#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\ICoreDispatcher.ahk
#Include .\ICoreAcceleratorKeys.ahk
#Include .\ICoreDispatcherWithTaskPriority.ahk
#Include .\ICoreDispatcher2.ahk
#Include ..\..\Foundation\TypedEventHandler.ahk
#Include .\CoreDispatcher.ahk
#Include .\AcceleratorKeyEventArgs.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\..\WinRTEventHandler.ahk

/**
 * Provides the Windows Runtime core event message dispatcher. Instances of this type are responsible for processing the window messages and dispatching the events to the client.
 * @remarks
 * Instances of this type can be obtained from the CoreWindow.Dispatcher property. The current [CoreWindow](corewindow.md) instance can be obtained by calling [CoreWindow.GetForCurrentThread](corewindow_getforcurrentthread_1771949562.md).
 * 
 * ```cppwinrt
 * // App.cpp
 * ...
 * // An implementation of IFrameworkView::Run.
 * void Run()
 * {
 *     CoreWindow window{ CoreWindow::GetForCurrentThread() };
 *     window.Activate();
 * 
 *     CoreDispatcher dispatcher{ window.Dispatcher() };
 *     dispatcher.ProcessEvents(CoreProcessEventsOption::ProcessUntilQuit);
 * }
 * 
 * // The CoreApplication::Run call indirectly calls the App::Run function above.
 * int __stdcall wWinMain(HINSTANCE, HINSTANCE, PWSTR, int)
 * {
 *     CoreApplication::Run(App());
 * }
 * ```
 * 
 * ```cppcx
 * void MyCoreWindowEvents::Run() // this is an implementation of IFrameworkView::Run() used to show context. It is called by CoreApplication::Run().
 * {
 *     CoreWindow::GetForCurrentThread()->Activate();
 * 
 *     //...
 * 
 *     CoreWindow::GetForCurrentThread()->Dispatcher->ProcessEvents(CoreProcessEventsOption::ProcessUntilQuit);
 * }
 * ```
 * @see https://learn.microsoft.com/uwp/api/windows.ui.core.coredispatcher
 * @namespace Windows.UI.Core
 * @version WindowsRuntime 1.4
 */
class CoreDispatcher extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => ICoreDispatcher

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => ICoreDispatcher.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets a value that specifies whether the event dispatcher provided by this instance of [CoreWindow](corewindow.md) has access to the current thread or not.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.core.coredispatcher.hasthreadaccess
     * @type {Boolean} 
     */
    HasThreadAccess {
        get => this.get_HasThreadAccess()
    }

    /**
     * Gets and sets the priority of the current task.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.core.coredispatcher.currentpriority
     * @type {Integer} 
     */
    CurrentPriority {
        get => this.get_CurrentPriority()
        set => this.put_CurrentPriority(value)
    }

    /**
     * Fired when an accelerator key is activated (pressed or held down).
     * @remarks
     * XAML processes CTRL+TAB or CTRL+SHIFT+TAB key presses for tab navigation, and apps do not get a chance to handle them from the **AcceleratorKeyActivated** event. Starting in Windows 8.1, we will allow the tab navigation processing with CTRL+TAB or ALT+TAB or SHIFT+TAB.
     * 
     * If you handled the **AcceleratorKeyActivated** event in Windows 8 to do special processing, the event will get fired for Tab keys when invoked with CTRL, ALT, or SHIFT modifiers in Windows 8.1. Verify tab navigation with CTRL+TAB or ALT+TAB or SHIFT+TAB keys.
     * @type {TypedEventHandler<CoreDispatcher, AcceleratorKeyEventArgs>}
    */
    OnAcceleratorKeyActivated {
        get {
            if(!this.HasProp("__OnAcceleratorKeyActivated")){
                this.__OnAcceleratorKeyActivated := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{136dff0d-f7e8-5153-b31c-86390c701880}"),
                    CoreDispatcher,
                    AcceleratorKeyEventArgs
                )
                this.__OnAcceleratorKeyActivatedToken := this.add_AcceleratorKeyActivated(this.__OnAcceleratorKeyActivated.iface)
            }
            return this.__OnAcceleratorKeyActivated
        }
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    __Delete() {
        if(this.HasProp("__OnAcceleratorKeyActivatedToken")) {
            this.remove_AcceleratorKeyActivated(this.__OnAcceleratorKeyActivatedToken)
            this.__OnAcceleratorKeyActivated.iface.Dispose()
        }

        super.__Delete()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_HasThreadAccess() {
        if (!this.HasProp("__ICoreDispatcher")) {
            if ((queryResult := this.QueryInterface(ICoreDispatcher.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICoreDispatcher := ICoreDispatcher(outPtr)
        }

        return this.__ICoreDispatcher.get_HasThreadAccess()
    }

    /**
     * Starts the dispatcher processing the input event queue for this instance of [CoreWindow](corewindow.md).
     * @param {Integer} options Determines how many events to process, and if this method should block.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.core.coredispatcher.processevents
     */
    ProcessEvents(options) {
        if (!this.HasProp("__ICoreDispatcher")) {
            if ((queryResult := this.QueryInterface(ICoreDispatcher.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICoreDispatcher := ICoreDispatcher(outPtr)
        }

        return this.__ICoreDispatcher.ProcessEvents(options)
    }

    /**
     * Schedules the provided callback on the UI thread from a worker thread, and returns the results asynchronously.
     * @remarks
     * If you're on a worker thread, and you want to schedule work on the UI thread, use **CoreDispatcher.RunAsync**. Always set the priority to [CoreDispatcherPriority.Normal](coredispatcherpriority.md) or [CoreDispatcherPriority.Low](coredispatcherpriority.md), and ensure that any chained callbacks also use [CoreDispatcherPriority.Normal](coredispatcherpriority.md) or [CoreDispatcherPriority.Low](coredispatcherpriority.md).
     * 
     * > [!NOTE]
     * > Callbacks scheduled with [CoreDispatcherPriority.Low](coredispatcherpriority.md) priority are called when there are no pending input events. Use the [CoreDispatcherPriority.Low](coredispatcherpriority.md) priority to make your app UI more responsive. To schedule background tasks, use [CoreDispatcher.RunIdleAsync](coredispatcher_runidleasync_1309054974.md).
     * 
     * To spin off a worker thread from the UI thread, do not use this method (CoreDispatcher.RunAsync). Instead, use one of the [Windows.System.Threading.ThreadPool.RunAsync](../windows.system.threading/threadpool_runasync_514988780.md) method overloads.
     * 
     * This method completes successfully when the CoreDispatcher starts to shut down, but does not run the specified callback on the UI thread. Use [CoreDispatcher.TryRunAsync](coredispatcher_tryrunasync_1355560768.md) if you need to detect this case.
     * 
     * **C++/WinRT**. An alternative to **CoreDispatcher.RunAsync** is [**winrt::resume_foreground**](/uwp/cpp-ref-for-winrt/resume-foreground).
     * @param {Integer} priority_ Specifies the priority for event dispatch. Set this to [CoreDispatcherPriority.Normal](coredispatcherpriority.md).
     * @param {DispatchedHandler} agileCallback The callback on which the dispatcher returns when the event is dispatched.
     * @returns {IAsyncAction} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.core.coredispatcher.runasync
     */
    RunAsync(priority_, agileCallback) {
        if (!this.HasProp("__ICoreDispatcher")) {
            if ((queryResult := this.QueryInterface(ICoreDispatcher.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICoreDispatcher := ICoreDispatcher(outPtr)
        }

        return this.__ICoreDispatcher.RunAsync(priority_, agileCallback)
    }

    /**
     * Schedules a callback on the UI thread from a worker thread at idle priority, and returns the results asynchronously.
     * @remarks
     * The RunIdleAsync method is very similar to [CoreDispatcher.RunAsync](coredispatcher_runasync_447339746.md), except that it always schedules the work item at [CoreDispatcherPriority.Low](coredispatcherpriority.md) priority. When you schedule a work item by calling RunIdleAsync from a worker thread, the work item is processed only when there are no event messages pending in the queue. This allows your app to perform tasks such as spell check or other discrete processing while the system is idle. If the [IdleDispatchedHandler](idledispatchedhandler.md) delegate returned by the callback has the [IsDispatcherIdle](idledispatchedhandlerargs_isdispatcheridle.md) property set to **false**, the work item immediately exits background processing until the event queue is empty again.
     * 
     * However, while your app is processing a background task, it can continue processing as long as there are no event messages pending in the [CoreDispatcher](coredispatcher.md) event message queue. If your app receives an event message in the queue, then it must break out of the background processing. To determine when your app must exit background processing, access the [IsDispatcherIdle](idledispatchedhandlerargs_isdispatcheridle.md) property on the [IdleDispatchedHandlerArgs](idledispatchedhandlerargs.md) object returned by the [IdleDispatchedHandler](idledispatchedhandler.md) callback you provided to RunIdleAsync. If there is a message, exit background processing and set the priority to [CoreDispatcherPriority.Normal](coredispatcherpriority.md). Otherwise, if the callback continues to run without checking the dispatcher status, it could lead to input starvation.
     * @param {IdleDispatchedHandler} agileCallback The callback on which the idle priority dispatcher returns when the event is dispatched.
     * @returns {IAsyncAction} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.core.coredispatcher.runidleasync
     */
    RunIdleAsync(agileCallback) {
        if (!this.HasProp("__ICoreDispatcher")) {
            if ((queryResult := this.QueryInterface(ICoreDispatcher.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICoreDispatcher := ICoreDispatcher(outPtr)
        }

        return this.__ICoreDispatcher.RunIdleAsync(agileCallback)
    }

    /**
     * 
     * @param {TypedEventHandler<CoreDispatcher, AcceleratorKeyEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_AcceleratorKeyActivated(handler) {
        if (!this.HasProp("__ICoreAcceleratorKeys")) {
            if ((queryResult := this.QueryInterface(ICoreAcceleratorKeys.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICoreAcceleratorKeys := ICoreAcceleratorKeys(outPtr)
        }

        return this.__ICoreAcceleratorKeys.add_AcceleratorKeyActivated(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} cookie 
     * @returns {HRESULT} 
     */
    remove_AcceleratorKeyActivated(cookie) {
        if (!this.HasProp("__ICoreAcceleratorKeys")) {
            if ((queryResult := this.QueryInterface(ICoreAcceleratorKeys.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICoreAcceleratorKeys := ICoreAcceleratorKeys(outPtr)
        }

        return this.__ICoreAcceleratorKeys.remove_AcceleratorKeyActivated(cookie)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_CurrentPriority() {
        if (!this.HasProp("__ICoreDispatcherWithTaskPriority")) {
            if ((queryResult := this.QueryInterface(ICoreDispatcherWithTaskPriority.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICoreDispatcherWithTaskPriority := ICoreDispatcherWithTaskPriority(outPtr)
        }

        return this.__ICoreDispatcherWithTaskPriority.get_CurrentPriority()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_CurrentPriority(value) {
        if (!this.HasProp("__ICoreDispatcherWithTaskPriority")) {
            if ((queryResult := this.QueryInterface(ICoreDispatcherWithTaskPriority.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICoreDispatcherWithTaskPriority := ICoreDispatcherWithTaskPriority(outPtr)
        }

        return this.__ICoreDispatcherWithTaskPriority.put_CurrentPriority(value)
    }

    /**
     * Queries whether the caller should yield if there are items in the task queue of the specified priority or higher.
     * @returns {Boolean} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.core.coredispatcher.shouldyield
     */
    ShouldYield() {
        if (!this.HasProp("__ICoreDispatcherWithTaskPriority")) {
            if ((queryResult := this.QueryInterface(ICoreDispatcherWithTaskPriority.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICoreDispatcherWithTaskPriority := ICoreDispatcherWithTaskPriority(outPtr)
        }

        return this.__ICoreDispatcherWithTaskPriority.ShouldYield()
    }

    /**
     * Queries whether the caller should yield if there are items in the task queue of higher priority than the current task.
     * @param {Integer} priority_ 
     * @returns {Boolean} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.core.coredispatcher.shouldyield
     */
    ShouldYieldToPriority(priority_) {
        if (!this.HasProp("__ICoreDispatcherWithTaskPriority")) {
            if ((queryResult := this.QueryInterface(ICoreDispatcherWithTaskPriority.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICoreDispatcherWithTaskPriority := ICoreDispatcherWithTaskPriority(outPtr)
        }

        return this.__ICoreDispatcherWithTaskPriority.ShouldYieldToPriority(priority_)
    }

    /**
     * Stops the dispatcher from processing any queued events.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.core.coredispatcher.stopprocessevents
     */
    StopProcessEvents() {
        if (!this.HasProp("__ICoreDispatcherWithTaskPriority")) {
            if ((queryResult := this.QueryInterface(ICoreDispatcherWithTaskPriority.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICoreDispatcherWithTaskPriority := ICoreDispatcherWithTaskPriority(outPtr)
        }

        return this.__ICoreDispatcherWithTaskPriority.StopProcessEvents()
    }

    /**
     * Attempts to schedule the specified callback on the UI thread from a worker thread, and returns the results asynchronously.
     * @remarks
     * If called while the CoreDispatcher is shutting down, this method will complete successfully and return false.
     * @param {Integer} priority_ Specifies the priority for event dispatch. Set this to [CoreDispatcherPriority.Normal](coredispatcherpriority.md).
     * @param {DispatchedHandler} agileCallback The callback on which the dispatcher returns when the event is dispatched.
     * @returns {IAsyncOperation<Boolean>} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.core.coredispatcher.tryrunasync
     */
    TryRunAsync(priority_, agileCallback) {
        if (!this.HasProp("__ICoreDispatcher2")) {
            if ((queryResult := this.QueryInterface(ICoreDispatcher2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICoreDispatcher2 := ICoreDispatcher2(outPtr)
        }

        return this.__ICoreDispatcher2.TryRunAsync(priority_, agileCallback)
    }

    /**
     * Attempts to schedule a callback on the UI thread from a worker thread at idle priority, and returns the results asynchronously.
     * @param {IdleDispatchedHandler} agileCallback The callback on which the idle priority dispatcher returns when the event is dispatched.
     * @returns {IAsyncOperation<Boolean>} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.core.coredispatcher.tryrunidleasync
     */
    TryRunIdleAsync(agileCallback) {
        if (!this.HasProp("__ICoreDispatcher2")) {
            if ((queryResult := this.QueryInterface(ICoreDispatcher2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICoreDispatcher2 := ICoreDispatcher2(outPtr)
        }

        return this.__ICoreDispatcher2.TryRunIdleAsync(agileCallback)
    }

;@endregion Instance Methods
}
