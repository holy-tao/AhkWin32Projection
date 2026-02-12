#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IInclinometer.ahk
#Include .\IInclinometerDeviceId.ahk
#Include .\IInclinometer2.ahk
#Include .\IInclinometer3.ahk
#Include .\IInclinometer4.ahk
#Include .\IInclinometerStatics.ahk
#Include .\IInclinometerStatics3.ahk
#Include .\IInclinometerStatics4.ahk
#Include .\IInclinometerStatics2.ahk
#Include ..\..\Foundation\TypedEventHandler.ahk
#Include .\Inclinometer.ahk
#Include .\InclinometerReadingChangedEventArgs.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\..\WinRTEventHandler.ahk

/**
 * Represents an inclinometer sensor that provides pitch, roll, and yaw values corresponding to rotation angles around the x, y, and z axes, respectively.
 * @remarks
 * Sensor data is provided relative to the device's fixed sensor coordinate system, and is independent of display orientation. For applications that rely on sensor data for input control or to manipulate elements on the screen, the developer must take current display orientation into account and compensate the data appropriately. For more info about the sensor coordinate system, see [Sensor data and display orientation](/previous-versions/windows/apps/dn440593(v=win.10)).
 * 
 * The following example demonstrates how a UWP app built with XAML and C# uses the [GetDefault](inclinometer_getdefault_2064571144.md) method to establish a connection to an inclinometer. If no integrated inclinometer is found, the method will return a null value.
 * 
 * [!code-csharp[GetDefaultCS](../windows.devices.sensors/code/inclinometer/csharp/Scenario1.xaml.cs#SnippetGetDefaultCS)]
 * 
 * The following example demonstrates how a UWP app built with XAML registers a [ReadingChanged](inclinometer_readingchanged.md) event handler.
 * 
 * [!code-csharp[EnableReadingChangedCS](../windows.devices.sensors/code/inclinometer/csharp/Scenario1.xaml.cs#SnippetEnableReadingChangedCS)]
 * 
 * The following example shows the [ReadingChanged](inclinometer_readingchanged.md) event handler.
 * 
 * [!code-csharp[ReadingChangedCS](../windows.devices.sensors/code/inclinometer/csharp/Scenario1.xaml.cs#SnippetReadingChangedCS)]
 * @see https://learn.microsoft.com/uwp/api/windows.devices.sensors.inclinometer
 * @namespace Windows.Devices.Sensors
 * @version WindowsRuntime 1.4
 */
class Inclinometer extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IInclinometer

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IInclinometer.IID

;@endregion Static Properties

;@region Static Methods
    /**
     * Returns the default inclinometer based on the [SensorReadingType](sensorreadingtype.md).
     * @remarks
     * This method only returns values for hardware that has been integrated into the computer by the manufacturer. (The inclinometer readings are derived from multiple sensors.) A **null** value will be returned if the specified sensor is not available in the system.
     * 
     * When a system is in Connected Standby, a call to the GetDefault method will return immediately with a **null** result.
     * @returns {Inclinometer} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.sensors.inclinometer.getdefault
     */
    static GetDefault() {
        if (!Inclinometer.HasProp("__IInclinometerStatics")) {
            activatableClassId := HSTRING.Create("Windows.Devices.Sensors.Inclinometer")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IInclinometerStatics.IID)
            Inclinometer.__IInclinometerStatics := IInclinometerStatics(factoryPtr)
        }

        return Inclinometer.__IInclinometerStatics.GetDefault()
    }

    /**
     * Returns the default inclinometer for [absolute readings](/uwp/api/windows.devices.sensors.sensorreadingtype).
     * @remarks
     * This method returns the same result as GetDefault(SensorReadingType.Absolute)
     * 
     * This method only returns values for hardware that has been integrated into the computer by the manufacturer. (The inclinometer readings are derived from multiple sensors.) A null value will be returned if the specified sensor is not available in the system.
     * 
     * When a system is in Connected Standby, a call to the [GetDefault](inclinometer_getdefault_2064571144.md) method will return immediately with a null result.
     * @param {Integer} sensorReadingtype_ 
     * @returns {Inclinometer} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.sensors.inclinometer.getdefault
     */
    static GetDefaultWithSensorReadingType(sensorReadingtype_) {
        if (!Inclinometer.HasProp("__IInclinometerStatics3")) {
            activatableClassId := HSTRING.Create("Windows.Devices.Sensors.Inclinometer")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IInclinometerStatics3.IID)
            Inclinometer.__IInclinometerStatics3 := IInclinometerStatics3(factoryPtr)
        }

        return Inclinometer.__IInclinometerStatics3.GetDefaultWithSensorReadingType(sensorReadingtype_)
    }

    /**
     * Gets the device selector.
     * @param {Integer} readingType The type of sensor to retrieve.
     * @returns {HSTRING} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.sensors.inclinometer.getdeviceselector
     */
    static GetDeviceSelector(readingType) {
        if (!Inclinometer.HasProp("__IInclinometerStatics4")) {
            activatableClassId := HSTRING.Create("Windows.Devices.Sensors.Inclinometer")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IInclinometerStatics4.IID)
            Inclinometer.__IInclinometerStatics4 := IInclinometerStatics4(factoryPtr)
        }

        return Inclinometer.__IInclinometerStatics4.GetDeviceSelector(readingType)
    }

    /**
     * Asynchronously obtains the sensor from its identifier.
     * @param {HSTRING} deviceId The [sensor identifier](/windows-hardware/drivers/install/device-instance-ids)
     * @returns {IAsyncOperation<Inclinometer>} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.sensors.inclinometer.fromidasync
     */
    static FromIdAsync(deviceId) {
        if (!Inclinometer.HasProp("__IInclinometerStatics4")) {
            activatableClassId := HSTRING.Create("Windows.Devices.Sensors.Inclinometer")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IInclinometerStatics4.IID)
            Inclinometer.__IInclinometerStatics4 := IInclinometerStatics4(factoryPtr)
        }

        return Inclinometer.__IInclinometerStatics4.FromIdAsync(deviceId)
    }

    /**
     * Returns the default inclinometer for [relative readings](/uwp/api/windows.devices.sensors.sensorreadingtype).
     * @remarks
     * This method returns the same result as GetDefault(SensorReadingType.Relative)
     * @returns {Inclinometer} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.sensors.inclinometer.getdefaultforrelativereadings
     */
    static GetDefaultForRelativeReadings() {
        if (!Inclinometer.HasProp("__IInclinometerStatics2")) {
            activatableClassId := HSTRING.Create("Windows.Devices.Sensors.Inclinometer")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IInclinometerStatics2.IID)
            Inclinometer.__IInclinometerStatics2 := IInclinometerStatics2(factoryPtr)
        }

        return Inclinometer.__IInclinometerStatics2.GetDefaultForRelativeReadings()
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * Gets the minimum report interval supported by the inclinometer.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.sensors.inclinometer.minimumreportinterval
     * @type {Integer} 
     */
    MinimumReportInterval {
        get => this.get_MinimumReportInterval()
    }

    /**
     * Gets or sets the current report interval for the inclinometer.
     * @remarks
     * The report interval is set to a default value that varies based on the sensor driver’s implementation. If your app does not want to use this default value, you should set the report interval to a non-zero value prior to registering an event handler or calling [GetCurrentReading](inclinometer_getcurrentreading_1416488181.md). The sensor then attempts to allocate resources to satisfy the application’s requirements while balancing the needs of other apps using the sensor.
     * 
     * Changes to the report interval after an event handler has been registered, or [GetCurrentReading](inclinometer_getcurrentreading_1416488181.md) has been called, might apply to the delivery of subsequent sensor readings.
     * 
     * Conversely, when an application is finished with the sensor, it should explicitly return the sensor to its default report interval by setting it to zero. This is important for power conservation, especially when using a language that might keep the sensor object active for an indefinite period prior to garbage collection.
     * 
     * The application should consult the [MinimumReportInterval](inclinometer_minimumreportinterval.md) property prior to setting the report interval to ensure that the sensor can honor the requested report interval. Setting a value below the minimum supported interval either triggers an exception or has undefined results.
     * 
     * Although the application can set this value to request a particular report interval, the driver determines the actual report interval, based on internal logic. For example, the driver might use the shortest report interval that is requested by any caller.
     * 
     * If the value is set to zero, the driver uses its default report interval. As with requesting a specific interval, the driver might choose a different interval based on other client requests and internal logic.
     * 
     * The sensor platform automatically sets the change sensitivity for orientation sensors based on the current report interval. This table specifies the change sensitivity values for given intervals.
     * 
     * | Current report interval | Change sensitivity |
     * | --- | --- |
     * | 1 ms – 16 ms | 0.01 degreees |
     * | 17 ms – 32 ms | 0.5 degrees |
     * | >= 33 ms | 2 degrees |
     * @see https://learn.microsoft.com/uwp/api/windows.devices.sensors.inclinometer.reportinterval
     * @type {Integer} 
     */
    ReportInterval {
        get => this.get_ReportInterval()
        set => this.put_ReportInterval(value)
    }

    /**
     * Gets the device identifier.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.sensors.inclinometer.deviceid
     * @type {HSTRING} 
     */
    DeviceId {
        get => this.get_DeviceId()
    }

    /**
     * Gets or sets the transformation that needs to be applied to sensor data. Transformations to be applied are tied to the display orientation with which to align the sensor data.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.sensors.inclinometer.readingtransform
     * @type {Integer} 
     */
    ReadingTransform {
        get => this.get_ReadingTransform()
        set => this.put_ReadingTransform(value)
    }

    /**
     * Gets the sensor reading type.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.sensors.inclinometer.readingtype
     * @type {Integer} 
     */
    ReadingType {
        get => this.get_ReadingType()
    }

    /**
     * Gets or sets the delay between batches of sensor information.
     * @remarks
     * This property is in reference to the frequency of [ReadingChanged](Inclinometer_readingchanged.md) events.
     * 
     * Not all sensors support [ReportLatency](Inclinometer_reportlatency.md). If the sensor does not support this property, it will function the same as if you set this value to 0. Setting this value to 0 will use the default latency for the sensor.
     * 
     * If you set [ReportLatency](Inclinometer_reportlatency.md) to a value higher than the maximum supported latency, the sensor will use the maximum supported latency. However, this property will not change in value. The maximum possible [ReportLatency](Inclinometer_reportlatency.md) equals the [MaxBatchSize](Inclinometer_maxbatchsize.md) times the [ReportInterval](Inclinometer_reportinterval.md).
     * 
     * Be aware that multiple applications could be dependent on a single sensor. Each of those applications can set a different value for [ReportLatency](Inclinometer_reportlatency.md). In this scenario, the sensor needs to try to accommodate the lowest value for [ReportLatency](Inclinometer_reportlatency.md). Because of this, the actual latency may not match the latency defined by this property in your application. This property corresponds to your ideal latency, which may not be the same latency on the sensor.
     * 
     * For more information about sensor batching, see [Sensors](/windows/uwp/devices-sensors/sensors).
     * @see https://learn.microsoft.com/uwp/api/windows.devices.sensors.inclinometer.reportlatency
     * @type {Integer} 
     */
    ReportLatency {
        get => this.get_ReportLatency()
        set => this.put_ReportLatency(value)
    }

    /**
     * Gets the maximum number of events that can be batched by the sensor.
     * @remarks
     * A sensor may not support batched data collection. In that case, this property will be 0. Otherwise, this determines the maximum number of events the sensor can gather before submitting them. This in turn will determine the maximum supported [ReportLatency](Inclinometer_reportlatency.md). The maximum latency equals the [ReportInterval](Inclinometer_reportinterval.md) times the [MaxBatchSize](Inclinometer_maxbatchsize.md). For more information about sensor batching, see [Sensors](/windows/uwp/devices-sensors/sensors).
     * @see https://learn.microsoft.com/uwp/api/windows.devices.sensors.inclinometer.maxbatchsize
     * @type {Integer} 
     */
    MaxBatchSize {
        get => this.get_MaxBatchSize()
    }

    /**
     * Gets the [InclinometerDataThreshold](inclinometerdatathreshold.md) for the gyrometer sensor.
     * @remarks
     * A report is generated only if the delta between the previous reported data reading and a new sample is greater than the [InclinometerDataThreshold](inclinometerdatathreshold.md).
     * @see https://learn.microsoft.com/uwp/api/windows.devices.sensors.inclinometer.reportthreshold
     * @type {InclinometerDataThreshold} 
     */
    ReportThreshold {
        get => this.get_ReportThreshold()
    }

    /**
     * Occurs each time the inclinometer reports a new sensor reading.
     * @remarks
     * Applications can set the frequency of this event by setting the **ReportInterval** property.
     * @type {TypedEventHandler<Inclinometer, InclinometerReadingChangedEventArgs>}
    */
    OnReadingChanged {
        get {
            if(!this.HasProp("__OnReadingChanged")){
                this.__OnReadingChanged := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{6f3b411f-d147-59f1-bbe4-7bec396c7b6e}"),
                    Inclinometer,
                    InclinometerReadingChangedEventArgs
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
     * Gets the current inclinometer reading.
     * @remarks
     * An application may use this method to poll the sensor for the current reading as an alternative to registering a [ReadingChanged](inclinometer_readingchanged.md) event handler. This would be the preferred alternative for an application that updates its user interface at a specific frame rate. Whether polling once or many times, the application must establish a desired [ReportInterval](inclinometer_reportinterval.md). This informs the sensor driver that resources should be allocated to satisfy subsequent polling requests
     * 
     * Before using the return value from this method, the application must first check that the value is not null. (If the value is null and you attempt to retrieve it, Windows will generate an exception.)
     * @returns {InclinometerReading} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.sensors.inclinometer.getcurrentreading
     */
    GetCurrentReading() {
        if (!this.HasProp("__IInclinometer")) {
            if ((queryResult := this.QueryInterface(IInclinometer.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IInclinometer := IInclinometer(outPtr)
        }

        return this.__IInclinometer.GetCurrentReading()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_MinimumReportInterval() {
        if (!this.HasProp("__IInclinometer")) {
            if ((queryResult := this.QueryInterface(IInclinometer.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IInclinometer := IInclinometer(outPtr)
        }

        return this.__IInclinometer.get_MinimumReportInterval()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_ReportInterval(value) {
        if (!this.HasProp("__IInclinometer")) {
            if ((queryResult := this.QueryInterface(IInclinometer.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IInclinometer := IInclinometer(outPtr)
        }

        return this.__IInclinometer.put_ReportInterval(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_ReportInterval() {
        if (!this.HasProp("__IInclinometer")) {
            if ((queryResult := this.QueryInterface(IInclinometer.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IInclinometer := IInclinometer(outPtr)
        }

        return this.__IInclinometer.get_ReportInterval()
    }

    /**
     * 
     * @param {TypedEventHandler<Inclinometer, InclinometerReadingChangedEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_ReadingChanged(handler) {
        if (!this.HasProp("__IInclinometer")) {
            if ((queryResult := this.QueryInterface(IInclinometer.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IInclinometer := IInclinometer(outPtr)
        }

        return this.__IInclinometer.add_ReadingChanged(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_ReadingChanged(token) {
        if (!this.HasProp("__IInclinometer")) {
            if ((queryResult := this.QueryInterface(IInclinometer.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IInclinometer := IInclinometer(outPtr)
        }

        return this.__IInclinometer.remove_ReadingChanged(token)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_DeviceId() {
        if (!this.HasProp("__IInclinometerDeviceId")) {
            if ((queryResult := this.QueryInterface(IInclinometerDeviceId.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IInclinometerDeviceId := IInclinometerDeviceId(outPtr)
        }

        return this.__IInclinometerDeviceId.get_DeviceId()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_ReadingTransform(value) {
        if (!this.HasProp("__IInclinometer2")) {
            if ((queryResult := this.QueryInterface(IInclinometer2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IInclinometer2 := IInclinometer2(outPtr)
        }

        return this.__IInclinometer2.put_ReadingTransform(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_ReadingTransform() {
        if (!this.HasProp("__IInclinometer2")) {
            if ((queryResult := this.QueryInterface(IInclinometer2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IInclinometer2 := IInclinometer2(outPtr)
        }

        return this.__IInclinometer2.get_ReadingTransform()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_ReadingType() {
        if (!this.HasProp("__IInclinometer2")) {
            if ((queryResult := this.QueryInterface(IInclinometer2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IInclinometer2 := IInclinometer2(outPtr)
        }

        return this.__IInclinometer2.get_ReadingType()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_ReportLatency(value) {
        if (!this.HasProp("__IInclinometer3")) {
            if ((queryResult := this.QueryInterface(IInclinometer3.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IInclinometer3 := IInclinometer3(outPtr)
        }

        return this.__IInclinometer3.put_ReportLatency(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_ReportLatency() {
        if (!this.HasProp("__IInclinometer3")) {
            if ((queryResult := this.QueryInterface(IInclinometer3.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IInclinometer3 := IInclinometer3(outPtr)
        }

        return this.__IInclinometer3.get_ReportLatency()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_MaxBatchSize() {
        if (!this.HasProp("__IInclinometer3")) {
            if ((queryResult := this.QueryInterface(IInclinometer3.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IInclinometer3 := IInclinometer3(outPtr)
        }

        return this.__IInclinometer3.get_MaxBatchSize()
    }

    /**
     * 
     * @returns {InclinometerDataThreshold} 
     */
    get_ReportThreshold() {
        if (!this.HasProp("__IInclinometer4")) {
            if ((queryResult := this.QueryInterface(IInclinometer4.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IInclinometer4 := IInclinometer4(outPtr)
        }

        return this.__IInclinometer4.get_ReportThreshold()
    }

;@endregion Instance Methods
}
