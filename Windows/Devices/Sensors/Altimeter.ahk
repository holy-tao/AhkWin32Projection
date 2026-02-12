#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IAltimeter.ahk
#Include .\IAltimeter2.ahk
#Include .\IAltimeterStatics.ahk
#Include ..\..\Foundation\TypedEventHandler.ahk
#Include .\Altimeter.ahk
#Include .\AltimeterReadingChangedEventArgs.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\..\WinRTEventHandler.ahk

/**
 * Provides an interface for an altimetric sensor to measure the relative altitude.
  * 
  * For an example implementation, see the [altimeter sample](https://github.com/Microsoft/Windows-universal-samples/tree/master/Samples/Altimeter).
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.devices.sensors.altimeter
 * @namespace Windows.Devices.Sensors
 * @version WindowsRuntime 1.4
 */
class Altimeter extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IAltimeter

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IAltimeter.IID

;@endregion Static Properties

;@region Static Methods
    /**
     * Returns the default altimeter sensor.
     * @remarks
     * If no barometer sensor is available, this method will return the null pointer.
     * @returns {Altimeter} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.sensors.altimeter.getdefault
     */
    static GetDefault() {
        if (!Altimeter.HasProp("__IAltimeterStatics")) {
            activatableClassId := HSTRING.Create("Windows.Devices.Sensors.Altimeter")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IAltimeterStatics.IID)
            Altimeter.__IAltimeterStatics := IAltimeterStatics(factoryPtr)
        }

        return Altimeter.__IAltimeterStatics.GetDefault()
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * Gets the device identifier.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.sensors.altimeter.deviceid
     * @type {HSTRING} 
     */
    DeviceId {
        get => this.get_DeviceId()
    }

    /**
     * The smallest report interval that is supported by this altimeter sensor.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.sensors.altimeter.minimumreportinterval
     * @type {Integer} 
     */
    MinimumReportInterval {
        get => this.get_MinimumReportInterval()
    }

    /**
     * Gets or sets the current report interval for the altimeter.
     * @remarks
     * The report interval is set to a default value that varies based on the sensor driver’s implementation. If your app does not want to use this default value, you should set the report interval to a non-zero value prior to registering an event handler or calling [GetCurrentReading](altimeter_getcurrentreading_1416488181.md). The sensor then attempts to allocate resources to satisfy the application’s requirements while balancing the needs of other apps using the sensor.
     * 
     * Changes to the report interval after an event handler has been registered, or [GetCurrentReading](altimeter_getcurrentreading_1416488181.md) has been called, might apply to the delivery of subsequent sensor readings.
     * 
     * Conversely, when an application is finished with the sensor, it should explicitly return the sensor to its default report interval by setting it to zero. This is important for power conservation, especially when using a language that might keep the sensor object active for an indefinite period prior to garbage collection.
     * 
     * The application should consult the [MinimumReportInterval](altimeter_minimumreportinterval.md) property prior to setting the report interval to ensure that the sensor can honor the requested report interval. Setting a value below the minimum supported interval either triggers an exception or has undefined results.
     * 
     * Although the application can set this value to request a particular report interval, the driver determines the actual report interval, based on internal logic. For example, the driver might use the shortest report interval that is requested by any caller.
     * 
     * If the value is set to zero, the driver uses its default report interval. As with requesting a specific interval, the driver might choose a different interval based on other client requests and internal logic.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.sensors.altimeter.reportinterval
     * @type {Integer} 
     */
    ReportInterval {
        get => this.get_ReportInterval()
        set => this.put_ReportInterval(value)
    }

    /**
     * Gets or sets the delay between batches of sensor information.
     * @remarks
     * This property is in reference to the frequency of [ReadingChanged](altimeter_readingchanged.md) events.
     * 
     * Not all sensors support ReportLatency. If the sensor does not support this property, it will function the same as if you set this value to 0. Setting this value to 0 will use the default latency for the sensor.
     * 
     * If you set ReportLatency to a value higher than the maximum supported latency, the sensor will use the maximum supported latency. However, this property will not change in value. The maximum possible ReportLatency equals the [MaxBatchSize](altimeter_maxbatchsize.md) times the [ReportInterval](altimeter_reportinterval.md).
     * 
     * Be aware that multiple applications could be dependent on a single sensor. Each of those applications can set a different value for ReportLatency. In this scenario, the sensor needs to try to accommodate the lowest value for ReportLatency. Because of this, the actual latency may not match the latency defined by this property in your application. This property corresponds to your ideal latency, which may not be the same latency on the sensor.
     * 
     * For more information about sensor batching, see [Sensors](/windows/uwp/devices-sensors/sensors).
     * @see https://learn.microsoft.com/uwp/api/windows.devices.sensors.altimeter.reportlatency
     * @type {Integer} 
     */
    ReportLatency {
        get => this.get_ReportLatency()
        set => this.put_ReportLatency(value)
    }

    /**
     * Gets the maximum number of events that can be batched by the sensor.
     * @remarks
     * A sensor may not support batched data collection. In that case, this property will be 0. Otherwise, this determines the maximum number of events the sensor can gather before submitting them. This in turn will determine the maximum supported [ReportLatency](altimeter_reportlatency.md). The maximum latency equals the [ReportInterval](altimeter_reportinterval.md) times the MaxBatchSize. For more information about sensor batching, see [Sensors](/windows/uwp/devices-sensors/sensors).
     * @see https://learn.microsoft.com/uwp/api/windows.devices.sensors.altimeter.maxbatchsize
     * @type {Integer} 
     */
    MaxBatchSize {
        get => this.get_MaxBatchSize()
    }

    /**
     * Occurs each time the altimeter sensor reports a new value.
     * @remarks
     * An application may register this event handler to obtain sensor readings. The application must establish a desired [ReportInterval](altimeter_reportinterval.md). This sets the frequency of the **ReadingChanged** event.
     * @type {TypedEventHandler<Altimeter, AltimeterReadingChangedEventArgs>}
    */
    OnReadingChanged {
        get {
            if(!this.HasProp("__OnReadingChanged")){
                this.__OnReadingChanged := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{d775d699-9d74-5473-9c1b-d51a89db6642}"),
                    Altimeter,
                    AltimeterReadingChangedEventArgs
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
     * Gets the current reading for the altimeter.
     * @remarks
     * It is important to note that the altitude reading for this sensor is not the absolute altitude. Rather, this API is designed to determine the change in elevation between readings.
     * @returns {AltimeterReading} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.sensors.altimeter.getcurrentreading
     */
    GetCurrentReading() {
        if (!this.HasProp("__IAltimeter")) {
            if ((queryResult := this.QueryInterface(IAltimeter.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAltimeter := IAltimeter(outPtr)
        }

        return this.__IAltimeter.GetCurrentReading()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_DeviceId() {
        if (!this.HasProp("__IAltimeter")) {
            if ((queryResult := this.QueryInterface(IAltimeter.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAltimeter := IAltimeter(outPtr)
        }

        return this.__IAltimeter.get_DeviceId()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_MinimumReportInterval() {
        if (!this.HasProp("__IAltimeter")) {
            if ((queryResult := this.QueryInterface(IAltimeter.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAltimeter := IAltimeter(outPtr)
        }

        return this.__IAltimeter.get_MinimumReportInterval()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_ReportInterval(value) {
        if (!this.HasProp("__IAltimeter")) {
            if ((queryResult := this.QueryInterface(IAltimeter.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAltimeter := IAltimeter(outPtr)
        }

        return this.__IAltimeter.put_ReportInterval(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_ReportInterval() {
        if (!this.HasProp("__IAltimeter")) {
            if ((queryResult := this.QueryInterface(IAltimeter.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAltimeter := IAltimeter(outPtr)
        }

        return this.__IAltimeter.get_ReportInterval()
    }

    /**
     * 
     * @param {TypedEventHandler<Altimeter, AltimeterReadingChangedEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_ReadingChanged(handler) {
        if (!this.HasProp("__IAltimeter")) {
            if ((queryResult := this.QueryInterface(IAltimeter.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAltimeter := IAltimeter(outPtr)
        }

        return this.__IAltimeter.add_ReadingChanged(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_ReadingChanged(token) {
        if (!this.HasProp("__IAltimeter")) {
            if ((queryResult := this.QueryInterface(IAltimeter.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAltimeter := IAltimeter(outPtr)
        }

        return this.__IAltimeter.remove_ReadingChanged(token)
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_ReportLatency(value) {
        if (!this.HasProp("__IAltimeter2")) {
            if ((queryResult := this.QueryInterface(IAltimeter2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAltimeter2 := IAltimeter2(outPtr)
        }

        return this.__IAltimeter2.put_ReportLatency(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_ReportLatency() {
        if (!this.HasProp("__IAltimeter2")) {
            if ((queryResult := this.QueryInterface(IAltimeter2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAltimeter2 := IAltimeter2(outPtr)
        }

        return this.__IAltimeter2.get_ReportLatency()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_MaxBatchSize() {
        if (!this.HasProp("__IAltimeter2")) {
            if ((queryResult := this.QueryInterface(IAltimeter2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAltimeter2 := IAltimeter2(outPtr)
        }

        return this.__IAltimeter2.get_MaxBatchSize()
    }

;@endregion Instance Methods
}
