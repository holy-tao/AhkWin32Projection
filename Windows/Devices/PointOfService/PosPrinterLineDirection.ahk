#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Describes the possible directions that a receipt or slip printer station can use to print a ruled line.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.posprinterlinedirection
 * @namespace Windows.Devices.PointOfService
 * @version WindowsRuntime 1.4
 */
class PosPrinterLineDirection extends Win32Enum{

    /**
     * Prints a horizontal ruled line.
     * @type {Integer (Int32)}
     */
    static Horizontal => 0

    /**
     * Prints a vertical ruled line.
     * @type {Integer (Int32)}
     */
    static Vertical => 1
}
