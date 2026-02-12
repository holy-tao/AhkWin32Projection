#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Describes the possible vertical positions in which a point-of-service printer prints the barcode text relative to the barcode.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.posprinterbarcodetextposition
 * @namespace Windows.Devices.PointOfService
 * @version WindowsRuntime 1.4
 */
class PosPrinterBarcodeTextPosition extends Win32Enum{

    /**
     * There is no barcode text.
     * @type {Integer (Int32)}
     */
    static None => 0

    /**
     * The barcode text is above the barcode.
     * @type {Integer (Int32)}
     */
    static Above => 1

    /**
     * The barcode text is below the barcode.
     * @type {Integer (Int32)}
     */
    static Below => 2
}
