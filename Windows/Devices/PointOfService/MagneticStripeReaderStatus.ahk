#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Defines the constants that indicate the device authentication status.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.magneticstripereaderstatus
 * @namespace Windows.Devices.PointOfService
 * @version WindowsRuntime 1.4
 */
class MagneticStripeReaderStatus extends Win32Enum{

    /**
     * A device not authenticated.
     * @type {Integer (Int32)}
     */
    static Unauthenticated => 0

    /**
     * An authenticated device.
     * @type {Integer (Int32)}
     */
    static Authenticated => 1

    /**
     * Vendor specific status.
     * @type {Integer (Int32)}
     */
    static Extended => 2
}
