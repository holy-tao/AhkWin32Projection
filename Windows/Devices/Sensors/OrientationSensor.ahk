#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IOrientationSensor.ahk
#Include .\IOrientationSensorDeviceId.ahk
#Include .\IOrientationSensor2.ahk
#Include .\IOrientationSensor3.ahk
#Include .\IOrientationSensorStatics4.ahk
#Include .\IOrientationSensorStatics3.ahk
#Include .\IOrientationSensorStatics2.ahk
#Include .\IOrientationSensorStatics.ahk
#Include ..\..\Foundation\TypedEventHandler.ahk
#Include .\OrientationSensor.ahk
#Include .\OrientationSensorReadingChangedEventArgs.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\..\WinRTEventHandler.ahk

/**
 * Represents an orientation sensor.
  * 
  * This sensor returns a rotation matrix and a Quaternion that can be used to adjust the user's perspective in a game application.
  * 
  * For an example implementation, see the [orientation sensor sample](https://github.com/Microsoft/Windows-universal-samples/tree/master/Samples/OrientationSensor).
 * @remarks
 * Sensor data is provided relative to the device's fixed sensor coordinate system, and is independent of display orientation. For applications that rely on sensor data for input control or to manipulate elements on the screen, the developer must take current display orientation into account and compensate the data appropriately. For more info about the sensor coordinate system, see [Sensor data and display orientation](/previous-versions/windows/apps/dn440593(v=win.10)).
 * 
 * The following example demonstrates how a UWP app built with XAML and C# uses the [GetDefault](orientationsensor_getdefault_2064571144.md) method to establish a connection to an orientation sensor. If no orientation sensor is found, the method will return a null value.
 * 
 * [!code-csharp[GetDefaultCS](../windows.devices.sensors/code/orientation/csharp/Scenario1.xaml.cs#SnippetGetDefaultCS)]
 * 
 * The following example demonstrates how a UWP app built with XAML registers a [ReadingChanged](orientationsensor_readingchanged.md) event handler.
 * 
 * [!code-csharp[EnableReadingChangedCS](../windows.devices.sensors/code/orientation/csharp/Scenario1.xaml.cs#SnippetEnableReadingChangedCS)]
 * 
 * The following example shows the [ReadingChanged](orientationsensor_readingchanged.md) event handler.
 * 
 * [!code-csharp[ReadingChangedCS](../windows.devices.sensors/code/orientation/csharp/Scenario1.xaml.cs#SnippetReadingChangedCS)]
 * @see https://learn.microsoft.com/uwp/api/windows.devices.sensors.orientationsensor
 * @namespace Windows.Devices.Sensors
 * @version WindowsRuntime 1.4
 */
class OrientationSensor extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IOrientationSensor

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IOrientationSensor.IID

;@endregion Static Properties

;@region Static Methods
    /**
     * Gets the device selector.
     * @param {Integer} readingType The type of sensor to retrieve. An Absolute SensorReadingType returns an OrientationSensor using an accelerometer, a gyromoter, and magnetometer to determine the orientation with respect to magnetic North. A Relative SensorReadingType returns an OrientationSensor using an accelerometer and gyrometer only (no magnetometer), measuring relative to where the sensor was first instantiated.
     * @returns {HSTRING} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.sensors.orientationsensor.getdeviceselector
     */
    static GetDeviceSelector(readingType) {
        if (!OrientationSensor.HasProp("__IOrientationSensorStatics4")) {
            activatableClassId := HSTRING.Create("Windows.Devices.Sensors.OrientationSensor")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IOrientationSensorStatics4.IID)
            OrientationSensor.__IOrientationSensorStatics4 := IOrientationSensorStatics4(factoryPtr)
        }

        return OrientationSensor.__IOrientationSensorStatics4.GetDeviceSelector(readingType)
    }

    /**
     * Gets the device selector.
     * @param {Integer} readingType The type of sensor to retrieve.
     * @param {Integer} optimizationGoal 
     * @returns {HSTRING} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.sensors.orientationsensor.getdeviceselector
     */
    static GetDeviceSelectorWithSensorReadingTypeAndSensorOptimizationGoal(readingType, optimizationGoal) {
        if (!OrientationSensor.HasProp("__IOrientationSensorStatics4")) {
            activatableClassId := HSTRING.Create("Windows.Devices.Sensors.OrientationSensor")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IOrientationSensorStatics4.IID)
            OrientationSensor.__IOrientationSensorStatics4 := IOrientationSensorStatics4(factoryPtr)
        }

        return OrientationSensor.__IOrientationSensorStatics4.GetDeviceSelectorWithSensorReadingTypeAndSensorOptimizationGoal(readingType, optimizationGoal)
    }

    /**
     * Asynchronously obtains the sensor from its identifier.
     * @param {HSTRING} deviceId The [sensor identifier](/windows-hardware/drivers/install/device-instance-ids)
     * @returns {IAsyncOperation<OrientationSensor>} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.sensors.orientationsensor.fromidasync
     */
    static FromIdAsync(deviceId) {
        if (!OrientationSensor.HasProp("__IOrientationSensorStatics4")) {
            activatableClassId := HSTRING.Create("Windows.Devices.Sensors.OrientationSensor")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IOrientationSensorStatics4.IID)
            OrientationSensor.__IOrientationSensorStatics4 := IOrientationSensorStatics4(factoryPtr)
        }

        return OrientationSensor.__IOrientationSensorStatics4.FromIdAsync(deviceId)
    }

    /**
     * Returns the default orientation sensor, taking into account power and accuracy preferences.
     * @remarks
     * This method only returns values for hardware that has been integrated into the computer by the manufacturer. (The orientation-sensor readings are derived from multiple sensors.) A **null** value will be returned if the specified sensor is not available in the system.
     * 
     * When a system is in Connected Standby, a call to the [GetDefault](orientationsensor_getdefault_2064571144.md) method will return immediately with a **null** result.
     * 
     * The *optimizationGoal* parameter is dependent on the hardware available. It will attempt to choose the best sensor available based on your provided preference for optimization. It only has an effect if the *sensorReadingType* is **Absolute**.
     * @param {Integer} sensorReadingtype_ 
     * @returns {OrientationSensor} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.sensors.orientationsensor.getdefault
     */
    static GetDefaultWithSensorReadingType(sensorReadingtype_) {
        if (!OrientationSensor.HasProp("__IOrientationSensorStatics3")) {
            activatableClassId := HSTRING.Create("Windows.Devices.Sensors.OrientationSensor")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IOrientationSensorStatics3.IID)
            OrientationSensor.__IOrientationSensorStatics3 := IOrientationSensorStatics3(factoryPtr)
        }

        return OrientationSensor.__IOrientationSensorStatics3.GetDefaultWithSensorReadingType(sensorReadingtype_)
    }

    /**
     * Returns the default orientation sensor for [absolute readings](/uwp/api/windows.devices.sensors.sensorreadingtype).
     * @remarks
     * This method returns the same result as GetDefault(SensorReadingType.Absolute)
     * 
     * This method only returns values for hardware that has been integrated into the computer by the manufacturer. (The orientation-sensor readings are derived from multiple sensors.) A null value will be returned if the specified sensor is not available in the system.
     * 
     * When a system is in Connected Standby, a call to the [GetDefault](orientationsensor_getdefault_2064571144.md) method will return immediately with a null result.
     * @param {Integer} sensorReadingType_ 
     * @param {Integer} optimizationGoal 
     * @returns {OrientationSensor} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.sensors.orientationsensor.getdefault
     */
    static GetDefaultWithSensorReadingTypeAndSensorOptimizationGoal(sensorReadingType_, optimizationGoal) {
        if (!OrientationSensor.HasProp("__IOrientationSensorStatics3")) {
            activatableClassId := HSTRING.Create("Windows.Devices.Sensors.OrientationSensor")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IOrientationSensorStatics3.IID)
            OrientationSensor.__IOrientationSensorStatics3 := IOrientationSensorStatics3(factoryPtr)
        }

        return OrientationSensor.__IOrientationSensorStatics3.GetDefaultWithSensorReadingTypeAndSensorOptimizationGoal(sensorReadingType_, optimizationGoal)
    }

    /**
     * Returns the default orientation sensor for [relative readings](/uwp/api/windows.devices.sensors.sensorreadingtype).
     * @remarks
     * This method returns the same result as GetDefault(SensorReadingType.Relative)
     * @returns {OrientationSensor} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.sensors.orientationsensor.getdefaultforrelativereadings
     */
    static GetDefaultForRelativeReadings() {
        if (!OrientationSensor.HasProp("__IOrientationSensorStatics2")) {
            activatableClassId := HSTRING.Create("Windows.Devices.Sensors.OrientationSensor")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IOrientationSensorStatics2.IID)
            OrientationSensor.__IOrientationSensorStatics2 := IOrientationSensorStatics2(factoryPtr)
        }

        return OrientationSensor.__IOrientationSensorStatics2.GetDefaultForRelativeReadings()
    }

    /**
     * Returns the default orientation sensor, taking into account accuracy preferences.
     * @remarks
     * This method only returns values for hardware that has been integrated into the computer by the manufacturer. (The orientation-sensor readings are derived from multiple sensors.) A **null** value will be returned if the specified sensor is not available in the system.
     * 
     * When a system is in Connected Standby, a call to the GetDefault method will return immediately with a **null** result.
     * @returns {OrientationSensor} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.sensors.orientationsensor.getdefault
     */
    static GetDefault() {
        if (!OrientationSensor.HasProp("__IOrientationSensorStatics")) {
            activatableClassId := HSTRING.Create("Windows.Devices.Sensors.OrientationSensor")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IOrientationSensorStatics.IID)
            OrientationSensor.__IOrientationSensorStatics := IOrientationSensorStatics(factoryPtr)
        }

        return OrientationSensor.__IOrientationSensorStatics.GetDefault()
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * Gets the minimum report interval supported by the sensor.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.sensors.orientationsensor.minimumreportinterval
     * @type {Integer} 
     */
    MinimumReportInterval {
        get => this.get_MinimumReportInterval()
    }

    /**
     * Gets or sets the report interval supported by the sensor.
     * @remarks
     * The report interval is set to a default value that varies based on the sensor driver’s implementation. If your app does not want to use this default value, you should set the report interval to a non-zero value prior to registering an event handler or calling [GetCurrentReading](orientationsensor_getcurrentreading_1416488181.md). The sensor then attempts to allocate resources to satisfy the application’s requirements while balancing the needs of other apps using the sensor.
     * 
     * Changes to the report interval after an event handler has been registered, or [GetCurrentReading](orientationsensor_getcurrentreading_1416488181.md) has been called, might apply to the delivery of subsequent sensor readings.
     * 
     * Conversely, when an application is finished with the sensor, it should explicitly return the sensor to its default report interval by setting it to zero. This is important for power conservation, especially when using a language that might keep the sensor object active for an indefinite period prior to garbage collection.
     * 
     * The application should consult the [MinimumReportInterval](orientationsensor_minimumreportinterval.md) property prior to setting the report interval to ensure that the sensor can honor the requested report interval. Setting a value below the minimum supported interval either triggers an exception or has undefined results.
     * 
     * Although the application can set this value to request a particular report interval, the driver determines the actual report interval, based on internal logic. For example, the driver might use the shortest report interval that is requested by any caller.
     * 
     * If the value is set to zero, the driver uses its default report interval. As with requesting a specific interval, the driver might choose a different interval based on other client requests and internal logic.
     * 
     * The sensor platform automatically sets the change sensitivity for orientation sensors based on the current report interval. This table specifies the change sensitivity values for given intervals.
     * 
     * | Current report interval | Change sensitivity |
     * | --- | --- |
     * | 1 ms – 16 ms | 0.01 degrees |
     * | 17 ms – 32 ms | 0.5 degrees |
     * | >= 33 ms | 2 degrees |
     * @see https://learn.microsoft.com/uwp/api/windows.devices.sensors.orientationsensor.reportinterval
     * @type {Integer} 
     */
    ReportInterval {
        get => this.get_ReportInterval()
        set => this.put_ReportInterval(value)
    }

    /**
     * Gets the device identifier.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.sensors.orientationsensor.deviceid
     * @type {HSTRING} 
     */
    DeviceId {
        get => this.get_DeviceId()
    }

    /**
     * Gets or sets the transformation that needs to be applied to sensor data. Transformations to be applied are tied to the display orientation with which to align the sensor data.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.sensors.orientationsensor.readingtransform
     * @type {Integer} 
     */
    ReadingTransform {
        get => this.get_ReadingTransform()
        set => this.put_ReadingTransform(value)
    }

    /**
     * Gets the sensor reading type.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.sensors.orientationsensor.readingtype
     * @type {Integer} 
     */
    ReadingType {
        get => this.get_ReadingType()
    }

    /**
     * Gets or sets the delay between batches of sensor information.
     * @remarks
     * This property is in reference to the frequency of [ReadingChanged](OrientationSensor_readingchanged.md) events.
     * 
     * Not all sensors support [ReportLatency](OrientationSensor_reportlatency.md). If the sensor does not support this property, it will function the same as if you set this value to 0. Setting this value to 0 will use the default latency for the sensor.
     * 
     * If you set [ReportLatency](OrientationSensor_reportlatency.md) to a value higher than the maximum supported latency, the sensor will use the maximum supported latency. However, this property will not change in value. The maximum possible [ReportLatency](OrientationSensor_reportlatency.md) equals the [MaxBatchSize](OrientationSensor_maxbatchsize.md) times the [ReportInterval](OrientationSensor_reportinterval.md).
     * 
     * Be aware that multiple applications could be dependent on a single sensor. Each of those applications can set a different value for [ReportLatency](OrientationSensor_reportlatency.md). In this scenario, the sensor needs to try to accommodate the lowest value for [ReportLatency](OrientationSensor_reportlatency.md). Because of this, the actual latency may not match the latency defined by this property in your application. This property corresponds to your ideal latency, which may not be the same latency on the sensor.
     * 
     * For more information about sensor batching, see [Sensors](/windows/uwp/devices-sensors/sensors).
     * @see https://learn.microsoft.com/uwp/api/windows.devices.sensors.orientationsensor.reportlatency
     * @type {Integer} 
     */
    ReportLatency {
        get => this.get_ReportLatency()
        set => this.put_ReportLatency(value)
    }

    /**
     * Gets the maximum number of events that can be batched by the sensor.
     * @remarks
     * A sensor may not support batched data collection. In that case, this property will be 0. Otherwise, this determines the maximum number of events the sensor can gather before submitting them. This in turn will determine the maximum supported [ReportLatency](OrientationSensor_reportlatency.md). The maximum latency equals the [ReportInterval](OrientationSensor_reportinterval.md) times the [MaxBatchSize](OrientationSensor_maxbatchsize.md). For more information about sensor batching, see [Sensors](/windows/uwp/devices-sensors/sensors).
     * @see https://learn.microsoft.com/uwp/api/windows.devices.sensors.orientationsensor.maxbatchsize
     * @type {Integer} 
     */
    MaxBatchSize {
        get => this.get_MaxBatchSize()
    }

    /**
     * Occurs each time the orientation sensor reports a new sensor reading.
     * @remarks
     * An application may register this event handler to obtain sensor readings. The application must establish a desired [ReportInterval](orientationsensor_reportinterval.md). This informs the sensor driver that resources should be allocated to satisfy the requirements of the application.
     * 
     * The [OrientationSensor](orientationsensor.md) returns a quaternion and a rotation matrix.
     * @type {TypedEventHandler<OrientationSensor, OrientationSensorReadingChangedEventArgs>}
    */
    OnReadingChanged {
        get {
            if(!this.HasProp("__OnReadingChanged")){
                this.__OnReadingChanged := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{91ae0c43-e1f7-577d-a161-8aaf275eb927}"),
                    OrientationSensor,
                    OrientationSensorReadingChangedEventArgs
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
     * An application may use this method to poll the sensor for the current reading as an alternative to registering a [ReadingChanged](orientationsensor_readingchanged.md) event handler. This would be the preferred alternative for an application that updates its user interface at a specific frame rate. Whether polling once or many times, the application must establish a desired [ReportInterval](orientationsensor_reportinterval.md). This informs the sensor driver that resources should be allocated to satisfy subsequent polling requests
     * 
     * Before using the return value from this method, the application must first check that the value is not null. (If the value is null and you attempt to retrieve it, Windows will generate an exception.)
     * @returns {OrientationSensorReading} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.sensors.orientationsensor.getcurrentreading
     */
    GetCurrentReading() {
        if (!this.HasProp("__IOrientationSensor")) {
            if ((queryResult := this.QueryInterface(IOrientationSensor.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IOrientationSensor := IOrientationSensor(outPtr)
        }

        return this.__IOrientationSensor.GetCurrentReading()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_MinimumReportInterval() {
        if (!this.HasProp("__IOrientationSensor")) {
            if ((queryResult := this.QueryInterface(IOrientationSensor.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IOrientationSensor := IOrientationSensor(outPtr)
        }

        return this.__IOrientationSensor.get_MinimumReportInterval()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_ReportInterval(value) {
        if (!this.HasProp("__IOrientationSensor")) {
            if ((queryResult := this.QueryInterface(IOrientationSensor.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IOrientationSensor := IOrientationSensor(outPtr)
        }

        return this.__IOrientationSensor.put_ReportInterval(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_ReportInterval() {
        if (!this.HasProp("__IOrientationSensor")) {
            if ((queryResult := this.QueryInterface(IOrientationSensor.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IOrientationSensor := IOrientationSensor(outPtr)
        }

        return this.__IOrientationSensor.get_ReportInterval()
    }

    /**
     * 
     * @param {TypedEventHandler<OrientationSensor, OrientationSensorReadingChangedEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_ReadingChanged(handler) {
        if (!this.HasProp("__IOrientationSensor")) {
            if ((queryResult := this.QueryInterface(IOrientationSensor.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IOrientationSensor := IOrientationSensor(outPtr)
        }

        return this.__IOrientationSensor.add_ReadingChanged(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_ReadingChanged(token) {
        if (!this.HasProp("__IOrientationSensor")) {
            if ((queryResult := this.QueryInterface(IOrientationSensor.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IOrientationSensor := IOrientationSensor(outPtr)
        }

        return this.__IOrientationSensor.remove_ReadingChanged(token)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_DeviceId() {
        if (!this.HasProp("__IOrientationSensorDeviceId")) {
            if ((queryResult := this.QueryInterface(IOrientationSensorDeviceId.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IOrientationSensorDeviceId := IOrientationSensorDeviceId(outPtr)
        }

        return this.__IOrientationSensorDeviceId.get_DeviceId()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_ReadingTransform(value) {
        if (!this.HasProp("__IOrientationSensor2")) {
            if ((queryResult := this.QueryInterface(IOrientationSensor2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IOrientationSensor2 := IOrientationSensor2(outPtr)
        }

        return this.__IOrientationSensor2.put_ReadingTransform(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_ReadingTransform() {
        if (!this.HasProp("__IOrientationSensor2")) {
            if ((queryResult := this.QueryInterface(IOrientationSensor2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IOrientationSensor2 := IOrientationSensor2(outPtr)
        }

        return this.__IOrientationSensor2.get_ReadingTransform()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_ReadingType() {
        if (!this.HasProp("__IOrientationSensor2")) {
            if ((queryResult := this.QueryInterface(IOrientationSensor2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IOrientationSensor2 := IOrientationSensor2(outPtr)
        }

        return this.__IOrientationSensor2.get_ReadingType()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_ReportLatency(value) {
        if (!this.HasProp("__IOrientationSensor3")) {
            if ((queryResult := this.QueryInterface(IOrientationSensor3.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IOrientationSensor3 := IOrientationSensor3(outPtr)
        }

        return this.__IOrientationSensor3.put_ReportLatency(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_ReportLatency() {
        if (!this.HasProp("__IOrientationSensor3")) {
            if ((queryResult := this.QueryInterface(IOrientationSensor3.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IOrientationSensor3 := IOrientationSensor3(outPtr)
        }

        return this.__IOrientationSensor3.get_ReportLatency()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_MaxBatchSize() {
        if (!this.HasProp("__IOrientationSensor3")) {
            if ((queryResult := this.QueryInterface(IOrientationSensor3.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IOrientationSensor3 := IOrientationSensor3(outPtr)
        }

        return this.__IOrientationSensor3.get_MaxBatchSize()
    }

;@endregion Instance Methods
}
