#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IDispatcherTimer.ahk
#Include .\IDispatcherTimerFactory.ahk
#Include ..\..\Foundation\EventHandler.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\..\WinRTEventHandler.ahk

/**
 * Provides a timer that is integrated into the **Dispatcher** queue, which is processed at a specified interval of time and at a specified priority.
 * @remarks
 * The DispatcherTimer can be used to run code on the same thread that produces the UI thread. Code running on this thread has the privilege to create and modify objects that can only be created and modified on the UI thread. To specify that code should run on the UI thread, set the [Interval](dispatchertimer_interval.md) property and then call the [Start](dispatchertimer_start_1587696324.md) method. The [Tick](dispatchertimer_tick.md) event fires after the time specified in [Interval](dispatchertimer_interval.md) has elapsed. [Tick](dispatchertimer_tick.md) continues firing at the same [Interval](dispatchertimer_interval.md) until the [Stop](dispatchertimer_stop_1201535524.md) method is called, the app terminates, or the app is suspended (fires [Suspending](application_suspending.md)).
 * 
 * One scenario for DispatcherTimer is to check properties on sensors where changes to the sensor values are not purely event-driven, or the events don't give you the granularity you want. You can see this in the [Accelerometer sample](https://github.com/microsoft/Windows-universal-samples/tree/master/Samples/Accelerometer).
 * 
 * Other scenarios for DispatcherTimer include checking for state changes that don't have related events, or for periodic UI updates that can't use a storyboarded animation or a two-way binding.
 * 
 * > [!TIP]
 * > If you're migrating Microsoft Silverlight or Windows Presentation Foundation (WPF) code, the DispatcherTimer and the related **Dispatcher** was in a separate **System.Windows.Threading** namespace. There is no **Windows.UI.Xaml.Threading** namespace in the Windows Runtime, so this class is in [Windows.UI.Xaml](windows_ui_xaml.md).
 * 
 * If you aren't doing anything with the UI thread in your **Tick** handlers and just need a timer, you could also use [ThreadPoolTimer](../windows.system.threading/threadpooltimer.md) instead. Also, for techniques like [ThreadPoolTimer](../windows.system.threading/threadpooltimer.md) or a .NET [Task](/dotnet/api/system.threading.tasks.task?view=dotnet-uwp-10.0&preserve-view=true), you aren't totally isolated from the UI thread. You could still assign to the UI thread asynchronously using [CoreDispatcher.RunAsync](../windows.ui.core/coredispatcher_runasync_447339746.md).
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.dispatchertimer
 * @namespace Windows.UI.Xaml
 * @version WindowsRuntime 1.4
 */
class DispatcherTimer extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IDispatcherTimer

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IDispatcherTimer.IID

;@endregion Static Properties

;@region Static Methods
    /**
     * 
     * @returns {DispatcherTimer} 
     */
    static CreateInstance() {
        if (!DispatcherTimer.HasProp("__IDispatcherTimerFactory")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.DispatcherTimer")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IDispatcherTimerFactory.IID)
            DispatcherTimer.__IDispatcherTimerFactory := IDispatcherTimerFactory(factoryPtr)
        }

        return DispatcherTimer.__IDispatcherTimerFactory.CreateInstance(0, Buffer(A_PtrSize))
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * Gets or sets the amount of time between timer ticks.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.dispatchertimer.interval
     * @type {TimeSpan} 
     */
    Interval {
        get => this.get_Interval()
        set => this.put_Interval(value)
    }

    /**
     * Gets a value that indicates whether the timer is running.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.dispatchertimer.isenabled
     * @type {Boolean} 
     */
    IsEnabled {
        get => this.get_IsEnabled()
    }

    /**
     * Occurs when the timer interval has elapsed.
     * @type {EventHandler<IInspectable>}
    */
    OnTick {
        get {
            if(!this.HasProp("__OnTick")){
                this.__OnTick := WinRTEventHandler(
                    EventHandler,
                    Guid("{074764f2-f0c0-5200-af2f-70e07638e4a7}"),
                    IInspectable,
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
        if (!this.HasProp("__IDispatcherTimer")) {
            if ((queryResult := this.QueryInterface(IDispatcherTimer.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDispatcherTimer := IDispatcherTimer(outPtr)
        }

        return this.__IDispatcherTimer.get_Interval()
    }

    /**
     * 
     * @param {TimeSpan} value 
     * @returns {HRESULT} 
     */
    put_Interval(value) {
        if (!this.HasProp("__IDispatcherTimer")) {
            if ((queryResult := this.QueryInterface(IDispatcherTimer.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDispatcherTimer := IDispatcherTimer(outPtr)
        }

        return this.__IDispatcherTimer.put_Interval(value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsEnabled() {
        if (!this.HasProp("__IDispatcherTimer")) {
            if ((queryResult := this.QueryInterface(IDispatcherTimer.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDispatcherTimer := IDispatcherTimer(outPtr)
        }

        return this.__IDispatcherTimer.get_IsEnabled()
    }

    /**
     * 
     * @param {EventHandler<IInspectable>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_Tick(handler) {
        if (!this.HasProp("__IDispatcherTimer")) {
            if ((queryResult := this.QueryInterface(IDispatcherTimer.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDispatcherTimer := IDispatcherTimer(outPtr)
        }

        return this.__IDispatcherTimer.add_Tick(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_Tick(token) {
        if (!this.HasProp("__IDispatcherTimer")) {
            if ((queryResult := this.QueryInterface(IDispatcherTimer.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDispatcherTimer := IDispatcherTimer(outPtr)
        }

        return this.__IDispatcherTimer.remove_Tick(token)
    }

    /**
     * Starts the [DispatcherTimer](dispatchertimer.md).
     * @remarks
     * If the timer has already started, then it is restarted.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.dispatchertimer.start
     */
    Start() {
        if (!this.HasProp("__IDispatcherTimer")) {
            if ((queryResult := this.QueryInterface(IDispatcherTimer.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDispatcherTimer := IDispatcherTimer(outPtr)
        }

        return this.__IDispatcherTimer.Start()
    }

    /**
     * Stops the [DispatcherTimer](dispatchertimer.md).
     * @remarks
     * If Stop is called when the timer interval has just elapsed, it's possible that the timer already queued a Tick event. This event will still be raised.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.dispatchertimer.stop
     */
    Stop() {
        if (!this.HasProp("__IDispatcherTimer")) {
            if ((queryResult := this.QueryInterface(IDispatcherTimer.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDispatcherTimer := IDispatcherTimer(outPtr)
        }

        return this.__IDispatcherTimer.Stop()
    }

;@endregion Instance Methods
}
