#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Defines the state of a camera stream.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.media.devices.camerastreamstate
 * @namespace Windows.Media.Devices
 * @version WindowsRuntime 1.4
 */
class CameraStreamState extends Win32Enum{

    /**
     * The camera stream is not currently streaming.
     * @type {Integer (Int32)}
     */
    static NotStreaming => 0

    /**
     * The camera stream is currently streaming.
     * @type {Integer (Int32)}
     */
    static Streaming => 1

    /**
     * Frames in the stream are being dropped for privacy reasons.
     * @type {Integer (Int32)}
     */
    static BlockedForPrivacy => 2

    /**
     * The camera stream has been shut down.
     * @type {Integer (Int32)}
     */
    static Shutdown => 3
}
