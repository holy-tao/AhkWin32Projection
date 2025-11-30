#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.UI.Input
 * @version v4.0.30319
 */
class RID_DEVICE_INFO_TYPE extends Win32Enum{

    /**
     * @type {Integer (UInt32)}
     */
    static RIM_TYPEMOUSE => 0

    /**
     * @type {Integer (UInt32)}
     */
    static RIM_TYPEKEYBOARD => 1

    /**
     * @type {Integer (UInt32)}
     */
    static RIM_TYPEHID => 2
}
