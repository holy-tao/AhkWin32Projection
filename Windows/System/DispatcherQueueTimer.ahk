#Requires AutoHotkey v2.0 64-bit

#Include ..\Win32\System\WinRT\Apis.ahk
#Include ..\Win32\System\WinRT\HSTRING.ahk
#Include ..\Win32\System\WinRT\IInspectable.ahk
#Include .\IDispatcherQueueTimer.ahk
#Include ..\Foundation\TypedEventHandler.ahk
#Include .\DispatcherQueueTimer.ahk
#Include ..\..\Guid.ahk
#Include ..\..\WinRTEventHandler.ahk

/**
 * Periodically executes a task on a **DispatcherQueue** thread after a time interval has elapsed.
 * @remarks
 * The system guarantees to invoke the event handler only after the specified duration expires. However, there may be some delay before the tick handler is invoked if there are other pending work items in the queue.
 * 
 * Timer tasks run at a priority lower than idle.
 * 
 * Timers don’t keep the **DispatcherQueue** event loop alive. Timers created after the **DispatcherQueue** event loop has stopped will not be processed.
 * @see https://learn.microsoft.com/uwp/api/windows.system.dispatcherqueuetimer
 * @namespace Windows.System
 * @version WindowsRuntime 1.4
 */
class DispatcherQueueTimer extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IDispatcherQueueTimer

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IDispatcherQueueTimer.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets and sets the interval for the timer.
     * @remarks
     * If you change the **DispatcherQueueTimer.Interval** while the timer is running, the timer will restart with the new value.
     * @see https://learn.microsoft.com/uwp/api/windows.system.dispatcherqueuetimer.interval
     * @type {TimeSpan} 
     */
    Interval {
        get => this.get_Interval()
        set => this.put_Interval(value)
    }

    /**
     * Indicates whether the timer is currently running.
     * @see https://learn.microsoft.com/uwp/api/windows.system.dispatcherqueuetimer.isrunning
     * @type {Boolean} 
     */
    IsRunning {
        get => this.get_IsRunning()
    }

    /**
     * Indicates whether the timer is repeating.
     * @remarks
     * The default value of **IsRepeating** is `true`. If you change the **IsRepeating** value while the timer is running, the timer will restart with the new value.
     * @see https://learn.microsoft.com/uwp/api/windows.system.dispatcherqueuetimer.isrepeating
     * @type {Boolean} 
     */
    IsRepeating {
        get => this.get_IsRepeating()
        set => this.put_IsRepeating(value)
    }

    /**
     * Event that fires when the timer **Interval** elapses.
     * @type {TypedEventHandler<DispatcherQueueTimer, IInspectable>}
    */
    OnTick {
        get {
            if(!this.HasProp("__OnTick")){
                this.__OnTick := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{8b5644c8-8b57-50ce-8933-7ab2cc5a14ef}"),
                    DispatcherQueueTimer,
                    IInspectable
                )
                this.__OnTickToken := this.add_Tick(this.__OnTick.iface)
            }
            return this.__OnTick
        }
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    __Delete() {
        if(this.HasProp("__OnTickToken")) {
            this.remove_Tick(this.__OnTickToken)
            this.__OnTick.iface.Dispose()
        }

        super.__Delete()
    }

    /**
     * 
     * @returns {TimeSpan} 
     */
    get_Interval() {
        if (!this.HasProp("__IDispatcherQueueTimer")) {
            if ((queryResult := this.QueryInterface(IDispatcherQueueTimer.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDispatcherQueueTimer := IDispatcherQueueTimer(outPtr)
        }

        return this.__IDispatcherQueueTimer.get_Interval()
    }

    /**
     * 
     * @param {TimeSpan} value 
     * @returns {HRESULT} 
     */
    put_Interval(value) {
        if (!this.HasProp("__IDispatcherQueueTimer")) {
            if ((queryResult := this.QueryInterface(IDispatcherQueueTimer.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDispatcherQueueTimer := IDispatcherQueueTimer(outPtr)
        }

        return this.__IDispatcherQueueTimer.put_Interval(value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsRunning() {
        if (!this.HasProp("__IDispatcherQueueTimer")) {
            if ((queryResult := this.QueryInterface(IDispatcherQueueTimer.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDispatcherQueueTimer := IDispatcherQueueTimer(outPtr)
        }

        return this.__IDispatcherQueueTimer.get_IsRunning()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsRepeating() {
        if (!this.HasProp("__IDispatcherQueueTimer")) {
            if ((queryResult := this.QueryInterface(IDispatcherQueueTimer.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDispatcherQueueTimer := IDispatcherQueueTimer(outPtr)
        }

        return this.__IDispatcherQueueTimer.get_IsRepeating()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_IsRepeating(value) {
        if (!this.HasProp("__IDispatcherQueueTimer")) {
            if ((queryResult := this.QueryInterface(IDispatcherQueueTimer.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDispatcherQueueTimer := IDispatcherQueueTimer(outPtr)
        }

        return this.__IDispatcherQueueTimer.put_IsRepeating(value)
    }

    /**
     * Starts the timer.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.system.dispatcherqueuetimer.start
     */
    Start() {
        if (!this.HasProp("__IDispatcherQueueTimer")) {
            if ((queryResult := this.QueryInterface(IDispatcherQueueTimer.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDispatcherQueueTimer := IDispatcherQueueTimer(outPtr)
        }

        return this.__IDispatcherQueueTimer.Start()
    }

    /**
     * Stops the timer.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.system.dispatcherqueuetimer.stop
     */
    Stop() {
        if (!this.HasProp("__IDispatcherQueueTimer")) {
            if ((queryResult := this.QueryInterface(IDispatcherQueueTimer.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDispatcherQueueTimer := IDispatcherQueueTimer(outPtr)
        }

        return this.__IDispatcherQueueTimer.Stop()
    }

    /**
     * 
     * @param {TypedEventHandler<DispatcherQueueTimer, IInspectable>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_Tick(handler) {
        if (!this.HasProp("__IDispatcherQueueTimer")) {
            if ((queryResult := this.QueryInterface(IDispatcherQueueTimer.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDispatcherQueueTimer := IDispatcherQueueTimer(outPtr)
        }

        return this.__IDispatcherQueueTimer.add_Tick(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_Tick(token) {
        if (!this.HasProp("__IDispatcherQueueTimer")) {
            if ((queryResult := this.QueryInterface(IDispatcherQueueTimer.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDispatcherQueueTimer := IDispatcherQueueTimer(outPtr)
        }

        return this.__IDispatcherQueueTimer.remove_Tick(token)
    }

;@endregion Instance Methods
}
