#Requires AutoHotkey v2.0.0 64-bit

/**
 * The VMR_ASPECT_RATIO_MODE enumeration type describes whether the Video Mixing Renderer Filter 7 preserves the aspect ratio of the source video.
 * @see https://docs.microsoft.com/windows/win32/api//strmif/ne-strmif-vmr_aspect_ratio_mode
 * @namespace Windows.Win32.Media.DirectShow
 * @version v4.0.30319
 */
class VMR_ASPECT_RATIO_MODE{

    /**
     * Indicates that the VMR will not try to maintain the aspect ratio of the source video.
     * @type {Integer (Int32)}
     */
    static VMR_ARMODE_NONE => 0

    /**
     * Indicates that the VMR will maintain the aspect ratio of the source video by letterboxing within the output rectangle.
     * @type {Integer (Int32)}
     */
    static VMR_ARMODE_LETTER_BOX => 1
}
