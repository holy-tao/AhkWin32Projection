#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Specifies how to flip a video image.
 * @see https://learn.microsoft.com/windows/win32/api/mfidl/ne-mfidl-mf_video_processor_mirror
 * @namespace Windows.Win32.Media.MediaFoundation
 */
class MF_VIDEO_PROCESSOR_MIRROR extends Win32Enum {

    /**
     * Do not flip the image.
     * Native name: MIRROR_NONE
     * @type {Integer (Int32)}
     */
    static NONE => 0

    /**
     * Flip the image horizontally.
     * Native name: MIRROR_HORIZONTAL
     * @type {Integer (Int32)}
     */
    static HORIZONTAL => 1

    /**
     * Flip the image vertically.
     * Native name: MIRROR_VERTICAL
     * @type {Integer (Int32)}
     */
    static VERTICAL => 2
}
