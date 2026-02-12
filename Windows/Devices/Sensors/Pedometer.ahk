#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IPedometer.ahk
#Include .\IPedometer2.ahk
#Include .\IPedometerStatics.ahk
#Include .\IPedometerStatics2.ahk
#Include ..\..\Foundation\TypedEventHandler.ahk
#Include .\Pedometer.ahk
#Include .\PedometerReadingChangedEventArgs.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\..\WinRTEventHandler.ahk

/**
 * Provides an interface for a pedometer to measure the number of steps taken.
  * 
  * For an example implemenation, see the [pedometer sample](https://github.com/Microsoft/Windows-universal-samples/tree/master/Samples/Pedometer).
 * @remarks
 * > [!NOTE]
 * > This class is not supported in JavaScript
 * @see https://learn.microsoft.com/uwp/api/windows.devices.sensors.pedometer
 * @namespace Windows.Devices.Sensors
 * @version WindowsRuntime 1.4
 */
class Pedometer extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IPedometer

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IPedometer.IID

;@endregion Static Properties

;@region Static Methods
    /**
     * Obtains the pedometer from its identifier.
     * @param {HSTRING} deviceId The sensor identifier.
     * @returns {IAsyncOperation<Pedometer>} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.sensors.pedometer.fromidasync
     */
    static FromIdAsync(deviceId) {
        if (!Pedometer.HasProp("__IPedometerStatics")) {
            activatableClassId := HSTRING.Create("Windows.Devices.Sensors.Pedometer")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IPedometerStatics.IID)
            Pedometer.__IPedometerStatics := IPedometerStatics(factoryPtr)
        }

        return Pedometer.__IPedometerStatics.FromIdAsync(deviceId)
    }

    /**
     * Asynchronously obtains the default pedometer.
     * @returns {IAsyncOperation<Pedometer>} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.sensors.pedometer.getdefaultasync
     */
    static GetDefaultAsync() {
        if (!Pedometer.HasProp("__IPedometerStatics")) {
            activatableClassId := HSTRING.Create("Windows.Devices.Sensors.Pedometer")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IPedometerStatics.IID)
            Pedometer.__IPedometerStatics := IPedometerStatics(factoryPtr)
        }

        return Pedometer.__IPedometerStatics.GetDefaultAsync()
    }

    /**
     * Gets the device selector.
     * @returns {HSTRING} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.sensors.pedometer.getdeviceselector
     */
    static GetDeviceSelector() {
        if (!Pedometer.HasProp("__IPedometerStatics")) {
            activatableClassId := HSTRING.Create("Windows.Devices.Sensors.Pedometer")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IPedometerStatics.IID)
            Pedometer.__IPedometerStatics := IPedometerStatics(factoryPtr)
        }

        return Pedometer.__IPedometerStatics.GetDeviceSelector()
    }

    /**
     * Asynchronously gets pedometer readings from a specific time and duration.
     * @param {DateTime} fromTime The time for which you want to retrieve the reading.
     * @returns {IAsyncOperation<IVectorView<PedometerReading>>} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.sensors.pedometer.getsystemhistoryasync
     */
    static GetSystemHistoryAsync(fromTime) {
        if (!Pedometer.HasProp("__IPedometerStatics")) {
            activatableClassId := HSTRING.Create("Windows.Devices.Sensors.Pedometer")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IPedometerStatics.IID)
            Pedometer.__IPedometerStatics := IPedometerStatics(factoryPtr)
        }

        return Pedometer.__IPedometerStatics.GetSystemHistoryAsync(fromTime)
    }

    /**
     * Asynchronously gets sensor readings from a specific time.
     * @param {DateTime} fromTime The time for which you want to retrieve the reading.
     * @param {TimeSpan} duration_ 
     * @returns {IAsyncOperation<IVectorView<PedometerReading>>} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.sensors.pedometer.getsystemhistoryasync
     */
    static GetSystemHistoryWithDurationAsync(fromTime, duration_) {
        if (!Pedometer.HasProp("__IPedometerStatics")) {
            activatableClassId := HSTRING.Create("Windows.Devices.Sensors.Pedometer")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IPedometerStatics.IID)
            Pedometer.__IPedometerStatics := IPedometerStatics(factoryPtr)
        }

        return Pedometer.__IPedometerStatics.GetSystemHistoryWithDurationAsync(fromTime, duration_)
    }

    /**
     * Gets readings from the trigger details in background task.
     * @remarks
     * [SensorDataThresholdTriggerDetails](sensordatathresholdtriggerdetails.md) objects are designed to be independent of the sensor that activated the background trigger. This enables you to support all of the sensors your are interested in with a single background task. In order to support this methodology, you need to define this method in all of your sensors that extract data from the background trigger.
     * @param {SensorDataThresholdTriggerDetails} triggerDetails The trigger details received from the background task.
     * @returns {IVectorView<PedometerReading>} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.sensors.pedometer.getreadingsfromtriggerdetails
     */
    static GetReadingsFromTriggerDetails(triggerDetails) {
        if (!Pedometer.HasProp("__IPedometerStatics2")) {
            activatableClassId := HSTRING.Create("Windows.Devices.Sensors.Pedometer")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IPedometerStatics2.IID)
            Pedometer.__IPedometerStatics2 := IPedometerStatics2(factoryPtr)
        }

        return Pedometer.__IPedometerStatics2.GetReadingsFromTriggerDetails(triggerDetails)
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * Gets the device identifier.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.sensors.pedometer.deviceid
     * @type {HSTRING} 
     */
    DeviceId {
        get => this.get_DeviceId()
    }

    /**
     * Gets the power that the sensor consumes.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.sensors.pedometer.powerinmilliwatts
     * @type {Float} 
     */
    PowerInMilliwatts {
        get => this.get_PowerInMilliwatts()
    }

    /**
     * The smallest report interval that is supported by this pedometer.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.sensors.pedometer.minimumreportinterval
     * @type {Integer} 
     */
    MinimumReportInterval {
        get => this.get_MinimumReportInterval()
    }

    /**
     * Gets or sets the current report interval for the pedometer.
     * @remarks
     * The report interval is set to a default value that varies based on the sensor driver’s implementation. If your app does not want to use this default value, you should set the report interval to a non-zero value prior to registering an event handler or calling [PedometerReading](pedometerreading.md). The sensor then attempts to allocate resources to satisfy the application’s requirements while balancing the needs of other apps using the sensor.
     * 
     * Changes to the report interval after an event handler has been registered, or [PedometerReading](pedometerreading.md) has been called, might apply to the delivery of subsequent sensor readings.
     * 
     * Conversely, when an application is finished with the sensor, it should explicitly return the sensor to its default report interval by setting it to zero. This is important for power conservation, especially when using a language that might keep the sensor object active for an indefinite period prior to garbage collection.
     * 
     * The application should consult the [MinimumReportInterval](pedometer_minimumreportinterval.md) property prior to setting the report interval to ensure that the sensor can honor the requested report interval. Setting a value below the minimum supported interval either triggers an exception or has undefined results.
     * 
     * Although the application can set this value to request a particular report interval, the driver determines the actual report interval, based on internal logic. For example, the driver might use the shortest report interval that is requested by any caller.
     * 
     * If the value is set to zero, the driver uses its default report interval. As with requesting a specific interval, the driver might choose a different interval based on other client requests and internal logic.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.sensors.pedometer.reportinterval
     * @type {Integer} 
     */
    ReportInterval {
        get => this.get_ReportInterval()
        set => this.put_ReportInterval(value)
    }

    /**
     * Occurs each time the pedometer reports a new value.
     * @remarks
     * An application may register this event handler to obtain sensor readings. The application must establish a desired [ReportInterval](pedometer_reportinterval.md). This sets the frequency of the **ReadingChanged** event.
     * @type {TypedEventHandler<Pedometer, PedometerReadingChangedEventArgs>}
    */
    OnReadingChanged {
        get {
            if(!this.HasProp("__OnReadingChanged")){
                this.__OnReadingChanged := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{dcd47693-aad5-5b3c-9c8d-140b8bc2122b}"),
                    Pedometer,
                    PedometerReadingChangedEventArgs
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
     * 
     * @returns {HSTRING} 
     */
    get_DeviceId() {
        if (!this.HasProp("__IPedometer")) {
            if ((queryResult := this.QueryInterface(IPedometer.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPedometer := IPedometer(outPtr)
        }

        return this.__IPedometer.get_DeviceId()
    }

    /**
     * 
     * @returns {Float} 
     */
    get_PowerInMilliwatts() {
        if (!this.HasProp("__IPedometer")) {
            if ((queryResult := this.QueryInterface(IPedometer.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPedometer := IPedometer(outPtr)
        }

        return this.__IPedometer.get_PowerInMilliwatts()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_MinimumReportInterval() {
        if (!this.HasProp("__IPedometer")) {
            if ((queryResult := this.QueryInterface(IPedometer.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPedometer := IPedometer(outPtr)
        }

        return this.__IPedometer.get_MinimumReportInterval()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_ReportInterval(value) {
        if (!this.HasProp("__IPedometer")) {
            if ((queryResult := this.QueryInterface(IPedometer.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPedometer := IPedometer(outPtr)
        }

        return this.__IPedometer.put_ReportInterval(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_ReportInterval() {
        if (!this.HasProp("__IPedometer")) {
            if ((queryResult := this.QueryInterface(IPedometer.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPedometer := IPedometer(outPtr)
        }

        return this.__IPedometer.get_ReportInterval()
    }

    /**
     * 
     * @param {TypedEventHandler<Pedometer, PedometerReadingChangedEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_ReadingChanged(handler) {
        if (!this.HasProp("__IPedometer")) {
            if ((queryResult := this.QueryInterface(IPedometer.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPedometer := IPedometer(outPtr)
        }

        return this.__IPedometer.add_ReadingChanged(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_ReadingChanged(token) {
        if (!this.HasProp("__IPedometer")) {
            if ((queryResult := this.QueryInterface(IPedometer.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPedometer := IPedometer(outPtr)
        }

        return this.__IPedometer.remove_ReadingChanged(token)
    }

    /**
     * Gets the current step information from the pedometer sensor.
     * @returns {IMapView<Integer, PedometerReading>} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.sensors.pedometer.getcurrentreadings
     */
    GetCurrentReadings() {
        if (!this.HasProp("__IPedometer2")) {
            if ((queryResult := this.QueryInterface(IPedometer2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPedometer2 := IPedometer2(outPtr)
        }

        return this.__IPedometer2.GetCurrentReadings()
    }

;@endregion Instance Methods
}
