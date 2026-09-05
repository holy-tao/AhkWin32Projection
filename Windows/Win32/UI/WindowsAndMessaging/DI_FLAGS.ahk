#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.UI.WindowsAndMessaging
 */
class DI_FLAGS extends Win32BitflagEnum {

    /**
     * Native name: DI_MASK
     * @type {Integer (UInt32)}
     */
    static MASK => 1

    /**
     * Native name: DI_IMAGE
     * @type {Integer (UInt32)}
     */
    static IMAGE => 2

    /**
     * Native name: DI_NORMAL
     * @type {Integer (UInt32)}
     */
    static NORMAL => 3

    /**
     * Native name: DI_COMPAT
     * @type {Integer (UInt32)}
     */
    static COMPAT => 4

    /**
     * Native name: DI_DEFAULTSIZE
     * @type {Integer (UInt32)}
     */
    static DEFAULTSIZE => 8

    /**
     * Native name: DI_NOMIRROR
     * @type {Integer (UInt32)}
     */
    static NOMIRROR => 16
}
