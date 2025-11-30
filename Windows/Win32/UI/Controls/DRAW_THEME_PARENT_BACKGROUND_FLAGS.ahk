#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.UI.Controls
 * @version v4.0.30319
 */
class DRAW_THEME_PARENT_BACKGROUND_FLAGS extends Win32BitflagEnum{

    /**
     * @type {Integer (UInt32)}
     */
    static DTPB_WINDOWDC => 1

    /**
     * @type {Integer (UInt32)}
     */
    static DTPB_USECTLCOLORSTATIC => 2

    /**
     * @type {Integer (UInt32)}
     */
    static DTPB_USEERASEBKGND => 4
}
