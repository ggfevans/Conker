#!/usr/bin/env python3
"""
Regenerate missing SVG files from history.json entries.
Uses stored trait data to recreate the visual appearance.
"""

import json
from pathlib import Path
import sys

# Add src to path
sys.path.insert(0, str(Path(__file__).parent))

from src.genetics import MonkeyDNA, Trait, TraitCategory, Rarity, GeneticsEngine
from src.visualizer import MonkeyVisualizer


def find_rarity_for_trait(category: TraitCategory, value: str) -> Rarity:
    """Look up the rarity for a trait value by searching TRAIT_POOL."""
    trait_pool = GeneticsEngine.TRAIT_POOL.get(category, {})
    
    for rarity, values in trait_pool.items():
        if value in values:
            return rarity
    
    # Default to common if not found
    return Rarity.COMMON


def create_dna_from_traits(traits_dict: dict, entry: dict) -> MonkeyDNA:
    """Create a MonkeyDNA object from a history entry's trait data."""
    
    category_map = {
        "body_color": TraitCategory.BODY_COLOR,
        "face_expression": TraitCategory.FACE_EXPRESSION,
        "accessory": TraitCategory.ACCESSORY,
        "pattern": TraitCategory.PATTERN,
        "background": TraitCategory.BACKGROUND,
        "special": TraitCategory.SPECIAL,
    }
    
    traits = {}
    for trait_key, trait_value in traits_dict.items():
        if trait_key in category_map:
            category = category_map[trait_key]
            rarity = find_rarity_for_trait(category, trait_value)
            traits[category] = Trait(
                category=category,
                value=trait_value,
                rarity=rarity,
                gene_sequence=f"regen_{trait_value}"
            )
    
    return MonkeyDNA(
        generation=entry.get("generation", 1),
        parent_id=None,
        traits=traits,
        mutation_count=entry.get("mutation_count", 0),
        birth_timestamp=0,
        dna_hash=entry.get("dna_hash", "")
    )


def main():
    history_file = Path("monkey_data/history.json")
    evolution_dir = Path("monkey_evolution")
    evolution_dir.mkdir(exist_ok=True)
    
    with open(history_file) as f:
        history = json.load(f)
    
    regenerated = 0
    skipped = 0
    
    for entry in history["entries"]:
        svg_filename = entry.get("svg_filename")
        if not svg_filename:
            print(f"⚠️  Entry {entry['timestamp']}: No svg_filename, skipping")
            skipped += 1
            continue
        
        svg_path = evolution_dir / svg_filename
        
        # Skip if already exists
        if svg_path.exists():
            print(f"✓ {svg_filename} already exists")
            skipped += 1
            continue
        
        # Reconstruct DNA from traits
        traits = entry.get("traits", {})
        if not traits:
            print(f"⚠️  Entry {entry['timestamp']}: No traits data, skipping")
            skipped += 1
            continue
        
        # Create DNA and generate SVG
        try:
            dna = create_dna_from_traits(traits, entry)
            svg = MonkeyVisualizer.generate_svg(dna)
            svg_path.write_text(svg)
            print(f"✅ Regenerated {svg_filename}")
            regenerated += 1
        except Exception as e:
            print(f"❌ Error regenerating {svg_filename}: {e}")
            import traceback
            traceback.print_exc()
    
    print(f"\n📊 Summary: {regenerated} regenerated, {skipped} skipped")


if __name__ == "__main__":
    main()
