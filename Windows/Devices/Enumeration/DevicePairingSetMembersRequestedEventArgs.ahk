#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IDevicePairingSetMembersRequestedEventArgs.ahk
#Include ..\..\..\Guid.ahk

/**
 * Event arguments passed to your handler for the [DeviceInformationCustomPairing.PairingSetMembersRequested](./deviceinformationcustompairing_pairingsetmembersrequested.md) event, which is raised when the member(s) of a pairing set have been requested.
  * 
  * **DevicePairingSetMembersRequestedEventArgs** contains: a status indicating success or failure; a vector of the devices/endpoints that were added to the set, or that failed to be added to the set, depending on that status; and info about the parent device.
  * 
  * For more info, and code examples, see [Pairing a set with the DeviceInformationPairing.Custom property](/windows/uwp/devices-sensors/pairing-a-set).
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.devices.enumeration.devicepairingsetmembersrequestedeventargs
 * @namespace Windows.Devices.Enumeration
 * @version WindowsRuntime 1.4
 */
class DevicePairingSetMembersRequestedEventArgs extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IDevicePairingSetMembersRequestedEventArgs

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IDevicePairingSetMembersRequestedEventArgs.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets a status value describing the result of adding member(s) to a pairing set. For more info, and code examples, see [Pairing a set with the DeviceInformationPairing.Custom property](/windows/uwp/devices-sensors/pairing-a-set).
     * @see https://learn.microsoft.com/uwp/api/windows.devices.enumeration.devicepairingsetmembersrequestedeventargs.status
     * @type {Integer} 
     */
    Status {
        get => this.get_Status()
    }

    /**
     * Gets the primary device/endpoint of the set. For more info, and code examples, see [Pairing a set with the DeviceInformationPairing.Custom property](/windows/uwp/devices-sensors/pairing-a-set).
     * @remarks
     * In the case of Bluetooth LE, if you'd started by pairing the left earbud, then **ParentDeviceInformation** would be that earbud.
     * 
     * In the case of IPP, if you'd you started pairing the WSD device (and added the others), then **ParentDeviceInformation** would be the WSD device.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.enumeration.devicepairingsetmembersrequestedeventargs.parentdeviceinformation
     * @type {DeviceInformation} 
     */
    ParentDeviceInformation {
        get => this.get_ParentDeviceInformation()
    }

    /**
     * Gets a vector of the devices/endpoints that were added to the set, or that failed to be added to the set, depending on the value of [Status](./devicepairingsetmembersrequestedeventargs_status.md). For more info, and code examples, see [Pairing a set with the DeviceInformationPairing.Custom property](/windows/uwp/devices-sensors/pairing-a-set).
     * @remarks
     * In the case of Bluetooth LE, if you'd paired the left earbud, then **PairingSetMembers** would contain the device info object for the right earbud.
     * 
     * In the case of IPP, if you'd called the [DeviceInformationCustomPairing.AddPairingSetMember](./deviceinformationcustompairing_addpairingsetmember_1277113744.md) method, then **PairingSetMembers** would contain a vector of all of the set members that you'd added. If pairing has started on the primary device/endpoint, then this vector will just have one device in it. If you added N devices/endpoints before starting pairing the primary, then the vector will have N devices in it.
     * 
     * If some devices fail to add, then your [DeviceInformationCustomPairing.PairingSetMembersRequested](./deviceinformationcustompairing_pairingsetmembersrequested.md) handler will still be called with a vector of the failed devices/endpoints. If, for example WSD adds and eSCL fails, then the handler will be called twice&mdash;once with success and the WSD endpoint in the vector; and again with failure and eSCL in the vector. The idea is that your app probably still wants to pair it even if the device failed to be added into the set.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.enumeration.devicepairingsetmembersrequestedeventargs.pairingsetmembers
     * @type {IVectorView<DeviceInformation>} 
     */
    PairingSetMembers {
        get => this.get_PairingSetMembers()
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
        if (!this.HasProp("__IDevicePairingSetMembersRequestedEventArgs")) {
            if ((queryResult := this.QueryInterface(IDevicePairingSetMembersRequestedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDevicePairingSetMembersRequestedEventArgs := IDevicePairingSetMembersRequestedEventArgs(outPtr)
        }

        return this.__IDevicePairingSetMembersRequestedEventArgs.get_Status()
    }

    /**
     * 
     * @returns {DeviceInformation} 
     */
    get_ParentDeviceInformation() {
        if (!this.HasProp("__IDevicePairingSetMembersRequestedEventArgs")) {
            if ((queryResult := this.QueryInterface(IDevicePairingSetMembersRequestedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDevicePairingSetMembersRequestedEventArgs := IDevicePairingSetMembersRequestedEventArgs(outPtr)
        }

        return this.__IDevicePairingSetMembersRequestedEventArgs.get_ParentDeviceInformation()
    }

    /**
     * 
     * @returns {IVectorView<DeviceInformation>} 
     */
    get_PairingSetMembers() {
        if (!this.HasProp("__IDevicePairingSetMembersRequestedEventArgs")) {
            if ((queryResult := this.QueryInterface(IDevicePairingSetMembersRequestedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDevicePairingSetMembersRequestedEventArgs := IDevicePairingSetMembersRequestedEventArgs(outPtr)
        }

        return this.__IDevicePairingSetMembersRequestedEventArgs.get_PairingSetMembers()
    }

;@endregion Instance Methods
}
