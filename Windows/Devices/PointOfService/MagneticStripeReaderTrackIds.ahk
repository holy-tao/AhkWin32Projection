#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Defines the constants that indicates the device track ID to read.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.magneticstripereadertrackids
 * @namespace Windows.Devices.PointOfService
 * @version WindowsRuntime 1.4
 */
class MagneticStripeReaderTrackIds extends Win32Enum{

    /**
     * No track ID
     * @type {Integer (Int32)}
     */
    static None => 0

    /**
     * Read track 1
     * @type {Integer (Int32)}
     */
    static Track1 => 1

    /**
     * Read track 2
     * @type {Integer (Int32)}
     */
    static Track2 => 2

    /**
     * Read track 3
     * @type {Integer (Int32)}
     */
    static Track3 => 4

    /**
     * Read track 4
     * @type {Integer (Int32)}
     */
    static Track4 => 8
}
