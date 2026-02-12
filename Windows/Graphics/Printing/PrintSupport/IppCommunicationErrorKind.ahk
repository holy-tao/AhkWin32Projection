#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Specifies the kind of error encountered for an Internet Printing Protocol (IPP) printer.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.graphics.printing.printsupport.ippcommunicationerrorkind
 * @namespace Windows.Graphics.Printing.PrintSupport
 * @version WindowsRuntime 1.4
 */
class IppCommunicationErrorKind extends Win32Enum{

    /**
     * Other error.
     * @type {Integer (Int32)}
     */
    static Other => 0

    /**
     * Timeout error.
     * @type {Integer (Int32)}
     */
    static Timeout => 1

    /**
     * Connection error.
     * @type {Integer (Int32)}
     */
    static ConnectionError => 2

    /**
     * Access denied error.
     * @type {Integer (Int32)}
     */
    static AccessDenied => 3
}
