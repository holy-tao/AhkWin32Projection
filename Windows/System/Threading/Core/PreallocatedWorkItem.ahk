#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IPreallocatedWorkItem.ahk
#Include .\IPreallocatedWorkItemFactory.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * A preallocated work item is constructed in advance of its submission to the thread pool, ensuring that the work item is constructed so that it can be submitted to the thread pool when necessary. For example, a PreallocatedWorkItem can be created in case it is needed for a resource deallocation routine, since the resource deallocation routine may be called in circumstances when not enough resources would be available to create the work item.
  * 
  * > [!NOTE]
  * > The ThreadPool API is supported for desktop as well as UWP apps.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.system.threading.core.preallocatedworkitem
 * @namespace Windows.System.Threading.Core
 * @version WindowsRuntime 1.4
 */
class PreallocatedWorkItem extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IPreallocatedWorkItem

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IPreallocatedWorkItem.IID

;@endregion Static Properties

;@region Static Methods
    /**
     * Initializes a new work item with a [WorkItemHandler](../windows.system.threading/workitemhandler.md) delegate, allocating resources for the work item in advance.
     * @remarks
     * In C++, make sure that methods used as [WorkItemHandler](../windows.system.threading/workitemhandler.md) delegates exhibit agile threading model behavior. Calling a non-agile method from a work item will cause a deadlock to occur.
     * @param {WorkItemHandler} handler Indicates the method that the preallocated work item will run.
     * @returns {PreallocatedWorkItem} 
     * @see https://learn.microsoft.com/uwp/api/windows.system.threading.core.preallocatedworkitem.#ctor
     */
    static CreateWorkItem(handler) {
        if (!PreallocatedWorkItem.HasProp("__IPreallocatedWorkItemFactory")) {
            activatableClassId := HSTRING.Create("Windows.System.Threading.Core.PreallocatedWorkItem")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IPreallocatedWorkItemFactory.IID)
            PreallocatedWorkItem.__IPreallocatedWorkItemFactory := IPreallocatedWorkItemFactory(factoryPtr)
        }

        return PreallocatedWorkItem.__IPreallocatedWorkItemFactory.CreateWorkItem(handler)
    }

    /**
     * Initializes a new work item with a [WorkItemHandler](../windows.system.threading/workitemhandler.md) delegate, allocating resources for the work item in advance, and specifies the priority of the work item relative to other work items in the thread pool.
     * @remarks
     * See the remarks section of the [PreallocatedWorkItem(WorkItemHandler)](preallocatedworkitem_preallocatedworkitem_1246050329.md) overload.
     * @param {WorkItemHandler} handler Indicates the method that the preallocated work item will run.
     * @param {Integer} priority_ The priority of the work item relative to other work items in the thread pool. The value of this parameter can be **Low**, **Normal**, or **High**.
     * @returns {PreallocatedWorkItem} 
     * @see https://learn.microsoft.com/uwp/api/windows.system.threading.core.preallocatedworkitem.#ctor
     */
    static CreateWorkItemWithPriority(handler, priority_) {
        if (!PreallocatedWorkItem.HasProp("__IPreallocatedWorkItemFactory")) {
            activatableClassId := HSTRING.Create("Windows.System.Threading.Core.PreallocatedWorkItem")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IPreallocatedWorkItemFactory.IID)
            PreallocatedWorkItem.__IPreallocatedWorkItemFactory := IPreallocatedWorkItemFactory(factoryPtr)
        }

        return PreallocatedWorkItem.__IPreallocatedWorkItemFactory.CreateWorkItemWithPriority(handler, priority_)
    }

    /**
     * Initializes a new work item with a [WorkItemHandler](../windows.system.threading/workitemhandler.md) delegate, allocating resources for the work item in advance, and specifies the priority of the work item relative to other work items in the thread pool. Also specifies how the thread pool will allocate processor time for the work item.
     * @remarks
     * See the remarks section of the [PreallocatedWorkItem(WorkItemHandler)](preallocatedworkitem_preallocatedworkitem_1246050329.md) overload.
     * @param {WorkItemHandler} handler Indicates the method that the preallocated work item will run.
     * @param {Integer} priority_ The priority of the work item relative to other work items in the thread pool. The value of this parameter can be **Low**, **Normal**, or **High**.
     * @param {Integer} options If this parameter is set to **TimeSliced**, the work item runs simultaneously with other time-sliced work items, with each work item receiving a share of processor time. If this parameter is set to **None**, the work item runs when a worker thread becomes available.
     * @returns {PreallocatedWorkItem} 
     * @see https://learn.microsoft.com/uwp/api/windows.system.threading.core.preallocatedworkitem.#ctor
     */
    static CreateWorkItemWithPriorityAndOptions(handler, priority_, options) {
        if (!PreallocatedWorkItem.HasProp("__IPreallocatedWorkItemFactory")) {
            activatableClassId := HSTRING.Create("Windows.System.Threading.Core.PreallocatedWorkItem")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IPreallocatedWorkItemFactory.IID)
            PreallocatedWorkItem.__IPreallocatedWorkItemFactory := IPreallocatedWorkItemFactory(factoryPtr)
        }

        return PreallocatedWorkItem.__IPreallocatedWorkItemFactory.CreateWorkItemWithPriorityAndOptions(handler, priority_, options)
    }

;@endregion Static Methods

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * Submits the preallocated work item to the thread pool, without requiring any additional resources to be allocated.
     * @remarks
     * For information about how [IAsyncAction](../windows.foundation/iasyncaction.md) applies to work items, see [Windows.System.Threading.RunAsync](../windows.system.threading/threadpool_runasync_514988780.md).
     * @returns {IAsyncAction} 
     * @see https://learn.microsoft.com/uwp/api/windows.system.threading.core.preallocatedworkitem.runasync
     */
    RunAsync() {
        if (!this.HasProp("__IPreallocatedWorkItem")) {
            if ((queryResult := this.QueryInterface(IPreallocatedWorkItem.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPreallocatedWorkItem := IPreallocatedWorkItem(outPtr)
        }

        return this.__IPreallocatedWorkItem.RunAsync()
    }

;@endregion Instance Methods
}
