#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IGattReadClientCharacteristicConfigurationDescriptorResult.ahk
#Include .\IGattReadClientCharacteristicConfigurationDescriptorResult2.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Represents the result of reading a GATT Client CharacteristicConfigurationClientDescriptor value.
 * @remarks
 * The [ReadClientCharacteristicConfigurationDescriptorAsync](gattcharacteristic_readclientcharacteristicconfigurationdescriptorasync_310627851.md) method is used to retrieve a GattReadClientCharacteristicConfigurationDescriptorResult object.
 * 
 * The [Status](gattreadclientcharacteristicconfigurationdescriptorresult_status.md) property on the GattReadClientCharacteristicConfigurationDescriptorResult returned indicates if the result of the operation was successful.
 * @see https://learn.microsoft.com/uwp/api/windows.devices.bluetooth.genericattributeprofile.gattreadclientcharacteristicconfigurationdescriptorresult
 * @namespace Windows.Devices.Bluetooth.GenericAttributeProfile
 * @version WindowsRuntime 1.4
 */
class GattReadClientCharacteristicConfigurationDescriptorResult extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IGattReadClientCharacteristicConfigurationDescriptorResult

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IGattReadClientCharacteristicConfigurationDescriptorResult.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the status of an asynchronous operation.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.bluetooth.genericattributeprofile.gattreadclientcharacteristicconfigurationdescriptorresult.status
     * @type {Integer} 
     */
    Status {
        get => this.get_Status()
    }

    /**
     * Gets the result of an asynchronous read operation.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.bluetooth.genericattributeprofile.gattreadclientcharacteristicconfigurationdescriptorresult.clientcharacteristicconfigurationdescriptor
     * @type {Integer} 
     */
    ClientCharacteristicConfigurationDescriptor {
        get => this.get_ClientCharacteristicConfigurationDescriptor()
    }

    /**
     * Gets the protocol error.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.bluetooth.genericattributeprofile.gattreadclientcharacteristicconfigurationdescriptorresult.protocolerror
     * @type {IReference<Integer>} 
     */
    ProtocolError {
        get => this.get_ProtocolError()
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
    get_Status() {
        if (!this.HasProp("__IGattReadClientCharacteristicConfigurationDescriptorResult")) {
            if ((queryResult := this.QueryInterface(IGattReadClientCharacteristicConfigurationDescriptorResult.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGattReadClientCharacteristicConfigurationDescriptorResult := IGattReadClientCharacteristicConfigurationDescriptorResult(outPtr)
        }

        return this.__IGattReadClientCharacteristicConfigurationDescriptorResult.get_Status()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_ClientCharacteristicConfigurationDescriptor() {
        if (!this.HasProp("__IGattReadClientCharacteristicConfigurationDescriptorResult")) {
            if ((queryResult := this.QueryInterface(IGattReadClientCharacteristicConfigurationDescriptorResult.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGattReadClientCharacteristicConfigurationDescriptorResult := IGattReadClientCharacteristicConfigurationDescriptorResult(outPtr)
        }

        return this.__IGattReadClientCharacteristicConfigurationDescriptorResult.get_ClientCharacteristicConfigurationDescriptor()
    }

    /**
     * 
     * @returns {IReference<Integer>} 
     */
    get_ProtocolError() {
        if (!this.HasProp("__IGattReadClientCharacteristicConfigurationDescriptorResult2")) {
            if ((queryResult := this.QueryInterface(IGattReadClientCharacteristicConfigurationDescriptorResult2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGattReadClientCharacteristicConfigurationDescriptorResult2 := IGattReadClientCharacteristicConfigurationDescriptorResult2(outPtr)
        }

        return this.__IGattReadClientCharacteristicConfigurationDescriptorResult2.get_ProtocolError()
    }

;@endregion Instance Methods
}
