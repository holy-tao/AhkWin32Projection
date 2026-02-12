#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IGattLocalCharacteristic.ahk
#Include ..\..\..\Foundation\TypedEventHandler.ahk
#Include .\GattLocalCharacteristic.ahk
#Include .\GattReadRequestedEventArgs.ahk
#Include .\GattWriteRequestedEventArgs.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\..\WinRTEventHandler.ahk

/**
 * This class represents a local characteristic.
 * @remarks
 * Also see [Send notifications to subscribed clients](/windows/uwp/devices-sensors/gatt-server#send-notifications-to-subscribed-clients).
 * @see https://learn.microsoft.com/uwp/api/windows.devices.bluetooth.genericattributeprofile.gattlocalcharacteristic
 * @namespace Windows.Devices.Bluetooth.GenericAttributeProfile
 * @version WindowsRuntime 1.4
 */
class GattLocalCharacteristic extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IGattLocalCharacteristic

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IGattLocalCharacteristic.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the BluetoothSIG-defined UUID for this local characteristic.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.bluetooth.genericattributeprofile.gattlocalcharacteristic.uuid
     * @type {Guid} 
     */
    Uuid {
        get => this.get_Uuid()
    }

    /**
     * Gets the static value for this local GATT characteristic.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.bluetooth.genericattributeprofile.gattlocalcharacteristic.staticvalue
     * @type {IBuffer} 
     */
    StaticValue {
        get => this.get_StaticValue()
    }

    /**
     * Gets the local characteristic properties.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.bluetooth.genericattributeprofile.gattlocalcharacteristic.characteristicproperties
     * @type {Integer} 
     */
    CharacteristicProperties {
        get => this.get_CharacteristicProperties()
    }

    /**
     * Gets the read protection level of this local characteristic.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.bluetooth.genericattributeprofile.gattlocalcharacteristic.readprotectionlevel
     * @type {Integer} 
     */
    ReadProtectionLevel {
        get => this.get_ReadProtectionLevel()
    }

    /**
     * Gets the write protection level of this local characteristic.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.bluetooth.genericattributeprofile.gattlocalcharacteristic.writeprotectionlevel
     * @type {Integer} 
     */
    WriteProtectionLevel {
        get => this.get_WriteProtectionLevel()
    }

    /**
     * Gets a vector list of all the descriptors for this local characteristic.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.bluetooth.genericattributeprofile.gattlocalcharacteristic.descriptors
     * @type {IVectorView<GattLocalDescriptor>} 
     */
    Descriptors {
        get => this.get_Descriptors()
    }

    /**
     * Gets the user-friendly description for this local characteristic.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.bluetooth.genericattributeprofile.gattlocalcharacteristic.userdescription
     * @type {HSTRING} 
     */
    UserDescription {
        get => this.get_UserDescription()
    }

    /**
     * Gets the presentation formats for this local characteristic.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.bluetooth.genericattributeprofile.gattlocalcharacteristic.presentationformats
     * @type {IVectorView<GattPresentationFormat>} 
     */
    PresentationFormats {
        get => this.get_PresentationFormats()
    }

    /**
     * Gets a vector list of all clients that are subscribed to this local characteristic.
     * @remarks
     * Also see [Send notifications to subscribed clients](/windows/uwp/devices-sensors/gatt-server#send-notifications-to-subscribed-clients).
     * @see https://learn.microsoft.com/uwp/api/windows.devices.bluetooth.genericattributeprofile.gattlocalcharacteristic.subscribedclients
     * @type {IVectorView<GattSubscribedClient>} 
     */
    SubscribedClients {
        get => this.get_SubscribedClients()
    }

    /**
     * An event that's raised when the collection of clients subscribed to this local characteristic changes (that is, clients are added to, or removed from, that collection).
     * @remarks
     * Also see [Send notifications to subscribed clients](/windows/uwp/devices-sensors/gatt-server#send-notifications-to-subscribed-clients).
     * @type {TypedEventHandler<GattLocalCharacteristic, IInspectable>}
    */
    OnSubscribedClientsChanged {
        get {
            if(!this.HasProp("__OnSubscribedClientsChanged")){
                this.__OnSubscribedClientsChanged := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{8087acd6-aed7-53eb-9b23-4808bb910c17}"),
                    GattLocalCharacteristic,
                    IInspectable
                )
                this.__OnSubscribedClientsChangedToken := this.add_SubscribedClientsChanged(this.__OnSubscribedClientsChanged.iface)
            }
            return this.__OnSubscribedClientsChanged
        }
    }

    /**
     * An event that is triggered when a GATT client requests a read operation.
     * @type {TypedEventHandler<GattLocalCharacteristic, GattReadRequestedEventArgs>}
    */
    OnReadRequested {
        get {
            if(!this.HasProp("__OnReadRequested")){
                this.__OnReadRequested := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{218a3e4a-aa9d-500e-bca7-047751bb10a3}"),
                    GattLocalCharacteristic,
                    GattReadRequestedEventArgs
                )
                this.__OnReadRequestedToken := this.add_ReadRequested(this.__OnReadRequested.iface)
            }
            return this.__OnReadRequested
        }
    }

    /**
     * This is an event that is triggered when a write was requested.
     * @type {TypedEventHandler<GattLocalCharacteristic, GattWriteRequestedEventArgs>}
    */
    OnWriteRequested {
        get {
            if(!this.HasProp("__OnWriteRequested")){
                this.__OnWriteRequested := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{ed61a2fb-7d2a-5ba3-8ebf-8ad878e539a9}"),
                    GattLocalCharacteristic,
                    GattWriteRequestedEventArgs
                )
                this.__OnWriteRequestedToken := this.add_WriteRequested(this.__OnWriteRequested.iface)
            }
            return this.__OnWriteRequested
        }
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    __Delete() {
        if(this.HasProp("__OnSubscribedClientsChangedToken")) {
            this.remove_SubscribedClientsChanged(this.__OnSubscribedClientsChangedToken)
            this.__OnSubscribedClientsChanged.iface.Dispose()
        }

        if(this.HasProp("__OnReadRequestedToken")) {
            this.remove_ReadRequested(this.__OnReadRequestedToken)
            this.__OnReadRequested.iface.Dispose()
        }

        if(this.HasProp("__OnWriteRequestedToken")) {
            this.remove_WriteRequested(this.__OnWriteRequestedToken)
            this.__OnWriteRequested.iface.Dispose()
        }

        super.__Delete()
    }

    /**
     * 
     * @returns {Guid} 
     */
    get_Uuid() {
        if (!this.HasProp("__IGattLocalCharacteristic")) {
            if ((queryResult := this.QueryInterface(IGattLocalCharacteristic.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGattLocalCharacteristic := IGattLocalCharacteristic(outPtr)
        }

        return this.__IGattLocalCharacteristic.get_Uuid()
    }

    /**
     * 
     * @returns {IBuffer} 
     */
    get_StaticValue() {
        if (!this.HasProp("__IGattLocalCharacteristic")) {
            if ((queryResult := this.QueryInterface(IGattLocalCharacteristic.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGattLocalCharacteristic := IGattLocalCharacteristic(outPtr)
        }

        return this.__IGattLocalCharacteristic.get_StaticValue()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_CharacteristicProperties() {
        if (!this.HasProp("__IGattLocalCharacteristic")) {
            if ((queryResult := this.QueryInterface(IGattLocalCharacteristic.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGattLocalCharacteristic := IGattLocalCharacteristic(outPtr)
        }

        return this.__IGattLocalCharacteristic.get_CharacteristicProperties()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_ReadProtectionLevel() {
        if (!this.HasProp("__IGattLocalCharacteristic")) {
            if ((queryResult := this.QueryInterface(IGattLocalCharacteristic.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGattLocalCharacteristic := IGattLocalCharacteristic(outPtr)
        }

        return this.__IGattLocalCharacteristic.get_ReadProtectionLevel()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_WriteProtectionLevel() {
        if (!this.HasProp("__IGattLocalCharacteristic")) {
            if ((queryResult := this.QueryInterface(IGattLocalCharacteristic.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGattLocalCharacteristic := IGattLocalCharacteristic(outPtr)
        }

        return this.__IGattLocalCharacteristic.get_WriteProtectionLevel()
    }

    /**
     * Creates descriptor for this local characteristic.
     * @param {Guid} descriptorUuid The descriptor UUID.
     * @param {GattLocalDescriptorParameters} parameters The parameters for the descriptor.
     * @returns {IAsyncOperation<GattLocalDescriptorResult>} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.bluetooth.genericattributeprofile.gattlocalcharacteristic.createdescriptorasync
     */
    CreateDescriptorAsync(descriptorUuid, parameters) {
        if (!this.HasProp("__IGattLocalCharacteristic")) {
            if ((queryResult := this.QueryInterface(IGattLocalCharacteristic.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGattLocalCharacteristic := IGattLocalCharacteristic(outPtr)
        }

        return this.__IGattLocalCharacteristic.CreateDescriptorAsync(descriptorUuid, parameters)
    }

    /**
     * 
     * @returns {IVectorView<GattLocalDescriptor>} 
     */
    get_Descriptors() {
        if (!this.HasProp("__IGattLocalCharacteristic")) {
            if ((queryResult := this.QueryInterface(IGattLocalCharacteristic.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGattLocalCharacteristic := IGattLocalCharacteristic(outPtr)
        }

        return this.__IGattLocalCharacteristic.get_Descriptors()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_UserDescription() {
        if (!this.HasProp("__IGattLocalCharacteristic")) {
            if ((queryResult := this.QueryInterface(IGattLocalCharacteristic.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGattLocalCharacteristic := IGattLocalCharacteristic(outPtr)
        }

        return this.__IGattLocalCharacteristic.get_UserDescription()
    }

    /**
     * 
     * @returns {IVectorView<GattPresentationFormat>} 
     */
    get_PresentationFormats() {
        if (!this.HasProp("__IGattLocalCharacteristic")) {
            if ((queryResult := this.QueryInterface(IGattLocalCharacteristic.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGattLocalCharacteristic := IGattLocalCharacteristic(outPtr)
        }

        return this.__IGattLocalCharacteristic.get_PresentationFormats()
    }

    /**
     * 
     * @returns {IVectorView<GattSubscribedClient>} 
     */
    get_SubscribedClients() {
        if (!this.HasProp("__IGattLocalCharacteristic")) {
            if ((queryResult := this.QueryInterface(IGattLocalCharacteristic.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGattLocalCharacteristic := IGattLocalCharacteristic(outPtr)
        }

        return this.__IGattLocalCharacteristic.get_SubscribedClients()
    }

    /**
     * 
     * @param {TypedEventHandler<GattLocalCharacteristic, IInspectable>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_SubscribedClientsChanged(handler) {
        if (!this.HasProp("__IGattLocalCharacteristic")) {
            if ((queryResult := this.QueryInterface(IGattLocalCharacteristic.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGattLocalCharacteristic := IGattLocalCharacteristic(outPtr)
        }

        return this.__IGattLocalCharacteristic.add_SubscribedClientsChanged(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_SubscribedClientsChanged(token) {
        if (!this.HasProp("__IGattLocalCharacteristic")) {
            if ((queryResult := this.QueryInterface(IGattLocalCharacteristic.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGattLocalCharacteristic := IGattLocalCharacteristic(outPtr)
        }

        return this.__IGattLocalCharacteristic.remove_SubscribedClientsChanged(token)
    }

    /**
     * 
     * @param {TypedEventHandler<GattLocalCharacteristic, GattReadRequestedEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_ReadRequested(handler) {
        if (!this.HasProp("__IGattLocalCharacteristic")) {
            if ((queryResult := this.QueryInterface(IGattLocalCharacteristic.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGattLocalCharacteristic := IGattLocalCharacteristic(outPtr)
        }

        return this.__IGattLocalCharacteristic.add_ReadRequested(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_ReadRequested(token) {
        if (!this.HasProp("__IGattLocalCharacteristic")) {
            if ((queryResult := this.QueryInterface(IGattLocalCharacteristic.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGattLocalCharacteristic := IGattLocalCharacteristic(outPtr)
        }

        return this.__IGattLocalCharacteristic.remove_ReadRequested(token)
    }

    /**
     * 
     * @param {TypedEventHandler<GattLocalCharacteristic, GattWriteRequestedEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_WriteRequested(handler) {
        if (!this.HasProp("__IGattLocalCharacteristic")) {
            if ((queryResult := this.QueryInterface(IGattLocalCharacteristic.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGattLocalCharacteristic := IGattLocalCharacteristic(outPtr)
        }

        return this.__IGattLocalCharacteristic.add_WriteRequested(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_WriteRequested(token) {
        if (!this.HasProp("__IGattLocalCharacteristic")) {
            if ((queryResult := this.QueryInterface(IGattLocalCharacteristic.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGattLocalCharacteristic := IGattLocalCharacteristic(outPtr)
        }

        return this.__IGattLocalCharacteristic.remove_WriteRequested(token)
    }

    /**
     * Sends and notifies a GattSubscribedClient of a value.
     * @param {IBuffer} value The buffer that contains the value to send to the GattSubscribedClient.
     * @returns {IAsyncOperation<IVectorView<GattClientNotificationResult>>} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.bluetooth.genericattributeprofile.gattlocalcharacteristic.notifyvalueasync
     */
    NotifyValueAsync(value) {
        if (!this.HasProp("__IGattLocalCharacteristic")) {
            if ((queryResult := this.QueryInterface(IGattLocalCharacteristic.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGattLocalCharacteristic := IGattLocalCharacteristic(outPtr)
        }

        return this.__IGattLocalCharacteristic.NotifyValueAsync(value)
    }

    /**
     * Send and notifies all subscribed clients a GattSubscribedClient of a value.
     * @param {IBuffer} value The buffer that contains the value to send to the GattSubscribedClient.
     * @param {GattSubscribedClient} subscribedClient 
     * @returns {IAsyncOperation<GattClientNotificationResult>} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.bluetooth.genericattributeprofile.gattlocalcharacteristic.notifyvalueasync
     */
    NotifyValueForSubscribedClientAsync(value, subscribedClient) {
        if (!this.HasProp("__IGattLocalCharacteristic")) {
            if ((queryResult := this.QueryInterface(IGattLocalCharacteristic.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGattLocalCharacteristic := IGattLocalCharacteristic(outPtr)
        }

        return this.__IGattLocalCharacteristic.NotifyValueForSubscribedClientAsync(value, subscribedClient)
    }

;@endregion Instance Methods
}
