#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Contains values that describe the types of print values.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.graphics.printing.printticket.printticketvaluetype
 * @namespace Windows.Graphics.Printing.PrintTicket
 * @version WindowsRuntime 1.4
 */
class PrintTicketValueType extends Win32Enum{

    /**
     * Integer value.
     * @type {Integer (Int32)}
     */
    static Integer => 0

    /**
     * String value.
     * @type {Integer (Int32)}
     */
    static String => 1

    /**
     * The value type is unknown.
     * @type {Integer (Int32)}
     */
    static Unknown => 2
}
