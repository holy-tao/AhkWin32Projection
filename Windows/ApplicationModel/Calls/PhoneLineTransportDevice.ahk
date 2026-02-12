#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IPhoneLineTransportDevice.ahk
#Include .\IPhoneLineTransportDevice2.ahk
#Include .\IPhoneLineTransportDeviceStatics.ahk
#Include ..\..\Foundation\TypedEventHandler.ahk
#Include .\PhoneLineTransportDevice.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\..\WinRTEventHandler.ahk

/**
 * Represents the hardware device associated with a PhoneLine. Currently only supported for use with bluetooth devices.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.calls.phonelinetransportdevice
 * @namespace Windows.ApplicationModel.Calls
 * @version WindowsRuntime 1.4
 */
class PhoneLineTransportDevice extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IPhoneLineTransportDevice

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IPhoneLineTransportDevice.IID

;@endregion Static Properties

;@region Static Methods
    /**
     * Gets the PhoneLineTransportDevice from the given DeviceId.
     * @param {HSTRING} id A [DeviceId](../windows.devices.enumeration/deviceinformation_id.md).
     * @returns {PhoneLineTransportDevice} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.calls.phonelinetransportdevice.fromid
     */
    static FromId(id) {
        if (!PhoneLineTransportDevice.HasProp("__IPhoneLineTransportDeviceStatics")) {
            activatableClassId := HSTRING.Create("Windows.ApplicationModel.Calls.PhoneLineTransportDevice")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IPhoneLineTransportDeviceStatics.IID)
            PhoneLineTransportDevice.__IPhoneLineTransportDeviceStatics := IPhoneLineTransportDeviceStatics(factoryPtr)
        }

        return PhoneLineTransportDevice.__IPhoneLineTransportDeviceStatics.FromId(id)
    }

    /**
     * Gets an Advanced Query Syntax (AQS) string that the app can pass to [DeviceInformation.FindAllAsync](../windows.devices.enumeration/deviceinformation_findallasync_1257462890.md) in order to find PhoneLineTransportDevices of the given type.
     * @returns {HSTRING} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.calls.phonelinetransportdevice.getdeviceselector
     */
    static GetDeviceSelector() {
        if (!PhoneLineTransportDevice.HasProp("__IPhoneLineTransportDeviceStatics")) {
            activatableClassId := HSTRING.Create("Windows.ApplicationModel.Calls.PhoneLineTransportDevice")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IPhoneLineTransportDeviceStatics.IID)
            PhoneLineTransportDevice.__IPhoneLineTransportDeviceStatics := IPhoneLineTransportDeviceStatics(factoryPtr)
        }

        return PhoneLineTransportDevice.__IPhoneLineTransportDeviceStatics.GetDeviceSelector()
    }

    /**
     * Gets an Advanced Query Syntax (AQS) string that the app can pass to [DeviceInformation.FindAllAsync](../windows.devices.enumeration/deviceinformation_findallasync_1257462890.md) in order to find PhoneLineTransportDevices.
     * @param {Integer} transport 
     * @returns {HSTRING} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.calls.phonelinetransportdevice.getdeviceselector
     */
    static GetDeviceSelectorForPhoneLineTransport(transport) {
        if (!PhoneLineTransportDevice.HasProp("__IPhoneLineTransportDeviceStatics")) {
            activatableClassId := HSTRING.Create("Windows.ApplicationModel.Calls.PhoneLineTransportDevice")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IPhoneLineTransportDeviceStatics.IID)
            PhoneLineTransportDevice.__IPhoneLineTransportDeviceStatics := IPhoneLineTransportDeviceStatics(factoryPtr)
        }

        return PhoneLineTransportDevice.__IPhoneLineTransportDeviceStatics.GetDeviceSelectorForPhoneLineTransport(transport)
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * Gets the DeviceID of the hardware device associated with the PhoneLineTransportDevice.
     * @remarks
     * The DeviceId comes from the [Windows.Devices.Enumerations.DeviceInformation.ID](../windows.devices.enumeration/deviceinformation_id.md).
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.calls.phonelinetransportdevice.deviceid
     * @type {HSTRING} 
     */
    DeviceId {
        get => this.get_DeviceId()
    }

    /**
     * Gets the PhoneLineTransport for the PhoneLineTransportDevice.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.calls.phonelinetransportdevice.transport
     * @type {Integer} 
     */
    Transport {
        get => this.get_Transport()
    }

    /**
     * Gets the audio routing status of the underlying transport device.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.calls.phonelinetransportdevice.audioroutingstatus
     * @type {Integer} 
     */
    AudioRoutingStatus {
        get => this.get_AudioRoutingStatus()
    }

    /**
     * Gets the in-band ringtone enable status of the underlying transport device.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.calls.phonelinetransportdevice.inbandringingenabled
     * @type {Boolean} 
     */
    InBandRingingEnabled {
        get => this.get_InBandRingingEnabled()
    }

    /**
     * An event that's raised when the audio routing of the underlying transport device changes.
     * @type {TypedEventHandler<PhoneLineTransportDevice, IInspectable>}
    */
    OnAudioRoutingStatusChanged {
        get {
            if(!this.HasProp("__OnAudioRoutingStatusChanged")){
                this.__OnAudioRoutingStatusChanged := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{b20415a7-ef40-50db-9340-ef10915d76f9}"),
                    PhoneLineTransportDevice,
                    IInspectable
                )
                this.__OnAudioRoutingStatusChangedToken := this.add_AudioRoutingStatusChanged(this.__OnAudioRoutingStatusChanged.iface)
            }
            return this.__OnAudioRoutingStatusChanged
        }
    }

    /**
     * An event that's raised when the in-band ringtone enable status changes.
     * @type {TypedEventHandler<PhoneLineTransportDevice, IInspectable>}
    */
    OnInBandRingingEnabledChanged {
        get {
            if(!this.HasProp("__OnInBandRingingEnabledChanged")){
                this.__OnInBandRingingEnabledChanged := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{b20415a7-ef40-50db-9340-ef10915d76f9}"),
                    PhoneLineTransportDevice,
                    IInspectable
                )
                this.__OnInBandRingingEnabledChangedToken := this.add_InBandRingingEnabledChanged(this.__OnInBandRingingEnabledChanged.iface)
            }
            return this.__OnInBandRingingEnabledChanged
        }
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    __Delete() {
        if(this.HasProp("__OnAudioRoutingStatusChangedToken")) {
            this.remove_AudioRoutingStatusChanged(this.__OnAudioRoutingStatusChangedToken)
            this.__OnAudioRoutingStatusChanged.iface.Dispose()
        }

        if(this.HasProp("__OnInBandRingingEnabledChangedToken")) {
            this.remove_InBandRingingEnabledChanged(this.__OnInBandRingingEnabledChangedToken)
            this.__OnInBandRingingEnabledChanged.iface.Dispose()
        }

        super.__Delete()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_DeviceId() {
        if (!this.HasProp("__IPhoneLineTransportDevice")) {
            if ((queryResult := this.QueryInterface(IPhoneLineTransportDevice.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPhoneLineTransportDevice := IPhoneLineTransportDevice(outPtr)
        }

        return this.__IPhoneLineTransportDevice.get_DeviceId()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Transport() {
        if (!this.HasProp("__IPhoneLineTransportDevice")) {
            if ((queryResult := this.QueryInterface(IPhoneLineTransportDevice.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPhoneLineTransportDevice := IPhoneLineTransportDevice(outPtr)
        }

        return this.__IPhoneLineTransportDevice.get_Transport()
    }

    /**
     * Used to request explicit access to the PhoneLineTransportDevice.
     * @returns {IAsyncOperation<Integer>} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.calls.phonelinetransportdevice.requestaccessasync
     */
    RequestAccessAsync() {
        if (!this.HasProp("__IPhoneLineTransportDevice")) {
            if ((queryResult := this.QueryInterface(IPhoneLineTransportDevice.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPhoneLineTransportDevice := IPhoneLineTransportDevice(outPtr)
        }

        return this.__IPhoneLineTransportDevice.RequestAccessAsync()
    }

    /**
     * Registers the app with Windows for the associated PhoneLineTransportDevice.
     * @remarks
     * Registration is necessary in order to see the PhoneLine for this PhoneLineTransportDevice. Registration is per user, so each user must individually register for the PhoneLineTransportDevice. Registration persists until the app is unregistered or the PhoneLineTransportDevice is removed.
     * 
     * For multi-user applications, use [RegisterAppForUser](phonelinetransportdevice_registerappforuser_1944233497.md).
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.calls.phonelinetransportdevice.registerapp
     */
    RegisterApp() {
        if (!this.HasProp("__IPhoneLineTransportDevice")) {
            if ((queryResult := this.QueryInterface(IPhoneLineTransportDevice.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPhoneLineTransportDevice := IPhoneLineTransportDevice(outPtr)
        }

        return this.__IPhoneLineTransportDevice.RegisterApp()
    }

    /**
     * Registers the app with Windows for the associated PhoneLineTransportDevice.
     * @remarks
     * This is used instead of **RegisterApp()** in multi-user applications to differentiate which user to register. Registration is necessary in order to see the PhoneLine for this PhoneLineTransportDevice. Registration is per user, so each user must individually register for the PhoneLineTransportDevice. Registration persists until the app is unregistered or the PhoneLineTransportDevice is removed.
     * @param {User} user_ User being registered.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.calls.phonelinetransportdevice.registerappforuser
     */
    RegisterAppForUser(user_) {
        if (!this.HasProp("__IPhoneLineTransportDevice")) {
            if ((queryResult := this.QueryInterface(IPhoneLineTransportDevice.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPhoneLineTransportDevice := IPhoneLineTransportDevice(outPtr)
        }

        return this.__IPhoneLineTransportDevice.RegisterAppForUser(user_)
    }

    /**
     * Unregisters the app with Windows for the associated PhoneLineTransportDevice.
     * @remarks
     * For use in single user applications.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.calls.phonelinetransportdevice.unregisterapp
     */
    UnregisterApp() {
        if (!this.HasProp("__IPhoneLineTransportDevice")) {
            if ((queryResult := this.QueryInterface(IPhoneLineTransportDevice.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPhoneLineTransportDevice := IPhoneLineTransportDevice(outPtr)
        }

        return this.__IPhoneLineTransportDevice.UnregisterApp()
    }

    /**
     * Unregisters the app with Windows for the associated PhoneLineTransportDevice.
     * @remarks
     * For use in multi-user applications.
     * @param {User} user_ The User to unregister.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.calls.phonelinetransportdevice.unregisterappforuser
     */
    UnregisterAppForUser(user_) {
        if (!this.HasProp("__IPhoneLineTransportDevice")) {
            if ((queryResult := this.QueryInterface(IPhoneLineTransportDevice.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPhoneLineTransportDevice := IPhoneLineTransportDevice(outPtr)
        }

        return this.__IPhoneLineTransportDevice.UnregisterAppForUser(user_)
    }

    /**
     * Returns the registration status of the app for the active user.
     * @returns {Boolean} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.calls.phonelinetransportdevice.isregistered
     */
    IsRegistered() {
        if (!this.HasProp("__IPhoneLineTransportDevice")) {
            if ((queryResult := this.QueryInterface(IPhoneLineTransportDevice.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPhoneLineTransportDevice := IPhoneLineTransportDevice(outPtr)
        }

        return this.__IPhoneLineTransportDevice.IsRegistered()
    }

    /**
     * Attempts to establish a connection with the device.
     * @returns {Boolean} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.calls.phonelinetransportdevice.connect
     */
    Connect() {
        if (!this.HasProp("__IPhoneLineTransportDevice")) {
            if ((queryResult := this.QueryInterface(IPhoneLineTransportDevice.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPhoneLineTransportDevice := IPhoneLineTransportDevice(outPtr)
        }

        return this.__IPhoneLineTransportDevice.Connect()
    }

    /**
     * Attempts to asynchronously establish a connection with the device.
     * @returns {IAsyncOperation<Boolean>} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.calls.phonelinetransportdevice.connectasync
     */
    ConnectAsync() {
        if (!this.HasProp("__IPhoneLineTransportDevice")) {
            if ((queryResult := this.QueryInterface(IPhoneLineTransportDevice.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPhoneLineTransportDevice := IPhoneLineTransportDevice(outPtr)
        }

        return this.__IPhoneLineTransportDevice.ConnectAsync()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_AudioRoutingStatus() {
        if (!this.HasProp("__IPhoneLineTransportDevice2")) {
            if ((queryResult := this.QueryInterface(IPhoneLineTransportDevice2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPhoneLineTransportDevice2 := IPhoneLineTransportDevice2(outPtr)
        }

        return this.__IPhoneLineTransportDevice2.get_AudioRoutingStatus()
    }

    /**
     * 
     * @param {TypedEventHandler<PhoneLineTransportDevice, IInspectable>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_AudioRoutingStatusChanged(handler) {
        if (!this.HasProp("__IPhoneLineTransportDevice2")) {
            if ((queryResult := this.QueryInterface(IPhoneLineTransportDevice2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPhoneLineTransportDevice2 := IPhoneLineTransportDevice2(outPtr)
        }

        return this.__IPhoneLineTransportDevice2.add_AudioRoutingStatusChanged(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_AudioRoutingStatusChanged(token) {
        if (!this.HasProp("__IPhoneLineTransportDevice2")) {
            if ((queryResult := this.QueryInterface(IPhoneLineTransportDevice2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPhoneLineTransportDevice2 := IPhoneLineTransportDevice2(outPtr)
        }

        return this.__IPhoneLineTransportDevice2.remove_AudioRoutingStatusChanged(token)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_InBandRingingEnabled() {
        if (!this.HasProp("__IPhoneLineTransportDevice2")) {
            if ((queryResult := this.QueryInterface(IPhoneLineTransportDevice2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPhoneLineTransportDevice2 := IPhoneLineTransportDevice2(outPtr)
        }

        return this.__IPhoneLineTransportDevice2.get_InBandRingingEnabled()
    }

    /**
     * 
     * @param {TypedEventHandler<PhoneLineTransportDevice, IInspectable>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_InBandRingingEnabledChanged(handler) {
        if (!this.HasProp("__IPhoneLineTransportDevice2")) {
            if ((queryResult := this.QueryInterface(IPhoneLineTransportDevice2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPhoneLineTransportDevice2 := IPhoneLineTransportDevice2(outPtr)
        }

        return this.__IPhoneLineTransportDevice2.add_InBandRingingEnabledChanged(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_InBandRingingEnabledChanged(token) {
        if (!this.HasProp("__IPhoneLineTransportDevice2")) {
            if ((queryResult := this.QueryInterface(IPhoneLineTransportDevice2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPhoneLineTransportDevice2 := IPhoneLineTransportDevice2(outPtr)
        }

        return this.__IPhoneLineTransportDevice2.remove_InBandRingingEnabledChanged(token)
    }

;@endregion Instance Methods
}
