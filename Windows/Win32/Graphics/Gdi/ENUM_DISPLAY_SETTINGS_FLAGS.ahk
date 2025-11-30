#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Graphics.Gdi
 * @version v4.0.30319
 */
class ENUM_DISPLAY_SETTINGS_FLAGS extends Win32BitflagEnum{

    /**
     * @type {Integer (UInt32)}
     */
    static EDS_RAWMODE => 2

    /**
     * @type {Integer (UInt32)}
     */
    static EDS_ROTATEDMODE => 4
}
