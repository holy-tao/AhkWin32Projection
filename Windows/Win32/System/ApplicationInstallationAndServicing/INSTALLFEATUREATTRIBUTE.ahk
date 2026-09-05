#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.ApplicationInstallationAndServicing
 */
class INSTALLFEATUREATTRIBUTE extends Win32Enum {

    /**
     * Native name: INSTALLFEATUREATTRIBUTE_FAVORLOCAL
     * @type {Integer (Int32)}
     */
    static FAVORLOCAL => 1

    /**
     * Native name: INSTALLFEATUREATTRIBUTE_FAVORSOURCE
     * @type {Integer (Int32)}
     */
    static FAVORSOURCE => 2

    /**
     * Native name: INSTALLFEATUREATTRIBUTE_FOLLOWPARENT
     * @type {Integer (Int32)}
     */
    static FOLLOWPARENT => 4

    /**
     * Native name: INSTALLFEATUREATTRIBUTE_FAVORADVERTISE
     * @type {Integer (Int32)}
     */
    static FAVORADVERTISE => 8

    /**
     * Native name: INSTALLFEATUREATTRIBUTE_DISALLOWADVERTISE
     * @type {Integer (Int32)}
     */
    static DISALLOWADVERTISE => 16

    /**
     * Native name: INSTALLFEATUREATTRIBUTE_NOUNSUPPORTEDADVERTISE
     * @type {Integer (Int32)}
     */
    static NOUNSUPPORTEDADVERTISE => 32
}
