#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IDeviceInformationCustomPairing.ahk
#Include .\IDeviceInformationCustomPairing2.ahk
#Include ..\..\Foundation\TypedEventHandler.ahk
#Include .\DeviceInformationCustomPairing.ahk
#Include .\DevicePairingRequestedEventArgs.ahk
#Include .\DevicePairingSetMembersRequestedEventArgs.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\..\WinRTEventHandler.ahk

/**
 * Represents a custom pairing for a [DeviceInformation](deviceinformation.md) object.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.devices.enumeration.deviceinformationcustompairing
 * @namespace Windows.Devices.Enumeration
 * @version WindowsRuntime 1.4
 */
class DeviceInformationCustomPairing extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IDeviceInformationCustomPairing

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IDeviceInformationCustomPairing.IID

;@endregion Static Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    __Delete() {
        if(this.HasProp("__OnPairingRequestedToken")) {
            this.remove_PairingRequested(this.__OnPairingRequestedToken)
            this.__OnPairingRequested.iface.Dispose()
        }

        if(this.HasProp("__OnPairingSetMembersRequestedToken")) {
            this.remove_PairingSetMembersRequested(this.__OnPairingSetMembersRequestedToken)
            this.__OnPairingSetMembersRequested.iface.Dispose()
        }

        super.__Delete()
    }

    /**
     * Attempts to pair a device using a minimum protection level.
     * @param {Integer} pairingKindsSupported The different pairing kinds supported by this [DeviceInformation](deviceinformation.md) object.
     * @returns {IAsyncOperation<DevicePairingResult>} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.enumeration.deviceinformationcustompairing.pairasync
     */
    PairAsync(pairingKindsSupported) {
        if (!this.HasProp("__IDeviceInformationCustomPairing")) {
            if ((queryResult := this.QueryInterface(IDeviceInformationCustomPairing.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDeviceInformationCustomPairing := IDeviceInformationCustomPairing(outPtr)
        }

        return this.__IDeviceInformationCustomPairing.PairAsync(pairingKindsSupported)
    }

    /**
     * Attempts to pair a device using a minimum protection level and custom settings.
     * @param {Integer} pairingKindsSupported The different pairing kinds supported by this [DeviceInformation](deviceinformation.md) object.
     * @param {Integer} minProtectionLevel The minimum protection level this [DeviceInformation](deviceinformation.md) object requires in order to pair.
     * @returns {IAsyncOperation<DevicePairingResult>} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.enumeration.deviceinformationcustompairing.pairasync
     */
    PairWithProtectionLevelAsync(pairingKindsSupported, minProtectionLevel) {
        if (!this.HasProp("__IDeviceInformationCustomPairing")) {
            if ((queryResult := this.QueryInterface(IDeviceInformationCustomPairing.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDeviceInformationCustomPairing := IDeviceInformationCustomPairing(outPtr)
        }

        return this.__IDeviceInformationCustomPairing.PairWithProtectionLevelAsync(pairingKindsSupported, minProtectionLevel)
    }

    /**
     * Attempts to pair the device.
     * @param {Integer} pairingKindsSupported The different pairing kinds supported by this [DeviceInformation](deviceinformation.md) object.
     * @param {Integer} minProtectionLevel 
     * @param {IDevicePairingSettings} devicePairingSettings 
     * @returns {IAsyncOperation<DevicePairingResult>} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.enumeration.deviceinformationcustompairing.pairasync
     */
    PairWithProtectionLevelAndSettingsAsync(pairingKindsSupported, minProtectionLevel, devicePairingSettings) {
        if (!this.HasProp("__IDeviceInformationCustomPairing")) {
            if ((queryResult := this.QueryInterface(IDeviceInformationCustomPairing.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDeviceInformationCustomPairing := IDeviceInformationCustomPairing(outPtr)
        }

        return this.__IDeviceInformationCustomPairing.PairWithProtectionLevelAndSettingsAsync(pairingKindsSupported, minProtectionLevel, devicePairingSettings)
    }

    /**
     * 
     * @param {TypedEventHandler<DeviceInformationCustomPairing, DevicePairingRequestedEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_PairingRequested(handler) {
        if (!this.HasProp("__IDeviceInformationCustomPairing")) {
            if ((queryResult := this.QueryInterface(IDeviceInformationCustomPairing.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDeviceInformationCustomPairing := IDeviceInformationCustomPairing(outPtr)
        }

        return this.__IDeviceInformationCustomPairing.add_PairingRequested(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_PairingRequested(token) {
        if (!this.HasProp("__IDeviceInformationCustomPairing")) {
            if ((queryResult := this.QueryInterface(IDeviceInformationCustomPairing.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDeviceInformationCustomPairing := IDeviceInformationCustomPairing(outPtr)
        }

        return this.__IDeviceInformationCustomPairing.remove_PairingRequested(token)
    }

    /**
     * Add a member of a pairing set (for Bluetooth LE and IPP style printers). For more info, and code examples, see [Pairing a set with the DeviceInformationPairing.Custom property](/windows/uwp/devices-sensors/pairing-a-set).
     * @param {DeviceInformation} device An object representing the device to add to the set.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.enumeration.deviceinformationcustompairing.addpairingsetmember
     */
    AddPairingSetMember(device) {
        if (!this.HasProp("__IDeviceInformationCustomPairing2")) {
            if ((queryResult := this.QueryInterface(IDeviceInformationCustomPairing2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDeviceInformationCustomPairing2 := IDeviceInformationCustomPairing2(outPtr)
        }

        return this.__IDeviceInformationCustomPairing2.AddPairingSetMember(device)
    }

    /**
     * 
     * @param {TypedEventHandler<DeviceInformationCustomPairing, DevicePairingSetMembersRequestedEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_PairingSetMembersRequested(handler) {
        if (!this.HasProp("__IDeviceInformationCustomPairing2")) {
            if ((queryResult := this.QueryInterface(IDeviceInformationCustomPairing2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDeviceInformationCustomPairing2 := IDeviceInformationCustomPairing2(outPtr)
        }

        return this.__IDeviceInformationCustomPairing2.add_PairingSetMembersRequested(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_PairingSetMembersRequested(token) {
        if (!this.HasProp("__IDeviceInformationCustomPairing2")) {
            if ((queryResult := this.QueryInterface(IDeviceInformationCustomPairing2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDeviceInformationCustomPairing2 := IDeviceInformationCustomPairing2(outPtr)
        }

        return this.__IDeviceInformationCustomPairing2.remove_PairingSetMembersRequested(token)
    }

;@endregion Instance Methods
}
