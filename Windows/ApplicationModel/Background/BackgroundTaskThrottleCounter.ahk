#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Indicates the type of throttle count to check for in a [GetThrottleCount](ibackgroundtaskinstance2_getthrottlecount_730175295.md) request.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.background.backgroundtaskthrottlecounter
 * @namespace Windows.ApplicationModel.Background
 * @version WindowsRuntime 1.4
 */
class BackgroundTaskThrottleCounter extends Win32Enum{

    /**
     * Indicates a request for all throttle counts (CPU and network).
     * @type {Integer (Int32)}
     */
    static All => 0

    /**
     * Indicates a request for CPU throttle count.
     * @type {Integer (Int32)}
     */
    static Cpu => 1

    /**
     * Indicates a request for network throttle count.
     * @type {Integer (Int32)}
     */
    static Network => 2
}
