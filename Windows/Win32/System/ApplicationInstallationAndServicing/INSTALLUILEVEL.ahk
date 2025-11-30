#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.ApplicationInstallationAndServicing
 * @version v4.0.30319
 */
class INSTALLUILEVEL extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static INSTALLUILEVEL_NOCHANGE => 0

    /**
     * @type {Integer (Int32)}
     */
    static INSTALLUILEVEL_DEFAULT => 1

    /**
     * @type {Integer (Int32)}
     */
    static INSTALLUILEVEL_NONE => 2

    /**
     * @type {Integer (Int32)}
     */
    static INSTALLUILEVEL_BASIC => 3

    /**
     * @type {Integer (Int32)}
     */
    static INSTALLUILEVEL_REDUCED => 4

    /**
     * @type {Integer (Int32)}
     */
    static INSTALLUILEVEL_FULL => 5

    /**
     * @type {Integer (Int32)}
     */
    static INSTALLUILEVEL_ENDDIALOG => 128

    /**
     * @type {Integer (Int32)}
     */
    static INSTALLUILEVEL_PROGRESSONLY => 64

    /**
     * @type {Integer (Int32)}
     */
    static INSTALLUILEVEL_HIDECANCEL => 32

    /**
     * @type {Integer (Int32)}
     */
    static INSTALLUILEVEL_SOURCERESONLY => 256

    /**
     * @type {Integer (Int32)}
     */
    static INSTALLUILEVEL_UACONLY => 512
}
