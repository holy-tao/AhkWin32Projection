#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Specifies the state of app broadcast camera capture.
  * 
  * > [!NOTE]
  * > This API requires the **appBroadcast** and **appBroadcastSettings** capability which is not available to all Windows apps. Unless your developer account is specially provisioned by Microsoft, calls to this API will fail at runtime.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.media.capture.appbroadcastcameracapturestate
 * @namespace Windows.Media.Capture
 * @version WindowsRuntime 1.4
 */
class AppBroadcastCameraCaptureState extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static Stopped => 0

    /**
     * @type {Integer (Int32)}
     */
    static Started => 1

    /**
     * @type {Integer (Int32)}
     */
    static Failed => 2
}
