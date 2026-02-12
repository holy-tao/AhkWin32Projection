#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IThreadPoolTimer.ahk
#Include .\IThreadPoolTimerStatics.ahk
#Include ..\..\..\Guid.ahk

/**
 * Represents a timer created with [CreateTimer](threadpooltimer_createtimer_1268637445.md) or [CreatePeriodicTimer](threadpooltimer_createperiodictimer_1185775417.md).
  * 
  * > [!NOTE]
  * > The ThreadPool API is supported for desktop as well as UWP apps.
 * @remarks
 * The [CreatePeriodicTimer](threadpooltimer_createperiodictimer_1185775417.md) or [CreateTimer](threadpooltimer_createtimer_1268637445.md) method can be used to create this object.
 * 
 * 
 * 
 * > [!NOTE]
 * > A [TimeSpan](../windows.foundation/timespan.md) value of zero (or any value less than 1 millisecond) will cause the periodic timer to behave as a single-shot timer.
 * @see https://learn.microsoft.com/uwp/api/windows.system.threading.threadpooltimer
 * @namespace Windows.System.Threading
 * @version WindowsRuntime 1.4
 */
class ThreadPoolTimer extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IThreadPoolTimer

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IThreadPoolTimer.IID

;@endregion Static Properties

;@region Static Methods
    /**
     * Creates a periodic timer and specifies a method to call after the periodic timer is complete. The periodic timer is complete when the timer has expired without being reactivated, and the final call to *handler* has finished.
     * @param {TimerElapsedHandler} handler The method to call when the timer expires.
     * @param {TimeSpan} period The amount of time until the timer expires. The timer reactivates each time the period elapses, until the timer is canceled.
     * 
     * > **C++**
     * > This amount of time is specified in ticks (100-nanosecond units) using the [Windows::Foundation::TimeSpan](../windows.foundation/timespan.md) structure.
     * 
     * 
     * 
     * > **JavaScript and C#**
     * > This amount of time is specified using the [System.TimeSpan](/dotnet/api/system.timespan?view=dotnet-uwp-10.0&preserve-view=true) structure. It can be specified in ticks, or it can be specified in milliseconds, seconds, and so on.
     * @returns {ThreadPoolTimer} 
     * @see https://learn.microsoft.com/uwp/api/windows.system.threading.threadpooltimer.createperiodictimer
     */
    static CreatePeriodicTimer(handler, period) {
        if (!ThreadPoolTimer.HasProp("__IThreadPoolTimerStatics")) {
            activatableClassId := HSTRING.Create("Windows.System.Threading.ThreadPoolTimer")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IThreadPoolTimerStatics.IID)
            ThreadPoolTimer.__IThreadPoolTimerStatics := IThreadPoolTimerStatics(factoryPtr)
        }

        return ThreadPoolTimer.__IThreadPoolTimerStatics.CreatePeriodicTimer(handler, period)
    }

    /**
     * Creates a single-use timer and specifies a method to call after the timer is complete. The timer is complete when the timer has expired and the final call to *handler* has finished.
     * @param {TimerElapsedHandler} handler The method to call when the timer expires.
     * @param {TimeSpan} delay The amount of time until the timer expires.
     * 
     * > **C++**
     * > This amount of time is specified in ticks (100-nanosecond units) using the [Windows::Foundation::TimeSpan](../windows.foundation/timespan.md) structure.
     * 
     * 
     * 
     * > **JavaScript and C#**
     * > This amount of time is specified using the [System.TimeSpan](/dotnet/api/system.timespan?view=dotnet-uwp-10.0&preserve-view=true) structure. It can be specified in ticks, or it can be specified in milliseconds, seconds, and so on.
     * @returns {ThreadPoolTimer} 
     * @see https://learn.microsoft.com/uwp/api/windows.system.threading.threadpooltimer.createtimer
     */
    static CreateTimer(handler, delay) {
        if (!ThreadPoolTimer.HasProp("__IThreadPoolTimerStatics")) {
            activatableClassId := HSTRING.Create("Windows.System.Threading.ThreadPoolTimer")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IThreadPoolTimerStatics.IID)
            ThreadPoolTimer.__IThreadPoolTimerStatics := IThreadPoolTimerStatics(factoryPtr)
        }

        return ThreadPoolTimer.__IThreadPoolTimerStatics.CreateTimer(handler, delay)
    }

    /**
     * Creates a periodic timer.
     * @param {TimerElapsedHandler} handler The method to call when the timer expires.
     * @param {TimeSpan} period The amount of time until the timer expires. The timer reactivates each time the period elapses, until the timer is canceled.
     * 
     * > **C++**
     * > This amount of time is specified in ticks (100-nanosecond units) using the [Windows::Foundation::TimeSpan](../windows.foundation/timespan.md) structure.
     * 
     * 
     * 
     * > **JavaScript and C#**
     * > This amount of time is specified using the [System.TimeSpan](/dotnet/api/system.timespan?view=dotnet-uwp-10.0&preserve-view=true) structure. It can be specified in ticks, or it can be specified in milliseconds, seconds, and so on.
     * @param {TimerDestroyedHandler} destroyed 
     * @returns {ThreadPoolTimer} 
     * @see https://learn.microsoft.com/uwp/api/windows.system.threading.threadpooltimer.createperiodictimer
     */
    static CreatePeriodicTimerWithCompletion(handler, period, destroyed) {
        if (!ThreadPoolTimer.HasProp("__IThreadPoolTimerStatics")) {
            activatableClassId := HSTRING.Create("Windows.System.Threading.ThreadPoolTimer")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IThreadPoolTimerStatics.IID)
            ThreadPoolTimer.__IThreadPoolTimerStatics := IThreadPoolTimerStatics(factoryPtr)
        }

        return ThreadPoolTimer.__IThreadPoolTimerStatics.CreatePeriodicTimerWithCompletion(handler, period, destroyed)
    }

    /**
     * Creates a single-use timer.
     * @param {TimerElapsedHandler} handler The method to call when the timer expires.
     * @param {TimeSpan} delay The amount of time until the timer expires.
     * 
     * > **C++**
     * > This amount of time is specified in ticks (100-nanosecond units) using the [Windows::Foundation::TimeSpan](../windows.foundation/timespan.md) structure.
     * 
     * 
     * 
     * > **JavaScript and C#**
     * > This amount of time is specified using the [System.TimeSpan](/dotnet/api/system.timespan?view=dotnet-uwp-10.0&preserve-view=true) structure. It can be specified in ticks, or it can be specified in milliseconds, seconds, and so on.
     * @param {TimerDestroyedHandler} destroyed 
     * @returns {ThreadPoolTimer} 
     * @see https://learn.microsoft.com/uwp/api/windows.system.threading.threadpooltimer.createtimer
     */
    static CreateTimerWithCompletion(handler, delay, destroyed) {
        if (!ThreadPoolTimer.HasProp("__IThreadPoolTimerStatics")) {
            activatableClassId := HSTRING.Create("Windows.System.Threading.ThreadPoolTimer")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IThreadPoolTimerStatics.IID)
            ThreadPoolTimer.__IThreadPoolTimerStatics := IThreadPoolTimerStatics(factoryPtr)
        }

        return ThreadPoolTimer.__IThreadPoolTimerStatics.CreateTimerWithCompletion(handler, delay, destroyed)
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * Gets the timeout value of a periodic timer created with [CreatePeriodicTimer](threadpooltimer_createperiodictimer_1185775417.md).
     * @remarks
     * A periodic timer begins counting down as soon as the timer object is created. When the timer expires, it is reactivated and begins counting down again.
     * @see https://learn.microsoft.com/uwp/api/windows.system.threading.threadpooltimer.period
     * @type {TimeSpan} 
     */
    Period {
        get => this.get_Period()
    }

    /**
     * Gets the timeout value of a single-use timer created with [CreateTimer](threadpooltimer_createtimer_1268637445.md).
     * @remarks
     * A timer begins counting down as soon as the timer object is created.
     * @see https://learn.microsoft.com/uwp/api/windows.system.threading.threadpooltimer.delay
     * @type {TimeSpan} 
     */
    Delay {
        get => this.get_Delay()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {TimeSpan} 
     */
    get_Period() {
        if (!this.HasProp("__IThreadPoolTimer")) {
            if ((queryResult := this.QueryInterface(IThreadPoolTimer.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IThreadPoolTimer := IThreadPoolTimer(outPtr)
        }

        return this.__IThreadPoolTimer.get_Period()
    }

    /**
     * 
     * @returns {TimeSpan} 
     */
    get_Delay() {
        if (!this.HasProp("__IThreadPoolTimer")) {
            if ((queryResult := this.QueryInterface(IThreadPoolTimer.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IThreadPoolTimer := IThreadPoolTimer(outPtr)
        }

        return this.__IThreadPoolTimer.get_Delay()
    }

    /**
     * Cancels a timer.
     * @remarks
     * When a timer is canceled, pending [TimerElapsedHandler](timerelapsedhandler.md) delegates are also canceled. [TimerElapsedHandler](timerelapsedhandler.md) delegates that are already running are allowed to finish.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.system.threading.threadpooltimer.cancel
     */
    Cancel() {
        if (!this.HasProp("__IThreadPoolTimer")) {
            if ((queryResult := this.QueryInterface(IThreadPoolTimer.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IThreadPoolTimer := IThreadPoolTimer(outPtr)
        }

        return this.__IThreadPoolTimer.Cancel()
    }

;@endregion Instance Methods
}
