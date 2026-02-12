#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IGattCharacteristic.ahk
#Include .\IGattCharacteristic2.ahk
#Include .\IGattCharacteristic3.ahk
#Include .\IGattCharacteristicStatics.ahk
#Include ..\..\..\Foundation\TypedEventHandler.ahk
#Include .\GattCharacteristic.ahk
#Include .\GattValueChangedEventArgs.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\..\WinRTEventHandler.ahk

/**
 * Represents a Characteristic of a GATT service. The GattCharacteristic object represents a GATT Characteristic of a particular service, and is obtained from the Characteristics property of the GattDeviceService object.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.devices.bluetooth.genericattributeprofile.gattcharacteristic
 * @namespace Windows.Devices.Bluetooth.GenericAttributeProfile
 * @version WindowsRuntime 1.4
 */
class GattCharacteristic extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IGattCharacteristic

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IGattCharacteristic.IID

;@endregion Static Properties

;@region Static Methods
    /**
     * Converts a Bluetooth SIG defined short Id to a full GATT UUID.
     * 
     * > [!IMPORTANT]
     * > The **ConvertShortIdToUuid** API is deprecated, and it may not be available in future versions of Windows. Instead, use [BluetoothUuidHelper.FromShortId](/uwp/api/windows.devices.bluetooth.bluetoothuuidhelper.fromshortid).
     * @param {Integer} shortId A 16-bit Bluetooth GATT Service UUID.
     * @returns {Guid} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.bluetooth.genericattributeprofile.gattcharacteristic.convertshortidtouuid
     */
    static ConvertShortIdToUuid(shortId) {
        if (!GattCharacteristic.HasProp("__IGattCharacteristicStatics")) {
            activatableClassId := HSTRING.Create("Windows.Devices.Bluetooth.GenericAttributeProfile.GattCharacteristic")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IGattCharacteristicStatics.IID)
            GattCharacteristic.__IGattCharacteristicStatics := IGattCharacteristicStatics(factoryPtr)
        }

        return GattCharacteristic.__IGattCharacteristicStatics.ConvertShortIdToUuid(shortId)
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * Gets the GATT characteristic properties, as defined by the GATT profile.
     * 
     * If the *ExtendedProperties* flag is present it also represents the properties of the Extended Characteristic Properties Descriptor.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.bluetooth.genericattributeprofile.gattcharacteristic.characteristicproperties
     * @type {Integer} 
     */
    CharacteristicProperties {
        get => this.get_CharacteristicProperties()
    }

    /**
     * Gets or sets the desired GATT security options for over the air communication with the device.
     * 
     * Windows will negotiate the maximum security possible with the device as part of the pairing process, and specifying a lower level of security won’t degrade the existing security level.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.bluetooth.genericattributeprofile.gattcharacteristic.protectionlevel
     * @type {Integer} 
     */
    ProtectionLevel {
        get => this.get_ProtectionLevel()
        set => this.put_ProtectionLevel(value)
    }

    /**
     * Get the user friendly description for this GattCharacteristic, if the User Description Descriptor is present, otherwise this will be an empty string.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.bluetooth.genericattributeprofile.gattcharacteristic.userdescription
     * @type {HSTRING} 
     */
    UserDescription {
        get => this.get_UserDescription()
    }

    /**
     * Gets the GATT Characteristic UUID for this GattCharacteristic.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.bluetooth.genericattributeprofile.gattcharacteristic.uuid
     * @type {Guid} 
     */
    Uuid {
        get => this.get_Uuid()
    }

    /**
     * Gets the handle used to uniquely identify GATT-based characteristic attributes as declared on the Bluetooth LE device.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.bluetooth.genericattributeprofile.gattcharacteristic.attributehandle
     * @type {Integer} 
     */
    AttributeHandle {
        get => this.get_AttributeHandle()
    }

    /**
     * Gets the list of presentation format descriptors associated with this GattCharacteristic, in the order specified by the Aggregate Format Descriptor.
     * 
     * The list shall be empty if no PresentationFormat or Aggregate Format descriptors are found.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.bluetooth.genericattributeprofile.gattcharacteristic.presentationformats
     * @type {IVectorView<GattPresentationFormat>} 
     */
    PresentationFormats {
        get => this.get_PresentationFormats()
    }

    /**
     * Gets the [GattDeviceService](gattdeviceservice.md) of which this characteristic is a member.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.bluetooth.genericattributeprofile.gattcharacteristic.service
     * @type {GattDeviceService} 
     */
    Service {
        get => this.get_Service()
    }

    /**
     * An App can register an event handler in order to receive events when notification or indications are received from a device, after setting the Client Characteristic Configuration Descriptor.
     * @remarks
     * The [GattValueChangedEventArgs](gattvaluechangedeventargs.md) object represents the arguments received by a ValueChanged event handler used to process characteristic value change notification and indication events sent by a Bluetooth LE device.
     * @type {TypedEventHandler<GattCharacteristic, GattValueChangedEventArgs>}
    */
    OnValueChanged {
        get {
            if(!this.HasProp("__OnValueChanged")){
                this.__OnValueChanged := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{c1f420f6-6292-5760-a2c9-9ddf98683cfc}"),
                    GattCharacteristic,
                    GattValueChangedEventArgs
                )
                this.__OnValueChangedToken := this.add_ValueChanged(this.__OnValueChanged.iface)
            }
            return this.__OnValueChanged
        }
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    __Delete() {
        if(this.HasProp("__OnValueChangedToken")) {
            this.remove_ValueChanged(this.__OnValueChangedToken)
            this.__OnValueChanged.iface.Dispose()
        }

        super.__Delete()
    }

    /**
     * Returns a vector of descriptors, that are identified by the specified UUID, and belong to this GattCharacteristic instance.
     * 
     * > [!IMPORTANT]
     * > The **GetDescriptors** API is deprecated, and it may not be available in future versions of Windows. Instead, use [GetDescriptorsForUuidAsync](/uwp/api/windows.devices.bluetooth.genericattributeprofile.gattcharacteristic.getdescriptorsforuuidasync).
     * @param {Guid} descriptorUuid The UUID for the descriptors to be retrieved.
     * @returns {IVectorView<GattDescriptor>} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.bluetooth.genericattributeprofile.gattcharacteristic.getdescriptors
     */
    GetDescriptors(descriptorUuid) {
        if (!this.HasProp("__IGattCharacteristic")) {
            if ((queryResult := this.QueryInterface(IGattCharacteristic.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGattCharacteristic := IGattCharacteristic(outPtr)
        }

        return this.__IGattCharacteristic.GetDescriptors(descriptorUuid)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_CharacteristicProperties() {
        if (!this.HasProp("__IGattCharacteristic")) {
            if ((queryResult := this.QueryInterface(IGattCharacteristic.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGattCharacteristic := IGattCharacteristic(outPtr)
        }

        return this.__IGattCharacteristic.get_CharacteristicProperties()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_ProtectionLevel() {
        if (!this.HasProp("__IGattCharacteristic")) {
            if ((queryResult := this.QueryInterface(IGattCharacteristic.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGattCharacteristic := IGattCharacteristic(outPtr)
        }

        return this.__IGattCharacteristic.get_ProtectionLevel()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_ProtectionLevel(value) {
        if (!this.HasProp("__IGattCharacteristic")) {
            if ((queryResult := this.QueryInterface(IGattCharacteristic.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGattCharacteristic := IGattCharacteristic(outPtr)
        }

        return this.__IGattCharacteristic.put_ProtectionLevel(value)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_UserDescription() {
        if (!this.HasProp("__IGattCharacteristic")) {
            if ((queryResult := this.QueryInterface(IGattCharacteristic.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGattCharacteristic := IGattCharacteristic(outPtr)
        }

        return this.__IGattCharacteristic.get_UserDescription()
    }

    /**
     * 
     * @returns {Guid} 
     */
    get_Uuid() {
        if (!this.HasProp("__IGattCharacteristic")) {
            if ((queryResult := this.QueryInterface(IGattCharacteristic.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGattCharacteristic := IGattCharacteristic(outPtr)
        }

        return this.__IGattCharacteristic.get_Uuid()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_AttributeHandle() {
        if (!this.HasProp("__IGattCharacteristic")) {
            if ((queryResult := this.QueryInterface(IGattCharacteristic.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGattCharacteristic := IGattCharacteristic(outPtr)
        }

        return this.__IGattCharacteristic.get_AttributeHandle()
    }

    /**
     * 
     * @returns {IVectorView<GattPresentationFormat>} 
     */
    get_PresentationFormats() {
        if (!this.HasProp("__IGattCharacteristic")) {
            if ((queryResult := this.QueryInterface(IGattCharacteristic.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGattCharacteristic := IGattCharacteristic(outPtr)
        }

        return this.__IGattCharacteristic.get_PresentationFormats()
    }

    /**
     * Performs a Characteristic Value read either from the value cache maintained by Windows, or directly from the device.
     * @returns {IAsyncOperation<GattReadResult>} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.bluetooth.genericattributeprofile.gattcharacteristic.readvalueasync
     */
    ReadValueAsync() {
        if (!this.HasProp("__IGattCharacteristic")) {
            if ((queryResult := this.QueryInterface(IGattCharacteristic.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGattCharacteristic := IGattCharacteristic(outPtr)
        }

        return this.__IGattCharacteristic.ReadValueAsync()
    }

    /**
     * Performs a Characteristic Value read from the value cache maintained by Windows.
     * @param {Integer} cacheMode_ 
     * @returns {IAsyncOperation<GattReadResult>} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.bluetooth.genericattributeprofile.gattcharacteristic.readvalueasync
     */
    ReadValueWithCacheModeAsync(cacheMode_) {
        if (!this.HasProp("__IGattCharacteristic")) {
            if ((queryResult := this.QueryInterface(IGattCharacteristic.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGattCharacteristic := IGattCharacteristic(outPtr)
        }

        return this.__IGattCharacteristic.ReadValueWithCacheModeAsync(cacheMode_)
    }

    /**
     * Performs a Characteristic Value write to a Bluetooth LE device.
     * @param {IBuffer} value A Windows.Storage.Streams.IBuffer object which contains the data to be written to the Bluetooth LE device.
     * @returns {IAsyncOperation<Integer>} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.bluetooth.genericattributeprofile.gattcharacteristic.writevalueasync
     */
    WriteValueAsync(value) {
        if (!this.HasProp("__IGattCharacteristic")) {
            if ((queryResult := this.QueryInterface(IGattCharacteristic.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGattCharacteristic := IGattCharacteristic(outPtr)
        }

        return this.__IGattCharacteristic.WriteValueAsync(value)
    }

    /**
     * Performs a Characteristic Value write to a Bluetooth LE device.
     * @param {IBuffer} value A Windows.Storage.Streams.IBuffer object which contains the data to be written to the Bluetooth LE device.
     * @param {Integer} writeOption 
     * @returns {IAsyncOperation<Integer>} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.bluetooth.genericattributeprofile.gattcharacteristic.writevalueasync
     */
    WriteValueWithOptionAsync(value, writeOption) {
        if (!this.HasProp("__IGattCharacteristic")) {
            if ((queryResult := this.QueryInterface(IGattCharacteristic.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGattCharacteristic := IGattCharacteristic(outPtr)
        }

        return this.__IGattCharacteristic.WriteValueWithOptionAsync(value, writeOption)
    }

    /**
     * Reads the current value of the ClientCharacteristicConfigurationDescriptor.
     * @returns {IAsyncOperation<GattReadClientCharacteristicConfigurationDescriptorResult>} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.bluetooth.genericattributeprofile.gattcharacteristic.readclientcharacteristicconfigurationdescriptorasync
     */
    ReadClientCharacteristicConfigurationDescriptorAsync() {
        if (!this.HasProp("__IGattCharacteristic")) {
            if ((queryResult := this.QueryInterface(IGattCharacteristic.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGattCharacteristic := IGattCharacteristic(outPtr)
        }

        return this.__IGattCharacteristic.ReadClientCharacteristicConfigurationDescriptorAsync()
    }

    /**
     * Writes the ClientCharacteristicConfigurationDescriptor to the Bluetooth LE device, and if the value to be written represents an indication or a notification and a ValueChanged event handler is registered, enables receiving ValueChanged events from the device.
     * @param {Integer} clientCharacteristicConfigurationDescriptorValue Specifies a new value for the ClientCharacteristicConfigurationDescriptor of this Characteristic object.
     * @returns {IAsyncOperation<Integer>} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.bluetooth.genericattributeprofile.gattcharacteristic.writeclientcharacteristicconfigurationdescriptorasync
     */
    WriteClientCharacteristicConfigurationDescriptorAsync(clientCharacteristicConfigurationDescriptorValue) {
        if (!this.HasProp("__IGattCharacteristic")) {
            if ((queryResult := this.QueryInterface(IGattCharacteristic.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGattCharacteristic := IGattCharacteristic(outPtr)
        }

        return this.__IGattCharacteristic.WriteClientCharacteristicConfigurationDescriptorAsync(clientCharacteristicConfigurationDescriptorValue)
    }

    /**
     * 
     * @param {TypedEventHandler<GattCharacteristic, GattValueChangedEventArgs>} valueChangedHandler 
     * @returns {EventRegistrationToken} 
     */
    add_ValueChanged(valueChangedHandler) {
        if (!this.HasProp("__IGattCharacteristic")) {
            if ((queryResult := this.QueryInterface(IGattCharacteristic.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGattCharacteristic := IGattCharacteristic(outPtr)
        }

        return this.__IGattCharacteristic.add_ValueChanged(valueChangedHandler)
    }

    /**
     * 
     * @param {EventRegistrationToken} valueChangedEventCookie 
     * @returns {HRESULT} 
     */
    remove_ValueChanged(valueChangedEventCookie) {
        if (!this.HasProp("__IGattCharacteristic")) {
            if ((queryResult := this.QueryInterface(IGattCharacteristic.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGattCharacteristic := IGattCharacteristic(outPtr)
        }

        return this.__IGattCharacteristic.remove_ValueChanged(valueChangedEventCookie)
    }

    /**
     * 
     * @returns {GattDeviceService} 
     */
    get_Service() {
        if (!this.HasProp("__IGattCharacteristic2")) {
            if ((queryResult := this.QueryInterface(IGattCharacteristic2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGattCharacteristic2 := IGattCharacteristic2(outPtr)
        }

        return this.__IGattCharacteristic2.get_Service()
    }

    /**
     * Gets the collection of all descriptors belonging to this GattCharacteristic instance.
     * 
     * > [!IMPORTANT]
     * > The **GetAllDescriptors** API is deprecated, and it may not be available in future versions of Windows. Instead, use [GetDescriptorsAsync](/uwp/api/windows.devices.bluetooth.genericattributeprofile.gattcharacteristic.getdescriptorsasync).
     * @returns {IVectorView<GattDescriptor>} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.bluetooth.genericattributeprofile.gattcharacteristic.getalldescriptors
     */
    GetAllDescriptors() {
        if (!this.HasProp("__IGattCharacteristic2")) {
            if ((queryResult := this.QueryInterface(IGattCharacteristic2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGattCharacteristic2 := IGattCharacteristic2(outPtr)
        }

        return this.__IGattCharacteristic2.GetAllDescriptors()
    }

    /**
     * Returns the descriptors with the specified cache mode for this GattCharacteristic instance.
     * @returns {IAsyncOperation<GattDescriptorsResult>} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.bluetooth.genericattributeprofile.gattcharacteristic.getdescriptorsasync
     */
    GetDescriptorsAsync() {
        if (!this.HasProp("__IGattCharacteristic3")) {
            if ((queryResult := this.QueryInterface(IGattCharacteristic3.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGattCharacteristic3 := IGattCharacteristic3(outPtr)
        }

        return this.__IGattCharacteristic3.GetDescriptorsAsync()
    }

    /**
     * Returns the descriptors for this GattCharacteristic instance.
     * @param {Integer} cacheMode_ 
     * @returns {IAsyncOperation<GattDescriptorsResult>} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.bluetooth.genericattributeprofile.gattcharacteristic.getdescriptorsasync
     */
    GetDescriptorsWithCacheModeAsync(cacheMode_) {
        if (!this.HasProp("__IGattCharacteristic3")) {
            if ((queryResult := this.QueryInterface(IGattCharacteristic3.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGattCharacteristic3 := IGattCharacteristic3(outPtr)
        }

        return this.__IGattCharacteristic3.GetDescriptorsWithCacheModeAsync(cacheMode_)
    }

    /**
     * Returns the descriptors whose UUIDs match descriptorUuid with the specified cacheMode.
     * @param {Guid} descriptorUuid The UUID for the descriptors to be retrieved.
     * @returns {IAsyncOperation<GattDescriptorsResult>} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.bluetooth.genericattributeprofile.gattcharacteristic.getdescriptorsforuuidasync
     */
    GetDescriptorsForUuidAsync(descriptorUuid) {
        if (!this.HasProp("__IGattCharacteristic3")) {
            if ((queryResult := this.QueryInterface(IGattCharacteristic3.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGattCharacteristic3 := IGattCharacteristic3(outPtr)
        }

        return this.__IGattCharacteristic3.GetDescriptorsForUuidAsync(descriptorUuid)
    }

    /**
     * Returns the descriptors whose UUIDs match descriptorUuid.
     * @param {Guid} descriptorUuid The UUID for the descriptors to be retrieved.
     * @param {Integer} cacheMode_ 
     * @returns {IAsyncOperation<GattDescriptorsResult>} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.bluetooth.genericattributeprofile.gattcharacteristic.getdescriptorsforuuidasync
     */
    GetDescriptorsForUuidWithCacheModeAsync(descriptorUuid, cacheMode_) {
        if (!this.HasProp("__IGattCharacteristic3")) {
            if ((queryResult := this.QueryInterface(IGattCharacteristic3.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGattCharacteristic3 := IGattCharacteristic3(outPtr)
        }

        return this.__IGattCharacteristic3.GetDescriptorsForUuidWithCacheModeAsync(descriptorUuid, cacheMode_)
    }

    /**
     * Performs a Characteristic Value write to a Bluetooth LE device.
     * @param {IBuffer} value A Windows.Storage.Streams.IBuffer object which contains the data to be written to the Bluetooth LE device.
     * @returns {IAsyncOperation<GattWriteResult>} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.bluetooth.genericattributeprofile.gattcharacteristic.writevaluewithresultasync
     */
    WriteValueWithResultAsync(value) {
        if (!this.HasProp("__IGattCharacteristic3")) {
            if ((queryResult := this.QueryInterface(IGattCharacteristic3.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGattCharacteristic3 := IGattCharacteristic3(outPtr)
        }

        return this.__IGattCharacteristic3.WriteValueWithResultAsync(value)
    }

    /**
     * Performs a Characteristic Value write to a Bluetooth LE device.
     * @param {IBuffer} value A Windows.Storage.Streams.IBuffer object which contains the data to be written to the Bluetooth LE device.
     * @param {Integer} writeOption 
     * @returns {IAsyncOperation<GattWriteResult>} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.bluetooth.genericattributeprofile.gattcharacteristic.writevaluewithresultasync
     */
    WriteValueWithResultAndOptionAsync(value, writeOption) {
        if (!this.HasProp("__IGattCharacteristic3")) {
            if ((queryResult := this.QueryInterface(IGattCharacteristic3.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGattCharacteristic3 := IGattCharacteristic3(outPtr)
        }

        return this.__IGattCharacteristic3.WriteValueWithResultAndOptionAsync(value, writeOption)
    }

    /**
     * Writes the ClientCharacteristicConfigurationDescriptor to the Bluetooth LE device, and if the value to be written represents an indication or a notification and a ValueChanged event handler is registered, enables receiving ValueChanged events from the device.
     * @param {Integer} clientCharacteristicConfigurationDescriptorValue Specifies a new value for the ClientCharacteristicConfigurationDescriptor of this Characteristic object.
     * @returns {IAsyncOperation<GattWriteResult>} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.bluetooth.genericattributeprofile.gattcharacteristic.writeclientcharacteristicconfigurationdescriptorwithresultasync
     */
    WriteClientCharacteristicConfigurationDescriptorWithResultAsync(clientCharacteristicConfigurationDescriptorValue) {
        if (!this.HasProp("__IGattCharacteristic3")) {
            if ((queryResult := this.QueryInterface(IGattCharacteristic3.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGattCharacteristic3 := IGattCharacteristic3(outPtr)
        }

        return this.__IGattCharacteristic3.WriteClientCharacteristicConfigurationDescriptorWithResultAsync(clientCharacteristicConfigurationDescriptorValue)
    }

;@endregion Instance Methods
}
