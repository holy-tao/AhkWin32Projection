#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Describes the valid units of measure for point-of-service printers.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.posprintermapmode
 * @namespace Windows.Devices.PointOfService
 * @version WindowsRuntime 1.4
 */
class PosPrinterMapMode extends Win32Enum{

    /**
     * The dot width for the point-of-service printer.
     * @type {Integer (Int32)}
     */
    static Dots => 0

    /**
     * 1/1440 of an inch.
     * @type {Integer (Int32)}
     */
    static Twips => 1

    /**
     * 0.001 inch.
     * @type {Integer (Int32)}
     */
    static English => 2

    /**
     * 0.01 millimeter.
     * @type {Integer (Int32)}
     */
    static Metric => 3
}
