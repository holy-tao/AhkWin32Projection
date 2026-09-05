#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.ApplicationInstallationAndServicing
 */
class INSTALLUILEVEL extends Win32Enum {

    /**
     * Native name: INSTALLUILEVEL_NOCHANGE
     * @type {Integer (Int32)}
     */
    static NOCHANGE => 0

    /**
     * Native name: INSTALLUILEVEL_DEFAULT
     * @type {Integer (Int32)}
     */
    static DEFAULT => 1

    /**
     * Native name: INSTALLUILEVEL_NONE
     * @type {Integer (Int32)}
     */
    static NONE => 2

    /**
     * Native name: INSTALLUILEVEL_BASIC
     * @type {Integer (Int32)}
     */
    static BASIC => 3

    /**
     * Native name: INSTALLUILEVEL_REDUCED
     * @type {Integer (Int32)}
     */
    static REDUCED => 4

    /**
     * Native name: INSTALLUILEVEL_FULL
     * @type {Integer (Int32)}
     */
    static FULL => 5

    /**
     * Native name: INSTALLUILEVEL_ENDDIALOG
     * @type {Integer (Int32)}
     */
    static ENDDIALOG => 128

    /**
     * Native name: INSTALLUILEVEL_PROGRESSONLY
     * @type {Integer (Int32)}
     */
    static PROGRESSONLY => 64

    /**
     * Native name: INSTALLUILEVEL_HIDECANCEL
     * @type {Integer (Int32)}
     */
    static HIDECANCEL => 32

    /**
     * Native name: INSTALLUILEVEL_SOURCERESONLY
     * @type {Integer (Int32)}
     */
    static SOURCERESONLY => 256

    /**
     * Native name: INSTALLUILEVEL_UACONLY
     * @type {Integer (Int32)}
     */
    static UACONLY => 512
}
