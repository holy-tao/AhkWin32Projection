#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Graphics.Gdi
 */
class ENUM_DISPLAY_SETTINGS_MODE extends Win32Enum {

    /**
     * Native name: ENUM_CURRENT_SETTINGS
     * @type {Integer (UInt32)}
     */
    static CURRENT_SETTINGS => 4294967295

    /**
     * Native name: ENUM_REGISTRY_SETTINGS
     * @type {Integer (UInt32)}
     */
    static REGISTRY_SETTINGS => 4294967294
}
