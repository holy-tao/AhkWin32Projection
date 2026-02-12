#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Specifies the collation option.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.graphics.printing.printcollation
 * @namespace Windows.Graphics.Printing
 * @version WindowsRuntime 1.4
 */
class PrintCollation extends Win32Enum{

    /**
     * The default collation option.
     * @type {Integer (Int32)}
     */
    static Default => 0

    /**
     * An unsupported collation option.
     * @type {Integer (Int32)}
     */
    static NotAvailable => 1

    /**
     * A custom collation option that is specific to the print device.
     * @type {Integer (Int32)}
     */
    static PrinterCustom => 2

    /**
     * An option to specify that collation has been selected for the printed output.
     * @type {Integer (Int32)}
     */
    static Collated => 3

    /**
     * An option to specify that collation has not been selected for the printed output.
     * @type {Integer (Int32)}
     */
    static Uncollated => 4
}
