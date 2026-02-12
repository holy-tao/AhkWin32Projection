#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Describes the power state for a point-of-service printer.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.posprinterstatuskind
 * @namespace Windows.Devices.PointOfService
 * @version WindowsRuntime 1.4
 */
class PosPrinterStatusKind extends Win32Enum{

    /**
     * The printer is online.
     * 
     * This value is valid if the value of the [PosPrinterCapabilities.PowerReportingType](posprintercapabilities_powerreportingtype.md) property is **UnifiedPosPowerReportingType.Standard** or **UnifiedPosPowerReportingType.Advanced**.
     * @type {Integer (Int32)}
     */
    static Online => 0

    /**
     * The printer is turned off or disconnected from the terminal.
     * 
     * This value is valid if the value of the [PosPrinterCapabilities.PowerReportingType](posprintercapabilities_powerreportingtype.md) property is **UnifiedPosPowerReportingType.Advanced**.
     * @type {Integer (Int32)}
     */
    static Off => 1

    /**
     * The printer is turned on, but it is not ready or not able to respond to requests.
     * 
     * This value is valid if the value of the [PosPrinterCapabilities.PowerReportingType](posprintercapabilities_powerreportingtype.md) property is **UnifiedPosPowerReportingType.Advanced**.
     * @type {Integer (Int32)}
     */
    static Offline => 2

    /**
     * The printer is either turned off, or turned on but not ready or not able to respond to requests.
     * 
     * This value is valid if the value of the [PosPrinterCapabilities.PowerReportingType](posprintercapabilities_powerreportingtype.md) property is **UnifiedPosPowerReportingType.Standard**.
     * @type {Integer (Int32)}
     */
    static OffOrOffline => 3

    /**
     * The original equipment manufacturer (OEM) reports extended information about the power state of the printer in the [PosPrinterStatus.ExtendedStatus](posprinterstatus_extendedstatus.md) property.
     * @type {Integer (Int32)}
     */
    static Extended => 4
}
