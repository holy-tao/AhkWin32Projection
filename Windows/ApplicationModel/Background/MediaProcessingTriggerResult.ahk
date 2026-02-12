#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Specifies the result of a call to [MediaProcessingTrigger.RequestAsync](/uwp/api/windows.applicationmodel.background.mediaprocessingtrigger.requestasync).
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.background.mediaprocessingtriggerresult
 * @namespace Windows.ApplicationModel.Background
 * @version WindowsRuntime 1.4
 */
class MediaProcessingTriggerResult extends Win32Enum{

    /**
     * The media processing trigger request was successful.
     * @type {Integer (Int32)}
     */
    static Allowed => 0

    /**
     * The media processing background task is currently running.
     * @type {Integer (Int32)}
     */
    static CurrentlyRunning => 1

    /**
     * The media processing trigger is disabled by policy on the device.
     * @type {Integer (Int32)}
     */
    static DisabledByPolicy => 2

    /**
     * An unknown error occurred.
     * @type {Integer (Int32)}
     */
    static UnknownError => 3
}
