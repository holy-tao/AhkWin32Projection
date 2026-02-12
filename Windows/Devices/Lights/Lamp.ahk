#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\ILamp.ahk
#Include ..\..\Foundation\IClosable.ahk
#Include .\ILampStatics.ahk
#Include ..\..\Foundation\TypedEventHandler.ahk
#Include .\Lamp.ahk
#Include .\LampAvailabilityChangedEventArgs.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\..\WinRTEventHandler.ahk

/**
 * Represents a lamp device.
 * @remarks
 * A common scenario for using this class is adding a flashlight feature to your app that allows the user to manually turn on and off a device's camera torch light, if one is available.
 * 
 * The underlying device that this Lamp API represents is often shared with the device's camera flash and video light. 
 * If the Lamp is shared device, the camera use cases have priority over the underlying lamp device. 
 * Thus, simultaneous camera usage will result [AvailabilityChanged](lamp_availabilitychanged.md) event to be fired for the corresponding Lamp device, and reporting the device being unavailable.
 * @see https://learn.microsoft.com/uwp/api/windows.devices.lights.lamp
 * @namespace Windows.Devices.Lights
 * @version WindowsRuntime 1.4
 */
class Lamp extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => ILamp

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => ILamp.IID

;@endregion Static Properties

;@region Static Methods
    /**
     * Returns the class selection string that you can use to enumerate lamp devices.
     * @remarks
     * You can enumerate lamp devices by passing the class selection string returned by the GetDeviceSelector method to the [FindAllAsync](/uwp/api/windows.devices.enumeration.deviceinformation.findallasync) or [CreateWatcher](/uwp/api/windows.devices.enumeration.deviceinformation.createwatcher) method.
     * @returns {HSTRING} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.lights.lamp.getdeviceselector
     */
    static GetDeviceSelector() {
        if (!Lamp.HasProp("__ILampStatics")) {
            activatableClassId := HSTRING.Create("Windows.Devices.Lights.Lamp")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ILampStatics.IID)
            Lamp.__ILampStatics := ILampStatics(factoryPtr)
        }

        return Lamp.__ILampStatics.GetDeviceSelector()
    }

    /**
     * Gets a [Lamp](lamp.md) object representing the lamp device with the specified ID.
     * @remarks
     * Use [GetDefaultAsync](lamp_getdefaultasync_1549573963.md) to get the default lamp for a device. Enumerate lamp devices by passing the class selection string returned by the [GetDeviceSelector](lamp_getdeviceselector_838466080.md) method to the [FindAllAsync](../windows.devices.enumeration/deviceinformation_findallasync_1257462890.md) or [CreateWatcher](../windows.devices.enumeration/deviceinformation_createwatcher_1506431823.md) method. Once retrieved, use the [DeviceId](lamp_deviceid.md) property to retrieve the ID for the associated lamp.
     * @param {HSTRING} deviceId The ID of the requested lamp device.
     * @returns {IAsyncOperation<Lamp>} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.lights.lamp.fromidasync
     */
    static FromIdAsync(deviceId) {
        if (!Lamp.HasProp("__ILampStatics")) {
            activatableClassId := HSTRING.Create("Windows.Devices.Lights.Lamp")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ILampStatics.IID)
            Lamp.__ILampStatics := ILampStatics(factoryPtr)
        }

        return Lamp.__ILampStatics.FromIdAsync(deviceId)
    }

    /**
     * Gets a [Lamp](lamp.md) object representing the default lamp for the device.
     * @returns {IAsyncOperation<Lamp>} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.lights.lamp.getdefaultasync
     */
    static GetDefaultAsync() {
        if (!Lamp.HasProp("__ILampStatics")) {
            activatableClassId := HSTRING.Create("Windows.Devices.Lights.Lamp")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ILampStatics.IID)
            Lamp.__ILampStatics := ILampStatics(factoryPtr)
        }

        return Lamp.__ILampStatics.GetDefaultAsync()
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * Gets the [DeviceInformation Id](../windows.devices.enumeration/deviceinformation_id.md) for a lamp device.
     * @remarks
     * Pass this ID to the [FromIdAsync](lamp_fromidasync_1322863552.md) method to retrieve the associated [Lamp](lamp.md) object. Implement a handler for the [DeviceWatcher.Removed](../windows.devices.enumeration/devicewatcher_removed.md) event and compare the ID of the [DeviceInformationUpdate](../windows.devices.enumeration/deviceinformationupdate.md) argument to the ID of a [Lamp](lamp.md) object to be notified if the device becomes unavailable.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.lights.lamp.deviceid
     * @type {HSTRING} 
     */
    DeviceId {
        get => this.get_DeviceId()
    }

    /**
     * Gets or sets a value indicating whether the lamp device is enabled.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.lights.lamp.isenabled
     * @type {Boolean} 
     */
    IsEnabled {
        get => this.get_IsEnabled()
        set => this.put_IsEnabled(value)
    }

    /**
     * Gets or sets a value indicating the current brightness level of the lamp, where 0.0 is completely off and 1.0 is maximum brightness.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.lights.lamp.brightnesslevel
     * @type {Float} 
     */
    BrightnessLevel {
        get => this.get_BrightnessLevel()
        set => this.put_BrightnessLevel(value)
    }

    /**
     * Gets a value indicating whether you can set the [Color](lamp_color.md) property of the lamp device.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.lights.lamp.iscolorsettable
     * @type {Boolean} 
     */
    IsColorSettable {
        get => this.get_IsColorSettable()
    }

    /**
     * Gets or sets the color of the lamp.
     * @remarks
     * The alpha channel of the color is ignored by this API.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.lights.lamp.color
     * @type {Color} 
     */
    Color {
        get => this.get_Color()
        set => this.put_Color(value)
    }

    /**
     * Occurs when the availability of the lamp device changes.
     * @type {TypedEventHandler<Lamp, LampAvailabilityChangedEventArgs>}
    */
    OnAvailabilityChanged {
        get {
            if(!this.HasProp("__OnAvailabilityChanged")){
                this.__OnAvailabilityChanged := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{556a02d9-7685-576f-89ca-b62dc481d29d}"),
                    Lamp,
                    LampAvailabilityChangedEventArgs
                )
                this.__OnAvailabilityChangedToken := this.add_AvailabilityChanged(this.__OnAvailabilityChanged.iface)
            }
            return this.__OnAvailabilityChanged
        }
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    __Delete() {
        if(this.HasProp("__OnAvailabilityChangedToken")) {
            this.remove_AvailabilityChanged(this.__OnAvailabilityChangedToken)
            this.__OnAvailabilityChanged.iface.Dispose()
        }

        this.Close()

        super.__Delete()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_DeviceId() {
        if (!this.HasProp("__ILamp")) {
            if ((queryResult := this.QueryInterface(ILamp.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ILamp := ILamp(outPtr)
        }

        return this.__ILamp.get_DeviceId()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsEnabled() {
        if (!this.HasProp("__ILamp")) {
            if ((queryResult := this.QueryInterface(ILamp.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ILamp := ILamp(outPtr)
        }

        return this.__ILamp.get_IsEnabled()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_IsEnabled(value) {
        if (!this.HasProp("__ILamp")) {
            if ((queryResult := this.QueryInterface(ILamp.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ILamp := ILamp(outPtr)
        }

        return this.__ILamp.put_IsEnabled(value)
    }

    /**
     * 
     * @returns {Float} 
     */
    get_BrightnessLevel() {
        if (!this.HasProp("__ILamp")) {
            if ((queryResult := this.QueryInterface(ILamp.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ILamp := ILamp(outPtr)
        }

        return this.__ILamp.get_BrightnessLevel()
    }

    /**
     * 
     * @param {Float} value 
     * @returns {HRESULT} 
     */
    put_BrightnessLevel(value) {
        if (!this.HasProp("__ILamp")) {
            if ((queryResult := this.QueryInterface(ILamp.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ILamp := ILamp(outPtr)
        }

        return this.__ILamp.put_BrightnessLevel(value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsColorSettable() {
        if (!this.HasProp("__ILamp")) {
            if ((queryResult := this.QueryInterface(ILamp.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ILamp := ILamp(outPtr)
        }

        return this.__ILamp.get_IsColorSettable()
    }

    /**
     * 
     * @returns {Color} 
     */
    get_Color() {
        if (!this.HasProp("__ILamp")) {
            if ((queryResult := this.QueryInterface(ILamp.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ILamp := ILamp(outPtr)
        }

        return this.__ILamp.get_Color()
    }

    /**
     * 
     * @param {Color} value 
     * @returns {HRESULT} 
     */
    put_Color(value) {
        if (!this.HasProp("__ILamp")) {
            if ((queryResult := this.QueryInterface(ILamp.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ILamp := ILamp(outPtr)
        }

        return this.__ILamp.put_Color(value)
    }

    /**
     * 
     * @param {TypedEventHandler<Lamp, LampAvailabilityChangedEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_AvailabilityChanged(handler) {
        if (!this.HasProp("__ILamp")) {
            if ((queryResult := this.QueryInterface(ILamp.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ILamp := ILamp(outPtr)
        }

        return this.__ILamp.add_AvailabilityChanged(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_AvailabilityChanged(token) {
        if (!this.HasProp("__ILamp")) {
            if ((queryResult := this.QueryInterface(ILamp.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ILamp := ILamp(outPtr)
        }

        return this.__ILamp.remove_AvailabilityChanged(token)
    }

    /**
     * Releases the lamp device.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.lights.lamp.close
     */
    Close() {
        if (!this.HasProp("__IClosable")) {
            if ((queryResult := this.QueryInterface(IClosable.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IClosable := IClosable(outPtr)
        }

        return this.__IClosable.Close()
    }

;@endregion Instance Methods
}
