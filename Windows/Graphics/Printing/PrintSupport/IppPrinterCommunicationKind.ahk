#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Specifies the communication medium for an Internet Printing Protocol (IPP) printer.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.graphics.printing.printsupport.ippprintercommunicationkind
 * @namespace Windows.Graphics.Printing.PrintSupport
 * @version WindowsRuntime 1.4
 */
class IppPrinterCommunicationKind extends Win32Enum{

    /**
     * The printer is connected over a network.
     * @type {Integer (Int32)}
     */
    static Network => 0

    /**
     * The printer is connected over USB using IPP over USB.
     * @type {Integer (Int32)}
     */
    static Usb => 1

    /**
     * The printer is connected over Printer Connection.
     * @type {Integer (Int32)}
     */
    static PrinterConnection => 2

    /**
     * The printer is connected using Universal Print.
     * @type {Integer (Int32)}
     */
    static UniversalPrint => 3

    /**
     * The printer is connected as a virtual printer.
     * @type {Integer (Int32)}
     */
    static VirtualPrinter => 4
}
