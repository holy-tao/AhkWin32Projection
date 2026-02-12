#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\ICompass.ahk
#Include .\ICompassDeviceId.ahk
#Include .\ICompass2.ahk
#Include .\ICompass3.ahk
#Include .\ICompass4.ahk
#Include .\ICompassStatics.ahk
#Include .\ICompassStatics2.ahk
#Include ..\..\Foundation\TypedEventHandler.ahk
#Include .\Compass.ahk
#Include .\CompassReadingChangedEventArgs.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\..\WinRTEventHandler.ahk

/**
 * Represents a compass sensor.
  * 
  * This sensor returns a heading with respect to Magnetic North and, possibly, True North. (The latter is dependent on the system capabilities.)
  * 
  * For an example implementation, see the [compass sample](https://github.com/Microsoft/Windows-universal-samples/tree/master/Samples/Compass).
 * @remarks
 * Sensor data is provided relative to the device's fixed sensor coordinate system, and is independent of display orientation. For applications that rely on sensor data for input control or to manipulate elements on the screen, the developer must take current display orientation into account and compensate the data appropriately. For more info about the sensor coordinate system, see [Sensor data and display orientation](/previous-versions/windows/apps/dn440593(v=win.10)).
 * 
 * The following example demonstrates how a UWP app built with XAML and C# uses the [GetDefault](compass_getdefault_846721868.md) method to establish a connection to a compass. If no integrated compass is found, the method will return a null value.
 * 
 * [!code-csharp[GetDefaultCS](../windows.devices.sensors/code/compass/csharp/Scenario1.xaml.cs#SnippetGetDefaultCS)]
 * 
 * The following example demonstrates how a UWP app built with XAML registers a [ReadingChanged](compass_readingchanged.md) event handler.
 * 
 * [!code-csharp[EnableReadingChangedCS](../windows.devices.sensors/code/compass/csharp/Scenario1.xaml.cs#SnippetEnableReadingChangedCS)]
 * 
 * The following example shows the [ReadingChanged](compass_readingchanged.md) event handler.
 * 
 * [!code-csharp[ReadingChangedCS](../windows.devices.sensors/code/compass/csharp/Scenario1.xaml.cs#SnippetReadingChangedCS)]
 * @see https://learn.microsoft.com/uwp/api/windows.devices.sensors.compass
 * @namespace Windows.Devices.Sensors
 * @version WindowsRuntime 1.4
 */
class Compass extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => ICompass

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => ICompass.IID

;@endregion Static Properties

;@region Static Methods
    /**
     * Returns the default compass.
     * @remarks
     * This method only returns values for a compass that has been integrated into the computer by the manufacturer. A null value will be returned if the specified sensor is not available in the system.
     * 
     * When a system is in Connected Standby, a call to the GetDefault method will return immediately with a null result.
     * @returns {Compass} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.sensors.compass.getdefault
     */
    static GetDefault() {
        if (!Compass.HasProp("__ICompassStatics")) {
            activatableClassId := HSTRING.Create("Windows.Devices.Sensors.Compass")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ICompassStatics.IID)
            Compass.__ICompassStatics := ICompassStatics(factoryPtr)
        }

        return Compass.__ICompassStatics.GetDefault()
    }

    /**
     * Gets the device selector.
     * @returns {HSTRING} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.sensors.compass.getdeviceselector
     */
    static GetDeviceSelector() {
        if (!Compass.HasProp("__ICompassStatics2")) {
            activatableClassId := HSTRING.Create("Windows.Devices.Sensors.Compass")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ICompassStatics2.IID)
            Compass.__ICompassStatics2 := ICompassStatics2(factoryPtr)
        }

        return Compass.__ICompassStatics2.GetDeviceSelector()
    }

    /**
     * Asynchronously obtains the sensor from its identifier.
     * @param {HSTRING} deviceId The [sensor identifier](/windows-hardware/drivers/install/device-instance-ids)
     * @returns {IAsyncOperation<Compass>} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.sensors.compass.fromidasync
     */
    static FromIdAsync(deviceId) {
        if (!Compass.HasProp("__ICompassStatics2")) {
            activatableClassId := HSTRING.Create("Windows.Devices.Sensors.Compass")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ICompassStatics2.IID)
            Compass.__ICompassStatics2 := ICompassStatics2(factoryPtr)
        }

        return Compass.__ICompassStatics2.FromIdAsync(deviceId)
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * Gets the minimum report interval supported by the compass.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.sensors.compass.minimumreportinterval
     * @type {Integer} 
     */
    MinimumReportInterval {
        get => this.get_MinimumReportInterval()
    }

    /**
     * Gets or sets the current report interval for the compass.
     * @remarks
     * The report interval is set to a default value that varies based on the sensor driver’s implementation. If your app does not want to use this default value, you should set the report interval to a non-zero value prior to registering an event handler or calling [GetCurrentReading](compass_getcurrentreading_1416488181.md). The sensor then attempts to allocate resources to satisfy the application’s requirements while balancing the needs of other apps using the sensor.
     * 
     * Changes to the report interval after an event handler has been registered, or [GetCurrentReading](compass_getcurrentreading_1416488181.md) has been called, might apply to the delivery of subsequent sensor readings.
     * 
     * Conversely, when an application is finished with the sensor, it should explicitly return the sensor to its default report interval by setting it to zero. This is important for power conservation, especially when using a language that might keep the sensor object active for an indefinite period prior to garbage collection.
     * 
     * The application should consult the [MinimumReportInterval](compass_minimumreportinterval.md) property prior to setting the report interval to ensure that the sensor can honor the requested report interval. Setting a value below the minimum supported interval either triggers an exception or has undefined results.
     * 
     * Although the application can set this value to request a particular report interval, the driver determines the actual report interval, based on internal logic. For example, the driver might use the shortest report interval that is requested by any caller.
     * 
     * If the value is set to zero, the driver uses its default report interval. As with requesting a specific interval, the driver might choose a different interval based on other client requests and internal logic.
     * 
     * The sensor platform automatically sets the change sensitivity for compasses based on the current report interval. This table specifies the change sensitivity values for given intervals.
     * 
     * | Current report interval | Change sensitivity |
     * | --- | --- |
     * | 1 ms – 16 ms | 0.01 degreees |
     * | 17 ms – 32 ms | 0.5 degrees |
     * | >= 33 ms | 2 degrees |
     * @see https://learn.microsoft.com/uwp/api/windows.devices.sensors.compass.reportinterval
     * @type {Integer} 
     */
    ReportInterval {
        get => this.get_ReportInterval()
        set => this.put_ReportInterval(value)
    }

    /**
     * Gets the device identifier.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.sensors.compass.deviceid
     * @type {HSTRING} 
     */
    DeviceId {
        get => this.get_DeviceId()
    }

    /**
     * Gets or sets the transformation that needs to be applied to sensor data. Transformations to be applied are tied to the display orientation with which to align the sensor data.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.sensors.compass.readingtransform
     * @type {Integer} 
     */
    ReadingTransform {
        get => this.get_ReadingTransform()
        set => this.put_ReadingTransform(value)
    }

    /**
     * Gets or sets the delay between batches of sensor information.
     * @remarks
     * This property is in reference to the frequency of [ReadingChanged](Compass_readingchanged.md) events.
     * 
     * Not all sensors support [ReportLatency](Compass_reportlatency.md). If the sensor does not support this property, it will function the same as if you set this value to 0. Setting this value to 0 will use the default latency for the sensor.
     * 
     * If you set [ReportLatency](Compass_reportlatency.md) to a value higher than the maximum supported latency, the sensor will use the maximum supported latency. However, this property will not change in value. The maximum possible [ReportLatency](Compass_reportlatency.md) equals the [MaxBatchSize](Compass_maxbatchsize.md) times the [ReportInterval](Compass_reportinterval.md).
     * 
     * Be aware that multiple applications could be dependent on a single sensor. Each of those applications can set a different value for [ReportLatency](Compass_reportlatency.md). In this scenario, the sensor needs to try to accommodate the lowest value for [ReportLatency](Compass_reportlatency.md). Because of this, the actual latency may not match the latency defined by this property in your application. This property corresponds to your ideal latency, which may not be the same latency on the sensor.
     * 
     * For more information about sensor batching, see [Sensors](/windows/uwp/devices-sensors/sensors).
     * @see https://learn.microsoft.com/uwp/api/windows.devices.sensors.compass.reportlatency
     * @type {Integer} 
     */
    ReportLatency {
        get => this.get_ReportLatency()
        set => this.put_ReportLatency(value)
    }

    /**
     * Gets the maximum number of events that can be batched by the sensor.
     * @remarks
     * A sensor may not support batched data collection. In that case, this property will be 0. Otherwise, this determines the maximum number of events the sensor can gather before submitting them. This in turn will determine the maximum supported [ReportLatency](Compass_reportlatency.md). The maximum latency equals the [ReportInterval](Compass_reportinterval.md) times the [MaxBatchSize](Compass_maxbatchsize.md). For more information about sensor batching, see [Sensors](/windows/uwp/devices-sensors/sensors).
     * @see https://learn.microsoft.com/uwp/api/windows.devices.sensors.compass.maxbatchsize
     * @type {Integer} 
     */
    MaxBatchSize {
        get => this.get_MaxBatchSize()
    }

    /**
     * Gets the [CompassDataThreshold](compassdatathreshold.md) for the compass sensor.
     * @remarks
     * A report is generated only if the delta between the previous reported data reading and a new sample is greater than the [CompassDataThreshold](compassdatathreshold.md).
     * @see https://learn.microsoft.com/uwp/api/windows.devices.sensors.compass.reportthreshold
     * @type {CompassDataThreshold} 
     */
    ReportThreshold {
        get => this.get_ReportThreshold()
    }

    /**
     * Occurs each time the compass reports a new sensor reading.
     * @remarks
     * An application may register this event handler to obtain sensor readings. The application must establish a desired [ReportInterval](compass_reportinterval.md). This informs the sensor driver that resources should be allocated to satisfy the requirements of the application.
     * 
     * Applications can set the frequency of this event by setting the **ReportInterval** property.
     * @type {TypedEventHandler<Compass, CompassReadingChangedEventArgs>}
    */
    OnReadingChanged {
        get {
            if(!this.HasProp("__OnReadingChanged")){
                this.__OnReadingChanged := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{e787d73d-a121-5ae6-b497-ab934837e57f}"),
                    Compass,
                    CompassReadingChangedEventArgs
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
     * Gets the current compass reading.
     * @remarks
     * An application may use this method to poll the sensor for the current reading as an alternative to registering a [ReadingChanged](compass_readingchanged.md) event handler. This would be the preferred alternative for an application that updates its user interface at a specific frame rate. Whether polling once or many times, the application must establish a desired [ReportInterval](compass_reportinterval.md). This informs the sensor driver that resources should be allocated to satisfy subsequent polling requests
     * 
     * The returned value is a magnetic heading specified in degrees.
     * 
     * The accuracy of this value is dependent on the capabilities of the compass.
     * 
     * Before using the return value from this method, the application must first check that the value is not null. (If the value is null and you attempt to retrieve it, Windows will generate an exception.)
     * @returns {CompassReading} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.sensors.compass.getcurrentreading
     */
    GetCurrentReading() {
        if (!this.HasProp("__ICompass")) {
            if ((queryResult := this.QueryInterface(ICompass.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICompass := ICompass(outPtr)
        }

        return this.__ICompass.GetCurrentReading()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_MinimumReportInterval() {
        if (!this.HasProp("__ICompass")) {
            if ((queryResult := this.QueryInterface(ICompass.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICompass := ICompass(outPtr)
        }

        return this.__ICompass.get_MinimumReportInterval()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_ReportInterval(value) {
        if (!this.HasProp("__ICompass")) {
            if ((queryResult := this.QueryInterface(ICompass.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICompass := ICompass(outPtr)
        }

        return this.__ICompass.put_ReportInterval(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_ReportInterval() {
        if (!this.HasProp("__ICompass")) {
            if ((queryResult := this.QueryInterface(ICompass.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICompass := ICompass(outPtr)
        }

        return this.__ICompass.get_ReportInterval()
    }

    /**
     * 
     * @param {TypedEventHandler<Compass, CompassReadingChangedEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_ReadingChanged(handler) {
        if (!this.HasProp("__ICompass")) {
            if ((queryResult := this.QueryInterface(ICompass.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICompass := ICompass(outPtr)
        }

        return this.__ICompass.add_ReadingChanged(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_ReadingChanged(token) {
        if (!this.HasProp("__ICompass")) {
            if ((queryResult := this.QueryInterface(ICompass.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICompass := ICompass(outPtr)
        }

        return this.__ICompass.remove_ReadingChanged(token)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_DeviceId() {
        if (!this.HasProp("__ICompassDeviceId")) {
            if ((queryResult := this.QueryInterface(ICompassDeviceId.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICompassDeviceId := ICompassDeviceId(outPtr)
        }

        return this.__ICompassDeviceId.get_DeviceId()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_ReadingTransform(value) {
        if (!this.HasProp("__ICompass2")) {
            if ((queryResult := this.QueryInterface(ICompass2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICompass2 := ICompass2(outPtr)
        }

        return this.__ICompass2.put_ReadingTransform(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_ReadingTransform() {
        if (!this.HasProp("__ICompass2")) {
            if ((queryResult := this.QueryInterface(ICompass2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICompass2 := ICompass2(outPtr)
        }

        return this.__ICompass2.get_ReadingTransform()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_ReportLatency(value) {
        if (!this.HasProp("__ICompass3")) {
            if ((queryResult := this.QueryInterface(ICompass3.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICompass3 := ICompass3(outPtr)
        }

        return this.__ICompass3.put_ReportLatency(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_ReportLatency() {
        if (!this.HasProp("__ICompass3")) {
            if ((queryResult := this.QueryInterface(ICompass3.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICompass3 := ICompass3(outPtr)
        }

        return this.__ICompass3.get_ReportLatency()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_MaxBatchSize() {
        if (!this.HasProp("__ICompass3")) {
            if ((queryResult := this.QueryInterface(ICompass3.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICompass3 := ICompass3(outPtr)
        }

        return this.__ICompass3.get_MaxBatchSize()
    }

    /**
     * 
     * @returns {CompassDataThreshold} 
     */
    get_ReportThreshold() {
        if (!this.HasProp("__ICompass4")) {
            if ((queryResult := this.QueryInterface(ICompass4.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICompass4 := ICompass4(outPtr)
        }

        return this.__ICompass4.get_ReportThreshold()
    }

;@endregion Instance Methods
}
