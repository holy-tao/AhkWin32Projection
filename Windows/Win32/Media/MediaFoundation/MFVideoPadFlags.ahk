#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Specifies whether to pad a video image so that it fits within a specified aspect ratio.
 * @remarks
 * Use these flags with the <a href="https://docs.microsoft.com/windows/desktop/medfound/mf-mt-pad-control-flags-attribute">MF_MT_PAD_CONTROL_FLAGS</a> attribute.
 * @see https://learn.microsoft.com/windows/win32/api/mfapi/ne-mfapi-mfvideopadflags
 * @namespace Windows.Win32.Media.MediaFoundation
 */
class MFVideoPadFlags extends Win32Enum {

    /**
     * Do not pad the image.
     * Native name: MFVideoPadFlag_PAD_TO_None
     * @type {Integer (Int32)}
     */
    static Flag_PAD_TO_None => 0

    /**
     * Pad the image so that it can be displayed in a 4×3 area.
     * Native name: MFVideoPadFlag_PAD_TO_4x3
     * @type {Integer (Int32)}
     */
    static Flag_PAD_TO_4x3 => 1

    /**
     * Pad the image so that it can be displayed in a 16×9 area.
     * Native name: MFVideoPadFlag_PAD_TO_16x9
     * @type {Integer (Int32)}
     */
    static Flag_PAD_TO_16x9 => 2
}
