#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Specifies the hole punch option.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.graphics.printing.printholepunch
 * @namespace Windows.Graphics.Printing
 * @version WindowsRuntime 1.4
 */
class PrintHolePunch extends Win32Enum{

    /**
     * The default hole punch option.
     * @type {Integer (Int32)}
     */
    static Default => 0

    /**
     * An unsupported hole punch option.
     * @type {Integer (Int32)}
     */
    static NotAvailable => 1

    /**
     * A custom hole punch option that is specific to the print device.
     * @type {Integer (Int32)}
     */
    static PrinterCustom => 2

    /**
     * The option to indicate that hole punching is not required.
     * @type {Integer (Int32)}
     */
    static None => 3

    /**
     * The option to indicate that hole punching required along the left edges of the sheets.
     * @type {Integer (Int32)}
     */
    static LeftEdge => 4

    /**
     * The option to indicate that hole punching required along the right edges of the sheets.
     * @type {Integer (Int32)}
     */
    static RightEdge => 5

    /**
     * The option to indicate that hole punching required along the top edges of the sheets.
     * @type {Integer (Int32)}
     */
    static TopEdge => 6

    /**
     * The option to indicate that hole punching required along the bottom edges of the sheets.
     * @type {Integer (Int32)}
     */
    static BottomEdge => 7
}
