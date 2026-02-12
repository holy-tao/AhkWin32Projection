#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Specifies the color mode option.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.graphics.printing.printcolormode
 * @namespace Windows.Graphics.Printing
 * @version WindowsRuntime 1.4
 */
class PrintColorMode extends Win32Enum{

    /**
     * The default color mode option.
     * @type {Integer (Int32)}
     */
    static Default => 0

    /**
     * An unsupported color mode option.
     * @type {Integer (Int32)}
     */
    static NotAvailable => 1

    /**
     * A custom color mode option that is specific to the print device.
     * @type {Integer (Int32)}
     */
    static PrinterCustom => 2

    /**
     * An option to indicate that the printed output will be in color.
     * @type {Integer (Int32)}
     */
    static Color => 3

    /**
     * An option to indicate that the printed output will be in shades of gray.
     * @type {Integer (Int32)}
     */
    static Grayscale => 4

    /**
     * An option to indicate that the printed output will be in one shade of a single color.
     * @type {Integer (Int32)}
     */
    static Monochrome => 5

    /**
     * @type {Integer (Int32)}
     */
    static AutoSelect => 6
}
