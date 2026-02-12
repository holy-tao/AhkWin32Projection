#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IProximitySensor.ahk
#Include .\IProximitySensorStatics.ahk
#Include .\IProximitySensorStatics2.ahk
#Include ..\..\Foundation\TypedEventHandler.ahk
#Include .\ProximitySensor.ahk
#Include .\ProximitySensorReadingChangedEventArgs.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\..\WinRTEventHandler.ahk

/**
 * Provides an interface for a proximity sensor to determine whether or not an object is detected.
  * 
  * For an example implementation, see the [proximity sensor sample](https://github.com/Microsoft/Windows-universal-samples/tree/master/Samples/ProximitySensor).
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.devices.sensors.proximitysensor
 * @namespace Windows.Devices.Sensors
 * @version WindowsRuntime 1.4
 */
class ProximitySensor extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IProximitySensor

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IProximitySensor.IID

;@endregion Static Properties

;@region Static Methods
    /**
     * Gets the device selector.
     * @returns {HSTRING} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.sensors.proximitysensor.getdeviceselector
     */
    static GetDeviceSelector() {
        if (!ProximitySensor.HasProp("__IProximitySensorStatics")) {
            activatableClassId := HSTRING.Create("Windows.Devices.Sensors.ProximitySensor")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IProximitySensorStatics.IID)
            ProximitySensor.__IProximitySensorStatics := IProximitySensorStatics(factoryPtr)
        }

        return ProximitySensor.__IProximitySensorStatics.GetDeviceSelector()
    }

    /**
     * Obtains the proximity sensor from its identifier.
     * @param {HSTRING} sensorId The sensor identifier.
     * @returns {ProximitySensor} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.sensors.proximitysensor.fromid
     */
    static FromId(sensorId) {
        if (!ProximitySensor.HasProp("__IProximitySensorStatics")) {
            activatableClassId := HSTRING.Create("Windows.Devices.Sensors.ProximitySensor")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IProximitySensorStatics.IID)
            ProximitySensor.__IProximitySensorStatics := IProximitySensorStatics(factoryPtr)
        }

        return ProximitySensor.__IProximitySensorStatics.FromId(sensorId)
    }

    /**
     * Gets readings from the trigger details in background task.
     * @remarks
     * [SensorDataThresholdTriggerDetails](sensordatathresholdtriggerdetails.md) objects are designed to be independent of the sensor that activated the background trigger. This enables you to support all of the sensors your are interested in with a single background task. In order to support this methodology, you need to define this method in all of your sensors that extract data from the background trigger.
     * @param {SensorDataThresholdTriggerDetails} triggerDetails The trigger details received from the background task.
     * @returns {IVectorView<ProximitySensorReading>} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.sensors.proximitysensor.getreadingsfromtriggerdetails
     */
    static GetReadingsFromTriggerDetails(triggerDetails) {
        if (!ProximitySensor.HasProp("__IProximitySensorStatics2")) {
            activatableClassId := HSTRING.Create("Windows.Devices.Sensors.ProximitySensor")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IProximitySensorStatics2.IID)
            ProximitySensor.__IProximitySensorStatics2 := IProximitySensorStatics2(factoryPtr)
        }

        return ProximitySensor.__IProximitySensorStatics2.GetReadingsFromTriggerDetails(triggerDetails)
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * Gets the device identifier.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.sensors.proximitysensor.deviceid
     * @type {HSTRING} 
     */
    DeviceId {
        get => this.get_DeviceId()
    }

    /**
     * The largest distance where the proximity sensor can detect an object.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.sensors.proximitysensor.maxdistanceinmillimeters
     * @type {IReference<Integer>} 
     */
    MaxDistanceInMillimeters {
        get => this.get_MaxDistanceInMillimeters()
    }

    /**
     * The shortest distance where the proximity sensor can detect an object.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.sensors.proximitysensor.mindistanceinmillimeters
     * @type {IReference<Integer>} 
     */
    MinDistanceInMillimeters {
        get => this.get_MinDistanceInMillimeters()
    }

    /**
     * Occurs each time the proximity sensor reports a new value.
     * @remarks
     * An application may register this event handler to obtain sensor readings.
     * @type {TypedEventHandler<ProximitySensor, ProximitySensorReadingChangedEventArgs>}
    */
    OnReadingChanged {
        get {
            if(!this.HasProp("__OnReadingChanged")){
                this.__OnReadingChanged := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{9f7e222b-892a-5e68-b08a-10384b5f92b9}"),
                    ProximitySensor,
                    ProximitySensorReadingChangedEventArgs
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
        if (!this.HasProp("__IProximitySensor")) {
            if ((queryResult := this.QueryInterface(IProximitySensor.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IProximitySensor := IProximitySensor(outPtr)
        }

        return this.__IProximitySensor.get_DeviceId()
    }

    /**
     * 
     * @returns {IReference<Integer>} 
     */
    get_MaxDistanceInMillimeters() {
        if (!this.HasProp("__IProximitySensor")) {
            if ((queryResult := this.QueryInterface(IProximitySensor.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IProximitySensor := IProximitySensor(outPtr)
        }

        return this.__IProximitySensor.get_MaxDistanceInMillimeters()
    }

    /**
     * 
     * @returns {IReference<Integer>} 
     */
    get_MinDistanceInMillimeters() {
        if (!this.HasProp("__IProximitySensor")) {
            if ((queryResult := this.QueryInterface(IProximitySensor.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IProximitySensor := IProximitySensor(outPtr)
        }

        return this.__IProximitySensor.get_MinDistanceInMillimeters()
    }

    /**
     * Gets the current reading for the proximity sensor.
     * @returns {ProximitySensorReading} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.sensors.proximitysensor.getcurrentreading
     */
    GetCurrentReading() {
        if (!this.HasProp("__IProximitySensor")) {
            if ((queryResult := this.QueryInterface(IProximitySensor.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IProximitySensor := IProximitySensor(outPtr)
        }

        return this.__IProximitySensor.GetCurrentReading()
    }

    /**
     * 
     * @param {TypedEventHandler<ProximitySensor, ProximitySensorReadingChangedEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_ReadingChanged(handler) {
        if (!this.HasProp("__IProximitySensor")) {
            if ((queryResult := this.QueryInterface(IProximitySensor.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IProximitySensor := IProximitySensor(outPtr)
        }

        return this.__IProximitySensor.add_ReadingChanged(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_ReadingChanged(token) {
        if (!this.HasProp("__IProximitySensor")) {
            if ((queryResult := this.QueryInterface(IProximitySensor.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IProximitySensor := IProximitySensor(outPtr)
        }

        return this.__IProximitySensor.remove_ReadingChanged(token)
    }

    /**
     * Creates a controller responsible for turning the display on or off based on the [ProximitySensorReading](proximitysensorreading.md).
     * @returns {ProximitySensorDisplayOnOffController} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.sensors.proximitysensor.createdisplayonoffcontroller
     */
    CreateDisplayOnOffController() {
        if (!this.HasProp("__IProximitySensor")) {
            if ((queryResult := this.QueryInterface(IProximitySensor.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IProximitySensor := IProximitySensor(outPtr)
        }

        return this.__IProximitySensor.CreateDisplayOnOffController()
    }

;@endregion Instance Methods
}
