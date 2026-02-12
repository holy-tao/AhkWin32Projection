#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IHumanPresenceSensor.ahk
#Include .\IHumanPresenceSensor2.ahk
#Include .\IHumanPresenceSensor3.ahk
#Include .\IHumanPresenceSensorStatics2.ahk
#Include .\IHumanPresenceSensorStatics.ahk
#Include ..\..\Foundation\TypedEventHandler.ahk
#Include .\HumanPresenceSensor.ahk
#Include .\HumanPresenceSensorReadingChangedEventArgs.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\..\WinRTEventHandler.ahk

/**
 * Represents a sensor that detects whether a user is present, absent, or not interacting with their device.
  * 
  * <!-- > [!Important]
  * > To access a human presence sensor, you must declare the `Motion activity` capability in your [app package manifest](/uwp/schemas/appxpackage/appx-package-manifest). For more details, see [App capability declarations](/windows/uwp/packaging/app-capability-declarations).
  *  -->
 * @remarks
 * Presence detection can have a significant impact on security, responsiveness, and performance.
 * 
 * - Devices can be locked automatically when left unattended to protect sensitive files and other info.
 * - User intent can be inferred to reduce the response time required from detection to authentication or interaction.
 * - Battery life can be preserved by reducing unnecessary screen idle time.
 * @see https://learn.microsoft.com/uwp/api/windows.devices.sensors.humanpresencesensor
 * @namespace Windows.Devices.Sensors
 * @version WindowsRuntime 1.4
 */
class HumanPresenceSensor extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IHumanPresenceSensor

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IHumanPresenceSensor.IID

;@endregion Static Properties

;@region Static Methods
    /**
     * Synchronously retrieves a reference to the human presence sensor associated with the provided device ID.
     * @param {HSTRING} sensorId The unique device ID of a human presence sensor.
     * @returns {HumanPresenceSensor} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.sensors.humanpresencesensor.fromid
     */
    static FromId(sensorId) {
        if (!HumanPresenceSensor.HasProp("__IHumanPresenceSensorStatics2")) {
            activatableClassId := HSTRING.Create("Windows.Devices.Sensors.HumanPresenceSensor")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IHumanPresenceSensorStatics2.IID)
            HumanPresenceSensor.__IHumanPresenceSensorStatics2 := IHumanPresenceSensorStatics2(factoryPtr)
        }

        return HumanPresenceSensor.__IHumanPresenceSensorStatics2.FromId(sensorId)
    }

    /**
     * Synchronously retrieves a reference to the default human presence sensor.
     * @returns {HumanPresenceSensor} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.sensors.humanpresencesensor.getdefault
     */
    static GetDefault() {
        if (!HumanPresenceSensor.HasProp("__IHumanPresenceSensorStatics2")) {
            activatableClassId := HSTRING.Create("Windows.Devices.Sensors.HumanPresenceSensor")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IHumanPresenceSensorStatics2.IID)
            HumanPresenceSensor.__IHumanPresenceSensorStatics2 := IHumanPresenceSensorStatics2(factoryPtr)
        }

        return HumanPresenceSensor.__IHumanPresenceSensorStatics2.GetDefault()
    }

    /**
     * Retrieves an Advanced Query Syntax (AQS) string used to enumerate the available human presence sensors.
     * @remarks
     * The app can pass the AQS string to [DeviceInformation.FindAllAsync](../windows.devices.enumeration/deviceinformation_findallasync_1257462890.md) to find all human presence sensors on the system.
     * @returns {HSTRING} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.sensors.humanpresencesensor.getdeviceselector
     */
    static GetDeviceSelector() {
        if (!HumanPresenceSensor.HasProp("__IHumanPresenceSensorStatics")) {
            activatableClassId := HSTRING.Create("Windows.Devices.Sensors.HumanPresenceSensor")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IHumanPresenceSensorStatics.IID)
            HumanPresenceSensor.__IHumanPresenceSensorStatics := IHumanPresenceSensorStatics(factoryPtr)
        }

        return HumanPresenceSensor.__IHumanPresenceSensorStatics.GetDeviceSelector()
    }

    /**
     * Asynchronously retrieves a reference to the human presence sensor associated with the provided device ID.
     * @param {HSTRING} sensorId The unique device ID of a human presence sensor.
     * @returns {IAsyncOperation<HumanPresenceSensor>} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.sensors.humanpresencesensor.fromidasync
     */
    static FromIdAsync(sensorId) {
        if (!HumanPresenceSensor.HasProp("__IHumanPresenceSensorStatics")) {
            activatableClassId := HSTRING.Create("Windows.Devices.Sensors.HumanPresenceSensor")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IHumanPresenceSensorStatics.IID)
            HumanPresenceSensor.__IHumanPresenceSensorStatics := IHumanPresenceSensorStatics(factoryPtr)
        }

        return HumanPresenceSensor.__IHumanPresenceSensorStatics.FromIdAsync(sensorId)
    }

    /**
     * Asynchronously retrieves a reference to the default human presence sensor.
     * @returns {IAsyncOperation<HumanPresenceSensor>} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.sensors.humanpresencesensor.getdefaultasync
     */
    static GetDefaultAsync() {
        if (!HumanPresenceSensor.HasProp("__IHumanPresenceSensorStatics")) {
            activatableClassId := HSTRING.Create("Windows.Devices.Sensors.HumanPresenceSensor")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IHumanPresenceSensorStatics.IID)
            HumanPresenceSensor.__IHumanPresenceSensorStatics := IHumanPresenceSensorStatics(factoryPtr)
        }

        return HumanPresenceSensor.__IHumanPresenceSensorStatics.GetDefaultAsync()
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * Gets the unique device ID of the human presence sensor.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.sensors.humanpresencesensor.deviceid
     * @type {HSTRING} 
     */
    DeviceId {
        get => this.get_DeviceId()
    }

    /**
     * Gets the maximum distance the human presence sensor can detect a user.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.sensors.humanpresencesensor.maxdetectabledistanceinmillimeters
     * @type {IReference<Integer>} 
     */
    MaxDetectableDistanceInMillimeters {
        get => this.get_MaxDetectableDistanceInMillimeters()
    }

    /**
     * Gets the minimum distance the human presence sensor can detect a user.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.sensors.humanpresencesensor.mindetectabledistanceinmillimeters
     * @type {IReference<Integer>} 
     */
    MinDetectableDistanceInMillimeters {
        get => this.get_MinDetectableDistanceInMillimeters()
    }

    /**
     * Gets whether the human presence sensor is capable of perceiving if the user is in front of their PC.
     * @remarks
     * **Introduced in the May Moment update for Windows 11, Version 22H2, Build 22621.**
     * @see https://learn.microsoft.com/uwp/api/windows.devices.sensors.humanpresencesensor.ispresencesupported
     * @type {Boolean} 
     */
    IsPresenceSupported {
        get => this.get_IsPresenceSupported()
    }

    /**
     * Gets whether the human presence sensor is capable of perceiving if the user is engaged with (looking at) their PC.
     * @remarks
     * **Introduced in the May Moment update for Windows 11, Version 22H2, Build 22621.**
     * @see https://learn.microsoft.com/uwp/api/windows.devices.sensors.humanpresencesensor.isengagementsupported
     * @type {Boolean} 
     */
    IsEngagementSupported {
        get => this.get_IsEngagementSupported()
    }

    /**
     * Gets the maximum number of people that can be detected by the human presence sensor.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.sensors.humanpresencesensor.maxdetectablepersons
     * @type {Integer} 
     */
    MaxDetectablePersons {
        get => this.get_MaxDetectablePersons()
    }

    /**
     * Gets the minimum azimuth angle supported by the human presence sensor, in degrees.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.sensors.humanpresencesensor.mindetectableazimuthindegrees
     * @type {IReference<Float>} 
     */
    MinDetectableAzimuthInDegrees {
        get => this.get_MinDetectableAzimuthInDegrees()
    }

    /**
     * Gets the maximum azimuth angle supported by the human presence sensor, in degrees.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.sensors.humanpresencesensor.maxdetectableazimuthindegrees
     * @type {IReference<Float>} 
     */
    MaxDetectableAzimuthInDegrees {
        get => this.get_MaxDetectableAzimuthInDegrees()
    }

    /**
     * Gets the minimum altitude angle supported by the human presence sensor, in degrees.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.sensors.humanpresencesensor.mindetectablealtitudeindegrees
     * @type {IReference<Float>} 
     */
    MinDetectableAltitudeInDegrees {
        get => this.get_MinDetectableAltitudeInDegrees()
    }

    /**
     * Gets the maximum altitude angle supported by the human presence sensor, in degrees.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.sensors.humanpresencesensor.maxdetectablealtitudeindegrees
     * @type {IReference<Float>} 
     */
    MaxDetectableAltitudeInDegrees {
        get => this.get_MaxDetectableAltitudeInDegrees()
    }

    /**
     * Occurs whenever there is a significant change in the human presence sensor reading.
     * @type {TypedEventHandler<HumanPresenceSensor, HumanPresenceSensorReadingChangedEventArgs>}
    */
    OnReadingChanged {
        get {
            if(!this.HasProp("__OnReadingChanged")){
                this.__OnReadingChanged := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{329678bc-3d7c-5ff3-87cb-4fc5e9fecf72}"),
                    HumanPresenceSensor,
                    HumanPresenceSensorReadingChangedEventArgs
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
        if (!this.HasProp("__IHumanPresenceSensor")) {
            if ((queryResult := this.QueryInterface(IHumanPresenceSensor.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IHumanPresenceSensor := IHumanPresenceSensor(outPtr)
        }

        return this.__IHumanPresenceSensor.get_DeviceId()
    }

    /**
     * 
     * @returns {IReference<Integer>} 
     */
    get_MaxDetectableDistanceInMillimeters() {
        if (!this.HasProp("__IHumanPresenceSensor")) {
            if ((queryResult := this.QueryInterface(IHumanPresenceSensor.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IHumanPresenceSensor := IHumanPresenceSensor(outPtr)
        }

        return this.__IHumanPresenceSensor.get_MaxDetectableDistanceInMillimeters()
    }

    /**
     * 
     * @returns {IReference<Integer>} 
     */
    get_MinDetectableDistanceInMillimeters() {
        if (!this.HasProp("__IHumanPresenceSensor")) {
            if ((queryResult := this.QueryInterface(IHumanPresenceSensor.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IHumanPresenceSensor := IHumanPresenceSensor(outPtr)
        }

        return this.__IHumanPresenceSensor.get_MinDetectableDistanceInMillimeters()
    }

    /**
     * Retrieves the current sensor reading from the human presence sensor.
     * @returns {HumanPresenceSensorReading} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.sensors.humanpresencesensor.getcurrentreading
     */
    GetCurrentReading() {
        if (!this.HasProp("__IHumanPresenceSensor")) {
            if ((queryResult := this.QueryInterface(IHumanPresenceSensor.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IHumanPresenceSensor := IHumanPresenceSensor(outPtr)
        }

        return this.__IHumanPresenceSensor.GetCurrentReading()
    }

    /**
     * 
     * @param {TypedEventHandler<HumanPresenceSensor, HumanPresenceSensorReadingChangedEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_ReadingChanged(handler) {
        if (!this.HasProp("__IHumanPresenceSensor")) {
            if ((queryResult := this.QueryInterface(IHumanPresenceSensor.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IHumanPresenceSensor := IHumanPresenceSensor(outPtr)
        }

        return this.__IHumanPresenceSensor.add_ReadingChanged(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_ReadingChanged(token) {
        if (!this.HasProp("__IHumanPresenceSensor")) {
            if ((queryResult := this.QueryInterface(IHumanPresenceSensor.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IHumanPresenceSensor := IHumanPresenceSensor(outPtr)
        }

        return this.__IHumanPresenceSensor.remove_ReadingChanged(token)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsPresenceSupported() {
        if (!this.HasProp("__IHumanPresenceSensor2")) {
            if ((queryResult := this.QueryInterface(IHumanPresenceSensor2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IHumanPresenceSensor2 := IHumanPresenceSensor2(outPtr)
        }

        return this.__IHumanPresenceSensor2.get_IsPresenceSupported()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsEngagementSupported() {
        if (!this.HasProp("__IHumanPresenceSensor2")) {
            if ((queryResult := this.QueryInterface(IHumanPresenceSensor2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IHumanPresenceSensor2 := IHumanPresenceSensor2(outPtr)
        }

        return this.__IHumanPresenceSensor2.get_IsEngagementSupported()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_MaxDetectablePersons() {
        if (!this.HasProp("__IHumanPresenceSensor3")) {
            if ((queryResult := this.QueryInterface(IHumanPresenceSensor3.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IHumanPresenceSensor3 := IHumanPresenceSensor3(outPtr)
        }

        return this.__IHumanPresenceSensor3.get_MaxDetectablePersons()
    }

    /**
     * 
     * @returns {IReference<Float>} 
     */
    get_MinDetectableAzimuthInDegrees() {
        if (!this.HasProp("__IHumanPresenceSensor3")) {
            if ((queryResult := this.QueryInterface(IHumanPresenceSensor3.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IHumanPresenceSensor3 := IHumanPresenceSensor3(outPtr)
        }

        return this.__IHumanPresenceSensor3.get_MinDetectableAzimuthInDegrees()
    }

    /**
     * 
     * @returns {IReference<Float>} 
     */
    get_MaxDetectableAzimuthInDegrees() {
        if (!this.HasProp("__IHumanPresenceSensor3")) {
            if ((queryResult := this.QueryInterface(IHumanPresenceSensor3.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IHumanPresenceSensor3 := IHumanPresenceSensor3(outPtr)
        }

        return this.__IHumanPresenceSensor3.get_MaxDetectableAzimuthInDegrees()
    }

    /**
     * 
     * @returns {IReference<Float>} 
     */
    get_MinDetectableAltitudeInDegrees() {
        if (!this.HasProp("__IHumanPresenceSensor3")) {
            if ((queryResult := this.QueryInterface(IHumanPresenceSensor3.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IHumanPresenceSensor3 := IHumanPresenceSensor3(outPtr)
        }

        return this.__IHumanPresenceSensor3.get_MinDetectableAltitudeInDegrees()
    }

    /**
     * 
     * @returns {IReference<Float>} 
     */
    get_MaxDetectableAltitudeInDegrees() {
        if (!this.HasProp("__IHumanPresenceSensor3")) {
            if ((queryResult := this.QueryInterface(IHumanPresenceSensor3.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IHumanPresenceSensor3 := IHumanPresenceSensor3(outPtr)
        }

        return this.__IHumanPresenceSensor3.get_MaxDetectableAltitudeInDegrees()
    }

;@endregion Instance Methods
}
