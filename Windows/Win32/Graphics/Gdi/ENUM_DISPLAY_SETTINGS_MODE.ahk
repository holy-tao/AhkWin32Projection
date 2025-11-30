#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Graphics.Gdi
 * @version v4.0.30319
 */
class ENUM_DISPLAY_SETTINGS_MODE extends Win32Enum{

    /**
     * @type {Integer (UInt32)}
     */
    static ENUM_CURRENT_SETTINGS => 4294967295

    /**
     * @type {Integer (UInt32)}
     */
    static ENUM_REGISTRY_SETTINGS => 4294967294
}
