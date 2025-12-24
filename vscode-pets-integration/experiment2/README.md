# Experiment 2: Video-Based Frame Extraction

## Approach

Generate a single video of the monkey walking using Gemini AI video generation, then extract frames and convert to animated GIF.

## Method

1. **Video Generation:** Use Gemini Video Generation to create a ~6 second video of a walking monkey with white background
2. **Frame Extraction:** Use ffmpeg to extract frames at 4 FPS from the video
3. **Processing:** Remove white background, resize to 111×101, and remove semi-transparency
4. **Assembly:** Select evenly-spaced frames to create a smooth walking cycle GIF

## Results

✅ **Pros:**
- **Single API call** (vs 6 calls in Experiment 1)
- **8x faster** generation (~30 seconds vs 4 minutes)
- **42% smaller file** (12 KB vs 21 KB)
- **Lower cost** (1 video generation vs 6 image generations)
- **Smooth, natural motion** from video
- **Easy to extract different cycles** from same video

❌ **Cons:**
- Less control over specific poses
- Limited to motion shown in video
- One animation type per video
- Requires video processing tools (ffmpeg)

## Technical Details

- **AI Model:** Gemini Video Generation
- **Video Specs:** 1920×1080, 24 FPS, 5.9 seconds, 141 frames
- **Extraction:** 4 FPS = 24 frames extracted
- **Selected Frames:** 6 frames (evenly spaced)
- **Generation Time:** ~30 seconds
- **Processing Time:** ~5 seconds
- **Final Size:** 12.0 KB

## Comparison with Experiment 1

| Metric | Experiment 1 | Experiment 2 | Winner |
|--------|--------------|--------------|--------|
| API Calls | 6 | 1 | ✅ Exp 2 |
| Generation Time | ~4 min | ~30 sec | ✅ Exp 2 |
| File Size | 20.8 KB | 12.0 KB | ✅ Exp 2 |
| Control | High | Medium | ✅ Exp 1 |
| Motion Quality | Good | Excellent | ✅ Exp 2 |
| Flexibility | High | Medium | ✅ Exp 1 |

## File Structure

```
experiment2/
├── videos/
│   └── walking_monkey.mp4    # Generated video
├── frames/
│   └── frame_*.png           # Extracted frames
├── gifs/
│   └── brown_walk_8fps.gif   # Final walking GIF
├── scripts/
│   └── video_to_gif.py       # Conversion script
└── README.md                 # This file
```

## Usage

### Generate Video

```python
from generate_video import generate_video

generate_video(
    prompt="A cute brown monkey walking with a fork...",
    output_path="videos/walking_monkey.mp4"
)
```

### Extract and Convert

```bash
python3 scripts/video_to_gif.py
```

This will:
1. Extract frames at 4 FPS
2. Remove white background
3. Resize to 111×101
4. Create walking cycle GIF

## Conclusion

**Experiment 2 is the clear winner for motion-based animations** (walk, run). It's faster, cheaper, produces smaller files, and creates smoother, more natural motion.

**Recommended Hybrid Approach:**
- Use **video generation** for: walk, run, jump animations
- Use **image generation** for: idle, swipe, with_ball animations

This combines the efficiency of video generation with the precision of image generation!

## Next Steps

1. Generate additional videos for:
   - Running animation
   - Idle animation (subtle breathing/movement)
2. Combine best results from both experiments
3. Create complete asset set for VS Code Pets integration
