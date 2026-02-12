#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\System\DispatcherQueue.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * Defines the behavior of pointer input (for processing on a worker thread).
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.ui.core.icorepointerinputsource2
 * @namespace Windows.UI.Core
 * @version WindowsRuntime 1.4
 */
class ICorePointerInputSource2 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ICorePointerInputSource2
     * @type {Guid}
     */
    static IID => Guid("{d703708a-4516-4786-b1e5-2751d563f997}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_DispatcherQueue"]

    /**
     * Gets the [DispatcherQueue](../windows.system/dispatcherqueue.md) associated with a platform object.
     * @remarks
     * Some platform objects require thread affinity for posting events back to the thread where the object was instantiated. The [DispatcherQueue](../windows.system/dispatcherqueue.md) lets you post work to this thread. 
     * 
     * These platform objects can be created on the UI thread, where the [DispatcherQueue](../windows.system/dispatcherqueue.md) already exists, or they can be created on a long running, non-UI thread with a DispatcherQueue created with the [DispatcherQueueController.CreateOnDedicatedThread](../windows.system/dispatcherqueuecontroller_createondedicatedthread_660689653.md) method.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.core.icorepointerinputsource2.dispatcherqueue
     * @type {DispatcherQueue} 
     */
    DispatcherQueue {
        get => this.get_DispatcherQueue()
    }

    /**
     * 
     * @returns {DispatcherQueue} 
     */
    get_DispatcherQueue() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return DispatcherQueue(value)
    }
}
