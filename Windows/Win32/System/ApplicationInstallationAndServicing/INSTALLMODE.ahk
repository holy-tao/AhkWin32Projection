#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.ApplicationInstallationAndServicing
 * @version v4.0.30319
 */
class INSTALLMODE extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static INSTALLMODE_NODETECTION_ANY => -4

    /**
     * @type {Integer (Int32)}
     */
    static INSTALLMODE_NOSOURCERESOLUTION => -3

    /**
     * @type {Integer (Int32)}
     */
    static INSTALLMODE_NODETECTION => -2

    /**
     * @type {Integer (Int32)}
     */
    static INSTALLMODE_EXISTING => -1

    /**
     * @type {Integer (Int32)}
     */
    static INSTALLMODE_DEFAULT => 0
}
