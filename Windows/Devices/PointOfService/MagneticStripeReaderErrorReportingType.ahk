#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Defines the constants that indicates the error reporting type for the device.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.magneticstripereadererrorreportingtype
 * @namespace Windows.Devices.PointOfService
 * @version WindowsRuntime 1.4
 */
class MagneticStripeReaderErrorReportingType extends Win32Enum{

    /**
     * Report errors at the card level.
     * @type {Integer (Int32)}
     */
    static CardLevel => 0

    /**
     * Report errors at the track level.
     * @type {Integer (Int32)}
     */
    static TrackLevel => 1
}
