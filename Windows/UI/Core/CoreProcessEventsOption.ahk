#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Specifies the set of exclusive event-processing options passed to [ProcessEvents](coredispatcher_processevents_1611214514.md).
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.ui.core.coreprocesseventsoption
 * @namespace Windows.UI.Core
 * @version WindowsRuntime 1.4
 */
class CoreProcessEventsOption extends Win32Enum{

    /**
     * Dispatch all currently available events in the queue. If no events are pending, wait for the next new event.
     * @type {Integer (Int32)}
     */
    static ProcessOneAndAllPending => 0

    /**
     * Dispatch one event if it is currently pending in the queue. If no events are pending, do not wait for a new event to be raised but instead return immediately.
     * @type {Integer (Int32)}
     */
    static ProcessOneIfPresent => 1

    /**
     * Wait for new events and dispatch all available events. Continue this behavior until the window is closed or the application calls the [Close](corewindow_close_811482585.md) method on the [CoreWindow](corewindow.md) instance.
     * @type {Integer (Int32)}
     */
    static ProcessUntilQuit => 2

    /**
     * Dispatch all events currently pending in the queue. If no events are pending, do not wait for a new event to be raised but instead return immediately. This option is provided specifically for view provider implementations with [IFrameworkView](../windows.applicationmodel.core/iframeworkview.md), and to be used in UWP app using DirectX with C++.
     * @type {Integer (Int32)}
     */
    static ProcessAllIfPresent => 3
}
