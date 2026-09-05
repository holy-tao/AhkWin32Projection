#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.UI.ColorSystem
 */
class ICM_COMMAND extends Win32Enum {

    /**
     * Native name: ICM_ADDPROFILE
     * @type {Integer (UInt32)}
     */
    static ADDPROFILE => 1

    /**
     * Native name: ICM_DELETEPROFILE
     * @type {Integer (UInt32)}
     */
    static DELETEPROFILE => 2

    /**
     * Native name: ICM_QUERYPROFILE
     * @type {Integer (UInt32)}
     */
    static QUERYPROFILE => 3

    /**
     * Native name: ICM_SETDEFAULTPROFILE
     * @type {Integer (UInt32)}
     */
    static SETDEFAULTPROFILE => 4

    /**
     * Native name: ICM_REGISTERICMATCHER
     * @type {Integer (UInt32)}
     */
    static REGISTERICMATCHER => 5

    /**
     * Native name: ICM_UNREGISTERICMATCHER
     * @type {Integer (UInt32)}
     */
    static UNREGISTERICMATCHER => 6

    /**
     * Native name: ICM_QUERYMATCH
     * @type {Integer (UInt32)}
     */
    static QUERYMATCH => 7
}
