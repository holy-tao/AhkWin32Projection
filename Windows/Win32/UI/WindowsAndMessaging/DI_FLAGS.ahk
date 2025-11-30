#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.UI.WindowsAndMessaging
 * @version v4.0.30319
 */
class DI_FLAGS extends Win32BitflagEnum{

    /**
     * @type {Integer (UInt32)}
     */
    static DI_MASK => 1

    /**
     * @type {Integer (UInt32)}
     */
    static DI_IMAGE => 2

    /**
     * @type {Integer (UInt32)}
     */
    static DI_NORMAL => 3

    /**
     * @type {Integer (UInt32)}
     */
    static DI_COMPAT => 4

    /**
     * @type {Integer (UInt32)}
     */
    static DI_DEFAULTSIZE => 8

    /**
     * @type {Integer (UInt32)}
     */
    static DI_NOMIRROR => 16
}
