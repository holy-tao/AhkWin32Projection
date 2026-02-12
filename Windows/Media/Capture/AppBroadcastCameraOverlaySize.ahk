#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Specifies the size of the camera overlay within the broadcast video frame.
  * 
  * > [!NOTE]
  * > This API requires the **appBroadcast** and **appBroadcastSettings** capability which is not available to all Windows apps. Unless your developer account is specially provisioned by Microsoft, calls to this API will fail at runtime.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.media.capture.appbroadcastcameraoverlaysize
 * @namespace Windows.Media.Capture
 * @version WindowsRuntime 1.4
 */
class AppBroadcastCameraOverlaySize extends Win32Enum{

    /**
     * Small overlay size.
     * @type {Integer (Int32)}
     */
    static Small => 0

    /**
     * Medium overlay size.
     * @type {Integer (Int32)}
     */
    static Medium => 1

    /**
     * Large overlay size.
     * @type {Integer (Int32)}
     */
    static Large => 2
}
