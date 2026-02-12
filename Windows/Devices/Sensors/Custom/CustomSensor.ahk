#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\ICustomSensor.ahk
#Include .\ICustomSensor2.ahk
#Include .\ICustomSensorStatics.ahk
#Include ..\..\..\Foundation\TypedEventHandler.ahk
#Include .\CustomSensor.ahk
#Include .\CustomSensorReadingChangedEventArgs.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\..\WinRTEventHandler.ahk

/**
 * Represents a custom sensor.
  * 
  * This class reuses the same [ReadingChanged](customsensor_readingchanged.md) event mechanism and the same common properties ([DeviceId](customsensor_deviceid.md), [ReportInterval](customsensor_reportinterval.md)) as the [Windows.Devices.Sensors](windows_devices_sensors_custom.md) classes ([Accelerometer](../windows.devices.sensors/accelerometer.md), [Gyrometer](../windows.devices.sensors/gyrometer.md), [Magnetometer](../windows.devices.sensors/magnetometer.md), and so on).
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.devices.sensors.custom.customsensor
 * @namespace Windows.Devices.Sensors.Custom
 * @version WindowsRuntime 1.4
 */
class CustomSensor extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => ICustomSensor

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => ICustomSensor.IID

;@endregion Static Properties

;@region Static Methods
    /**
     * Gets the device selector from the given interface identifier.
     * @param {Guid} interfaceId The interface [Guid](/dotnet/api/system.guid?view=dotnet-uwp-10.0&preserve-view=true) that is associated with the custom sensor. This [Guid](/dotnet/api/system.guid?view=dotnet-uwp-10.0&preserve-view=true) is defined and registered by the sensor.
     * @returns {HSTRING} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.sensors.custom.customsensor.getdeviceselector
     */
    static GetDeviceSelector(interfaceId) {
        if (!CustomSensor.HasProp("__ICustomSensorStatics")) {
            activatableClassId := HSTRING.Create("Windows.Devices.Sensors.Custom.CustomSensor")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ICustomSensorStatics.IID)
            CustomSensor.__ICustomSensorStatics := ICustomSensorStatics(factoryPtr)
        }

        return CustomSensor.__ICustomSensorStatics.GetDeviceSelector(interfaceId)
    }

    /**
     * Asynchronously obtains the sensor from its identifier.
     * @param {HSTRING} sensorId The sensor identifier.
     * @returns {IAsyncOperation<CustomSensor>} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.sensors.custom.customsensor.fromidasync
     */
    static FromIdAsync(sensorId) {
        if (!CustomSensor.HasProp("__ICustomSensorStatics")) {
            activatableClassId := HSTRING.Create("Windows.Devices.Sensors.Custom.CustomSensor")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ICustomSensorStatics.IID)
            CustomSensor.__ICustomSensorStatics := ICustomSensorStatics(factoryPtr)
        }

        return CustomSensor.__ICustomSensorStatics.FromIdAsync(sensorId)
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * Gets the minimum report interval that is supported by the sensor.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.sensors.custom.customsensor.minimumreportinterval
     * @type {Integer} 
     */
    MinimumReportInterval {
        get => this.get_MinimumReportInterval()
    }

    /**
     * Gets or sets the current report interval for the sensor.
     * @remarks
     * The report interval is specified in milliseconds.
     * 
     * The report interval will be set to a default value that will vary based on the sensor driver’s implementation. If your app doesn't want to use this default value, set the report interval to a non-zero value prior to registering an event handler or calling [GetCurrentReading](customsensor_getcurrentreading_1416488181.md). The sensor will then attempt to allocate resources to satisfy the app’s requirements but the sensor also has to balance the needs of other apps using the sensor.
     * 
     * Changes to the report interval after an event handler has been registered or [GetCurrentReading](customsensor_getcurrentreading_1416488181.md) has been called may apply to the delivery of subsequent sensor readings.
     * 
     * Conversely, when an app is finished with the sensor, we recommend that it explicitly return the sensor to its default report interval by setting it to zero. This is important for power conservation, especially when using a language that may keep the sensor object active for an indefinite period prior to garbage collection.
     * 
     * We recommend that the app consult the [MinimumReportInterval](customsensor_minimumreportinterval.md) property prior to setting the report interval to ensure that the sensor can honor the requested report interval. Setting a value below the minimum supported interval will either trigger an exception or have undefined results.
     * 
     * Although the app can set this value to request a particular report interval, the driver will determine the actual report interval, based on internal logic. For example, the driver might use the shortest report interval that is requested by any caller.
     * 
     * Setting a value of zero requests the driver to use its default report interval. As with requesting a specific interval, the driver may choose a different interval based on other client requests and internal logic.
     * 
     * The custom sensor platform automatically sets the change sensitivity for custom sensors based on the current report interval. This table specifies the change sensitivity values for given intervals.
     * 
     * <table>
     *    <tr><th>Current report interval (specified in milliseconds)</th><th>Change sensitivity (specified as G force)</th></tr>
     *    <tr><td>1 ms – 16 ms</td><td>0.01 G</td></tr>
     *    <tr><td>17 ms – 32 ms</td><td>0.02 G</td></tr>
     *    <tr><td>&gt;= 33 ms</td><td>0.05 G</td></tr>
     * </table>
     * @see https://learn.microsoft.com/uwp/api/windows.devices.sensors.custom.customsensor.reportinterval
     * @type {Integer} 
     */
    ReportInterval {
        get => this.get_ReportInterval()
        set => this.put_ReportInterval(value)
    }

    /**
     * Gets the device identifier of the sensor.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.sensors.custom.customsensor.deviceid
     * @type {HSTRING} 
     */
    DeviceId {
        get => this.get_DeviceId()
    }

    /**
     * Gets or sets the delay between batches of sensor information.
     * @remarks
     * This property is in reference to the frequency of [ReadingChanged](customsensor_readingchanged.md) events.
     * 
     * Not all sensors support ReportLatency. If the sensor does not support this property, it will function the same as if you set this value to 0. Setting this value to 0 will use the default latency for the sensor.
     * 
     * If you set ReportLatency to a value higher than the maximum supported latency, the sensor will use the maximum supported latency. However, this property will not change in value. The maximum possible ReportLatency equals the [MaxBatchSize](customsensor_maxbatchsize.md) times the [ReportInterval](customsensor_reportinterval.md).
     * 
     * Be aware that multiple applications could be dependent on a single sensor. Each of those applications can set a different value for ReportLatency. In this scenario, the sensor needs to try to accommodate the lowest value for ReportLatency. Because of this, the actual latency may not match the latency defined by this property in your application. This property corresponds to your ideal latency, which may not be the same latency on the sensor.
     * 
     * For more information about sensor batching, see [Sensors](/windows/uwp/devices-sensors/sensors).
     * @see https://learn.microsoft.com/uwp/api/windows.devices.sensors.custom.customsensor.reportlatency
     * @type {Integer} 
     */
    ReportLatency {
        get => this.get_ReportLatency()
        set => this.put_ReportLatency(value)
    }

    /**
     * Gets the maximum number of events that can be batched by the sensor.
     * @remarks
     * A sensor may not support batched data collection. In that case, this property will be 0. Otherwise, this determines the maximum number of events the sensor can gather before submitting them. This in turn will determine the maximum supported [ReportLatency](customsensor_reportlatency.md). The maximum latency equals the [ReportInterval](customsensor_reportinterval.md) times the MaxBatchSize. For more information about sensor batching, see [Sensors](/windows/uwp/devices-sensors/sensors).
     * @see https://learn.microsoft.com/uwp/api/windows.devices.sensors.custom.customsensor.maxbatchsize
     * @type {Integer} 
     */
    MaxBatchSize {
        get => this.get_MaxBatchSize()
    }

    /**
     * Occurs each time the sensor reports a new sensor reading.
     * @remarks
     * An app may register this event handler to obtain sensor readings. The app must establish a desired [ReportInterval](customsensor_reportinterval.md). This informs the sensor driver to allocate resources to satisfy the requirements of the app.
     * @type {TypedEventHandler<CustomSensor, CustomSensorReadingChangedEventArgs>}
    */
    OnReadingChanged {
        get {
            if(!this.HasProp("__OnReadingChanged")){
                this.__OnReadingChanged := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{aa9460cb-f08c-5963-b232-cc4075e984e7}"),
                    CustomSensor,
                    CustomSensorReadingChangedEventArgs
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
     * Gets the current sensor reading.
     * @remarks
     * An app may use this method to poll the sensor for the current reading as an alternative to registering a [ReadingChanged](customsensor_readingchanged.md) event handler. This would be the preferred alternative for an app that updates its user interface at a specific frame rate. Whether polling once or many times, the app must establish a desired [ReportInterval](customsensor_reportinterval.md). This informs the sensor driver to allocate resources to satisfy subsequent polling requests.
     * 
     * Before using the return value from this method, the app must first check that the value is not null. (If the value is null and you attempt to retrieve it, Windows will generate an exception.)
     * @returns {CustomSensorReading} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.sensors.custom.customsensor.getcurrentreading
     */
    GetCurrentReading() {
        if (!this.HasProp("__ICustomSensor")) {
            if ((queryResult := this.QueryInterface(ICustomSensor.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICustomSensor := ICustomSensor(outPtr)
        }

        return this.__ICustomSensor.GetCurrentReading()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_MinimumReportInterval() {
        if (!this.HasProp("__ICustomSensor")) {
            if ((queryResult := this.QueryInterface(ICustomSensor.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICustomSensor := ICustomSensor(outPtr)
        }

        return this.__ICustomSensor.get_MinimumReportInterval()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_ReportInterval(value) {
        if (!this.HasProp("__ICustomSensor")) {
            if ((queryResult := this.QueryInterface(ICustomSensor.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICustomSensor := ICustomSensor(outPtr)
        }

        return this.__ICustomSensor.put_ReportInterval(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_ReportInterval() {
        if (!this.HasProp("__ICustomSensor")) {
            if ((queryResult := this.QueryInterface(ICustomSensor.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICustomSensor := ICustomSensor(outPtr)
        }

        return this.__ICustomSensor.get_ReportInterval()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_DeviceId() {
        if (!this.HasProp("__ICustomSensor")) {
            if ((queryResult := this.QueryInterface(ICustomSensor.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICustomSensor := ICustomSensor(outPtr)
        }

        return this.__ICustomSensor.get_DeviceId()
    }

    /**
     * 
     * @param {TypedEventHandler<CustomSensor, CustomSensorReadingChangedEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_ReadingChanged(handler) {
        if (!this.HasProp("__ICustomSensor")) {
            if ((queryResult := this.QueryInterface(ICustomSensor.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICustomSensor := ICustomSensor(outPtr)
        }

        return this.__ICustomSensor.add_ReadingChanged(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_ReadingChanged(token) {
        if (!this.HasProp("__ICustomSensor")) {
            if ((queryResult := this.QueryInterface(ICustomSensor.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICustomSensor := ICustomSensor(outPtr)
        }

        return this.__ICustomSensor.remove_ReadingChanged(token)
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_ReportLatency(value) {
        if (!this.HasProp("__ICustomSensor2")) {
            if ((queryResult := this.QueryInterface(ICustomSensor2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICustomSensor2 := ICustomSensor2(outPtr)
        }

        return this.__ICustomSensor2.put_ReportLatency(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_ReportLatency() {
        if (!this.HasProp("__ICustomSensor2")) {
            if ((queryResult := this.QueryInterface(ICustomSensor2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICustomSensor2 := ICustomSensor2(outPtr)
        }

        return this.__ICustomSensor2.get_ReportLatency()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_MaxBatchSize() {
        if (!this.HasProp("__ICustomSensor2")) {
            if ((queryResult := this.QueryInterface(ICustomSensor2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICustomSensor2 := ICustomSensor2(outPtr)
        }

        return this.__ICustomSensor2.get_MaxBatchSize()
    }

;@endregion Instance Methods
}
