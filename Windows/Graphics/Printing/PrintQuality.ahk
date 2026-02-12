#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Specifies the print quality options for the printed output.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.graphics.printing.printquality
 * @namespace Windows.Graphics.Printing
 * @version WindowsRuntime 1.4
 */
class PrintQuality extends Win32Enum{

    /**
     * The default print quality option.
     * @type {Integer (Int32)}
     */
    static Default => 0

    /**
     * A print quality option that is not available with the application or one that is not supported by the print device.
     * @type {Integer (Int32)}
     */
    static NotAvailable => 1

    /**
     * A print quality option that is specific to the print device.
     * @type {Integer (Int32)}
     */
    static PrinterCustom => 2

    /**
     * The option to automatically select the print quality.
     * @type {Integer (Int32)}
     */
    static Automatic => 3

    /**
     * The Draft print quality option.
     * @type {Integer (Int32)}
     */
    static Draft => 4

    /**
     * The Fax print quality option.
     * @type {Integer (Int32)}
     */
    static Fax => 5

    /**
     * The High print quality option.
     * @type {Integer (Int32)}
     */
    static High => 6

    /**
     * The Normal print quality option.
     * @type {Integer (Int32)}
     */
    static Normal => 7

    /**
     * The Photographic print quality option.
     * @type {Integer (Int32)}
     */
    static Photographic => 8

    /**
     * The Text print quality option.
     * @type {Integer (Int32)}
     */
    static Text => 9
}
