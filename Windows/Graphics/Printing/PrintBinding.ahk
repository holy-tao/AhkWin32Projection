#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Specifies the print binding option.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.graphics.printing.printbinding
 * @namespace Windows.Graphics.Printing
 * @version WindowsRuntime 1.4
 */
class PrintBinding extends Win32Enum{

    /**
     * The default binding option.
     * @type {Integer (Int32)}
     */
    static Default => 0

    /**
     * An unsupported binding option.
     * @type {Integer (Int32)}
     */
    static NotAvailable => 1

    /**
     * A custom option that is specific to the print device.
     * @type {Integer (Int32)}
     */
    static PrinterCustom => 2

    /**
     * No binding required.
     * @type {Integer (Int32)}
     */
    static None => 3

    /**
     * The bale binding option.
     * @type {Integer (Int32)}
     */
    static Bale => 4

    /**
     * The option to bind the pages along their bottom edge.
     * @type {Integer (Int32)}
     */
    static BindBottom => 5

    /**
     * The option to bind the pages along their left edge.
     * @type {Integer (Int32)}
     */
    static BindLeft => 6

    /**
     * The option to bind the pages along their right edge.
     * @type {Integer (Int32)}
     */
    static BindRight => 7

    /**
     * The option to bind the pages along their top edge.
     * @type {Integer (Int32)}
     */
    static BindTop => 8

    /**
     * The option to bind the pages in booklet form.
     * @type {Integer (Int32)}
     */
    static Booklet => 9

    /**
     * The option to bind the pages along their bottom edge, with stiches.
     * @type {Integer (Int32)}
     */
    static EdgeStitchBottom => 10

    /**
     * The option to bind the pages along their left edge, with stiches.
     * @type {Integer (Int32)}
     */
    static EdgeStitchLeft => 11

    /**
     * The option to bind the pages along their right edge, with stiches.
     * @type {Integer (Int32)}
     */
    static EdgeStitchRight => 12

    /**
     * The option to bind the pages along their top edge, with stiches.
     * @type {Integer (Int32)}
     */
    static EdgeStitchTop => 13

    /**
     * The option to fold the pages.
     * @type {Integer (Int32)}
     */
    static Fold => 14

    /**
     * The option to offset the positioning of the pages in the output tray.
     * @type {Integer (Int32)}
     */
    static JogOffset => 15

    /**
     * The option to trim the printed sheets.
     * @type {Integer (Int32)}
     */
    static Trim => 16
}
