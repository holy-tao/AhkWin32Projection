#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IAccelerometer.ahk
#Include .\IAccelerometerDeviceId.ahk
#Include .\IAccelerometer2.ahk
#Include .\IAccelerometer3.ahk
#Include .\IAccelerometer4.ahk
#Include .\IAccelerometer5.ahk
#Include .\IAccelerometerStatics3.ahk
#Include .\IAccelerometerStatics.ahk
#Include .\IAccelerometerStatics2.ahk
#Include ..\..\Foundation\TypedEventHandler.ahk
#Include .\Accelerometer.ahk
#Include .\AccelerometerReadingChangedEventArgs.ahk
#Include .\AccelerometerShakenEventArgs.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\..\WinRTEventHandler.ahk

/**
 * Represents an accelerometer sensor.
  * 
  * This sensor returns G-force values with respect to the x, y, and z axes.
  * 
  * For an example implementation, see the [accelerometer sample](https://github.com/Microsoft/Windows-universal-samples/tree/master/Samples/Accelerometer).
 * @remarks
 * Applications use the methods in this class to determine whether the sensor reading has changed or the device has been shaken.
 * 
 * Applications use the properties in this class to retrieve and adjust the sensor report interval.
 * 
 * Sensor data is provided relative to the device's fixed sensor coordinate system, and is independent of display orientation. For applications that rely on sensor data for input control or to manipulate elements on the screen, the developer must take current display orientation into account and compensate the data appropriately. For more info about the sensor coordinate system, see [Sensor data and display orientation](/previous-versions/windows/apps/dn440593(v=win.10)).
 * 
 * The following example demonstrates how a UWP app built with XAML and C# uses the [GetDefault](accelerometer_getdefault_702418228.md) method to establish a connection to an accelerometer. If no integrated accelerometer is found, the method will return a null value.
 * 
 * [!code-csharp[GetDefaultCS](../windows.devices.sensors/code/Accelerometer/cs/Scenario1.xaml.cs#SnippetGetDefaultCS)]
 * 
 * The following example demonstrates how a UWP app built with XAML registers a **ReadingChanged** event handler.
 * 
 * [!code-csharp[EnableReadingChangedCS](../windows.devices.sensors/code/Accelerometer/cs/Scenario1.xaml.cs#SnippetEnableReadingChangedCS)]
 * 
 * The following example shows the [ReadingChanged](accelerometer_readingchanged.md) event handler.
 * 
 * [!code-csharp[ReadingChangedCS](../windows.devices.sensors/code/Accelerometer/cs/Scenario1.xaml.cs#SnippetReadingChangedCS)]
 * @see https://learn.microsoft.com/uwp/api/windows.devices.sensors.accelerometer
 * @namespace Windows.Devices.Sensors
 * @version WindowsRuntime 1.4
 */
class Accelerometer extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IAccelerometer

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IAccelerometer.IID

;@endregion Static Properties

;@region Static Methods
    /**
     * Asynchronously obtains the sensor from its identifier.
     * @param {HSTRING} deviceId The [sensor identifier](/windows-hardware/drivers/install/device-instance-ids)
     * @returns {IAsyncOperation<Accelerometer>} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.sensors.accelerometer.fromidasync
     */
    static FromIdAsync(deviceId) {
        if (!Accelerometer.HasProp("__IAccelerometerStatics3")) {
            activatableClassId := HSTRING.Create("Windows.Devices.Sensors.Accelerometer")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IAccelerometerStatics3.IID)
            Accelerometer.__IAccelerometerStatics3 := IAccelerometerStatics3(factoryPtr)
        }

        return Accelerometer.__IAccelerometerStatics3.FromIdAsync(deviceId)
    }

    /**
     * Gets the device selector.
     * @param {Integer} readingType The type of sensor to retrieve.
     * @returns {HSTRING} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.sensors.accelerometer.getdeviceselector
     */
    static GetDeviceSelector(readingType) {
        if (!Accelerometer.HasProp("__IAccelerometerStatics3")) {
            activatableClassId := HSTRING.Create("Windows.Devices.Sensors.Accelerometer")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IAccelerometerStatics3.IID)
            Accelerometer.__IAccelerometerStatics3 := IAccelerometerStatics3(factoryPtr)
        }

        return Accelerometer.__IAccelerometerStatics3.GetDeviceSelector(readingType)
    }

    /**
     * Returns the default accelerometer of a specific type of sensor. The possible accelerometer sensors are defined by [AccelerometerReadingType](accelerometerreadingtype.md).
     * @returns {Accelerometer} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.sensors.accelerometer.getdefault
     */
    static GetDefault() {
        if (!Accelerometer.HasProp("__IAccelerometerStatics")) {
            activatableClassId := HSTRING.Create("Windows.Devices.Sensors.Accelerometer")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IAccelerometerStatics.IID)
            Accelerometer.__IAccelerometerStatics := IAccelerometerStatics(factoryPtr)
        }

        return Accelerometer.__IAccelerometerStatics.GetDefault()
    }

    /**
     * Returns the default accelerometer.
     * @remarks
     * This method only returns values for an accelerometer that has been integrated into the computer by the manufacturer. A null value will be returned if the specified sensor is not available in the system.
     * 
     * When a system is in Connected Standby, a call to the [GetDefault](accelerometer_getdefault_702418228.md) method will return immediately with a null result.
     * @param {Integer} readingType 
     * @returns {Accelerometer} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.sensors.accelerometer.getdefault
     */
    static GetDefaultWithAccelerometerReadingType(readingType) {
        if (!Accelerometer.HasProp("__IAccelerometerStatics2")) {
            activatableClassId := HSTRING.Create("Windows.Devices.Sensors.Accelerometer")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IAccelerometerStatics2.IID)
            Accelerometer.__IAccelerometerStatics2 := IAccelerometerStatics2(factoryPtr)
        }

        return Accelerometer.__IAccelerometerStatics2.GetDefaultWithAccelerometerReadingType(readingType)
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * Gets the minimum report interval supported by the accelerometer.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.sensors.accelerometer.minimumreportinterval
     * @type {Integer} 
     */
    MinimumReportInterval {
        get => this.get_MinimumReportInterval()
    }

    /**
     * Gets or sets the current report interval for the accelerometer.
     * @remarks
     * The report interval is set to a default value that varies based on the sensor driver’s implementation. If your app does not want to use this default value, you should set the report interval to a non-zero value prior to registering an event handler or calling [GetCurrentReading](accelerometer_getcurrentreading_1416488181.md). The sensor then attempts to allocate resources to satisfy the application’s requirements while balancing the needs of other apps using the sensor.
     * 
     * Changes to the report interval after an event handler has been registered, or [GetCurrentReading](accelerometer_getcurrentreading_1416488181.md) has been called, might apply to the delivery of subsequent sensor readings.
     * 
     * Conversely, when an application is finished with the sensor, it should explicitly return the sensor to its default report interval by setting it to zero. This is important for power conservation, especially when using a language that might keep the sensor object active for an indefinite period prior to garbage collection.
     * 
     * The application should consult the [MinimumReportInterval](accelerometer_minimumreportinterval.md) property prior to setting the report interval to ensure that the sensor can honor the requested report interval. Setting a value below the minimum supported interval either triggers an exception or has undefined results.
     * 
     * Although the application can set this value to request a particular report interval, the driver determines the actual report interval, based on internal logic. For example, the driver might use the shortest report interval that is requested by any caller.
     * 
     * If the value is set to zero, the driver uses its default report interval. As with requesting a specific interval, the driver might choose a different interval based on other client requests and internal logic.
     * 
     * <!-- Removing this piece based on MS VSO item 1118657. The sensor no longer adjusts change sensitivity based on the current report interval
     *     <p>The Sensor platform automatically sets the change sensitivity for accelerometers based on the current report interval. This table specifies the change sensitivity values for given intervals.</p>
     *         <table>
     *           <tr>
     *             <th>Current report interval (specified in milliseconds)</th>
     *             <th>Change sensitivity (specified as G force)</th>
     *           </tr>
     *           <tr>
     *             <td>1 ms <entity type="ndash"/> 16 ms</td>
     *             <td>0.01 G
     * </td>
     *           </tr>
     *           <tr>
     *             <td>17 ms <entity type="ndash"/> 32 ms</td>
     *             <td>0.02 G
     * </td>
     *           </tr>
     *           <tr>
     *             <td>&gt;= 33 ms</td>
     *             <td>0.05 G
     * </td>
     *           </tr>
     *         </table>
     *     -->
     * @see https://learn.microsoft.com/uwp/api/windows.devices.sensors.accelerometer.reportinterval
     * @type {Integer} 
     */
    ReportInterval {
        get => this.get_ReportInterval()
        set => this.put_ReportInterval(value)
    }

    /**
     * Gets the device identifier.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.sensors.accelerometer.deviceid
     * @type {HSTRING} 
     */
    DeviceId {
        get => this.get_DeviceId()
    }

    /**
     * Gets or sets the transformation that needs to be applied to sensor data. Transformations to be applied are tied to the display orientation with which to align the sensor data.
     * @remarks
     * This property provides these improvements:
     * 
     * + Differences in the sensor data on landscape-first devices versus portrait-first devices are no longer important.
     * + Easily port existing sensor-based apps that were written for landscape-first devices to portrait-first devices and vice-versa.
     * + Allows handling of display orientation changes. You can align the sensor data with the current orientation by updating the sensor’s ReadingTransform to match the current display orientation.
     * + Allows aligning sensor data with a display orientation that is different from the current display orientation.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.sensors.accelerometer.readingtransform
     * @type {Integer} 
     */
    ReadingTransform {
        get => this.get_ReadingTransform()
        set => this.put_ReadingTransform(value)
    }

    /**
     * Gets or sets the delay between batches of sensor information.
     * @remarks
     * This property is in reference to the frequency of [ReadingChanged](accelerometer_readingchanged.md) events.
     * 
     * Not all sensors support ReportLatency. If the sensor does not support this property, it will function the same as if you set this value to 0. Setting this value to 0 will use the default latency for the sensor.
     * 
     * If you set ReportLatency to a value higher than the maximum supported latency, the sensor will use the maximum supported latency. However, this property will not change in value. The maximum possible ReportLatency equals the [MaxBatchSize](accelerometer_maxbatchsize.md) times the [ReportInterval](accelerometer_reportinterval.md).
     * 
     * Be aware that multiple applications could be dependent on a single sensor. Each of those applications can set a different value for ReportLatency. In this scenario, the sensor needs to try to accommodate the lowest value for ReportLatency. Because of this, the actual latency may not match the latency defined by this property in your application. This property corresponds to your ideal latency, which may not be the same latency on the sensor.
     * 
     * For more information about sensor batching, see [Sensors](/windows/uwp/devices-sensors/sensors).
     * @see https://learn.microsoft.com/uwp/api/windows.devices.sensors.accelerometer.reportlatency
     * @type {Integer} 
     */
    ReportLatency {
        get => this.get_ReportLatency()
        set => this.put_ReportLatency(value)
    }

    /**
     * Gets the maximum number of events that can be batched by the sensor.
     * @remarks
     * A sensor may not support batched data collection. In that case, this property will be 0. Otherwise, this determines the maximum number of events the sensor can gather before submitting them. This in turn will determine the maximum supported [ReportLatency](accelerometer_reportlatency.md). The maximum latency equals the [ReportInterval](accelerometer_reportinterval.md) times the MaxBatchSize. For more information about sensor batching, see [Sensors](/windows/uwp/devices-sensors/sensors).
     * @see https://learn.microsoft.com/uwp/api/windows.devices.sensors.accelerometer.maxbatchsize
     * @type {Integer} 
     */
    MaxBatchSize {
        get => this.get_MaxBatchSize()
    }

    /**
     * Gets the type of accelerometer sensor the is represented by this object.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.sensors.accelerometer.readingtype
     * @type {Integer} 
     */
    ReadingType {
        get => this.get_ReadingType()
    }

    /**
     * Gets the [AccelerometerDataThreshold](accelerometerdatathreshold.md) for the accelerometer sensor.
     * @remarks
     * A report is generated only if the delta between the previous reported data reading and a new sample is greater than the [AccelerometerDataThreshold](accelerometerdatathreshold.md).
     * @see https://learn.microsoft.com/uwp/api/windows.devices.sensors.accelerometer.reportthreshold
     * @type {AccelerometerDataThreshold} 
     */
    ReportThreshold {
        get => this.get_ReportThreshold()
    }

    /**
     * Occurs each time the accelerometer reports a new sensor reading.
     * @remarks
     * An application may register this event handler to obtain sensor readings. The application must establish a desired [ReportInterval](accelerometer_reportinterval.md). This informs the sensor driver that resources should be allocated to satisfy the requirements of the application.
     * @type {TypedEventHandler<Accelerometer, AccelerometerReadingChangedEventArgs>}
    */
    OnReadingChanged {
        get {
            if(!this.HasProp("__OnReadingChanged")){
                this.__OnReadingChanged := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{a5e83e40-b597-5b83-92f5-5bed3926ca80}"),
                    Accelerometer,
                    AccelerometerReadingChangedEventArgs
                )
                this.__OnReadingChangedToken := this.add_ReadingChanged(this.__OnReadingChanged.iface)
            }
            return this.__OnReadingChanged
        }
    }

    /**
     * Occurs when the accelerometer detects that the PC has been shaken.
     * @remarks
     * Use this event to receive notification that the device containing the accelerometer has been shaken. The app is not required to set a report interval prior to registering for Shaken events.
     * 
     * Support for the Shaken event is dependent upon hardware and driver support. In practice, very few accelerometers support the Shaken event. If the accelerometer does not support the Shaken event and you add an event handler for the Shaken event, no error is raised, but the code in the event handler won't run.
     * @type {TypedEventHandler<Accelerometer, AccelerometerShakenEventArgs>}
    */
    OnShaken {
        get {
            if(!this.HasProp("__OnShaken")){
                this.__OnShaken := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{3e5d6eaf-f169-5d60-92b0-98cd6bd8f808}"),
                    Accelerometer,
                    AccelerometerShakenEventArgs
                )
                this.__OnShakenToken := this.add_Shaken(this.__OnShaken.iface)
            }
            return this.__OnShaken
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

        if(this.HasProp("__OnShakenToken")) {
            this.remove_Shaken(this.__OnShakenToken)
            this.__OnShaken.iface.Dispose()
        }

        super.__Delete()
    }

    /**
     * Gets the current accelerometer reading.
     * @remarks
     * An application may use this method to poll the sensor for the current reading as an alternative to registering a [ReadingChanged](accelerometer_readingchanged.md) event handler. This would be the preferred alternative for an application that updates its user interface at a specific frame rate. Whether polling once or many times, the application must establish a desired [ReportInterval](accelerometer_reportinterval.md). This informs the sensor driver that resources should be allocated to satisfy subsequent polling requests
     * 
     * If the sensor is configured to support batch delivery, this method flushes the current batch and starts a new latency period. For more information about sensor batching, see [Sensors](/windows/uwp/devices-sensors/sensors).
     * 
     * Before using the return value from this method, the application must first check that the value is not null. (If the value is null and you attempt to retrieve it, Windows will generate an exception.)
     * @returns {AccelerometerReading} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.sensors.accelerometer.getcurrentreading
     */
    GetCurrentReading() {
        if (!this.HasProp("__IAccelerometer")) {
            if ((queryResult := this.QueryInterface(IAccelerometer.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAccelerometer := IAccelerometer(outPtr)
        }

        return this.__IAccelerometer.GetCurrentReading()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_MinimumReportInterval() {
        if (!this.HasProp("__IAccelerometer")) {
            if ((queryResult := this.QueryInterface(IAccelerometer.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAccelerometer := IAccelerometer(outPtr)
        }

        return this.__IAccelerometer.get_MinimumReportInterval()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_ReportInterval(value) {
        if (!this.HasProp("__IAccelerometer")) {
            if ((queryResult := this.QueryInterface(IAccelerometer.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAccelerometer := IAccelerometer(outPtr)
        }

        return this.__IAccelerometer.put_ReportInterval(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_ReportInterval() {
        if (!this.HasProp("__IAccelerometer")) {
            if ((queryResult := this.QueryInterface(IAccelerometer.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAccelerometer := IAccelerometer(outPtr)
        }

        return this.__IAccelerometer.get_ReportInterval()
    }

    /**
     * 
     * @param {TypedEventHandler<Accelerometer, AccelerometerReadingChangedEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_ReadingChanged(handler) {
        if (!this.HasProp("__IAccelerometer")) {
            if ((queryResult := this.QueryInterface(IAccelerometer.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAccelerometer := IAccelerometer(outPtr)
        }

        return this.__IAccelerometer.add_ReadingChanged(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_ReadingChanged(token) {
        if (!this.HasProp("__IAccelerometer")) {
            if ((queryResult := this.QueryInterface(IAccelerometer.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAccelerometer := IAccelerometer(outPtr)
        }

        return this.__IAccelerometer.remove_ReadingChanged(token)
    }

    /**
     * 
     * @param {TypedEventHandler<Accelerometer, AccelerometerShakenEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_Shaken(handler) {
        if (!this.HasProp("__IAccelerometer")) {
            if ((queryResult := this.QueryInterface(IAccelerometer.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAccelerometer := IAccelerometer(outPtr)
        }

        return this.__IAccelerometer.add_Shaken(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_Shaken(token) {
        if (!this.HasProp("__IAccelerometer")) {
            if ((queryResult := this.QueryInterface(IAccelerometer.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAccelerometer := IAccelerometer(outPtr)
        }

        return this.__IAccelerometer.remove_Shaken(token)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_DeviceId() {
        if (!this.HasProp("__IAccelerometerDeviceId")) {
            if ((queryResult := this.QueryInterface(IAccelerometerDeviceId.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAccelerometerDeviceId := IAccelerometerDeviceId(outPtr)
        }

        return this.__IAccelerometerDeviceId.get_DeviceId()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_ReadingTransform(value) {
        if (!this.HasProp("__IAccelerometer2")) {
            if ((queryResult := this.QueryInterface(IAccelerometer2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAccelerometer2 := IAccelerometer2(outPtr)
        }

        return this.__IAccelerometer2.put_ReadingTransform(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_ReadingTransform() {
        if (!this.HasProp("__IAccelerometer2")) {
            if ((queryResult := this.QueryInterface(IAccelerometer2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAccelerometer2 := IAccelerometer2(outPtr)
        }

        return this.__IAccelerometer2.get_ReadingTransform()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_ReportLatency(value) {
        if (!this.HasProp("__IAccelerometer3")) {
            if ((queryResult := this.QueryInterface(IAccelerometer3.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAccelerometer3 := IAccelerometer3(outPtr)
        }

        return this.__IAccelerometer3.put_ReportLatency(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_ReportLatency() {
        if (!this.HasProp("__IAccelerometer3")) {
            if ((queryResult := this.QueryInterface(IAccelerometer3.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAccelerometer3 := IAccelerometer3(outPtr)
        }

        return this.__IAccelerometer3.get_ReportLatency()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_MaxBatchSize() {
        if (!this.HasProp("__IAccelerometer3")) {
            if ((queryResult := this.QueryInterface(IAccelerometer3.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAccelerometer3 := IAccelerometer3(outPtr)
        }

        return this.__IAccelerometer3.get_MaxBatchSize()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_ReadingType() {
        if (!this.HasProp("__IAccelerometer4")) {
            if ((queryResult := this.QueryInterface(IAccelerometer4.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAccelerometer4 := IAccelerometer4(outPtr)
        }

        return this.__IAccelerometer4.get_ReadingType()
    }

    /**
     * 
     * @returns {AccelerometerDataThreshold} 
     */
    get_ReportThreshold() {
        if (!this.HasProp("__IAccelerometer5")) {
            if ((queryResult := this.QueryInterface(IAccelerometer5.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAccelerometer5 := IAccelerometer5(outPtr)
        }

        return this.__IAccelerometer5.get_ReportThreshold()
    }

;@endregion Instance Methods
}
