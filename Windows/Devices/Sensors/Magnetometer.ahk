#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IMagnetometer.ahk
#Include .\IMagnetometerDeviceId.ahk
#Include .\IMagnetometer2.ahk
#Include .\IMagnetometer3.ahk
#Include .\IMagnetometer4.ahk
#Include .\IMagnetometerStatics2.ahk
#Include .\IMagnetometerStatics.ahk
#Include ..\..\Foundation\TypedEventHandler.ahk
#Include .\Magnetometer.ahk
#Include .\MagnetometerReadingChangedEventArgs.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\..\WinRTEventHandler.ahk

/**
 * Represents a magnetic sensor.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.devices.sensors.magnetometer
 * @namespace Windows.Devices.Sensors
 * @version WindowsRuntime 1.4
 */
class Magnetometer extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IMagnetometer

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IMagnetometer.IID

;@endregion Static Properties

;@region Static Methods
    /**
     * Gets the device selector.
     * @returns {HSTRING} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.sensors.magnetometer.getdeviceselector
     */
    static GetDeviceSelector() {
        if (!Magnetometer.HasProp("__IMagnetometerStatics2")) {
            activatableClassId := HSTRING.Create("Windows.Devices.Sensors.Magnetometer")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IMagnetometerStatics2.IID)
            Magnetometer.__IMagnetometerStatics2 := IMagnetometerStatics2(factoryPtr)
        }

        return Magnetometer.__IMagnetometerStatics2.GetDeviceSelector()
    }

    /**
     * Asynchronously obtains the sensor from its identifier.
     * @param {HSTRING} deviceId The [sensor identifier](/windows-hardware/drivers/install/device-instance-ids)
     * @returns {IAsyncOperation<Magnetometer>} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.sensors.magnetometer.fromidasync
     */
    static FromIdAsync(deviceId) {
        if (!Magnetometer.HasProp("__IMagnetometerStatics2")) {
            activatableClassId := HSTRING.Create("Windows.Devices.Sensors.Magnetometer")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IMagnetometerStatics2.IID)
            Magnetometer.__IMagnetometerStatics2 := IMagnetometerStatics2(factoryPtr)
        }

        return Magnetometer.__IMagnetometerStatics2.FromIdAsync(deviceId)
    }

    /**
     * Returns the default magnetometer.
     * @returns {Magnetometer} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.sensors.magnetometer.getdefault
     */
    static GetDefault() {
        if (!Magnetometer.HasProp("__IMagnetometerStatics")) {
            activatableClassId := HSTRING.Create("Windows.Devices.Sensors.Magnetometer")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IMagnetometerStatics.IID)
            Magnetometer.__IMagnetometerStatics := IMagnetometerStatics(factoryPtr)
        }

        return Magnetometer.__IMagnetometerStatics.GetDefault()
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * Gets the minimum report interval supported by the magnetometer.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.sensors.magnetometer.minimumreportinterval
     * @type {Integer} 
     */
    MinimumReportInterval {
        get => this.get_MinimumReportInterval()
    }

    /**
     * Gets or sets the current report interval for the magnetometer.
     * @remarks
     * The report interval is set to a default value that varies based on the sensor driver’s implementation. If your app does not want to use this default value, you should set the report interval to a non-zero value prior to registering an event handler or calling [GetCurrentReading](magnetometer_getcurrentreading_1416488181.md). The sensor then attempts to allocate resources to satisfy the application’s requirements while balancing the needs of other apps using the sensor.
     * 
     * Changes to the report interval after an event handler has been registered, or [GetCurrentReading](magnetometer_getcurrentreading_1416488181.md) has been called, might apply to the delivery of subsequent sensor readings.
     * 
     * Conversely, when an application is finished with the sensor, it should explicitly return the sensor to its default report interval by setting it to zero. This is important for power conservation, especially when using a language that might keep the sensor object active for an indefinite period prior to garbage collection.
     * 
     * The application should consult the [MinimumReportInterval](magnetometer_minimumreportinterval.md) property prior to setting the report interval to ensure that the sensor can honor the requested report interval. Setting a value below the minimum supported interval either triggers an exception or has undefined results.
     * 
     * Although the application can set this value to request a particular report interval, the driver determines the actual report interval, based on internal logic. For example, the driver might use the shortest report interval that is requested by any caller.
     * 
     * If the value is set to zero, the driver uses its default report interval. As with requesting a specific interval, the driver might choose a different interval based on other client requests and internal logic.
     * 
     * The sensor platform automatically sets the change sensitivity for magnetometers based on the current report interval. This table specifies the change sensitivity values for given intervals.
     * 
     * | Current report interval | Change sensitivity |
     * | --- | --- |
     * | 1 ms – 16 ms | 0.01 degrees |
     * | 17 ms – 32 ms | 0.5 degrees |
     * | >= 33 ms | 2 degrees |
     * @see https://learn.microsoft.com/uwp/api/windows.devices.sensors.magnetometer.reportinterval
     * @type {Integer} 
     */
    ReportInterval {
        get => this.get_ReportInterval()
        set => this.put_ReportInterval(value)
    }

    /**
     * Gets the device identifier.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.sensors.magnetometer.deviceid
     * @type {HSTRING} 
     */
    DeviceId {
        get => this.get_DeviceId()
    }

    /**
     * Gets or sets the transformation that needs to be applied to sensor data. Transformations to be applied are tied to the display orientation with which to align the sensor data.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.sensors.magnetometer.readingtransform
     * @type {Integer} 
     */
    ReadingTransform {
        get => this.get_ReadingTransform()
        set => this.put_ReadingTransform(value)
    }

    /**
     * Gets or sets the delay between batches of sensor information.
     * @remarks
     * This property is in reference to the frequency of [ReadingChanged](Magnetometer_readingchanged.md) events.
     * 
     * Not all sensors support [ReportLatency](Magnetometer_reportlatency.md). If the sensor does not support this property, it will function the same as if you set this value to 0. Setting this value to 0 will use the default latency for the sensor.
     * 
     * If you set [ReportLatency](Magnetometer_reportlatency.md) to a value higher than the maximum supported latency, the sensor will use the maximum supported latency. However, this property will not change in value. The maximum possible [ReportLatency](Magnetometer_reportlatency.md) equals the [MaxBatchSize](Magnetometer_maxbatchsize.md) times the [ReportInterval](Magnetometer_reportinterval.md).
     * 
     * Be aware that multiple applications could be dependent on a single sensor. Each of those applications can set a different value for [ReportLatency](Magnetometer_reportlatency.md). In this scenario, the sensor needs to try to accommodate the lowest value for [ReportLatency](Magnetometer_reportlatency.md). Because of this, the actual latency may not match the latency defined by this property in your application. This property corresponds to your ideal latency, which may not be the same latency on the sensor.
     * 
     * For more information about sensor batching, see [Sensors](/windows/uwp/devices-sensors/sensors).
     * @see https://learn.microsoft.com/uwp/api/windows.devices.sensors.magnetometer.reportlatency
     * @type {Integer} 
     */
    ReportLatency {
        get => this.get_ReportLatency()
        set => this.put_ReportLatency(value)
    }

    /**
     * Gets the maximum number of events that can be batched by the sensor.
     * @remarks
     * A sensor may not support batched data collection. In that case, this property will be 0. Otherwise, this determines the maximum number of events the sensor can gather before submitting them. This in turn will determine the maximum supported [ReportLatency](Magnetometer_reportlatency.md). The maximum latency equals the [ReportInterval](Magnetometer_reportinterval.md) times the [MaxBatchSize](Magnetometer_maxbatchsize.md). For more information about sensor batching, see [Sensors](/windows/uwp/devices-sensors/sensors).
     * @see https://learn.microsoft.com/uwp/api/windows.devices.sensors.magnetometer.maxbatchsize
     * @type {Integer} 
     */
    MaxBatchSize {
        get => this.get_MaxBatchSize()
    }

    /**
     * Gets the [MagnetometerDataThreshold](magnetometerdatathreshold.md) for the magnetometer sensor.
     * @remarks
     * A report is generated only if the delta between the previous reported data reading and a new sample is greater than the [MagnetometerDataThreshold](magnetometerdatathreshold.md).
     * @see https://learn.microsoft.com/uwp/api/windows.devices.sensors.magnetometer.reportthreshold
     * @type {MagnetometerDataThreshold} 
     */
    ReportThreshold {
        get => this.get_ReportThreshold()
    }

    /**
     * Occurs each time the compass reports a new sensor reading.
     * @remarks
     * An application may register this event handler to obtain sensor readings. The application must establish a desired [ReportInterval](magnetometer_reportinterval.md). This informs the sensor driver that resources should be allocated to satisfy the requirements of the application.
     * 
     * Applications can set the frequency of this event by setting the **ReportInterval** property.
     * @type {TypedEventHandler<Magnetometer, MagnetometerReadingChangedEventArgs>}
    */
    OnReadingChanged {
        get {
            if(!this.HasProp("__OnReadingChanged")){
                this.__OnReadingChanged := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{f9a0da76-c4fd-50ab-98b6-bfd26d6d3d82}"),
                    Magnetometer,
                    MagnetometerReadingChangedEventArgs
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
     * Gets the current magnetometer reading.
     * @returns {MagnetometerReading} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.sensors.magnetometer.getcurrentreading
     */
    GetCurrentReading() {
        if (!this.HasProp("__IMagnetometer")) {
            if ((queryResult := this.QueryInterface(IMagnetometer.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMagnetometer := IMagnetometer(outPtr)
        }

        return this.__IMagnetometer.GetCurrentReading()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_MinimumReportInterval() {
        if (!this.HasProp("__IMagnetometer")) {
            if ((queryResult := this.QueryInterface(IMagnetometer.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMagnetometer := IMagnetometer(outPtr)
        }

        return this.__IMagnetometer.get_MinimumReportInterval()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_ReportInterval(value) {
        if (!this.HasProp("__IMagnetometer")) {
            if ((queryResult := this.QueryInterface(IMagnetometer.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMagnetometer := IMagnetometer(outPtr)
        }

        return this.__IMagnetometer.put_ReportInterval(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_ReportInterval() {
        if (!this.HasProp("__IMagnetometer")) {
            if ((queryResult := this.QueryInterface(IMagnetometer.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMagnetometer := IMagnetometer(outPtr)
        }

        return this.__IMagnetometer.get_ReportInterval()
    }

    /**
     * 
     * @param {TypedEventHandler<Magnetometer, MagnetometerReadingChangedEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_ReadingChanged(handler) {
        if (!this.HasProp("__IMagnetometer")) {
            if ((queryResult := this.QueryInterface(IMagnetometer.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMagnetometer := IMagnetometer(outPtr)
        }

        return this.__IMagnetometer.add_ReadingChanged(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_ReadingChanged(token) {
        if (!this.HasProp("__IMagnetometer")) {
            if ((queryResult := this.QueryInterface(IMagnetometer.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMagnetometer := IMagnetometer(outPtr)
        }

        return this.__IMagnetometer.remove_ReadingChanged(token)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_DeviceId() {
        if (!this.HasProp("__IMagnetometerDeviceId")) {
            if ((queryResult := this.QueryInterface(IMagnetometerDeviceId.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMagnetometerDeviceId := IMagnetometerDeviceId(outPtr)
        }

        return this.__IMagnetometerDeviceId.get_DeviceId()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_ReadingTransform(value) {
        if (!this.HasProp("__IMagnetometer2")) {
            if ((queryResult := this.QueryInterface(IMagnetometer2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMagnetometer2 := IMagnetometer2(outPtr)
        }

        return this.__IMagnetometer2.put_ReadingTransform(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_ReadingTransform() {
        if (!this.HasProp("__IMagnetometer2")) {
            if ((queryResult := this.QueryInterface(IMagnetometer2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMagnetometer2 := IMagnetometer2(outPtr)
        }

        return this.__IMagnetometer2.get_ReadingTransform()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_ReportLatency(value) {
        if (!this.HasProp("__IMagnetometer3")) {
            if ((queryResult := this.QueryInterface(IMagnetometer3.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMagnetometer3 := IMagnetometer3(outPtr)
        }

        return this.__IMagnetometer3.put_ReportLatency(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_ReportLatency() {
        if (!this.HasProp("__IMagnetometer3")) {
            if ((queryResult := this.QueryInterface(IMagnetometer3.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMagnetometer3 := IMagnetometer3(outPtr)
        }

        return this.__IMagnetometer3.get_ReportLatency()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_MaxBatchSize() {
        if (!this.HasProp("__IMagnetometer3")) {
            if ((queryResult := this.QueryInterface(IMagnetometer3.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMagnetometer3 := IMagnetometer3(outPtr)
        }

        return this.__IMagnetometer3.get_MaxBatchSize()
    }

    /**
     * 
     * @returns {MagnetometerDataThreshold} 
     */
    get_ReportThreshold() {
        if (!this.HasProp("__IMagnetometer4")) {
            if ((queryResult := this.QueryInterface(IMagnetometer4.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMagnetometer4 := IMagnetometer4(outPtr)
        }

        return this.__IMagnetometer4.get_ReportThreshold()
    }

;@endregion Instance Methods
}
