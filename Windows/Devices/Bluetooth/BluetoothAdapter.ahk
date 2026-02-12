#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IBluetoothAdapter.ahk
#Include .\IBluetoothAdapter2.ahk
#Include .\IBluetoothAdapter3.ahk
#Include .\IBluetoothAdapter4.ahk
#Include .\IBluetoothAdapterStatics.ahk
#Include ..\..\..\Guid.ahk

/**
 * Represents a Bluetooth adapter.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.devices.bluetooth.bluetoothadapter
 * @namespace Windows.Devices.Bluetooth
 * @version WindowsRuntime 1.4
 */
class BluetoothAdapter extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IBluetoothAdapter

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IBluetoothAdapter.IID

;@endregion Static Properties

;@region Static Methods
    /**
     * Gets an Advanced Query Syntax (AQS) string for identifying instances of this adapter. This string is passed to the FindAllAsync or CreateWatcher method.
     * @returns {HSTRING} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.bluetooth.bluetoothadapter.getdeviceselector
     */
    static GetDeviceSelector() {
        if (!BluetoothAdapter.HasProp("__IBluetoothAdapterStatics")) {
            activatableClassId := HSTRING.Create("Windows.Devices.Bluetooth.BluetoothAdapter")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IBluetoothAdapterStatics.IID)
            BluetoothAdapter.__IBluetoothAdapterStatics := IBluetoothAdapterStatics(factoryPtr)
        }

        return BluetoothAdapter.__IBluetoothAdapterStatics.GetDeviceSelector()
    }

    /**
     * Gets a [BluetoothAdapter](bluetoothadapter.md) object identified by the given [DeviceId](bluetoothadapter_deviceid.md).
     * @param {HSTRING} deviceId The DeviceId value that identifies the BluetoothAdapter instance. This is a composite string combining registry information that includes the MatchingDeviceId, the MAC address, and a [GUID](/windows/win32/api/guiddef/ns-guiddef-guid) representing a device class. This is different than Windows.Devices.Enumeration.DeviceInformation.Id. However, both contain the MAC address of the Bluetooth radio device embedded within the identifier string.
     * @returns {IAsyncOperation<BluetoothAdapter>} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.bluetooth.bluetoothadapter.fromidasync
     */
    static FromIdAsync(deviceId) {
        if (!BluetoothAdapter.HasProp("__IBluetoothAdapterStatics")) {
            activatableClassId := HSTRING.Create("Windows.Devices.Bluetooth.BluetoothAdapter")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IBluetoothAdapterStatics.IID)
            BluetoothAdapter.__IBluetoothAdapterStatics := IBluetoothAdapterStatics(factoryPtr)
        }

        return BluetoothAdapter.__IBluetoothAdapterStatics.FromIdAsync(deviceId)
    }

    /**
     * Gets the default BluetoothAdapter.
     * @returns {IAsyncOperation<BluetoothAdapter>} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.bluetooth.bluetoothadapter.getdefaultasync
     */
    static GetDefaultAsync() {
        if (!BluetoothAdapter.HasProp("__IBluetoothAdapterStatics")) {
            activatableClassId := HSTRING.Create("Windows.Devices.Bluetooth.BluetoothAdapter")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IBluetoothAdapterStatics.IID)
            BluetoothAdapter.__IBluetoothAdapterStatics := IBluetoothAdapterStatics(factoryPtr)
        }

        return BluetoothAdapter.__IBluetoothAdapterStatics.GetDefaultAsync()
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * Gets the device ID.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.bluetooth.bluetoothadapter.deviceid
     * @type {HSTRING} 
     */
    DeviceId {
        get => this.get_DeviceId()
    }

    /**
     * Gets the device address.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.bluetooth.bluetoothadapter.bluetoothaddress
     * @type {Integer} 
     */
    BluetoothAddress {
        get => this.get_BluetoothAddress()
    }

    /**
     * Gets a boolean indicating if the adapter supports the Bluetooth Classic transport type.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.bluetooth.bluetoothadapter.isclassicsupported
     * @type {Boolean} 
     */
    IsClassicSupported {
        get => this.get_IsClassicSupported()
    }

    /**
     * Gets a boolean indicating if the adapater supports LowEnergy Bluetooth Transport type.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.bluetooth.bluetoothadapter.islowenergysupported
     * @type {Boolean} 
     */
    IsLowEnergySupported {
        get => this.get_IsLowEnergySupported()
    }

    /**
     * Gets a boolean indicating if the adapater supports LowEnergy peripheral role.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.bluetooth.bluetoothadapter.isperipheralrolesupported
     * @type {Boolean} 
     */
    IsPeripheralRoleSupported {
        get => this.get_IsPeripheralRoleSupported()
    }

    /**
     * Gets a boolean indicating if the adapater supports LowEnergy central role.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.bluetooth.bluetoothadapter.iscentralrolesupported
     * @type {Boolean} 
     */
    IsCentralRoleSupported {
        get => this.get_IsCentralRoleSupported()
    }

    /**
     * Gets a boolean indicating if the adapter supports advertisement offload.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.bluetooth.bluetoothadapter.isadvertisementoffloadsupported
     * @type {Boolean} 
     */
    IsAdvertisementOffloadSupported {
        get => this.get_IsAdvertisementOffloadSupported()
    }

    /**
     * Gets or sets a value indicating whether Secure Connections are supported for classic paired Bluetooth devices.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.bluetooth.bluetoothadapter.areclassicsecureconnectionssupported
     * @type {Boolean} 
     */
    AreClassicSecureConnectionsSupported {
        get => this.get_AreClassicSecureConnectionsSupported()
    }

    /**
     * Gets or sets a value indicating whether Secure Connections are supported for paired Bluetooth LE devices.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.bluetooth.bluetoothadapter.arelowenergysecureconnectionssupported
     * @type {Boolean} 
     */
    AreLowEnergySecureConnectionsSupported {
        get => this.get_AreLowEnergySecureConnectionsSupported()
    }

    /**
     * Indicates whether the adapter supports the 5.0 Extended Advertising format.
     * @remarks
     * The Extended Advertisement format allows for further customization of the advertising header. See the related APIs for more information.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.bluetooth.bluetoothadapter.isextendedadvertisingsupported
     * @type {Boolean} 
     */
    IsExtendedAdvertisingSupported {
        get => this.get_IsExtendedAdvertisingSupported()
    }

    /**
     * Indicates the maximum length of an advertisement that can be published by this adapter.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.bluetooth.bluetoothadapter.maxadvertisementdatalength
     * @type {Integer} 
     */
    MaxAdvertisementDataLength {
        get => this.get_MaxAdvertisementDataLength()
    }

    /**
     * @type {Boolean} 
     */
    IsLowEnergyUncoded2MPhySupported {
        get => this.get_IsLowEnergyUncoded2MPhySupported()
    }

    /**
     * @type {Boolean} 
     */
    IsLowEnergyCodedPhySupported {
        get => this.get_IsLowEnergyCodedPhySupported()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_DeviceId() {
        if (!this.HasProp("__IBluetoothAdapter")) {
            if ((queryResult := this.QueryInterface(IBluetoothAdapter.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IBluetoothAdapter := IBluetoothAdapter(outPtr)
        }

        return this.__IBluetoothAdapter.get_DeviceId()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_BluetoothAddress() {
        if (!this.HasProp("__IBluetoothAdapter")) {
            if ((queryResult := this.QueryInterface(IBluetoothAdapter.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IBluetoothAdapter := IBluetoothAdapter(outPtr)
        }

        return this.__IBluetoothAdapter.get_BluetoothAddress()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsClassicSupported() {
        if (!this.HasProp("__IBluetoothAdapter")) {
            if ((queryResult := this.QueryInterface(IBluetoothAdapter.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IBluetoothAdapter := IBluetoothAdapter(outPtr)
        }

        return this.__IBluetoothAdapter.get_IsClassicSupported()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsLowEnergySupported() {
        if (!this.HasProp("__IBluetoothAdapter")) {
            if ((queryResult := this.QueryInterface(IBluetoothAdapter.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IBluetoothAdapter := IBluetoothAdapter(outPtr)
        }

        return this.__IBluetoothAdapter.get_IsLowEnergySupported()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsPeripheralRoleSupported() {
        if (!this.HasProp("__IBluetoothAdapter")) {
            if ((queryResult := this.QueryInterface(IBluetoothAdapter.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IBluetoothAdapter := IBluetoothAdapter(outPtr)
        }

        return this.__IBluetoothAdapter.get_IsPeripheralRoleSupported()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsCentralRoleSupported() {
        if (!this.HasProp("__IBluetoothAdapter")) {
            if ((queryResult := this.QueryInterface(IBluetoothAdapter.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IBluetoothAdapter := IBluetoothAdapter(outPtr)
        }

        return this.__IBluetoothAdapter.get_IsCentralRoleSupported()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsAdvertisementOffloadSupported() {
        if (!this.HasProp("__IBluetoothAdapter")) {
            if ((queryResult := this.QueryInterface(IBluetoothAdapter.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IBluetoothAdapter := IBluetoothAdapter(outPtr)
        }

        return this.__IBluetoothAdapter.get_IsAdvertisementOffloadSupported()
    }

    /**
     * Gets the radio represented by this Bluetooth adapter.
     * @remarks
     * When called from a UWP app, there is no architecture requirement. This method will work on the native architecture, as well as x86 architecture on x64 or ARM64 architectures.
     * 
     * When this method is called from a desktop application (Win32), it will retrieve radio instances only when the application is natively compiled for the target architecture (in other words, when the application matches the computer architecture; so an x86 application running on an x64 architecture computer won't see any radio instances).
     * @returns {IAsyncOperation<Radio>} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.bluetooth.bluetoothadapter.getradioasync
     */
    GetRadioAsync() {
        if (!this.HasProp("__IBluetoothAdapter")) {
            if ((queryResult := this.QueryInterface(IBluetoothAdapter.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IBluetoothAdapter := IBluetoothAdapter(outPtr)
        }

        return this.__IBluetoothAdapter.GetRadioAsync()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_AreClassicSecureConnectionsSupported() {
        if (!this.HasProp("__IBluetoothAdapter2")) {
            if ((queryResult := this.QueryInterface(IBluetoothAdapter2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IBluetoothAdapter2 := IBluetoothAdapter2(outPtr)
        }

        return this.__IBluetoothAdapter2.get_AreClassicSecureConnectionsSupported()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_AreLowEnergySecureConnectionsSupported() {
        if (!this.HasProp("__IBluetoothAdapter2")) {
            if ((queryResult := this.QueryInterface(IBluetoothAdapter2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IBluetoothAdapter2 := IBluetoothAdapter2(outPtr)
        }

        return this.__IBluetoothAdapter2.get_AreLowEnergySecureConnectionsSupported()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsExtendedAdvertisingSupported() {
        if (!this.HasProp("__IBluetoothAdapter3")) {
            if ((queryResult := this.QueryInterface(IBluetoothAdapter3.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IBluetoothAdapter3 := IBluetoothAdapter3(outPtr)
        }

        return this.__IBluetoothAdapter3.get_IsExtendedAdvertisingSupported()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_MaxAdvertisementDataLength() {
        if (!this.HasProp("__IBluetoothAdapter3")) {
            if ((queryResult := this.QueryInterface(IBluetoothAdapter3.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IBluetoothAdapter3 := IBluetoothAdapter3(outPtr)
        }

        return this.__IBluetoothAdapter3.get_MaxAdvertisementDataLength()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsLowEnergyUncoded2MPhySupported() {
        if (!this.HasProp("__IBluetoothAdapter4")) {
            if ((queryResult := this.QueryInterface(IBluetoothAdapter4.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IBluetoothAdapter4 := IBluetoothAdapter4(outPtr)
        }

        return this.__IBluetoothAdapter4.get_IsLowEnergyUncoded2MPhySupported()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsLowEnergyCodedPhySupported() {
        if (!this.HasProp("__IBluetoothAdapter4")) {
            if ((queryResult := this.QueryInterface(IBluetoothAdapter4.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IBluetoothAdapter4 := IBluetoothAdapter4(outPtr)
        }

        return this.__IBluetoothAdapter4.get_IsLowEnergyCodedPhySupported()
    }

;@endregion Instance Methods
}
