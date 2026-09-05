#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Graphics.Printing
 */
class PRINTER_ACCESS_RIGHTS extends Win32BitflagEnum {

    /**
     * Native name: PRINTER_ALL_ACCESS
     * @type {Integer (UInt32)}
     */
    static ALL_ACCESS => 983052

    /**
     * Native name: PRINTER_READ
     * @type {Integer (UInt32)}
     */
    static READ => 131080

    /**
     * Native name: PRINTER_WRITE
     * @type {Integer (UInt32)}
     */
    static WRITE => 131080

    /**
     * Native name: PRINTER_EXECUTE
     * @type {Integer (UInt32)}
     */
    static EXECUTE => 131080

    /**
     * @type {Integer (UInt32)}
     */
    static SERVER_ALL_ACCESS => 983043

    /**
     * @type {Integer (UInt32)}
     */
    static SERVER_READ => 131074

    /**
     * @type {Integer (UInt32)}
     */
    static SERVER_WRITE => 131075

    /**
     * @type {Integer (UInt32)}
     */
    static SERVER_EXECUTE => 131074

    /**
     * Native name: PRINTER_DELETE
     * @type {Integer (UInt32)}
     */
    static DELETE => 65536

    /**
     * Native name: PRINTER_READ_CONTROL
     * @type {Integer (UInt32)}
     */
    static READ_CONTROL => 131072

    /**
     * Native name: PRINTER_WRITE_DAC
     * @type {Integer (UInt32)}
     */
    static WRITE_DAC => 262144

    /**
     * Native name: PRINTER_WRITE_OWNER
     * @type {Integer (UInt32)}
     */
    static WRITE_OWNER => 524288

    /**
     * Native name: PRINTER_SYNCHRONIZE
     * @type {Integer (UInt32)}
     */
    static SYNCHRONIZE => 1048576

    /**
     * Native name: PRINTER_STANDARD_RIGHTS_REQUIRED
     * @type {Integer (UInt32)}
     */
    static STANDARD_RIGHTS_REQUIRED => 983040

    /**
     * Native name: PRINTER_STANDARD_RIGHTS_READ
     * @type {Integer (UInt32)}
     */
    static STANDARD_RIGHTS_READ => 131072

    /**
     * Native name: PRINTER_STANDARD_RIGHTS_WRITE
     * @type {Integer (UInt32)}
     */
    static STANDARD_RIGHTS_WRITE => 131072

    /**
     * Native name: PRINTER_STANDARD_RIGHTS_EXECUTE
     * @type {Integer (UInt32)}
     */
    static STANDARD_RIGHTS_EXECUTE => 131072

    /**
     * @type {Integer (UInt32)}
     */
    static SERVER_ACCESS_ADMINISTER => 1

    /**
     * @type {Integer (UInt32)}
     */
    static SERVER_ACCESS_ENUMERATE => 2

    /**
     * Native name: PRINTER_ACCESS_ADMINISTER
     * @type {Integer (UInt32)}
     */
    static ADMINISTER => 4

    /**
     * Native name: PRINTER_ACCESS_USE
     * @type {Integer (UInt32)}
     */
    static USE => 8

    /**
     * Native name: PRINTER_ACCESS_MANAGE_LIMITED
     * @type {Integer (UInt32)}
     */
    static MANAGE_LIMITED => 64
}
