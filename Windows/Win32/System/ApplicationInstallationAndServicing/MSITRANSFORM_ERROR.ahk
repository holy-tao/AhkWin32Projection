#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.ApplicationInstallationAndServicing
 */
class MSITRANSFORM_ERROR extends Win32Enum {

    /**
     * Native name: MSITRANSFORM_ERROR_ADDEXISTINGROW
     * @type {Integer (Int32)}
     */
    static ADDEXISTINGROW => 1

    /**
     * Native name: MSITRANSFORM_ERROR_DELMISSINGROW
     * @type {Integer (Int32)}
     */
    static DELMISSINGROW => 2

    /**
     * Native name: MSITRANSFORM_ERROR_ADDEXISTINGTABLE
     * @type {Integer (Int32)}
     */
    static ADDEXISTINGTABLE => 4

    /**
     * Native name: MSITRANSFORM_ERROR_DELMISSINGTABLE
     * @type {Integer (Int32)}
     */
    static DELMISSINGTABLE => 8

    /**
     * Native name: MSITRANSFORM_ERROR_UPDATEMISSINGROW
     * @type {Integer (Int32)}
     */
    static UPDATEMISSINGROW => 16

    /**
     * Native name: MSITRANSFORM_ERROR_CHANGECODEPAGE
     * @type {Integer (Int32)}
     */
    static CHANGECODEPAGE => 32

    /**
     * Native name: MSITRANSFORM_ERROR_VIEWTRANSFORM
     * @type {Integer (Int32)}
     */
    static VIEWTRANSFORM => 256

    /**
     * Native name: MSITRANSFORM_ERROR_NONE
     * @type {Integer (Int32)}
     */
    static NONE => 0
}
