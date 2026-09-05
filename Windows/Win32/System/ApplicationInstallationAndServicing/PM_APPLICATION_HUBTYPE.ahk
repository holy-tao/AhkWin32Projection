#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.ApplicationInstallationAndServicing
 */
class PM_APPLICATION_HUBTYPE extends Win32Enum {

    /**
     * Native name: PM_APPLICATION_HUBTYPE_NONMUSIC
     * @type {Integer (Int32)}
     */
    static NONMUSIC => 0

    /**
     * Native name: PM_APPLICATION_HUBTYPE_MUSIC
     * @type {Integer (Int32)}
     */
    static MUSIC => 1

    /**
     * Native name: PM_APPLICATION_HUBTYPE_INVALID
     * @type {Integer (Int32)}
     */
    static INVALID => 2
}
