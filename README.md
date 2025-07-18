# YouTube CLI Tool

A simple, modular command-line tool to **download or stream YouTube videos and audio** using `yt-dlp` and `mpv`.

> Built with ❤️ by Suman — lightweight, colorful, and beginner-friendly.

---

## Features

- Listen to audio from any YouTube video (audio-only stream)
- Watch YouTube videos in your selected resolution
- Download audio in high-quality MP3
- Download video in selected format/quality
- Choose default or custom download location
- Supports YouTube video URLs or just video IDs
- Colored CLI output

---

## Dependencies

This tool requires the following:

- [`yt-dlp`](https://github.com/yt-dlp/yt-dlp) – YouTube downloader
- [`mpv`](https://mpv.io) – for streaming playback
- `awk` – used to format output (usually pre-installed)

Install with your package manager:

```bash
# Debian/Ubuntu
sudo apt install yt-dlp mpv gawk

# Arch
sudo pacman -S yt-dlp mpv gawk

# macOS (Homebrew)
brew install yt-dlp mpv gawk
```
---

## Getting Started

### 1. Clone the repo

```bash
git clone https://github.com/Sumanxhub/youtube-cli.git
cd youtube-cli
```

### 2. Make scripts executable

```bash
chmod +x main.sh
```

### 3. Run the tool

```bash
./main.sh
```

---

## Usage & Menu Options

After launching, you'll see a menu like this:

```
1. Listen Audio     – Stream audio only
2. Watch Video      – Stream video with quality selection
3. Download Audio   – Download MP3
4. Download Video   – Download video as MP4
5. Exit
```

You'll be prompted to enter a **YouTube URL or video ID**, and (for video) to choose a **quality/format code**.

---

## Download Location

When downloading:

* Default folders are:

  * Audio: `~/Music/`
  * Video: `~/Videos/`
* You can also enter a **custom path** for saving files
* If the custom folder doesn't exist, it will be created automatically

---

## URL Normalization

You can enter:

* Full YouTube URLs (e.g., `https://www.youtube.com/watch?v=xyz123`)
* Shortened URLs (e.g., `https://youtu.be/xyz123`)
* Or just the video ID (`xyz123`)

The script will normalize it automatically.

---

## Folder Structure

```
.
├── main.sh                 # Entry point
├── menu.sh                 # User menu
├── modules/
│   ├── listen_audio.sh
│   ├── watch_video.sh
│   ├── download_audio.sh
│   └── download_video.sh
├── utils/
│   ├── check_deps.sh
│   ├── normalize.sh
│   ├── color.sh
│   └── path.sh
```

---

## Notes

* Currently, only `mpv` is supported for playback
* If `mpv` is not installed, the tool will exit with a warning
* Support for other players is planned

---

## Contributing

Feel free to fork the project, suggest improvements, or open pull requests!

---

## License

MIT — free to use, share, and modify.

---

## Credits

Made with:

* [yt-dlp](https://github.com/yt-dlp/yt-dlp)
* [mpv](https://mpv.io/)
* Bash 

