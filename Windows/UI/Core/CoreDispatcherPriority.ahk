#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Defines the priority for window event dispatches.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.ui.core.coredispatcherpriority
 * @namespace Windows.UI.Core
 * @version WindowsRuntime 1.4
 */
class CoreDispatcherPriority extends Win32Enum{

    /**
     * Lowest priority. Use this priority for background tasks. Delegates are processed when the window's main thread is idle and there is no input pending in the queue.
     * @type {Integer (Int32)}
     */
    static Idle => -2

    /**
     * Low priority. Delegates are processed if there are no higher priority events pending in the queue.
     * @type {Integer (Int32)}
     */
    static Low => -1

    /**
     * Normal priority. Delegates are processed in the order they are scheduled.
     * @type {Integer (Int32)}
     */
    static Normal => 0

    /**
     * High priority. Delegates are invoked immediately for all synchronous requests. Asynchronous requests are queued and processed before any other request type.
     * 
     * > [!NOTE]
     * > Do not use this priority level in your app. It is reserved for system events. Using this priority can lead to the starvation of other messages, including system events.
     * @type {Integer (Int32)}
     */
    static High => 1
}
