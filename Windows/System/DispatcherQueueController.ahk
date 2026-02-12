#Requires AutoHotkey v2.0 64-bit

#Include ..\Win32\System\WinRT\Apis.ahk
#Include ..\Win32\System\WinRT\HSTRING.ahk
#Include ..\Win32\System\WinRT\IInspectable.ahk
#Include .\IDispatcherQueueController.ahk
#Include .\IDispatcherQueueControllerStatics.ahk
#Include ..\..\Guid.ahk

/**
 * Manages the lifetime of a [DispatcherQueue](dispatcherqueue.md). Provides methods to create and shutdown the **DispatcherQueue**.
 * @remarks
 * *Object and Thread Lifetime*
 * 
 * **DispatcherQueueController** and its associated **DispatcherQueue** will be kept alive while the event loop is running. When **Shutdown** is completed, the loop is terminated and the dedicated thread will unwind. However,
 * **DispacherQueueController** and the associated **DispatcherQueue** object can outlive thread’s lifetime and will be disposed when all their references are released.
 * @see https://learn.microsoft.com/uwp/api/windows.system.dispatcherqueuecontroller
 * @namespace Windows.System
 * @version WindowsRuntime 1.4
 */
class DispatcherQueueController extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IDispatcherQueueController

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IDispatcherQueueController.IID

;@endregion Static Properties

;@region Static Methods
    /**
     * Creates a [DispatcherQueue](dispatcherqueue.md) that you can use to run tasks on a dedicated thread.
     * @remarks
     * You can access the created **DispatcherQueue** via [DispatcherQueueController.DispatcherQueue](dispatcherqueuecontroller_dispatcherqueue.md).
     * 
     * The created **DispatcherQueue** continues running on its dedicated thread until explicitly shut down.
     * To avoid thread and memory leaks,
     * call [DispatcherQueueController.ShutdownQueueAsync](dispatcherqueuecontroller_shutdownqueueasync_542547627.md)
     * when you are finished with the **DispatcherQueue**.
     * @returns {DispatcherQueueController} 
     * @see https://learn.microsoft.com/uwp/api/windows.system.dispatcherqueuecontroller.createondedicatedthread
     */
    static CreateOnDedicatedThread() {
        if (!DispatcherQueueController.HasProp("__IDispatcherQueueControllerStatics")) {
            activatableClassId := HSTRING.Create("Windows.System.DispatcherQueueController")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IDispatcherQueueControllerStatics.IID)
            DispatcherQueueController.__IDispatcherQueueControllerStatics := IDispatcherQueueControllerStatics(factoryPtr)
        }

        return DispatcherQueueController.__IDispatcherQueueControllerStatics.CreateOnDedicatedThread()
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * Gets the **DispatcherQueue** associated with this **DispatcherQueueController**.
     * @see https://learn.microsoft.com/uwp/api/windows.system.dispatcherqueuecontroller.dispatcherqueue
     * @type {DispatcherQueue} 
     */
    DispatcherQueue {
        get => this.get_DispatcherQueue()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {DispatcherQueue} 
     */
    get_DispatcherQueue() {
        if (!this.HasProp("__IDispatcherQueueController")) {
            if ((queryResult := this.QueryInterface(IDispatcherQueueController.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDispatcherQueueController := IDispatcherQueueController(outPtr)
        }

        return this.__IDispatcherQueueController.get_DispatcherQueue()
    }

    /**
     * Asynchronously stops the [DispatcherQueue](./dispatcherqueue.md) associated with this [DispatcherQueueController](./dispatcherqueuecontroller.md), and shuts down the thread if the **DispatcherQueueController** was created by [CreateOnDedicatedThread](dispatcherqueuecontroller_createondedicatedthread_660689653.md).
     * 
     * This method returns (an asynchronous operation) as soon as the shutdown operation is started; but the asynchronous operation doesn't complete until the shutdown operation is complete.
     * @remarks
     * When you call **ShutdownQueueAsync**, the following events are raised, in this order:
     * 
     * * [ShutdownStarting](./dispatcherqueue_shutdownstarting.md)
     * * [ShutdownCompleted](./dispatcherqueue_shutdowncompleted.md)
     * 
     * Those events are members of the [DispatcherQueue](./dispatcherqueue.md) object, and their purpose is to notify listeners that the **DispatcherQueue** is shutting down. The events are raised on the thread running the **DispatcherQueue** event loop itself.
     * @returns {IAsyncAction} 
     * @see https://learn.microsoft.com/uwp/api/windows.system.dispatcherqueuecontroller.shutdownqueueasync
     */
    ShutdownQueueAsync() {
        if (!this.HasProp("__IDispatcherQueueController")) {
            if ((queryResult := this.QueryInterface(IDispatcherQueueController.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDispatcherQueueController := IDispatcherQueueController(outPtr)
        }

        return this.__IDispatcherQueueController.ShutdownQueueAsync()
    }

;@endregion Instance Methods
}
