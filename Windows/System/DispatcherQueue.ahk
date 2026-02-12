#Requires AutoHotkey v2.0 64-bit

#Include ..\Win32\System\WinRT\Apis.ahk
#Include ..\Win32\System\WinRT\HSTRING.ahk
#Include ..\Win32\System\WinRT\IInspectable.ahk
#Include .\IDispatcherQueue.ahk
#Include .\IDispatcherQueue2.ahk
#Include .\IDispatcherQueueStatics.ahk
#Include ..\Foundation\TypedEventHandler.ahk
#Include .\DispatcherQueue.ahk
#Include .\DispatcherQueueShutdownStartingEventArgs.ahk
#Include ..\..\Guid.ahk
#Include ..\..\WinRTEventHandler.ahk

/**
 * Manages a prioritized queue on which tasks execute in a serial fashion on a thread.
 * @remarks
 * All tasks dispatched to a queue execute on the same thread.
 * @see https://learn.microsoft.com/uwp/api/windows.system.dispatcherqueue
 * @namespace Windows.System
 * @version WindowsRuntime 1.4
 */
class DispatcherQueue extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IDispatcherQueue

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IDispatcherQueue.IID

;@endregion Static Properties

;@region Static Methods
    /**
     * Gets the **DispatcherQueue** associated with the current thread.
     * @returns {DispatcherQueue} 
     * @see https://learn.microsoft.com/uwp/api/windows.system.dispatcherqueue.getforcurrentthread
     */
    static GetForCurrentThread() {
        if (!DispatcherQueue.HasProp("__IDispatcherQueueStatics")) {
            activatableClassId := HSTRING.Create("Windows.System.DispatcherQueue")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IDispatcherQueueStatics.IID)
            DispatcherQueue.__IDispatcherQueueStatics := IDispatcherQueueStatics(factoryPtr)
        }

        return DispatcherQueue.__IDispatcherQueueStatics.GetForCurrentThread()
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * Gets a value indicating whether the [DispatcherQueue](dispatcherqueue.md) has access to the current thread.
     * @see https://learn.microsoft.com/uwp/api/windows.system.dispatcherqueue.hasthreadaccess
     * @type {Boolean} 
     */
    HasThreadAccess {
        get => this.get_HasThreadAccess()
    }

    /**
     * Raised when [ShutdownQueueAsync](dispatcherqueuecontroller_shutdownqueueasync_542547627.md) is called. For a full list of the events raised, and in what order, see the Remarks for [ShutdownQueueAsync](dispatcherqueuecontroller_shutdownqueueasync_542547627.md).
     * @remarks
     * The **ShutdownStarting** event is raised from the event loop thread *before* the event loop exits. The handler for this event can take a deferral, and can continue to post work until the deferral completes. Once the deferral completes, the **DispatcherQueue** no longer accepts work, and [DispatcherQueue.TryEnqueue](dispatcherqueue_tryenqueue_591440238.md) returns `false`.
     * @type {TypedEventHandler<DispatcherQueue, DispatcherQueueShutdownStartingEventArgs>}
    */
    OnShutdownStarting {
        get {
            if(!this.HasProp("__OnShutdownStarting")){
                this.__OnShutdownStarting := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{b58b5e24-e1c6-528e-9d99-07ec8829dea5}"),
                    DispatcherQueue,
                    DispatcherQueueShutdownStartingEventArgs
                )
                this.__OnShutdownStartingToken := this.add_ShutdownStarting(this.__OnShutdownStarting.iface)
            }
            return this.__OnShutdownStarting
        }
    }

    /**
     * Raised when [ShutdownQueueAsync](./dispatcherqueuecontroller_shutdownqueueasync_542547627.md) is called. For a full list of the events raised, and in what order, see the Remarks for [ShutdownQueueAsync](./dispatcherqueuecontroller_shutdownqueueasync_542547627.md).
     * @remarks
     * The **ShutdownCompleted** event is raised from the event loop thread *after* the event loop has exited. You can use the handler for this event to clean up any state maintained by partner components that were maintained on the dedicated thread.
     * @type {TypedEventHandler<DispatcherQueue, IInspectable>}
    */
    OnShutdownCompleted {
        get {
            if(!this.HasProp("__OnShutdownCompleted")){
                this.__OnShutdownCompleted := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{fe79f855-2f40-5b88-a0c3-4c042a05dd05}"),
                    DispatcherQueue,
                    IInspectable
                )
                this.__OnShutdownCompletedToken := this.add_ShutdownCompleted(this.__OnShutdownCompleted.iface)
            }
            return this.__OnShutdownCompleted
        }
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    __Delete() {
        if(this.HasProp("__OnShutdownStartingToken")) {
            this.remove_ShutdownStarting(this.__OnShutdownStartingToken)
            this.__OnShutdownStarting.iface.Dispose()
        }

        if(this.HasProp("__OnShutdownCompletedToken")) {
            this.remove_ShutdownCompleted(this.__OnShutdownCompletedToken)
            this.__OnShutdownCompleted.iface.Dispose()
        }

        super.__Delete()
    }

    /**
     * Creates a **DispatcherQueueTimer** on the **DispatcherQueue** to execute a task periodically after a time interval has elapsed.
     * @remarks
     * By default, a repeating timer is created. Set **IsRepeating** to **false** to make it non-repeating.
     * @returns {DispatcherQueueTimer} 
     * @see https://learn.microsoft.com/uwp/api/windows.system.dispatcherqueue.createtimer
     */
    CreateTimer() {
        if (!this.HasProp("__IDispatcherQueue")) {
            if ((queryResult := this.QueryInterface(IDispatcherQueue.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDispatcherQueue := IDispatcherQueue(outPtr)
        }

        return this.__IDispatcherQueue.CreateTimer()
    }

    /**
     * Adds a task to the **DispatcherQueue** which will be executed on the thread associated with the **DispatcherQueue**.
     * @remarks
     * The queue will invoke **callback** serially and in priority order.
     * 
     * Once [ShutdownQueueAsync()](dispatcherqueuecontroller_shutdownqueueasync_542547627.md) has been called, the queue will not queue new tasks and this method will return **false**.
     * @param {DispatcherQueueHandler} callback A delegate to the task to execute.
     * @returns {Boolean} 
     * @see https://learn.microsoft.com/uwp/api/windows.system.dispatcherqueue.tryenqueue
     */
    TryEnqueue(callback) {
        if (!this.HasProp("__IDispatcherQueue")) {
            if ((queryResult := this.QueryInterface(IDispatcherQueue.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDispatcherQueue := IDispatcherQueue(outPtr)
        }

        return this.__IDispatcherQueue.TryEnqueue(callback)
    }

    /**
     * Adds a task to the **DispatcherQueue** which will be executed on the thread  associated with the **DispatcherQueue**.
     * @remarks
     * The task will be queued at **Normal** priority. The queue will invoke **callback** serially and in priority order.
     * 
     * Once [ShutdownQueueAsync()](dispatcherqueuecontroller_shutdownqueueasync_542547627.md) has been called, the queue will not queue new tasks and this method will return **false**.
     * @param {Integer} priority_ 
     * @param {DispatcherQueueHandler} callback The task to execute.
     * @returns {Boolean} 
     * @see https://learn.microsoft.com/uwp/api/windows.system.dispatcherqueue.tryenqueue
     */
    TryEnqueueWithPriority(priority_, callback) {
        if (!this.HasProp("__IDispatcherQueue")) {
            if ((queryResult := this.QueryInterface(IDispatcherQueue.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDispatcherQueue := IDispatcherQueue(outPtr)
        }

        return this.__IDispatcherQueue.TryEnqueueWithPriority(priority_, callback)
    }

    /**
     * 
     * @param {TypedEventHandler<DispatcherQueue, DispatcherQueueShutdownStartingEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_ShutdownStarting(handler) {
        if (!this.HasProp("__IDispatcherQueue")) {
            if ((queryResult := this.QueryInterface(IDispatcherQueue.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDispatcherQueue := IDispatcherQueue(outPtr)
        }

        return this.__IDispatcherQueue.add_ShutdownStarting(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_ShutdownStarting(token) {
        if (!this.HasProp("__IDispatcherQueue")) {
            if ((queryResult := this.QueryInterface(IDispatcherQueue.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDispatcherQueue := IDispatcherQueue(outPtr)
        }

        return this.__IDispatcherQueue.remove_ShutdownStarting(token)
    }

    /**
     * 
     * @param {TypedEventHandler<DispatcherQueue, IInspectable>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_ShutdownCompleted(handler) {
        if (!this.HasProp("__IDispatcherQueue")) {
            if ((queryResult := this.QueryInterface(IDispatcherQueue.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDispatcherQueue := IDispatcherQueue(outPtr)
        }

        return this.__IDispatcherQueue.add_ShutdownCompleted(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_ShutdownCompleted(token) {
        if (!this.HasProp("__IDispatcherQueue")) {
            if ((queryResult := this.QueryInterface(IDispatcherQueue.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDispatcherQueue := IDispatcherQueue(outPtr)
        }

        return this.__IDispatcherQueue.remove_ShutdownCompleted(token)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_HasThreadAccess() {
        if (!this.HasProp("__IDispatcherQueue2")) {
            if ((queryResult := this.QueryInterface(IDispatcherQueue2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDispatcherQueue2 := IDispatcherQueue2(outPtr)
        }

        return this.__IDispatcherQueue2.get_HasThreadAccess()
    }

;@endregion Instance Methods
}
