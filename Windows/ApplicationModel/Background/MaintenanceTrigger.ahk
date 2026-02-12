#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IMaintenanceTrigger.ahk
#Include .\IMaintenanceTriggerFactory.ahk
#Include ..\..\..\Guid.ahk

/**
 * Represents a maintenance trigger.
 * @remarks
 * Background tasks that use a maintenance trigger run only when the system is connected to AC power.
 * 
 * <!-- confirmed -->
 * > [!NOTE]
 * > This class is not agile, which means that you need to consider its threading model and marshaling behavior. For more info, see [Threading and Marshaling (C++/CX)](/cpp/cppcx/threading-and-marshaling-c-cx) and [Using Windows Runtime objects in a multithreaded environment (.NET)](/windows/uwp/threading-async/using-windows-runtime-objects-in-a-multithreaded-environment).
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.background.maintenancetrigger
 * @namespace Windows.ApplicationModel.Background
 * @version WindowsRuntime 1.4
 */
class MaintenanceTrigger extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IMaintenanceTrigger

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IMaintenanceTrigger.IID

;@endregion Static Properties

;@region Static Methods
    /**
     * Initializes a new instance of a maintenance trigger.
     * @param {Integer} freshnessTime The number of minutes to wait before scheduling the background task. The system schedules the task within 15 minutes after *freshnessTime* elapses.
     * @param {Boolean} oneShot True if the maintenance trigger is used once; false if it is used each time the *freshnessTime* interval elapses.
     * @returns {MaintenanceTrigger} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.background.maintenancetrigger.#ctor
     */
    static Create(freshnessTime, oneShot) {
        if (!MaintenanceTrigger.HasProp("__IMaintenanceTriggerFactory")) {
            activatableClassId := HSTRING.Create("Windows.ApplicationModel.Background.MaintenanceTrigger")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IMaintenanceTriggerFactory.IID)
            MaintenanceTrigger.__IMaintenanceTriggerFactory := IMaintenanceTriggerFactory(factoryPtr)
        }

        return MaintenanceTrigger.__IMaintenanceTriggerFactory.Create(freshnessTime, oneShot)
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * Gets the interval of a maintenance trigger.
     * @remarks
     * The provided value acts as a suggested value, because it may change depending on system polices in place. Examples of system policies that could override this value include Battery Saver, Game Mode, or the system detecting that the application is not being used very often. The list of system policies that affect this value can also change from release to release.
     * 
     * Passing in a value greater than 30 days (in minutes) may result in an argument exception.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.background.maintenancetrigger.freshnesstime
     * @type {Integer} 
     */
    FreshnessTime {
        get => this.get_FreshnessTime()
    }

    /**
     * Gets whether the maintenance trigger is used only once or each time the [FreshnessTime](timetrigger_freshnesstime.md) interval elapses.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.background.maintenancetrigger.oneshot
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
        if (!this.HasProp("__IMaintenanceTrigger")) {
            if ((queryResult := this.QueryInterface(IMaintenanceTrigger.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMaintenanceTrigger := IMaintenanceTrigger(outPtr)
        }

        return this.__IMaintenanceTrigger.get_FreshnessTime()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_OneShot() {
        if (!this.HasProp("__IMaintenanceTrigger")) {
            if ((queryResult := this.QueryInterface(IMaintenanceTrigger.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMaintenanceTrigger := IMaintenanceTrigger(outPtr)
        }

        return this.__IMaintenanceTrigger.get_OneShot()
    }

;@endregion Instance Methods
}
