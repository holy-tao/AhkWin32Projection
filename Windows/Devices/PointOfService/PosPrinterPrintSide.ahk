#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Describes the sides of the sheet of paper on which the point-of-service printer prints.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.posprinterprintside
 * @namespace Windows.Devices.PointOfService
 * @version WindowsRuntime 1.4
 */
class PosPrinterPrintSide extends Win32Enum{

    /**
     * The side on which the point-of-service printer is currently printing is unknown.
     * @type {Integer (Int32)}
     */
    static Unknown => 0

    /**
     * The point-of-service printer is printing or should print on the front side of the sheet.
     * @type {Integer (Int32)}
     */
    static Side1 => 1

    /**
     * The point-of-service printer is printing or should print on the back side of the sheet.
     * @type {Integer (Int32)}
     */
    static Side2 => 2
}
