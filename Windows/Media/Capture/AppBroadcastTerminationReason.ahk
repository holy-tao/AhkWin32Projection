#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Specifies the reason that an app broadcast was terminated.
  * 
  * > [!NOTE]
  * > This API requires the **appBroadcast** and **appBroadcastSettings** capability which is not available to all Windows apps. Unless your developer account is specially provisioned by Microsoft, calls to this API will fail at runtime.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.media.capture.appbroadcastterminationreason
 * @namespace Windows.Media.Capture
 * @version WindowsRuntime 1.4
 */
class AppBroadcastTerminationReason extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static NormalTermination => 0

    /**
     * @type {Integer (Int32)}
     */
    static LostConnectionToService => 1

    /**
     * @type {Integer (Int32)}
     */
    static NoNetworkConnectivity => 2

    /**
     * @type {Integer (Int32)}
     */
    static ServiceAbort => 3

    /**
     * @type {Integer (Int32)}
     */
    static ServiceError => 4

    /**
     * @type {Integer (Int32)}
     */
    static ServiceUnavailable => 5

    /**
     * @type {Integer (Int32)}
     */
    static InternalError => 6

    /**
     * @type {Integer (Int32)}
     */
    static UnsupportedFormat => 7

    /**
     * @type {Integer (Int32)}
     */
    static BackgroundTaskTerminated => 8

    /**
     * @type {Integer (Int32)}
     */
    static BackgroundTaskUnresponsive => 9
}
