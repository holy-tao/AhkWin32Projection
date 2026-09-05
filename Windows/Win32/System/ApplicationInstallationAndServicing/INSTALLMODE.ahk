#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.ApplicationInstallationAndServicing
 */
class INSTALLMODE extends Win32Enum {

    /**
     * Native name: INSTALLMODE_NODETECTION_ANY
     * @type {Integer (Int32)}
     */
    static NODETECTION_ANY => -4

    /**
     * Native name: INSTALLMODE_NOSOURCERESOLUTION
     * @type {Integer (Int32)}
     */
    static NOSOURCERESOLUTION => -3

    /**
     * Native name: INSTALLMODE_NODETECTION
     * @type {Integer (Int32)}
     */
    static NODETECTION => -2

    /**
     * Native name: INSTALLMODE_EXISTING
     * @type {Integer (Int32)}
     */
    static EXISTING => -1

    /**
     * Native name: INSTALLMODE_DEFAULT
     * @type {Integer (Int32)}
     */
    static DEFAULT => 0
}
