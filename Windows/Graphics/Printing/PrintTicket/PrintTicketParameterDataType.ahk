#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Contains values that describe the data type of a print ticket parameter.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.graphics.printing.printticket.printticketparameterdatatype
 * @namespace Windows.Graphics.Printing.PrintTicket
 * @version WindowsRuntime 1.4
 */
class PrintTicketParameterDataType extends Win32Enum{

    /**
     * Integer data type.
     * @type {Integer (Int32)}
     */
    static Integer => 0

    /**
     * Numeric string data type.
     * @type {Integer (Int32)}
     */
    static NumericString => 1

    /**
     * String data type.
     * @type {Integer (Int32)}
     */
    static String => 2
}
