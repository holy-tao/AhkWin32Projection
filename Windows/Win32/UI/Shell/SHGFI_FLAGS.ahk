#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.UI.Shell
 */
class SHGFI_FLAGS extends Win32BitflagEnum {

    /**
     * Native name: SHGFI_ADDOVERLAYS
     * @type {Integer (UInt32)}
     */
    static ADDOVERLAYS => 32

    /**
     * Native name: SHGFI_ATTR_SPECIFIED
     * @type {Integer (UInt32)}
     */
    static ATTR_SPECIFIED => 131072

    /**
     * Native name: SHGFI_ATTRIBUTES
     * @type {Integer (UInt32)}
     */
    static ATTRIBUTES => 2048

    /**
     * Native name: SHGFI_DISPLAYNAME
     * @type {Integer (UInt32)}
     */
    static DISPLAYNAME => 512

    /**
     * Native name: SHGFI_EXETYPE
     * @type {Integer (UInt32)}
     */
    static EXETYPE => 8192

    /**
     * Native name: SHGFI_ICON
     * @type {Integer (UInt32)}
     */
    static ICON => 256

    /**
     * Native name: SHGFI_ICONLOCATION
     * @type {Integer (UInt32)}
     */
    static ICONLOCATION => 4096

    /**
     * Native name: SHGFI_LARGEICON
     * @type {Integer (UInt32)}
     */
    static LARGEICON => 0

    /**
     * Native name: SHGFI_LINKOVERLAY
     * @type {Integer (UInt32)}
     */
    static LINKOVERLAY => 32768

    /**
     * Native name: SHGFI_OPENICON
     * @type {Integer (UInt32)}
     */
    static OPENICON => 2

    /**
     * Native name: SHGFI_OVERLAYINDEX
     * @type {Integer (UInt32)}
     */
    static OVERLAYINDEX => 64

    /**
     * Native name: SHGFI_PIDL
     * @type {Integer (UInt32)}
     */
    static PIDL => 8

    /**
     * Native name: SHGFI_SELECTED
     * @type {Integer (UInt32)}
     */
    static SELECTED => 65536

    /**
     * Native name: SHGFI_SHELLICONSIZE
     * @type {Integer (UInt32)}
     */
    static SHELLICONSIZE => 4

    /**
     * Native name: SHGFI_SMALLICON
     * @type {Integer (UInt32)}
     */
    static SMALLICON => 1

    /**
     * Native name: SHGFI_SYSICONINDEX
     * @type {Integer (UInt32)}
     */
    static SYSICONINDEX => 16384

    /**
     * Native name: SHGFI_TYPENAME
     * @type {Integer (UInt32)}
     */
    static TYPENAME => 1024

    /**
     * Native name: SHGFI_USEFILEATTRIBUTES
     * @type {Integer (UInt32)}
     */
    static USEFILEATTRIBUTES => 16
}
