#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IActivitySensorTrigger.ahk
#Include .\IActivitySensorTriggerFactory.ahk
#Include ..\..\..\Guid.ahk

/**
 * Represents a trigger that is activated when the [ActivitySensor](../windows.devices.sensors/activitysensor.md) receives input. This is used when your application needs to respond to the activity sensor.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.background.activitysensortrigger
 * @namespace Windows.ApplicationModel.Background
 * @version WindowsRuntime 1.4
 */
class ActivitySensorTrigger extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IActivitySensorTrigger

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IActivitySensorTrigger.IID

;@endregion Static Properties

;@region Static Methods
    /**
     * Creates an instance of the [ActivitySensorTrigger](activitysensortrigger.md) class with an initial [MinimumReportInterval](activitysensortrigger_minimumreportinterval.md).
     * @param {Integer} reportIntervalInMilliseconds The initial report interval to use for [MinimumReportInterval](activitysensortrigger_minimumreportinterval.md).
     * @returns {ActivitySensorTrigger} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.background.activitysensortrigger.#ctor
     */
    static Create(reportIntervalInMilliseconds) {
        if (!ActivitySensorTrigger.HasProp("__IActivitySensorTriggerFactory")) {
            activatableClassId := HSTRING.Create("Windows.ApplicationModel.Background.ActivitySensorTrigger")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IActivitySensorTriggerFactory.IID)
            ActivitySensorTrigger.__IActivitySensorTriggerFactory := IActivitySensorTriggerFactory(factoryPtr)
        }

        return ActivitySensorTrigger.__IActivitySensorTriggerFactory.Create(reportIntervalInMilliseconds)
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * Gets or sets the list of activities your trigger is subscribed to.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.background.activitysensortrigger.subscribedactivities
     * @type {IVector<Integer>} 
     */
    SubscribedActivities {
        get => this.get_SubscribedActivities()
    }

    /**
     * Gets the report interval for the trigger.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.background.activitysensortrigger.reportinterval
     * @type {Integer} 
     */
    ReportInterval {
        get => this.get_ReportInterval()
    }

    /**
     * Gets the list of supported activities you can subscribe to.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.background.activitysensortrigger.supportedactivities
     * @type {IVectorView<Integer>} 
     */
    SupportedActivities {
        get => this.get_SupportedActivities()
    }

    /**
     * Gets the minimum supported report interval for the sensor trigger.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.background.activitysensortrigger.minimumreportinterval
     * @type {Integer} 
     */
    MinimumReportInterval {
        get => this.get_MinimumReportInterval()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {IVector<Integer>} 
     */
    get_SubscribedActivities() {
        if (!this.HasProp("__IActivitySensorTrigger")) {
            if ((queryResult := this.QueryInterface(IActivitySensorTrigger.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IActivitySensorTrigger := IActivitySensorTrigger(outPtr)
        }

        return this.__IActivitySensorTrigger.get_SubscribedActivities()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_ReportInterval() {
        if (!this.HasProp("__IActivitySensorTrigger")) {
            if ((queryResult := this.QueryInterface(IActivitySensorTrigger.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IActivitySensorTrigger := IActivitySensorTrigger(outPtr)
        }

        return this.__IActivitySensorTrigger.get_ReportInterval()
    }

    /**
     * 
     * @returns {IVectorView<Integer>} 
     */
    get_SupportedActivities() {
        if (!this.HasProp("__IActivitySensorTrigger")) {
            if ((queryResult := this.QueryInterface(IActivitySensorTrigger.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IActivitySensorTrigger := IActivitySensorTrigger(outPtr)
        }

        return this.__IActivitySensorTrigger.get_SupportedActivities()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_MinimumReportInterval() {
        if (!this.HasProp("__IActivitySensorTrigger")) {
            if ((queryResult := this.QueryInterface(IActivitySensorTrigger.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IActivitySensorTrigger := IActivitySensorTrigger(outPtr)
        }

        return this.__IActivitySensorTrigger.get_MinimumReportInterval()
    }

;@endregion Instance Methods
}
