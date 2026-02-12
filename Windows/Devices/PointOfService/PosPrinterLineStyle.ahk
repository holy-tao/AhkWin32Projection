#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Describes the line styles that a receipt or slip printer station can use to print a ruled line.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.posprinterlinestyle
 * @namespace Windows.Devices.PointOfService
 * @version WindowsRuntime 1.4
 */
class PosPrinterLineStyle extends Win32Enum{

    /**
     * Prints a continuous solid line.
     * @type {Integer (Int32)}
     */
    static SingleSolid => 0

    /**
     * Prints a continuous solid line of double the normal thickness.
     * @type {Integer (Int32)}
     */
    static DoubleSolid => 1

    /**
     * Prints a sequence of short lines separated by spaces.
     * @type {Integer (Int32)}
     */
    static Broken => 2

    /**
     * Prints a sequence of short lines separated by a space, then followed by a very short line, followed by a space, then followed by a short line again.
     * @type {Integer (Int32)}
     */
    static Chain => 3
}
