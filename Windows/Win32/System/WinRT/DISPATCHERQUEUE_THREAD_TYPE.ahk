#Requires AutoHotkey v2.0.0 64-bit

/**
 * Specifies the thread affinity for a new DispatcherQueueController.
 * @remarks
 * 
  * Introduced in Windows 10, version 1709.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//dispatcherqueue/ne-dispatcherqueue-dispatcherqueue_thread_type
 * @namespace Windows.Win32.System.WinRT
 * @version v4.0.30319
 */
class DISPATCHERQUEUE_THREAD_TYPE{

    /**
     * Specifies that the <a href="https://docs.microsoft.com/uwp/api/windows.system.dispatcherqueuecontroller">DispatcherQueueController</a> be created on a dedicated thread. With this option, <a href="https://docs.microsoft.com/windows/desktop/api/dispatcherqueue/nf-dispatcherqueue-createdispatcherqueuecontroller">CreateDispatcherQueueController</a> creates a thread, the <a href="https://docs.microsoft.com/uwp/api/windows.system.dispatcherqueuecontroller">DispatcherQueueController</a> instance, and runs the dispatcher queue event loop on the newly created thread.
     * @type {Integer (Int32)}
     */
    static DQTYPE_THREAD_DEDICATED => 1

    /**
     * Specifies that the <a href="https://docs.microsoft.com/uwp/api/windows.system.dispatcherqueuecontroller">DispatcherQueueController</a> will be created on the caller's thread.
     * @type {Integer (Int32)}
     */
    static DQTYPE_THREAD_CURRENT => 2
}
