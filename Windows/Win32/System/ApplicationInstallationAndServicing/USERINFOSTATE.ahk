#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.ApplicationInstallationAndServicing
 */
class USERINFOSTATE extends Win32Enum {

    /**
     * @type {Integer (Int32)}
     */
    static USERINFOSTATE_MOREDATA => -3

    /**
     * @type {Integer (Int32)}
     */
    static USERINFOSTATE_INVALIDARG => -2

    /**
     * @type {Integer (Int32)}
     */
    static USERINFOSTATE_UNKNOWN => -1

    /**
     * @type {Integer (Int32)}
     */
    static USERINFOSTATE_ABSENT => 0

    /**
     * @type {Integer (Int32)}
     */
    static USERINFOSTATE_PRESENT => 1
}
