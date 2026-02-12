#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Defines the constants that indicates the track error type.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.magneticstripereadertrackerrortype
 * @namespace Windows.Devices.PointOfService
 * @version WindowsRuntime 1.4
 */
class MagneticStripeReaderTrackErrorType extends Win32Enum{

    /**
     * No specified error.
     * @type {Integer (Int32)}
     */
    static None => 0

    /**
     * A start sentinel error.
     * @type {Integer (Int32)}
     */
    static StartSentinelError => 1

    /**
     * An end sentinel error.
     * @type {Integer (Int32)}
     */
    static EndSentinelError => 2

    /**
     * A parity error.
     * @type {Integer (Int32)}
     */
    static ParityError => 3

    /**
     * An LRC error.
     * @type {Integer (Int32)}
     */
    static LrcError => 4

    /**
     * An unknown error.
     * @type {Integer (Int32)}
     */
    static Unknown => -1
}
