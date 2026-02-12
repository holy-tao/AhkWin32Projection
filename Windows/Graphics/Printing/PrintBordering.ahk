#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Specifies the bordering printing option.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.graphics.printing.printbordering
 * @namespace Windows.Graphics.Printing
 * @version WindowsRuntime 1.4
 */
class PrintBordering extends Win32Enum{

    /**
     * The default bordering option.
     * @type {Integer (Int32)}
     */
    static Default => 0

    /**
     * An unsupported border option.
     * @type {Integer (Int32)}
     */
    static NotAvailable => 1

    /**
     * A border option that is specific to the printer device.
     * @type {Integer (Int32)}
     */
    static PrinterCustom => 2

    /**
     * An option to indicate the printed output will be bordered.
     * @type {Integer (Int32)}
     */
    static Bordered => 3

    /**
     * An option to indicate the printed output will be borderless.
     * @type {Integer (Int32)}
     */
    static Borderless => 4
}
