#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Specifies the orientation options for the printed output.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.graphics.printing.printorientation
 * @namespace Windows.Graphics.Printing
 * @version WindowsRuntime 1.4
 */
class PrintOrientation extends Win32Enum{

    /**
     * The default orientation option.
     * @type {Integer (Int32)}
     */
    static Default => 0

    /**
     * An orientaiton option that is not available with the application or one that is not supported by the print device.
     * @type {Integer (Int32)}
     */
    static NotAvailable => 1

    /**
     * A custom orientation that is specific to the print device.
     * @type {Integer (Int32)}
     */
    static PrinterCustom => 2

    /**
     * The Portrait orientation option.
     * @type {Integer (Int32)}
     */
    static Portrait => 3

    /**
     * The PortraitFlipped orientation option.
     * @type {Integer (Int32)}
     */
    static PortraitFlipped => 4

    /**
     * The Landscape orientation option.
     * @type {Integer (Int32)}
     */
    static Landscape => 5

    /**
     * The LandscapeFlipped orientation option.
     * @type {Integer (Int32)}
     */
    static LandscapeFlipped => 6
}
