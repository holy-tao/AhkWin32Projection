#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Gets a value that specifies the reason that broadcast mode was exited.
  * 
  * > [!NOTE]
  * > This API requires the **appBroadcast** and **appBroadcastSettings** capability which is not available to all Windows apps. Unless your developer account is specially provisioned by Microsoft, calls to this API will fail at runtime.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.media.capture.appbroadcastexitbroadcastmodereason
 * @namespace Windows.Media.Capture
 * @version WindowsRuntime 1.4
 */
class AppBroadcastExitBroadcastModeReason extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static NormalExit => 0

    /**
     * @type {Integer (Int32)}
     */
    static UserCanceled => 1

    /**
     * @type {Integer (Int32)}
     */
    static AuthorizationFail => 2

    /**
     * @type {Integer (Int32)}
     */
    static ForegroundAppActivated => 3
}
