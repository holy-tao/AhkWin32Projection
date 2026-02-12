#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Specifies the kind of an Internet Printing Protocol (IPP) device.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.devices.printers.ippprintdevicekind
 * @namespace Windows.Devices.Printers
 * @version WindowsRuntime 1.4
 */
class IppPrintDeviceKind extends Win32Enum{

    /**
     * The device is a printer.
     * @type {Integer (Int32)}
     */
    static Printer => 0

    /**
     * The device is a fax machine.
     * @type {Integer (Int32)}
     */
    static FaxOut => 1

    /**
     * The device is a virtual printer.
     * @type {Integer (Int32)}
     */
    static VirtualPrinter => 2
}
