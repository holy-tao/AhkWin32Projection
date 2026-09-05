#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.ApplicationInstallationAndServicing
 */
class USERINFOSTATE extends Win32Enum {

    /**
     * Native name: USERINFOSTATE_MOREDATA
     * @type {Integer (Int32)}
     */
    static MOREDATA => -3

    /**
     * Native name: USERINFOSTATE_INVALIDARG
     * @type {Integer (Int32)}
     */
    static INVALIDARG => -2

    /**
     * Native name: USERINFOSTATE_UNKNOWN
     * @type {Integer (Int32)}
     */
    static UNKNOWN => -1

    /**
     * Native name: USERINFOSTATE_ABSENT
     * @type {Integer (Int32)}
     */
    static ABSENT => 0

    /**
     * Native name: USERINFOSTATE_PRESENT
     * @type {Integer (Int32)}
     */
    static PRESENT => 1
}
