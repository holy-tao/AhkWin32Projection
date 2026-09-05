#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.ApplicationInstallationAndServicing
 */
class MSIPATCHSTATE extends Win32Enum {

    /**
     * Native name: MSIPATCHSTATE_INVALID
     * @type {Integer (Int32)}
     */
    static INVALID => 0

    /**
     * Native name: MSIPATCHSTATE_APPLIED
     * @type {Integer (Int32)}
     */
    static APPLIED => 1

    /**
     * Native name: MSIPATCHSTATE_SUPERSEDED
     * @type {Integer (Int32)}
     */
    static SUPERSEDED => 2

    /**
     * Native name: MSIPATCHSTATE_OBSOLETED
     * @type {Integer (Int32)}
     */
    static OBSOLETED => 4

    /**
     * Native name: MSIPATCHSTATE_REGISTERED
     * @type {Integer (Int32)}
     */
    static REGISTERED => 8

    /**
     * Native name: MSIPATCHSTATE_ALL
     * @type {Integer (Int32)}
     */
    static ALL => 15
}
