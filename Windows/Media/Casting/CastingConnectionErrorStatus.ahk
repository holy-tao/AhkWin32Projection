#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Indicates the error status when starting or ending a casting connection.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.media.casting.castingconnectionerrorstatus
 * @namespace Windows.Media.Casting
 * @version WindowsRuntime 1.4
 */
class CastingConnectionErrorStatus extends Win32Enum{

    /**
     * Starting or ending the connection was successful.
     * @type {Integer (Int32)}
     */
    static Succeeded => 0

    /**
     * The device did not respond to the attempt to start or end theconnection.
     * @type {Integer (Int32)}
     */
    static DeviceDidNotRespond => 1

    /**
     * The device returned an error when attempting to start or end the connection.
     * @type {Integer (Int32)}
     */
    static DeviceError => 2

    /**
     * The device was locked and a start or end the connection could not be made.
     * @type {Integer (Int32)}
     */
    static DeviceLocked => 3

    /**
     * The device could not provide protected playback.
     * @type {Integer (Int32)}
     */
    static ProtectedPlaybackFailed => 4

    /**
     * The casting source was invalid.
     * @type {Integer (Int32)}
     */
    static InvalidCastingSource => 5

    /**
     * An unknown error occurred when attempting to start or end the connection.
     * @type {Integer (Int32)}
     */
    static Unknown => 6
}
