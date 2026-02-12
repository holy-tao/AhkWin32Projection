#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IThreadPoolStatics.ahk
#Include ..\..\..\Guid.ahk

/**
 * Provides access to the thread pool. See [Threading and async programming](/windows/uwp/threading-async/index) for detailed guidance on using the thread pool:
  * 
  * 
  * + [Submit a work item to the thread pool](/windows/uwp/threading-async/submit-a-work-item-to-the-thread-pool)
  * + [Use a timer to submit a work item](/windows/uwp/threading-async/use-a-timer-to-submit-a-work-item)
  * + [Create a periodic work item](/windows/uwp/threading-async/create-a-periodic-work-item)
  * + [How to create and use pre-allocated work items](/previous-versions/windows/apps/jj248673(v=win.10))
  * + [Best practices for using the thread pool](/windows/uwp/threading-async/best-practices-for-using-the-thread-pool)
  * + [How to respond to named events and semaphores](/previous-versions/windows/apps/jj248674(v=win.10))
  * + [How to use functions as work item delegates](/previous-versions/windows/apps/jj710193(v=win.10))
  * > [!NOTE]
  * > The ThreadPool API is supported for desktop as well as UWP apps.
 * @remarks
 * The ThreadPool class has only static methods, so its methods can be called without creating an instance of the class.
 * @see https://learn.microsoft.com/uwp/api/windows.system.threading.threadpool
 * @namespace Windows.System.Threading
 * @version WindowsRuntime 1.4
 */
class ThreadPool extends IInspectable {
;@region Static Methods
    /**
     * Creates a work item and specifies its priority relative to other work items in the thread pool.
     * @param {WorkItemHandler} handler The method to call when a thread becomes available to run the work item.
     * @returns {IAsyncAction} 
     * @see https://learn.microsoft.com/uwp/api/windows.system.threading.threadpool.runasync
     */
    static RunAsync(handler) {
        if (!ThreadPool.HasProp("__IThreadPoolStatics")) {
            activatableClassId := HSTRING.Create("Windows.System.Threading.ThreadPool")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IThreadPoolStatics.IID)
            ThreadPool.__IThreadPoolStatics := IThreadPoolStatics(factoryPtr)
        }

        return ThreadPool.__IThreadPoolStatics.RunAsync(handler)
    }

    /**
     * Creates a work item, specifies its priority relative to other work items in the thread pool, and specifies how long-running work items should be run.
     * @param {WorkItemHandler} handler The method to call when a thread becomes available to run the work item.
     * @param {Integer} priority_ The priority of the work item relative to other work items in the thread pool.
     * @returns {IAsyncAction} 
     * @see https://learn.microsoft.com/uwp/api/windows.system.threading.threadpool.runasync
     */
    static RunWithPriorityAsync(handler, priority_) {
        if (!ThreadPool.HasProp("__IThreadPoolStatics")) {
            activatableClassId := HSTRING.Create("Windows.System.Threading.ThreadPool")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IThreadPoolStatics.IID)
            ThreadPool.__IThreadPoolStatics := IThreadPoolStatics(factoryPtr)
        }

        return ThreadPool.__IThreadPoolStatics.RunWithPriorityAsync(handler, priority_)
    }

    /**
     * Creates a work item.
     * @param {WorkItemHandler} handler The method to call when a thread becomes available to run the work item.
     * @param {Integer} priority_ 
     * @param {Integer} options 
     * @returns {IAsyncAction} 
     * @see https://learn.microsoft.com/uwp/api/windows.system.threading.threadpool.runasync
     */
    static RunWithPriorityAndOptionsAsync(handler, priority_, options) {
        if (!ThreadPool.HasProp("__IThreadPoolStatics")) {
            activatableClassId := HSTRING.Create("Windows.System.Threading.ThreadPool")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IThreadPoolStatics.IID)
            ThreadPool.__IThreadPoolStatics := IThreadPoolStatics(factoryPtr)
        }

        return ThreadPool.__IThreadPoolStatics.RunWithPriorityAndOptionsAsync(handler, priority_, options)
    }

;@endregion Static Methods

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

;@endregion Instance Methods
}
