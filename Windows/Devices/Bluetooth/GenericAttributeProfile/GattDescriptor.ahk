#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IGattDescriptor.ahk
#Include .\IGattDescriptor2.ahk
#Include .\IGattDescriptorStatics.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Represents a Descriptor of a GATT Characteristic. The GattDescriptor object represents a GATT Descriptor of a particular characteristic, and is obtained from the Descriptors property of the GattCharacteristic object.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.devices.bluetooth.genericattributeprofile.gattdescriptor
 * @namespace Windows.Devices.Bluetooth.GenericAttributeProfile
 * @version WindowsRuntime 1.4
 */
class GattDescriptor extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IGattDescriptor

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IGattDescriptor.IID

;@endregion Static Properties

;@region Static Methods
    /**
     * Converts a Bluetooth SIG defined short Id to a full GATT UUID.
     * 
     * > [!IMPORTANT]
     * > The **ConvertShortIdToUuid** API is deprecated, and it may not be available in future versions of Windows. Instead, use [BluetoothUuidHelper.FromShortId](/uwp/api/windows.devices.bluetooth.bluetoothuuidhelper.fromshortid).
     * @param {Integer} shortId A 16-bit Bluetooth GATT Descriptor UUID.
     * @returns {Guid} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.bluetooth.genericattributeprofile.gattdescriptor.convertshortidtouuid
     */
    static ConvertShortIdToUuid(shortId) {
        if (!GattDescriptor.HasProp("__IGattDescriptorStatics")) {
            activatableClassId := HSTRING.Create("Windows.Devices.Bluetooth.GenericAttributeProfile.GattDescriptor")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IGattDescriptorStatics.IID)
            GattDescriptor.__IGattDescriptorStatics := IGattDescriptorStatics(factoryPtr)
        }

        return GattDescriptor.__IGattDescriptorStatics.ConvertShortIdToUuid(shortId)
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * Gets or sets the desired GATT security options for over the air communication with the device.
     * 
     * Windows will negotiate the maximum security possible with the device as part of the pairing process, and specifying a lower level of security won’t degrade the existing security level.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.bluetooth.genericattributeprofile.gattdescriptor.protectionlevel
     * @type {Integer} 
     */
    ProtectionLevel {
        get => this.get_ProtectionLevel()
        set => this.put_ProtectionLevel(value)
    }

    /**
     * Gets the GATT Descriptor UUID for this GattDescriptor.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.bluetooth.genericattributeprofile.gattdescriptor.uuid
     * @type {Guid} 
     */
    Uuid {
        get => this.get_Uuid()
    }

    /**
     * Gets the GATT Attribute handle used to uniquely identify this attribute on the GATT Server Device.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.bluetooth.genericattributeprofile.gattdescriptor.attributehandle
     * @type {Integer} 
     */
    AttributeHandle {
        get => this.get_AttributeHandle()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_ProtectionLevel() {
        if (!this.HasProp("__IGattDescriptor")) {
            if ((queryResult := this.QueryInterface(IGattDescriptor.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGattDescriptor := IGattDescriptor(outPtr)
        }

        return this.__IGattDescriptor.get_ProtectionLevel()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_ProtectionLevel(value) {
        if (!this.HasProp("__IGattDescriptor")) {
            if ((queryResult := this.QueryInterface(IGattDescriptor.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGattDescriptor := IGattDescriptor(outPtr)
        }

        return this.__IGattDescriptor.put_ProtectionLevel(value)
    }

    /**
     * 
     * @returns {Guid} 
     */
    get_Uuid() {
        if (!this.HasProp("__IGattDescriptor")) {
            if ((queryResult := this.QueryInterface(IGattDescriptor.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGattDescriptor := IGattDescriptor(outPtr)
        }

        return this.__IGattDescriptor.get_Uuid()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_AttributeHandle() {
        if (!this.HasProp("__IGattDescriptor")) {
            if ((queryResult := this.QueryInterface(IGattDescriptor.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGattDescriptor := IGattDescriptor(outPtr)
        }

        return this.__IGattDescriptor.get_AttributeHandle()
    }

    /**
     * Performs a Descriptor Value read either from the value cache maintained by Windows, or directly from the device.
     * @returns {IAsyncOperation<GattReadResult>} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.bluetooth.genericattributeprofile.gattdescriptor.readvalueasync
     */
    ReadValueAsync() {
        if (!this.HasProp("__IGattDescriptor")) {
            if ((queryResult := this.QueryInterface(IGattDescriptor.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGattDescriptor := IGattDescriptor(outPtr)
        }

        return this.__IGattDescriptor.ReadValueAsync()
    }

    /**
     * Performs a Descriptor Value read from a value cache maintained by Windows.
     * @param {Integer} cacheMode_ 
     * @returns {IAsyncOperation<GattReadResult>} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.bluetooth.genericattributeprofile.gattdescriptor.readvalueasync
     */
    ReadValueWithCacheModeAsync(cacheMode_) {
        if (!this.HasProp("__IGattDescriptor")) {
            if ((queryResult := this.QueryInterface(IGattDescriptor.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGattDescriptor := IGattDescriptor(outPtr)
        }

        return this.__IGattDescriptor.ReadValueWithCacheModeAsync(cacheMode_)
    }

    /**
     * Performs a Descriptor Value write to a Bluetooth LE device.
     * @param {IBuffer} value A Windows.Storage.Streams.IBuffer object which contains the data to be written to the Bluetooth LE device.
     * @returns {IAsyncOperation<Integer>} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.bluetooth.genericattributeprofile.gattdescriptor.writevalueasync
     */
    WriteValueAsync(value) {
        if (!this.HasProp("__IGattDescriptor")) {
            if ((queryResult := this.QueryInterface(IGattDescriptor.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGattDescriptor := IGattDescriptor(outPtr)
        }

        return this.__IGattDescriptor.WriteValueAsync(value)
    }

    /**
     * Performs a Descriptor Value write to a Bluetooth LE device.
     * @param {IBuffer} value A Windows.Storage.Streams.IBuffer object which contains the data to be written to the Bluetooth LE device.
     * @returns {IAsyncOperation<GattWriteResult>} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.bluetooth.genericattributeprofile.gattdescriptor.writevaluewithresultasync
     */
    WriteValueWithResultAsync(value) {
        if (!this.HasProp("__IGattDescriptor2")) {
            if ((queryResult := this.QueryInterface(IGattDescriptor2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGattDescriptor2 := IGattDescriptor2(outPtr)
        }

        return this.__IGattDescriptor2.WriteValueWithResultAsync(value)
    }

;@endregion Instance Methods
}
