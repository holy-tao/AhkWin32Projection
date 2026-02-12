#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Specifies the staple options.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.graphics.printing.printstaple
 * @namespace Windows.Graphics.Printing
 * @version WindowsRuntime 1.4
 */
class PrintStaple extends Win32Enum{

    /**
     * The default staple option.
     * @type {Integer (Int32)}
     */
    static Default => 0

    /**
     * A staple option that is not available with the application or one that is not supported by the print device.
     * @type {Integer (Int32)}
     */
    static NotAvailable => 1

    /**
     * A custom staple option that is specific to the print device.
     * @type {Integer (Int32)}
     */
    static PrinterCustom => 2

    /**
     * The option to indicate that no stapling is required.
     * @type {Integer (Int32)}
     */
    static None => 3

    /**
     * The option to staple the top left of the printed output.
     * @type {Integer (Int32)}
     */
    static StapleTopLeft => 4

    /**
     * The option to staple the top right of the printed output.
     * @type {Integer (Int32)}
     */
    static StapleTopRight => 5

    /**
     * The option to staple the bottom left of the printed output.
     * @type {Integer (Int32)}
     */
    static StapleBottomLeft => 6

    /**
     * The option to staple the bottom right of the printed output.
     * @type {Integer (Int32)}
     */
    static StapleBottomRight => 7

    /**
     * The option to staple the printed output in two places along the left edge.
     * @type {Integer (Int32)}
     */
    static StapleDualLeft => 8

    /**
     * The option to staple the printed output in two places along the right edge.
     * @type {Integer (Int32)}
     */
    static StapleDualRight => 9

    /**
     * The option to staple the printed output in two places along the top edge.
     * @type {Integer (Int32)}
     */
    static StapleDualTop => 10

    /**
     * The option to staple the printed output in two places along the bottom edge.
     * @type {Integer (Int32)}
     */
    static StapleDualBottom => 11

    /**
     * The option to saddle stitch the printed output.
     * @type {Integer (Int32)}
     */
    static SaddleStitch => 12
}
