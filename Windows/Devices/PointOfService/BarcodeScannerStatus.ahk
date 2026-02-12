#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Defines the constants that indicate the barcode scanner status.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.barcodescannerstatus
 * @namespace Windows.Devices.PointOfService
 * @version WindowsRuntime 1.4
 */
class BarcodeScannerStatus extends Win32Enum{

    /**
     * The device is online. This is valid if [UnifiedPosPowerReportingType](unifiedpospowerreportingtype.md) is Standard or Advanced.
     * @type {Integer (Int32)}
     */
    static Online => 0

    /**
     * The device power is off or detached from the terminal. This is valid if [UnifiedPosPowerReportingType](unifiedpospowerreportingtype.md) is Advanced.
     * @type {Integer (Int32)}
     */
    static Off => 1

    /**
     * The device power is on, but it is not ready or unable to respond to requests. This is valid if [UnifiedPosPowerReportingType](unifiedpospowerreportingtype.md) is Advanced.
     * @type {Integer (Int32)}
     */
    static Offline => 2

    /**
     * The device power is off or the device is offline. This is valid if [UnifiedPosPowerReportingType](unifiedpospowerreportingtype.md) is Standard.
     * @type {Integer (Int32)}
     */
    static OffOrOffline => 3

    /**
     * Vendor specific status information.
     * @type {Integer (Int32)}
     */
    static Extended => 4
}
