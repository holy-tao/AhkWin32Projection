#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.ApplicationInstallationAndServicing
 */
class INSTALLTYPE extends Win32Enum {

    /**
     * Native name: INSTALLTYPE_DEFAULT
     * @type {Integer (Int32)}
     */
    static DEFAULT => 0

    /**
     * Native name: INSTALLTYPE_NETWORK_IMAGE
     * @type {Integer (Int32)}
     */
    static NETWORK_IMAGE => 1

    /**
     * Native name: INSTALLTYPE_SINGLE_INSTANCE
     * @type {Integer (Int32)}
     */
    static SINGLE_INSTANCE => 2
}
