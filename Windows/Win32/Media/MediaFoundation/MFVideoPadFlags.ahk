#Requires AutoHotkey v2.0.0 64-bit

/**
 * Specifies whether to pad a video image so that it fits within a specified aspect ratio.
 * @remarks
 * 
  * Use these flags with the <a href="https://docs.microsoft.com/windows/desktop/medfound/mf-mt-pad-control-flags-attribute">MF_MT_PAD_CONTROL_FLAGS</a> attribute.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//mfapi/ne-mfapi-mfvideopadflags
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class MFVideoPadFlags{

    /**
     * Do not pad the image.
     * @type {Integer (Int32)}
     */
    static MFVideoPadFlag_PAD_TO_None => 0

    /**
     * Pad the image so that it can be displayed in a 4×3 area.
     * @type {Integer (Int32)}
     */
    static MFVideoPadFlag_PAD_TO_4x3 => 1

    /**
     * Pad the image so that it can be displayed in a 16×9 area.
     * @type {Integer (Int32)}
     */
    static MFVideoPadFlag_PAD_TO_16x9 => 2
}
