#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.UI.ColorSystem
 * @version v4.0.30319
 */
class ICM_COMMAND extends Win32Enum{

    /**
     * @type {Integer (UInt32)}
     */
    static ICM_ADDPROFILE => 1

    /**
     * @type {Integer (UInt32)}
     */
    static ICM_DELETEPROFILE => 2

    /**
     * @type {Integer (UInt32)}
     */
    static ICM_QUERYPROFILE => 3

    /**
     * @type {Integer (UInt32)}
     */
    static ICM_SETDEFAULTPROFILE => 4

    /**
     * @type {Integer (UInt32)}
     */
    static ICM_REGISTERICMATCHER => 5

    /**
     * @type {Integer (UInt32)}
     */
    static ICM_UNREGISTERICMATCHER => 6

    /**
     * @type {Integer (UInt32)}
     */
    static ICM_QUERYMATCH => 7
}
