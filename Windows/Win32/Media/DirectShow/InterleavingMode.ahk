#Requires AutoHotkey v2.0.0 64-bit

/**
 * Specifies how video frames and audio samples will be written to disk.
 * @see https://learn.microsoft.com/windows/win32/api/strmif/ne-strmif-interleavingmode
 * @namespace Windows.Win32.Media.DirectShow
 * @version v4.0.30319
 */
class InterleavingMode{

    /**
     * Noninterleaved. Frames are written in the order they arrive. Files must be interleaved for playback at a later time. In this mode, the AVI Mux filter attempts to use unbuffered, overlapped write operations, to increase throughput.
     * @type {Integer (Int32)}
     */
    static INTERLEAVE_NONE => 0

    /**
     * Approximate interleaving with less overhead than <b>INTERLEAVE_FULL</b>. This mode is suitable for video capture. The AVI Mux attempts to use unbuffered, overlapped write operations. Unless the interleaving parameters are configured properly, however, frames may be dropped if one stream blocks while it waits for data from another stream. In particular, audio buffers should be less than .5 second, or else the video stream will block for excessive periods of time.
     * @type {Integer (Int32)}
     */
    static INTERLEAVE_CAPTURE => 1

    /**
     * Full, precise interleaving of audio samples and video frames. Streams will block indefinitely, waiting for equal amounts of data before interleaving. This mode is suitable for authoring and playback.
     * @type {Integer (Int32)}
     */
    static INTERLEAVE_FULL => 2

    /**
     * Noninterleaved. This mode is equivalent to <b>INTERLEAVE_NONE</b> but uses less file space and system overhead.
     * @type {Integer (Int32)}
     */
    static INTERLEAVE_NONE_BUFFERED => 3
}
