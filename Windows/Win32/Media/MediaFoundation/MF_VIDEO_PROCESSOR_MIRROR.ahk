#Requires AutoHotkey v2.0.0 64-bit

/**
 * Specifies how to flip a video image.
 * @see https://docs.microsoft.com/windows/win32/api//mfidl/ne-mfidl-mf_video_processor_mirror
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class MF_VIDEO_PROCESSOR_MIRROR{

    /**
     * Do not flip the image.
     * @type {Integer (Int32)}
     */
    static MIRROR_NONE => 0

    /**
     * Flip the image horizontally.
     * @type {Integer (Int32)}
     */
    static MIRROR_HORIZONTAL => 1

    /**
     * Flip the image vertically.
     * @type {Integer (Int32)}
     */
    static MIRROR_VERTICAL => 2
}
