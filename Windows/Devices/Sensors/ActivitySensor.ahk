#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IActivitySensor.ahk
#Include .\IActivitySensorStatics.ahk
#Include ..\..\Foundation\TypedEventHandler.ahk
#Include .\ActivitySensor.ahk
#Include .\ActivitySensorReadingChangedEventArgs.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\..\WinRTEventHandler.ahk

/**
 * Represents a sensor that provides the activity and status of a sensor.
 * @remarks
 * > [!NOTE]
 * > This class is not supported in JavaScript
 * 
 * In order to use ActivitySensor, you need to define the activity device capability in your app manifest file.
 * 
 * ```
 * <Capabilities>
 *     <DeviceCapability Name="activity"/>
 * </Capabilities>
 * ```
 * @see https://learn.microsoft.com/uwp/api/windows.devices.sensors.activitysensor
 * @namespace Windows.Devices.Sensors
 * @version WindowsRuntime 1.4
 */
class ActivitySensor extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IActivitySensor

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IActivitySensor.IID

;@endregion Static Properties

;@region Static Methods
    /**
     * Asynchronously obtains the default sensor.
     * @returns {IAsyncOperation<ActivitySensor>} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.sensors.activitysensor.getdefaultasync
     */
    static GetDefaultAsync() {
        if (!ActivitySensor.HasProp("__IActivitySensorStatics")) {
            activatableClassId := HSTRING.Create("Windows.Devices.Sensors.ActivitySensor")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IActivitySensorStatics.IID)
            ActivitySensor.__IActivitySensorStatics := IActivitySensorStatics(factoryPtr)
        }

        return ActivitySensor.__IActivitySensorStatics.GetDefaultAsync()
    }

    /**
     * Gets the device selector.
     * @returns {HSTRING} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.sensors.activitysensor.getdeviceselector
     */
    static GetDeviceSelector() {
        if (!ActivitySensor.HasProp("__IActivitySensorStatics")) {
            activatableClassId := HSTRING.Create("Windows.Devices.Sensors.ActivitySensor")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IActivitySensorStatics.IID)
            ActivitySensor.__IActivitySensorStatics := IActivitySensorStatics(factoryPtr)
        }

        return ActivitySensor.__IActivitySensorStatics.GetDeviceSelector()
    }

    /**
     * Asynchronously obtains the sensor from its identifier.
     * @param {HSTRING} deviceId [The sensor identifier](/windows-hardware/drivers/install/device-instance-ids)
     * @returns {IAsyncOperation<ActivitySensor>} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.sensors.activitysensor.fromidasync
     */
    static FromIdAsync(deviceId) {
        if (!ActivitySensor.HasProp("__IActivitySensorStatics")) {
            activatableClassId := HSTRING.Create("Windows.Devices.Sensors.ActivitySensor")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IActivitySensorStatics.IID)
            ActivitySensor.__IActivitySensorStatics := IActivitySensorStatics(factoryPtr)
        }

        return ActivitySensor.__IActivitySensorStatics.FromIdAsync(deviceId)
    }

    /**
     * Asynchronously gets sensor readings from a specific time and duration.
     * @param {DateTime} fromTime The time at which to get sensor readings.
     * @returns {IAsyncOperation<IVectorView<ActivitySensorReading>>} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.sensors.activitysensor.getsystemhistoryasync
     */
    static GetSystemHistoryAsync(fromTime) {
        if (!ActivitySensor.HasProp("__IActivitySensorStatics")) {
            activatableClassId := HSTRING.Create("Windows.Devices.Sensors.ActivitySensor")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IActivitySensorStatics.IID)
            ActivitySensor.__IActivitySensorStatics := IActivitySensorStatics(factoryPtr)
        }

        return ActivitySensor.__IActivitySensorStatics.GetSystemHistoryAsync(fromTime)
    }

    /**
     * Asynchronously gets sensor readings from a specific time.
     * @param {DateTime} fromTime The time at which to get sensor readings.
     * @param {TimeSpan} duration_ 
     * @returns {IAsyncOperation<IVectorView<ActivitySensorReading>>} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.sensors.activitysensor.getsystemhistoryasync
     */
    static GetSystemHistoryWithDurationAsync(fromTime, duration_) {
        if (!ActivitySensor.HasProp("__IActivitySensorStatics")) {
            activatableClassId := HSTRING.Create("Windows.Devices.Sensors.ActivitySensor")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IActivitySensorStatics.IID)
            ActivitySensor.__IActivitySensorStatics := IActivitySensorStatics(factoryPtr)
        }

        return ActivitySensor.__IActivitySensorStatics.GetSystemHistoryWithDurationAsync(fromTime, duration_)
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * Gets the list of activity types that the sensor pledges to perform.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.sensors.activitysensor.subscribedactivities
     * @type {IVector<Integer>} 
     */
    SubscribedActivities {
        get => this.get_SubscribedActivities()
    }

    /**
     * Gets the power in milliwatts that the sensor consumes.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.sensors.activitysensor.powerinmilliwatts
     * @type {Float} 
     */
    PowerInMilliwatts {
        get => this.get_PowerInMilliwatts()
    }

    /**
     * Gets the device identifier.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.sensors.activitysensor.deviceid
     * @type {HSTRING} 
     */
    DeviceId {
        get => this.get_DeviceId()
    }

    /**
     * Gets the list of activity types that the sensor supports.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.sensors.activitysensor.supportedactivities
     * @type {IVectorView<Integer>} 
     */
    SupportedActivities {
        get => this.get_SupportedActivities()
    }

    /**
     * Gets the minimum report interval supported by the sensor.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.sensors.activitysensor.minimumreportinterval
     * @type {Integer} 
     */
    MinimumReportInterval {
        get => this.get_MinimumReportInterval()
    }

    /**
     * Occurs each time the sensor reports a new sensor reading.
     * @remarks
     * When you add a callback function, you receive an initial callback. However, there is a case where you will not receive this initial callback.
     * 
     * 
     * + Add a callback function.
     * + Remove the callback function.
     * + Add another callback function (or the original one a second time)
     * 
     * 
     * In this sequence of events, the second callback function will not receive the initial callback. It will receive callback notifications normally when the [ActivitySensor](activitysensor.md) reports a new reading; only the initial callback will be missed.
     * @type {TypedEventHandler<ActivitySensor, ActivitySensorReadingChangedEventArgs>}
    */
    OnReadingChanged {
        get {
            if(!this.HasProp("__OnReadingChanged")){
                this.__OnReadingChanged := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{a5b72e01-546c-5fbb-b847-49200aaaaac5}"),
                    ActivitySensor,
                    ActivitySensorReadingChangedEventArgs
                )
                this.__OnReadingChangedToken := this.add_ReadingChanged(this.__OnReadingChanged.iface)
            }
            return this.__OnReadingChanged
        }
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    __Delete() {
        if(this.HasProp("__OnReadingChangedToken")) {
            this.remove_ReadingChanged(this.__OnReadingChangedToken)
            this.__OnReadingChanged.iface.Dispose()
        }

        super.__Delete()
    }

    /**
     * Asynchronously gets the current sensor reading.
     * @returns {IAsyncOperation<ActivitySensorReading>} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.sensors.activitysensor.getcurrentreadingasync
     */
    GetCurrentReadingAsync() {
        if (!this.HasProp("__IActivitySensor")) {
            if ((queryResult := this.QueryInterface(IActivitySensor.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IActivitySensor := IActivitySensor(outPtr)
        }

        return this.__IActivitySensor.GetCurrentReadingAsync()
    }

    /**
     * 
     * @returns {IVector<Integer>} 
     */
    get_SubscribedActivities() {
        if (!this.HasProp("__IActivitySensor")) {
            if ((queryResult := this.QueryInterface(IActivitySensor.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IActivitySensor := IActivitySensor(outPtr)
        }

        return this.__IActivitySensor.get_SubscribedActivities()
    }

    /**
     * 
     * @returns {Float} 
     */
    get_PowerInMilliwatts() {
        if (!this.HasProp("__IActivitySensor")) {
            if ((queryResult := this.QueryInterface(IActivitySensor.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IActivitySensor := IActivitySensor(outPtr)
        }

        return this.__IActivitySensor.get_PowerInMilliwatts()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_DeviceId() {
        if (!this.HasProp("__IActivitySensor")) {
            if ((queryResult := this.QueryInterface(IActivitySensor.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IActivitySensor := IActivitySensor(outPtr)
        }

        return this.__IActivitySensor.get_DeviceId()
    }

    /**
     * 
     * @returns {IVectorView<Integer>} 
     */
    get_SupportedActivities() {
        if (!this.HasProp("__IActivitySensor")) {
            if ((queryResult := this.QueryInterface(IActivitySensor.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IActivitySensor := IActivitySensor(outPtr)
        }

        return this.__IActivitySensor.get_SupportedActivities()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_MinimumReportInterval() {
        if (!this.HasProp("__IActivitySensor")) {
            if ((queryResult := this.QueryInterface(IActivitySensor.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IActivitySensor := IActivitySensor(outPtr)
        }

        return this.__IActivitySensor.get_MinimumReportInterval()
    }

    /**
     * 
     * @param {TypedEventHandler<ActivitySensor, ActivitySensorReadingChangedEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_ReadingChanged(handler) {
        if (!this.HasProp("__IActivitySensor")) {
            if ((queryResult := this.QueryInterface(IActivitySensor.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IActivitySensor := IActivitySensor(outPtr)
        }

        return this.__IActivitySensor.add_ReadingChanged(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_ReadingChanged(token) {
        if (!this.HasProp("__IActivitySensor")) {
            if ((queryResult := this.QueryInterface(IActivitySensor.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IActivitySensor := IActivitySensor(outPtr)
        }

        return this.__IActivitySensor.remove_ReadingChanged(token)
    }

;@endregion Instance Methods
}
