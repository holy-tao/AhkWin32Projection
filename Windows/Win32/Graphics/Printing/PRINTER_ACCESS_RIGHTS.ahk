#Requires AutoHotkey v2.0.0 64-bit

/**
 * @namespace Windows.Win32.Graphics.Printing
 * @version v4.0.30319
 */
class PRINTER_ACCESS_RIGHTS{

    /**
     * @type {Integer (UInt32)}
     */
    static PRINTER_ALL_ACCESS => 983052

    /**
     * @type {Integer (UInt32)}
     */
    static PRINTER_READ => 131080

    /**
     * @type {Integer (UInt32)}
     */
    static PRINTER_WRITE => 131080

    /**
     * @type {Integer (UInt32)}
     */
    static PRINTER_EXECUTE => 131080

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
     * @type {Integer (UInt32)}
     */
    static PRINTER_DELETE => 65536

    /**
     * @type {Integer (UInt32)}
     */
    static PRINTER_READ_CONTROL => 131072

    /**
     * @type {Integer (UInt32)}
     */
    static PRINTER_WRITE_DAC => 262144

    /**
     * @type {Integer (UInt32)}
     */
    static PRINTER_WRITE_OWNER => 524288

    /**
     * @type {Integer (UInt32)}
     */
    static PRINTER_SYNCHRONIZE => 1048576

    /**
     * @type {Integer (UInt32)}
     */
    static PRINTER_STANDARD_RIGHTS_REQUIRED => 983040

    /**
     * @type {Integer (UInt32)}
     */
    static PRINTER_STANDARD_RIGHTS_READ => 131072

    /**
     * @type {Integer (UInt32)}
     */
    static PRINTER_STANDARD_RIGHTS_WRITE => 131072

    /**
     * @type {Integer (UInt32)}
     */
    static PRINTER_STANDARD_RIGHTS_EXECUTE => 131072

    /**
     * @type {Integer (UInt32)}
     */
    static SERVER_ACCESS_ADMINISTER => 1

    /**
     * @type {Integer (UInt32)}
     */
    static SERVER_ACCESS_ENUMERATE => 2

    /**
     * @type {Integer (UInt32)}
     */
    static PRINTER_ACCESS_ADMINISTER => 4

    /**
     * @type {Integer (UInt32)}
     */
    static PRINTER_ACCESS_USE => 8

    /**
     * @type {Integer (UInt32)}
     */
    static PRINTER_ACCESS_MANAGE_LIMITED => 64
}
