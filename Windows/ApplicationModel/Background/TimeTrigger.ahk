#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\ITimeTrigger.ahk
#Include .\ITimeTriggerFactory.ahk
#Include ..\..\..\Guid.ahk

/**
 * Represents a time event that triggers a background task to run.
 * @remarks
 * The background task must be declared in the manifest before the registration can be successful. You do not need to add the app to the lock screen in order to use background tasks in Windows 10, but you still need to call  [BackgroundExecutionManager.RequestAccessAsync](/uwp/api/windows.applicationmodel.background.backgroundexecutionmanager.RequestAccessAsync) to request background access.
 * 
 * TimeTriggers do not work when the device is in battery saver mode. If the user wants the app to be able to perform background activity when the device is in battery saver mode, they can make an exception for that app in the **Let apps run in the background** settings panel.
 * 
 * <!-- confirmed -->
 * > [!NOTE]
 * > This class is not agile, which means that you need to consider its threading model and marshaling behavior. For more info, see [Threading and Marshaling (C++/CX)](/cpp/cppcx/threading-and-marshaling-c-cx) and [Using Windows Runtime objects in a multithreaded environment (.NET)](/windows/uwp/threading-async/using-windows-runtime-objects-in-a-multithreaded-environment).
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.background.timetrigger
 * @namespace Windows.ApplicationModel.Background
 * @version WindowsRuntime 1.4
 */
class TimeTrigger extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => ITimeTrigger

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => ITimeTrigger.IID

;@endregion Static Properties

;@region Static Methods
    /**
     * Initializes a new instance of a time event trigger.
     * @param {Integer} freshnessTime Specifies the number of minutes to wait before scheduling the background task. The system schedules the task within 15 minutes after *freshnessTime* elapses. If the [OneShot](timetrigger_oneshot.md) property is false, *freshnessTime* specifies the interval between recurring tasks.
     * 
     * > [!NOTE]
     * > If *FreshnessTime* is set to less than 15 minutes, an exception is thrown when attempting to register the background task.
     * @param {Boolean} oneShot True if the time event trigger will be used once; false if it will be used each time *freshnessTime* elapses.
     * @returns {TimeTrigger} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.background.timetrigger.#ctor
     */
    static Create(freshnessTime, oneShot) {
        if (!TimeTrigger.HasProp("__ITimeTriggerFactory")) {
            activatableClassId := HSTRING.Create("Windows.ApplicationModel.Background.TimeTrigger")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ITimeTriggerFactory.IID)
            TimeTrigger.__ITimeTriggerFactory := ITimeTriggerFactory(factoryPtr)
        }

        return TimeTrigger.__ITimeTriggerFactory.Create(freshnessTime, oneShot)
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * Gets the interval of a time event trigger.
     * @remarks
     * The system uses a 15-minute tick frequency for timer requests. A time-triggered background task is scheduled on the next tick after **FreshnessTime** elapses. If the [OneShot](timetrigger_oneshot.md) property is false, **FreshnessTime** specifies the interval for a recurring task.
     * 
     * 
     * > [!NOTE]
     * > To understand the timeframe within which the time trigger may fire, consider a **FreshnessTime** set to 15 minutes. Because the system schedules the task within 15 minutes after *FreshnessTime* elapses, it may be up to 30 minutes before the time trigger fires.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.background.timetrigger.freshnesstime
     * @type {Integer} 
     */
    FreshnessTime {
        get => this.get_FreshnessTime()
    }

    /**
     * Gets whether the time event trigger will be used only once or each time the [FreshnessTime](timetrigger_freshnesstime.md) interval elapses.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.background.timetrigger.oneshot
     * @type {Boolean} 
     */
    OneShot {
        get => this.get_OneShot()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_FreshnessTime() {
        if (!this.HasProp("__ITimeTrigger")) {
            if ((queryResult := this.QueryInterface(ITimeTrigger.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITimeTrigger := ITimeTrigger(outPtr)
        }

        return this.__ITimeTrigger.get_FreshnessTime()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_OneShot() {
        if (!this.HasProp("__ITimeTrigger")) {
            if ((queryResult := this.QueryInterface(ITimeTrigger.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITimeTrigger := ITimeTrigger(outPtr)
        }

        return this.__ITimeTrigger.get_OneShot()
    }

;@endregion Instance Methods
}
