#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IGyrometer.ahk
#Include .\IGyrometerDeviceId.ahk
#Include .\IGyrometer2.ahk
#Include .\IGyrometer3.ahk
#Include .\IGyrometer4.ahk
#Include .\IGyrometerStatics.ahk
#Include .\IGyrometerStatics2.ahk
#Include ..\..\Foundation\TypedEventHandler.ahk
#Include .\Gyrometer.ahk
#Include .\GyrometerReadingChangedEventArgs.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\..\WinRTEventHandler.ahk

/**
 * Represents a gyrometer sensor that provides angular velocity values with respect to the x, y, and z axes.
 * @remarks
 * Sensor data is provided relative to the device's fixed sensor coordinate system, and is independent of display orientation. For applications that rely on sensor data for input control or to manipulate elements on the screen, the developer must take current display orientation into account and compensate the data appropriately. For more info about the sensor coordinate system, see [Sensor data and display orientation](/previous-versions/windows/apps/dn440593(v=win.10)).
 * 
 * The following example demonstrates how a UWP app built with XAML and C# uses the [GetDefault](gyrometer_getdefault_846721868.md) method to establish a connection to a gyrometer. If no integrated gyrometer is found, the method will return a null value.
 * 
 * [!code-csharp[GetDefaultCS](../windows.devices.sensors/code/gyrometer/csharp/Scenario1.xaml.cs#SnippetGetDefaultCS)]
 * 
 * The following example demonstrates how a UWP app built with XAML registers a [ReadingChanged](gyrometer_readingchanged.md) event handler.
 * 
 * [!code-csharp[EnableReadingChangedCS](../windows.devices.sensors/code/gyrometer/csharp/Scenario1.xaml.cs#SnippetEnableReadingChangedCS)]
 * 
 * The following example shows the [ReadingChanged](gyrometer_readingchanged.md) event handler.
 * 
 * [!code-csharp[ReadingChangedCS](../windows.devices.sensors/code/gyrometer/csharp/Scenario1.xaml.cs#SnippetReadingChangedCS)]
 * @see https://learn.microsoft.com/uwp/api/windows.devices.sensors.gyrometer
 * @namespace Windows.Devices.Sensors
 * @version WindowsRuntime 1.4
 */
class Gyrometer extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IGyrometer

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IGyrometer.IID

;@endregion Static Properties

;@region Static Methods
    /**
     * Returns the default gyrometer.
     * @remarks
     * This method only returns values for a gyrometer that has been integrated into the computer by the manufacturer. A null value will be returned if the specified sensor is not available in the system.
     * 
     * When a system is in Connected Standby, a call to the GetDefault method will return immediately with a null result.
     * @returns {Gyrometer} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.sensors.gyrometer.getdefault
     */
    static GetDefault() {
        if (!Gyrometer.HasProp("__IGyrometerStatics")) {
            activatableClassId := HSTRING.Create("Windows.Devices.Sensors.Gyrometer")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IGyrometerStatics.IID)
            Gyrometer.__IGyrometerStatics := IGyrometerStatics(factoryPtr)
        }

        return Gyrometer.__IGyrometerStatics.GetDefault()
    }

    /**
     * Gets the device selector.
     * @returns {HSTRING} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.sensors.gyrometer.getdeviceselector
     */
    static GetDeviceSelector() {
        if (!Gyrometer.HasProp("__IGyrometerStatics2")) {
            activatableClassId := HSTRING.Create("Windows.Devices.Sensors.Gyrometer")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IGyrometerStatics2.IID)
            Gyrometer.__IGyrometerStatics2 := IGyrometerStatics2(factoryPtr)
        }

        return Gyrometer.__IGyrometerStatics2.GetDeviceSelector()
    }

    /**
     * Asynchronously obtains the sensor from its identifier.
     * @param {HSTRING} deviceId The [sensor identifier](/windows-hardware/drivers/install/device-instance-ids)
     * @returns {IAsyncOperation<Gyrometer>} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.sensors.gyrometer.fromidasync
     */
    static FromIdAsync(deviceId) {
        if (!Gyrometer.HasProp("__IGyrometerStatics2")) {
            activatableClassId := HSTRING.Create("Windows.Devices.Sensors.Gyrometer")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IGyrometerStatics2.IID)
            Gyrometer.__IGyrometerStatics2 := IGyrometerStatics2(factoryPtr)
        }

        return Gyrometer.__IGyrometerStatics2.FromIdAsync(deviceId)
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * Gets the minimum report interval supported by the gyrometer.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.sensors.gyrometer.minimumreportinterval
     * @type {Integer} 
     */
    MinimumReportInterval {
        get => this.get_MinimumReportInterval()
    }

    /**
     * Gets or sets the current report interval for the gyrometer.
     * @remarks
     * The report interval is set to a default value that varies based on the sensor driver’s implementation. If your app does not want to use this default value, you should set the report interval to a non-zero value prior to registering an event handler or calling [GetCurrentReading](gyrometer_getcurrentreading_1416488181.md). The sensor then attempts to allocate resources to satisfy the application’s requirements while balancing the needs of other apps using the sensor.
     * 
     * Changes to the report interval after an event handler has been registered, or [GetCurrentReading](gyrometer_getcurrentreading_1416488181.md) has been called, might apply to the delivery of subsequent sensor readings.
     * 
     * Conversely, when an application is finished with the sensor, it should explicitly return the sensor to its default report interval by setting it to zero. This is important for power conservation, especially when using a language that might keep the sensor object active for an indefinite period prior to garbage collection.
     * 
     * The application should consult the [MinimumReportInterval](gyrometer_minimumreportinterval.md) property prior to setting the report interval to ensure that the sensor can honor the requested report interval. Setting a value below the minimum supported interval either triggers an exception or has undefined results.
     * 
     * Although the application can set this value to request a particular report interval, the driver determines the actual report interval, based on internal logic. For example, the driver might use the shortest report interval that is requested by any caller.
     * 
     * If the value is set to zero, the driver uses its default report interval. As with requesting a specific interval, the driver might choose a different interval based on other client requests and internal logic.
     * 
     * The sensor platform automatically sets the change sensitivity for gyrometers based on the current report interval. This table specifies the change sensitivity values for given intervals.
     * 
     * | Current report interval | Change sensitivity (degrees per second) |
     * | --- | --- |
     * | 1 ms – 16 ms | 0.1 DPS |
     * | 17 ms – 32 ms | 0.5 DPS |
     * | >= 33 ms | 1.0 DPS |
     * @see https://learn.microsoft.com/uwp/api/windows.devices.sensors.gyrometer.reportinterval
     * @type {Integer} 
     */
    ReportInterval {
        get => this.get_ReportInterval()
        set => this.put_ReportInterval(value)
    }

    /**
     * Gets the device identifier.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.sensors.gyrometer.deviceid
     * @type {HSTRING} 
     */
    DeviceId {
        get => this.get_DeviceId()
    }

    /**
     * Gets or sets the transformation that needs to be applied to sensor data. Transformations to be applied are tied to the display orientation with which to align the sensor data.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.sensors.gyrometer.readingtransform
     * @type {Integer} 
     */
    ReadingTransform {
        get => this.get_ReadingTransform()
        set => this.put_ReadingTransform(value)
    }

    /**
     * Gets or sets the delay between batches of sensor information.
     * @remarks
     * This property is in reference to the frequency of [ReadingChanged](Gyrometer_readingchanged.md) events.
     * 
     * Not all sensors support [ReportLatency](Gyrometer_reportlatency.md). If the sensor does not support this property, it will function the same as if you set this value to 0. Setting this value to 0 will use the default latency for the sensor.
     * 
     * If you set [ReportLatency](Gyrometer_reportlatency.md) to a value higher than the maximum supported latency, the sensor will use the maximum supported latency. However, this property will not change in value. The maximum possible [ReportLatency](Gyrometer_reportlatency.md) equals the [MaxBatchSize](Gyrometer_maxbatchsize.md) times the [ReportInterval](Gyrometer_reportinterval.md).
     * 
     * Be aware that multiple applications could be dependent on a single sensor. Each of those applications can set a different value for [ReportLatency](Gyrometer_reportlatency.md). In this scenario, the sensor needs to try to accommodate the lowest value for [ReportLatency](Gyrometer_reportlatency.md). Because of this, the actual latency may not match the latency defined by this property in your application. This property corresponds to your ideal latency, which may not be the same latency on the sensor.
     * 
     * For more information about sensor batching, see [Sensors](/windows/uwp/devices-sensors/sensors).
     * @see https://learn.microsoft.com/uwp/api/windows.devices.sensors.gyrometer.reportlatency
     * @type {Integer} 
     */
    ReportLatency {
        get => this.get_ReportLatency()
        set => this.put_ReportLatency(value)
    }

    /**
     * Gets the maximum number of events that can be batched by the sensor.
     * @remarks
     * A sensor may not support batched data collection. In that case, this property will be 0. Otherwise, this determines the maximum number of events the sensor can gather before submitting them. This in turn will determine the maximum supported [ReportLatency](Gyrometer_reportlatency.md). The maximum latency equals the [ReportInterval](Gyrometer_reportinterval.md) times the [MaxBatchSize](Gyrometer_maxbatchsize.md). For more information about sensor batching, see [Sensors](/windows/uwp/devices-sensors/sensors).
     * @see https://learn.microsoft.com/uwp/api/windows.devices.sensors.gyrometer.maxbatchsize
     * @type {Integer} 
     */
    MaxBatchSize {
        get => this.get_MaxBatchSize()
    }

    /**
     * Gets the [GyrometerDataThreshold](gyrometerdatathreshold.md) for the gyrometer sensor.
     * @remarks
     * A report is generated only if the delta between the previous reported data reading and a new sample is greater than the [GyrometerDataThreshold](gyrometerdatathreshold.md).
     * @see https://learn.microsoft.com/uwp/api/windows.devices.sensors.gyrometer.reportthreshold
     * @type {GyrometerDataThreshold} 
     */
    ReportThreshold {
        get => this.get_ReportThreshold()
    }

    /**
     * Occurs each time the gyrometer reports the current sensor reading.
     * @remarks
     * An application may register this event handler to obtain sensor readings. The application must establish a desired [ReportInterval](gyrometer_reportinterval.md). This informs the sensor driver that resources should be allocated to satisfy the requirements of the application.
     * 
     * Applications can set the frequency of this event by setting the **ReportInterval** property.
     * @type {TypedEventHandler<Gyrometer, GyrometerReadingChangedEventArgs>}
    */
    OnReadingChanged {
        get {
            if(!this.HasProp("__OnReadingChanged")){
                this.__OnReadingChanged := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{15171524-5786-59a5-af5b-a01245726c44}"),
                    Gyrometer,
                    GyrometerReadingChangedEventArgs
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
     * Gets the current gyrometer reading.
     * @remarks
     * An application may use this method to poll the sensor for the current reading as an alternative to registering a [ReadingChanged](gyrometer_readingchanged.md) event handler. This would be the preferred alternative for an application that updates its user interface at a specific frame rate. Whether polling once or many times, the application must establish a desired [ReportInterval](gyrometer_reportinterval.md). This informs the sensor driver that resources should be allocated to satisfy subsequent polling requests
     * 
     * Before using the return value from this method, the application must first check that the value is not null. (If the value is null and you attempt to retrieve it, Windows will generate an exception.)
     * @returns {GyrometerReading} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.sensors.gyrometer.getcurrentreading
     */
    GetCurrentReading() {
        if (!this.HasProp("__IGyrometer")) {
            if ((queryResult := this.QueryInterface(IGyrometer.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGyrometer := IGyrometer(outPtr)
        }

        return this.__IGyrometer.GetCurrentReading()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_MinimumReportInterval() {
        if (!this.HasProp("__IGyrometer")) {
            if ((queryResult := this.QueryInterface(IGyrometer.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGyrometer := IGyrometer(outPtr)
        }

        return this.__IGyrometer.get_MinimumReportInterval()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_ReportInterval(value) {
        if (!this.HasProp("__IGyrometer")) {
            if ((queryResult := this.QueryInterface(IGyrometer.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGyrometer := IGyrometer(outPtr)
        }

        return this.__IGyrometer.put_ReportInterval(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_ReportInterval() {
        if (!this.HasProp("__IGyrometer")) {
            if ((queryResult := this.QueryInterface(IGyrometer.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGyrometer := IGyrometer(outPtr)
        }

        return this.__IGyrometer.get_ReportInterval()
    }

    /**
     * 
     * @param {TypedEventHandler<Gyrometer, GyrometerReadingChangedEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_ReadingChanged(handler) {
        if (!this.HasProp("__IGyrometer")) {
            if ((queryResult := this.QueryInterface(IGyrometer.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGyrometer := IGyrometer(outPtr)
        }

        return this.__IGyrometer.add_ReadingChanged(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_ReadingChanged(token) {
        if (!this.HasProp("__IGyrometer")) {
            if ((queryResult := this.QueryInterface(IGyrometer.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGyrometer := IGyrometer(outPtr)
        }

        return this.__IGyrometer.remove_ReadingChanged(token)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_DeviceId() {
        if (!this.HasProp("__IGyrometerDeviceId")) {
            if ((queryResult := this.QueryInterface(IGyrometerDeviceId.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGyrometerDeviceId := IGyrometerDeviceId(outPtr)
        }

        return this.__IGyrometerDeviceId.get_DeviceId()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_ReadingTransform(value) {
        if (!this.HasProp("__IGyrometer2")) {
            if ((queryResult := this.QueryInterface(IGyrometer2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGyrometer2 := IGyrometer2(outPtr)
        }

        return this.__IGyrometer2.put_ReadingTransform(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_ReadingTransform() {
        if (!this.HasProp("__IGyrometer2")) {
            if ((queryResult := this.QueryInterface(IGyrometer2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGyrometer2 := IGyrometer2(outPtr)
        }

        return this.__IGyrometer2.get_ReadingTransform()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_ReportLatency(value) {
        if (!this.HasProp("__IGyrometer3")) {
            if ((queryResult := this.QueryInterface(IGyrometer3.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGyrometer3 := IGyrometer3(outPtr)
        }

        return this.__IGyrometer3.put_ReportLatency(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_ReportLatency() {
        if (!this.HasProp("__IGyrometer3")) {
            if ((queryResult := this.QueryInterface(IGyrometer3.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGyrometer3 := IGyrometer3(outPtr)
        }

        return this.__IGyrometer3.get_ReportLatency()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_MaxBatchSize() {
        if (!this.HasProp("__IGyrometer3")) {
            if ((queryResult := this.QueryInterface(IGyrometer3.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGyrometer3 := IGyrometer3(outPtr)
        }

        return this.__IGyrometer3.get_MaxBatchSize()
    }

    /**
     * 
     * @returns {GyrometerDataThreshold} 
     */
    get_ReportThreshold() {
        if (!this.HasProp("__IGyrometer4")) {
            if ((queryResult := this.QueryInterface(IGyrometer4.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGyrometer4 := IGyrometer4(outPtr)
        }

        return this.__IGyrometer4.get_ReportThreshold()
    }

;@endregion Instance Methods
}
