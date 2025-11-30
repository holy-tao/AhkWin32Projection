#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.ApplicationInstallationAndServicing
 * @version v4.0.30319
 */
class INSTALLTYPE extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static INSTALLTYPE_DEFAULT => 0

    /**
     * @type {Integer (Int32)}
     */
    static INSTALLTYPE_NETWORK_IMAGE => 1

    /**
     * @type {Integer (Int32)}
     */
    static INSTALLTYPE_SINGLE_INSTANCE => 2
}
