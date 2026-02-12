#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Specifies the duplex option.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.graphics.printing.printduplex
 * @namespace Windows.Graphics.Printing
 * @version WindowsRuntime 1.4
 */
class PrintDuplex extends Win32Enum{

    /**
     * The default duplex option.
     * @type {Integer (Int32)}
     */
    static Default => 0

    /**
     * An unsupported duplex option.
     * @type {Integer (Int32)}
     */
    static NotAvailable => 1

    /**
     * A custom duplex option that is specific to the print device.
     * @type {Integer (Int32)}
     */
    static PrinterCustom => 2

    /**
     * The option to print on only one side of the sheet.
     * @type {Integer (Int32)}
     */
    static OneSided => 3

    /**
     * The option to print on both sides of the sheet, flipped along the short edge.
     * @type {Integer (Int32)}
     */
    static TwoSidedShortEdge => 4

    /**
     * The option to print on both sides of the sheet, flipped along the long edge.
     * @type {Integer (Int32)}
     */
    static TwoSidedLongEdge => 5
}
