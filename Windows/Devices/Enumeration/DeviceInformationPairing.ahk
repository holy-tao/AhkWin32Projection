#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IDeviceInformationPairing.ahk
#Include .\IDeviceInformationPairing2.ahk
#Include .\IDeviceInformationPairingStatics.ahk
#Include .\IDeviceInformationPairingStatics2.ahk
#Include ..\..\..\Guid.ahk

/**
 * Contains information and enables pairing for a device.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.devices.enumeration.deviceinformationpairing
 * @namespace Windows.Devices.Enumeration
 * @version WindowsRuntime 1.4
 */
class DeviceInformationPairing extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IDeviceInformationPairing

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IDeviceInformationPairing.IID

;@endregion Static Properties

;@region Static Methods
    /**
     * Registers the application to handle all inbound pairing requests.
     * @remarks
     * This API only works with Windows 10 IoT Core (IoT Core) applications.
     * @param {Integer} pairingKindsSupported The pairing kinds your app supports.
     * @returns {Boolean} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.enumeration.deviceinformationpairing.tryregisterforallinboundpairingrequests
     */
    static TryRegisterForAllInboundPairingRequests(pairingKindsSupported) {
        if (!DeviceInformationPairing.HasProp("__IDeviceInformationPairingStatics")) {
            activatableClassId := HSTRING.Create("Windows.Devices.Enumeration.DeviceInformationPairing")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IDeviceInformationPairingStatics.IID)
            DeviceInformationPairing.__IDeviceInformationPairingStatics := IDeviceInformationPairingStatics(factoryPtr)
        }

        return DeviceInformationPairing.__IDeviceInformationPairingStatics.TryRegisterForAllInboundPairingRequests(pairingKindsSupported)
    }

    /**
     * Registers the application to handle all inbound pairing requests with the specified minimum level of protection.
     * @remarks
     * This API only works with Windows 10 IoT Core (IoT Core) applications.
     * @param {Integer} pairingKindsSupported The pairing kinds your app supports.
     * @param {Integer} minProtectionLevel The required minimum level of protection to accept for the pairing requests.
     * @returns {Boolean} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.enumeration.deviceinformationpairing.tryregisterforallinboundpairingrequestswithprotectionlevel
     */
    static TryRegisterForAllInboundPairingRequestsWithProtectionLevel(pairingKindsSupported, minProtectionLevel) {
        if (!DeviceInformationPairing.HasProp("__IDeviceInformationPairingStatics2")) {
            activatableClassId := HSTRING.Create("Windows.Devices.Enumeration.DeviceInformationPairing")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IDeviceInformationPairingStatics2.IID)
            DeviceInformationPairing.__IDeviceInformationPairingStatics2 := IDeviceInformationPairingStatics2(factoryPtr)
        }

        return DeviceInformationPairing.__IDeviceInformationPairingStatics2.TryRegisterForAllInboundPairingRequestsWithProtectionLevel(pairingKindsSupported, minProtectionLevel)
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * Gets a value that indicates whether the device is currently paired.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.enumeration.deviceinformationpairing.ispaired
     * @type {Boolean} 
     */
    IsPaired {
        get => this.get_IsPaired()
    }

    /**
     * Gets a value that indicates whether the device can be paired.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.enumeration.deviceinformationpairing.canpair
     * @type {Boolean} 
     */
    CanPair {
        get => this.get_CanPair()
    }

    /**
     * Gets the level of protection used to pair the device.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.enumeration.deviceinformationpairing.protectionlevel
     * @type {Integer} 
     */
    ProtectionLevel {
        get => this.get_ProtectionLevel()
    }

    /**
     * Gets the [DeviceInformationCustomPairing](deviceinformationcustompairing.md) object necessary for custom pairing.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.enumeration.deviceinformationpairing.custom
     * @type {DeviceInformationCustomPairing} 
     */
    Custom {
        get => this.get_Custom()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsPaired() {
        if (!this.HasProp("__IDeviceInformationPairing")) {
            if ((queryResult := this.QueryInterface(IDeviceInformationPairing.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDeviceInformationPairing := IDeviceInformationPairing(outPtr)
        }

        return this.__IDeviceInformationPairing.get_IsPaired()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_CanPair() {
        if (!this.HasProp("__IDeviceInformationPairing")) {
            if ((queryResult := this.QueryInterface(IDeviceInformationPairing.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDeviceInformationPairing := IDeviceInformationPairing(outPtr)
        }

        return this.__IDeviceInformationPairing.get_CanPair()
    }

    /**
     * Attempts to pair the device using a provided level of protection.
     * @remarks
     * For all protocols other than Bluetooth, the *minProtectionLevel* value is ignored and the default behavior is always assumed. For the Bluetooth protocol, the pairing attempt will fail if the device doesn’t support the specified minimum protection level or a higher level. If the device doesn’t support the specified minimum protection level but does support a higher protection level, the higher protection level is used.
     * @returns {IAsyncOperation<DevicePairingResult>} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.enumeration.deviceinformationpairing.pairasync
     */
    PairAsync() {
        if (!this.HasProp("__IDeviceInformationPairing")) {
            if ((queryResult := this.QueryInterface(IDeviceInformationPairing.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDeviceInformationPairing := IDeviceInformationPairing(outPtr)
        }

        return this.__IDeviceInformationPairing.PairAsync()
    }

    /**
     * Attempts to pair a device object with a specified protection level and custom settings.
     * @remarks
     * For all protocols other than Bluetooth, the *minProtectionLevel* value is ignored and the default behavior is always assumed. For the Bluetooth protocol, the pairing attempt will fail if the device doesn’t support the specified minimum protection level or a higher level. If the device doesn’t support the specified minimum protection level but does support a higher protection level, the higher protection level is used.
     * @param {Integer} minProtectionLevel The required level of protection to use for the pairing action.
     * @returns {IAsyncOperation<DevicePairingResult>} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.enumeration.deviceinformationpairing.pairasync
     */
    PairWithProtectionLevelAsync(minProtectionLevel) {
        if (!this.HasProp("__IDeviceInformationPairing")) {
            if ((queryResult := this.QueryInterface(IDeviceInformationPairing.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDeviceInformationPairing := IDeviceInformationPairing(outPtr)
        }

        return this.__IDeviceInformationPairing.PairWithProtectionLevelAsync(minProtectionLevel)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_ProtectionLevel() {
        if (!this.HasProp("__IDeviceInformationPairing2")) {
            if ((queryResult := this.QueryInterface(IDeviceInformationPairing2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDeviceInformationPairing2 := IDeviceInformationPairing2(outPtr)
        }

        return this.__IDeviceInformationPairing2.get_ProtectionLevel()
    }

    /**
     * 
     * @returns {DeviceInformationCustomPairing} 
     */
    get_Custom() {
        if (!this.HasProp("__IDeviceInformationPairing2")) {
            if ((queryResult := this.QueryInterface(IDeviceInformationPairing2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDeviceInformationPairing2 := IDeviceInformationPairing2(outPtr)
        }

        return this.__IDeviceInformationPairing2.get_Custom()
    }

    /**
     * Attempts to pair the device.
     * @param {Integer} minProtectionLevel 
     * @param {IDevicePairingSettings} devicePairingSettings 
     * @returns {IAsyncOperation<DevicePairingResult>} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.enumeration.deviceinformationpairing.pairasync
     */
    PairWithProtectionLevelAndSettingsAsync(minProtectionLevel, devicePairingSettings) {
        if (!this.HasProp("__IDeviceInformationPairing2")) {
            if ((queryResult := this.QueryInterface(IDeviceInformationPairing2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDeviceInformationPairing2 := IDeviceInformationPairing2(outPtr)
        }

        return this.__IDeviceInformationPairing2.PairWithProtectionLevelAndSettingsAsync(minProtectionLevel, devicePairingSettings)
    }

    /**
     * Attempts to unpair the device.
     * @returns {IAsyncOperation<DeviceUnpairingResult>} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.enumeration.deviceinformationpairing.unpairasync
     */
    UnpairAsync() {
        if (!this.HasProp("__IDeviceInformationPairing2")) {
            if ((queryResult := this.QueryInterface(IDeviceInformationPairing2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDeviceInformationPairing2 := IDeviceInformationPairing2(outPtr)
        }

        return this.__IDeviceInformationPairing2.UnpairAsync()
    }

;@endregion Instance Methods
}
