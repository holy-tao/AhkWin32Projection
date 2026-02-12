#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Specifies the state of an app broadcast stream.
  * 
  * > [!NOTE]
  * > This API requires the **appBroadcast** and **appBroadcastSettings** capability which is not available to all Windows apps. Unless your developer account is specially provisioned by Microsoft, calls to this API will fail at runtime.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.media.capture.appbroadcaststreamstate
 * @namespace Windows.Media.Capture
 * @version WindowsRuntime 1.4
 */
class AppBroadcastStreamState extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static Initializing => 0

    /**
     * @type {Integer (Int32)}
     */
    static StreamReady => 1

    /**
     * @type {Integer (Int32)}
     */
    static Started => 2

    /**
     * @type {Integer (Int32)}
     */
    static Paused => 3

    /**
     * @type {Integer (Int32)}
     */
    static Terminated => 4
}
