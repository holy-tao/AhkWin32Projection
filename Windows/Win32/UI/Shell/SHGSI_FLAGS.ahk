#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.UI.Shell
 */
class SHGSI_FLAGS extends Win32BitflagEnum {

    /**
     * Native name: SHGSI_ICONLOCATION
     * @type {Integer (UInt32)}
     */
    static ICONLOCATION => 0

    /**
     * Native name: SHGSI_ICON
     * @type {Integer (UInt32)}
     */
    static ICON => 256

    /**
     * Native name: SHGSI_SYSICONINDEX
     * @type {Integer (UInt32)}
     */
    static SYSICONINDEX => 16384

    /**
     * Native name: SHGSI_LINKOVERLAY
     * @type {Integer (UInt32)}
     */
    static LINKOVERLAY => 32768

    /**
     * Native name: SHGSI_SELECTED
     * @type {Integer (UInt32)}
     */
    static SELECTED => 65536

    /**
     * Native name: SHGSI_LARGEICON
     * @type {Integer (UInt32)}
     */
    static LARGEICON => 0

    /**
     * Native name: SHGSI_SMALLICON
     * @type {Integer (UInt32)}
     */
    static SMALLICON => 1

    /**
     * Native name: SHGSI_SHELLICONSIZE
     * @type {Integer (UInt32)}
     */
    static SHELLICONSIZE => 4
}
