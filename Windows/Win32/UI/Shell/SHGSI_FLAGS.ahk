#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.UI.Shell
 * @version v4.0.30319
 */
class SHGSI_FLAGS extends Win32BitflagEnum{

    /**
     * @type {Integer (UInt32)}
     */
    static SHGSI_ICONLOCATION => 0

    /**
     * @type {Integer (UInt32)}
     */
    static SHGSI_ICON => 256

    /**
     * @type {Integer (UInt32)}
     */
    static SHGSI_SYSICONINDEX => 16384

    /**
     * @type {Integer (UInt32)}
     */
    static SHGSI_LINKOVERLAY => 32768

    /**
     * @type {Integer (UInt32)}
     */
    static SHGSI_SELECTED => 65536

    /**
     * @type {Integer (UInt32)}
     */
    static SHGSI_LARGEICON => 0

    /**
     * @type {Integer (UInt32)}
     */
    static SHGSI_SMALLICON => 1

    /**
     * @type {Integer (UInt32)}
     */
    static SHGSI_SHELLICONSIZE => 4
}
