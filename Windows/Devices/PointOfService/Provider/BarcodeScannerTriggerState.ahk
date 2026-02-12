#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Defines the constants that indicate the barcode trigger state.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.provider.barcodescannertriggerstate
 * @namespace Windows.Devices.PointOfService.Provider
 * @version WindowsRuntime 1.4
 */
class BarcodeScannerTriggerState extends Win32Enum{

    /**
     * The barcode scanner trigger or button is released during a scanning operation.
     * @type {Integer (Int32)}
     */
    static Released => 0

    /**
     * The barcode scanner trigger or button is pressed during a scanning operation.
     * @type {Integer (Int32)}
     */
    static Pressed => 1
}
