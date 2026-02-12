#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\ILightSensor.ahk
#Include .\ILightSensorDeviceId.ahk
#Include .\ILightSensor2.ahk
#Include .\ILightSensor3.ahk
#Include .\ILightSensor4.ahk
#Include .\ILightSensorStatics2.ahk
#Include .\ILightSensorStatics.ahk
#Include ..\..\Foundation\TypedEventHandler.ahk
#Include .\LightSensor.ahk
#Include .\LightSensorReadingChangedEventArgs.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\..\WinRTEventHandler.ahk

/**
 * Represents an ambient-light sensor that provides the ambient-light reading as a LUX value.
 * @remarks
 * The following example demonstrates how a UWP app built with XAML and C# uses the [GetDefault](lightsensor_getdefault_846721868.md) method to establish a connection to a light sensor. If no integrated light sensor is found, the method will return a null value.
 * 
 * [!code-csharp[GetDefaultCS](../windows.devices.sensors/code/lightsensor/csharp/Scenario1.xaml.cs#SnippetGetDefaultCS)]
 * 
 * The following example demonstrates how a UWP app built with XAML registers a [ReadingChanged](lightsensor_readingchanged.md) event handler.
 * 
 * [!code-csharp[EnableReadingChangedCS](../windows.devices.sensors/code/lightsensor/csharp/Scenario1.xaml.cs#SnippetEnableReadingChangedCS)]
 * 
 * The following example shows the [ReadingChanged](lightsensor_readingchanged.md) event handler.
 * 
 * [!code-csharp[ReadingChangedCS](../windows.devices.sensors/code/lightsensor/csharp/Scenario1.xaml.cs#SnippetReadingChangedCS)]
 * @see https://learn.microsoft.com/uwp/api/windows.devices.sensors.lightsensor
 * @namespace Windows.Devices.Sensors
 * @version WindowsRuntime 1.4
 */
class LightSensor extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => ILightSensor

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => ILightSensor.IID

;@endregion Static Properties

;@region Static Methods
    /**
     * Gets the device selector.
     * @returns {HSTRING} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.sensors.lightsensor.getdeviceselector
     */
    static GetDeviceSelector() {
        if (!LightSensor.HasProp("__ILightSensorStatics2")) {
            activatableClassId := HSTRING.Create("Windows.Devices.Sensors.LightSensor")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ILightSensorStatics2.IID)
            LightSensor.__ILightSensorStatics2 := ILightSensorStatics2(factoryPtr)
        }

        return LightSensor.__ILightSensorStatics2.GetDeviceSelector()
    }

    /**
     * Asynchronously obtains the sensor from its identifier.
     * @param {HSTRING} deviceId The [sensor identifier](/windows-hardware/drivers/install/device-instance-ids)
     * @returns {IAsyncOperation<LightSensor>} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.sensors.lightsensor.fromidasync
     */
    static FromIdAsync(deviceId) {
        if (!LightSensor.HasProp("__ILightSensorStatics2")) {
            activatableClassId := HSTRING.Create("Windows.Devices.Sensors.LightSensor")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ILightSensorStatics2.IID)
            LightSensor.__ILightSensorStatics2 := ILightSensorStatics2(factoryPtr)
        }

        return LightSensor.__ILightSensorStatics2.FromIdAsync(deviceId)
    }

    /**
     * Returns the default ambient-light sensor.
     * @remarks
     * This method only returns values for a light sensor that has been integrated into the computer by the manufacturer. A null value will be returned if the specified sensor is not available in the system.
     * 
     * When a system is in Connected Standby, a call to the GetDefault method will return immediately with a null result.
     * @returns {LightSensor} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.sensors.lightsensor.getdefault
     */
    static GetDefault() {
        if (!LightSensor.HasProp("__ILightSensorStatics")) {
            activatableClassId := HSTRING.Create("Windows.Devices.Sensors.LightSensor")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ILightSensorStatics.IID)
            LightSensor.__ILightSensorStatics := ILightSensorStatics(factoryPtr)
        }

        return LightSensor.__ILightSensorStatics.GetDefault()
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * Gets the minimum report interval supported by the sensor.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.sensors.lightsensor.minimumreportinterval
     * @type {Integer} 
     */
    MinimumReportInterval {
        get => this.get_MinimumReportInterval()
    }

    /**
     * Gets or sets the current report interval for the ambient light sensor.
     * @remarks
     * The report interval is set to a default value that varies based on the sensor driver’s implementation. If your app does not want to use this default value, you should set the report interval to a non-zero value prior to registering an event handler or calling [GetCurrentReading](lightsensor_getcurrentreading_1416488181.md). The sensor then attempts to allocate resources to satisfy the application’s requirements while balancing the needs of other apps using the sensor.
     * 
     * Changes to the report interval after an event handler has been registered, or [GetCurrentReading](lightsensor_getcurrentreading_1416488181.md) has been called, might apply to the delivery of subsequent sensor readings.
     * 
     * Conversely, when an application is finished with the sensor, it should explicitly return the sensor to its default report interval by setting it to zero. This is important for power conservation, especially when using a language that might keep the sensor object active for an indefinite period prior to garbage collection.
     * 
     * The application should consult the [MinimumReportInterval](lightsensor_minimumreportinterval.md) property prior to setting the report interval to ensure that the sensor can honor the requested report interval. Setting a value below the minimum supported interval either triggers an exception or has undefined results.
     * 
     * Although the application can set this value to request a particular report interval, the driver determines the actual report interval, based on internal logic. For example, the driver might use the shortest report interval that is requested by any caller.
     * 
     * If the value is set to zero, the driver uses its default report interval. As with requesting a specific interval, the driver might choose a different interval based on other client requests and internal logic.
     * 
     * The sensor platform automatically sets the change sensitivity for ambient light sensors based on the current report interval. This table specifies the change sensitivity values for given intervals.
     * 
     * | Current report interval | Change sensitivity |
     * | --- | --- |
     * | 1 ms – 16 ms | 1% |
     * | 17 ms – 32 ms | 1% |
     * | >= 33 ms | 5% |
     * @see https://learn.microsoft.com/uwp/api/windows.devices.sensors.lightsensor.reportinterval
     * @type {Integer} 
     */
    ReportInterval {
        get => this.get_ReportInterval()
        set => this.put_ReportInterval(value)
    }

    /**
     * Gets the device identifier.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.sensors.lightsensor.deviceid
     * @type {HSTRING} 
     */
    DeviceId {
        get => this.get_DeviceId()
    }

    /**
     * Gets or sets the delay between batches of sensor information.
     * @remarks
     * This property is in reference to the frequency of [ReadingChanged](LightSensor_readingchanged.md) events.
     * 
     * Not all sensors support [ReportLatency](LightSensor_reportlatency.md). If the sensor does not support this property, it will function the same as if you set this value to 0. Setting this value to 0 will use the default latency for the sensor.
     * 
     * If you set [ReportLatency](LightSensor_reportlatency.md) to a value higher than the maximum supported latency, the sensor will use the maximum supported latency. However, this property will not change in value. The maximum possible [ReportLatency](LightSensor_reportlatency.md) equals the [MaxBatchSize](LightSensor_maxbatchsize.md) times the [ReportInterval](LightSensor_reportinterval.md).
     * 
     * Be aware that multiple applications could be dependent on a single sensor. Each of those applications can set a different value for [ReportLatency](LightSensor_reportlatency.md). In this scenario, the sensor needs to try to accommodate the lowest value for [ReportLatency](LightSensor_reportlatency.md). Because of this, the actual latency may not match the latency defined by this property in your application. This property corresponds to your ideal latency, which may not be the same latency on the sensor.
     * 
     * For more information about sensor batching, see [Sensors](/windows/uwp/devices-sensors/sensors).
     * @see https://learn.microsoft.com/uwp/api/windows.devices.sensors.lightsensor.reportlatency
     * @type {Integer} 
     */
    ReportLatency {
        get => this.get_ReportLatency()
        set => this.put_ReportLatency(value)
    }

    /**
     * Gets the maximum number of events that can be batched by the sensor.
     * @remarks
     * A sensor may not support batched data collection. In that case, this property will be 0. Otherwise, this determines the maximum number of events the sensor can gather before submitting them. This in turn will determine the maximum supported [ReportLatency](LightSensor_reportlatency.md). The maximum latency equals the [ReportInterval](LightSensor_reportinterval.md) times the [MaxBatchSize](LightSensor_maxbatchsize.md). For more information about sensor batching, see [Sensors](/windows/uwp/devices-sensors/sensors).
     * @see https://learn.microsoft.com/uwp/api/windows.devices.sensors.lightsensor.maxbatchsize
     * @type {Integer} 
     */
    MaxBatchSize {
        get => this.get_MaxBatchSize()
    }

    /**
     * Gets the [LightSensorDataThreshold](lightsensordatathreshold.md) for the light sensor.
     * @remarks
     * A report is generated only if the delta between the previous reported data reading and a new sample is greater than the [LightSensorDataThreshold](lightsensordatathreshold.md).
     * @see https://learn.microsoft.com/uwp/api/windows.devices.sensors.lightsensor.reportthreshold
     * @type {LightSensorDataThreshold} 
     */
    ReportThreshold {
        get => this.get_ReportThreshold()
    }

    /**
     * Occurs each time the ambient-light sensor reports a new sensor reading.
     * @remarks
     * An application may register this event handler to obtain sensor readings. The application must establish a desired [ReportInterval](lightsensor_reportinterval.md). This informs the sensor driver that resources should be allocated to satisfy the requirements of the application.
     * 
     * Applications can set the frequency of this event by setting the **ReportInterval** property.
     * @type {TypedEventHandler<LightSensor, LightSensorReadingChangedEventArgs>}
    */
    OnReadingChanged {
        get {
            if(!this.HasProp("__OnReadingChanged")){
                this.__OnReadingChanged := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{1ecf183a-9f0a-5f73-9225-5a33eab5594f}"),
                    LightSensor,
                    LightSensorReadingChangedEventArgs
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
     * Gets the current ambient-light sensor reading.
     * @remarks
     * An application may use this method to poll the sensor for the current reading as an alternative to registering a [ReadingChanged](lightsensor_readingchanged.md) event handler. This would be the preferred alternative for an application that updates its user interface at a specific frame rate. Whether polling once or many times, the application must establish a desired [ReportInterval](lightsensor_reportinterval.md). This informs the sensor driver that resources should be allocated to satisfy subsequent polling requests
     * 
     * Before using the return value from this method, the application must first check that the value is not null. (If the value is null and you attempt to retrieve it, Windows will generate an exception.)
     * @returns {LightSensorReading} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.sensors.lightsensor.getcurrentreading
     */
    GetCurrentReading() {
        if (!this.HasProp("__ILightSensor")) {
            if ((queryResult := this.QueryInterface(ILightSensor.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ILightSensor := ILightSensor(outPtr)
        }

        return this.__ILightSensor.GetCurrentReading()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_MinimumReportInterval() {
        if (!this.HasProp("__ILightSensor")) {
            if ((queryResult := this.QueryInterface(ILightSensor.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ILightSensor := ILightSensor(outPtr)
        }

        return this.__ILightSensor.get_MinimumReportInterval()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_ReportInterval(value) {
        if (!this.HasProp("__ILightSensor")) {
            if ((queryResult := this.QueryInterface(ILightSensor.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ILightSensor := ILightSensor(outPtr)
        }

        return this.__ILightSensor.put_ReportInterval(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_ReportInterval() {
        if (!this.HasProp("__ILightSensor")) {
            if ((queryResult := this.QueryInterface(ILightSensor.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ILightSensor := ILightSensor(outPtr)
        }

        return this.__ILightSensor.get_ReportInterval()
    }

    /**
     * 
     * @param {TypedEventHandler<LightSensor, LightSensorReadingChangedEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_ReadingChanged(handler) {
        if (!this.HasProp("__ILightSensor")) {
            if ((queryResult := this.QueryInterface(ILightSensor.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ILightSensor := ILightSensor(outPtr)
        }

        return this.__ILightSensor.add_ReadingChanged(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_ReadingChanged(token) {
        if (!this.HasProp("__ILightSensor")) {
            if ((queryResult := this.QueryInterface(ILightSensor.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ILightSensor := ILightSensor(outPtr)
        }

        return this.__ILightSensor.remove_ReadingChanged(token)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_DeviceId() {
        if (!this.HasProp("__ILightSensorDeviceId")) {
            if ((queryResult := this.QueryInterface(ILightSensorDeviceId.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ILightSensorDeviceId := ILightSensorDeviceId(outPtr)
        }

        return this.__ILightSensorDeviceId.get_DeviceId()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_ReportLatency(value) {
        if (!this.HasProp("__ILightSensor2")) {
            if ((queryResult := this.QueryInterface(ILightSensor2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ILightSensor2 := ILightSensor2(outPtr)
        }

        return this.__ILightSensor2.put_ReportLatency(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_ReportLatency() {
        if (!this.HasProp("__ILightSensor2")) {
            if ((queryResult := this.QueryInterface(ILightSensor2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ILightSensor2 := ILightSensor2(outPtr)
        }

        return this.__ILightSensor2.get_ReportLatency()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_MaxBatchSize() {
        if (!this.HasProp("__ILightSensor2")) {
            if ((queryResult := this.QueryInterface(ILightSensor2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ILightSensor2 := ILightSensor2(outPtr)
        }

        return this.__ILightSensor2.get_MaxBatchSize()
    }

    /**
     * 
     * @returns {LightSensorDataThreshold} 
     */
    get_ReportThreshold() {
        if (!this.HasProp("__ILightSensor3")) {
            if ((queryResult := this.QueryInterface(ILightSensor3.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ILightSensor3 := ILightSensor3(outPtr)
        }

        return this.__ILightSensor3.get_ReportThreshold()
    }

    /**
     * Returns a value that indicates whether chromaticity is supported with the device.
     * @returns {Boolean} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.sensors.lightsensor.ischromaticitysupported
     */
    IsChromaticitySupported() {
        if (!this.HasProp("__ILightSensor4")) {
            if ((queryResult := this.QueryInterface(ILightSensor4.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ILightSensor4 := ILightSensor4(outPtr)
        }

        return this.__ILightSensor4.IsChromaticitySupported()
    }

;@endregion Instance Methods
}
