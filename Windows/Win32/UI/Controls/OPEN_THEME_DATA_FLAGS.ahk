#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.UI.Controls
 * @version v4.0.30319
 */
class OPEN_THEME_DATA_FLAGS extends Win32BitflagEnum{

    /**
     * @type {Integer (UInt32)}
     */
    static OTD_FORCE_RECT_SIZING => 1

    /**
     * @type {Integer (UInt32)}
     */
    static OTD_NONCLIENT => 2
}
