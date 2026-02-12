#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Specifies the location of the camera overlay within the broadcast video frame.
  * 
  * > [!NOTE]
  * > This API requires the **appBroadcast** and **appBroadcastSettings** capability which is not available to all Windows apps. Unless your developer account is specially provisioned by Microsoft, calls to this API will fail at runtime.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.media.capture.appbroadcastcameraoverlaylocation
 * @namespace Windows.Media.Capture
 * @version WindowsRuntime 1.4
 */
class AppBroadcastCameraOverlayLocation extends Win32Enum{

    /**
     * The overlay is positioned at the top left of the frame.
     * @type {Integer (Int32)}
     */
    static TopLeft => 0

    /**
     * The overlay is positioned at the top center of the frame.
     * @type {Integer (Int32)}
     */
    static TopCenter => 1

    /**
     * The overlay is positioned at the top right of the frame.
     * @type {Integer (Int32)}
     */
    static TopRight => 2

    /**
     * The overlay is positioned at the middle left of the frame.
     * @type {Integer (Int32)}
     */
    static MiddleLeft => 3

    /**
     * The overlay is positioned at the middle center of the frame.
     * @type {Integer (Int32)}
     */
    static MiddleCenter => 4

    /**
     * The overlay is positioned at the middle right of the frame.
     * @type {Integer (Int32)}
     */
    static MiddleRight => 5

    /**
     * The overlay is positioned at the bottom left of the frame.
     * @type {Integer (Int32)}
     */
    static BottomLeft => 6

    /**
     * The overlay is positioned at the bottom center of the frame.
     * @type {Integer (Int32)}
     */
    static BottomCenter => 7

    /**
     * The overlay is positioned at the bottom right of the frame.
     * @type {Integer (Int32)}
     */
    static BottomRight => 8
}
