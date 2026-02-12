#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IMobileBroadbandDeviceInformation.ahk
#Include .\IMobileBroadbandDeviceInformation2.ahk
#Include .\IMobileBroadbandDeviceInformation3.ahk
#Include .\IMobileBroadbandDeviceInformation4.ahk
#Include ..\..\..\Guid.ahk

/**
 * Represents the current state of the mobile broadband network device for the account.
  * 
  * > [!NOTE]
  * > This functionality is available only to mobile operator apps and UWP apps given privileged access by mobile network operators.
  * > 
  * > If you want to use this API and publish your app to the Microsoft Store, then you'll need special approval. For more information, see the **Restricted capabilities** section in the [App capability declarations](/windows/uwp/packaging/app-capability-declarations#restricted-capabilities) topic.
 * @remarks
 * If you're trying to get information about a SIM card that uses CMDA, the device information may contain multiple lines. Typically, the first line is for data connection and the second line contains SIM device information.
 * @see https://learn.microsoft.com/uwp/api/windows.networking.networkoperators.mobilebroadbanddeviceinformation
 * @namespace Windows.Networking.NetworkOperators
 * @version WindowsRuntime 1.4
 */
class MobileBroadbandDeviceInformation extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IMobileBroadbandDeviceInformation

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IMobileBroadbandDeviceInformation.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the readiness status of the mobile broadband network device.
     * @see https://learn.microsoft.com/uwp/api/windows.networking.networkoperators.mobilebroadbanddeviceinformation.networkdevicestatus
     * @type {Integer} 
     */
    NetworkDeviceStatus {
        get => this.get_NetworkDeviceStatus()
    }

    /**
     * Gets the name of the manufacturer of the mobile broadband network device.
     * @remarks
     * You can use the Manufacturer property value to determine the provisioning that must occur for the mobile broadband network device.
     * @see https://learn.microsoft.com/uwp/api/windows.networking.networkoperators.mobilebroadbanddeviceinformation.manufacturer
     * @type {HSTRING} 
     */
    Manufacturer {
        get => this.get_Manufacturer()
    }

    /**
     * Gets the name of the model of the mobile broadband network device.
     * @remarks
     * You can use the Model property value to determine the provisioning that must occur for the mobile broadband network device.
     * @see https://learn.microsoft.com/uwp/api/windows.networking.networkoperators.mobilebroadbanddeviceinformation.model
     * @type {HSTRING} 
     */
    Model {
        get => this.get_Model()
    }

    /**
     * Gets the device-specific firmware information for the mobile broadband network device.
     * @see https://learn.microsoft.com/uwp/api/windows.networking.networkoperators.mobilebroadbanddeviceinformation.firmwareinformation
     * @type {HSTRING} 
     */
    FirmwareInformation {
        get => this.get_FirmwareInformation()
    }

    /**
     * Gets the cellular technology used by the mobile broadband network device.
     * @see https://learn.microsoft.com/uwp/api/windows.networking.networkoperators.mobilebroadbanddeviceinformation.cellularclass
     * @type {Integer} 
     */
    CellularClass {
        get => this.get_CellularClass()
    }

    /**
     * Gets the cellular data services supported by the mobile broadband network device.
     * @see https://learn.microsoft.com/uwp/api/windows.networking.networkoperators.mobilebroadbanddeviceinformation.dataclasses
     * @type {Integer} 
     */
    DataClasses {
        get => this.get_DataClasses()
    }

    /**
     * Gets the name of the data class when the [DataClasses](mobilebroadbanddeviceinformation_dataclasses.md) property returns **Custom**.
     * @see https://learn.microsoft.com/uwp/api/windows.networking.networkoperators.mobilebroadbanddeviceinformation.customdataclass
     * @type {HSTRING} 
     */
    CustomDataClass {
        get => this.get_CustomDataClass()
    }

    /**
     * Gets the value that uniquely identifies the mobile broadband device to the network provider.
     * @remarks
     * For GSM devices, the MobileEquipmentId value will be the International Mobile Equipment Identitiy (IMEI), which can be up to 15 digits long. For CDMA devices, the MobileEquipmentId value must be the electronic serical number (ESNs0, which is 11 digits long, or the mobile equipment identifier (MEID), which is 17 digits long.
     * @see https://learn.microsoft.com/uwp/api/windows.networking.networkoperators.mobilebroadbanddeviceinformation.mobileequipmentid
     * @type {HSTRING} 
     */
    MobileEquipmentId {
        get => this.get_MobileEquipmentId()
    }

    /**
     * Gets the telephone numbers for the mobile broadband device.
     * @remarks
     * If the device supports the GSM cellular class, the telephone numbers are Mobile Subscriber ISDN Numbers (MSISDNs). If the device supports the CDMA cellular class, the telephone numbers are Mobile Directory Numbers (MDNs).
     * @see https://learn.microsoft.com/uwp/api/windows.networking.networkoperators.mobilebroadbanddeviceinformation.telephonenumbers
     * @type {IVectorView<HSTRING>} 
     */
    TelephoneNumbers {
        get => this.get_TelephoneNumbers()
    }

    /**
     * Gets the subscriber identifier for the mobile broadband network device.
     * @remarks
     * You can use the SubscriberId value to help provision the mobile broadband network device.
     * 
     * For devices that support the GSM cellular class, the SubscriberId value represents the International Mobile Subscriber Identity (IMSI), which is up to 15 digits long. For devices that support the CDMA cellular class, the SubscriberId value represents the Mobile Identification Number (MIN) string, or the International Roaming MIN (IRM), which is 10 digits long.
     * @see https://learn.microsoft.com/uwp/api/windows.networking.networkoperators.mobilebroadbanddeviceinformation.subscriberid
     * @type {HSTRING} 
     */
    SubscriberId {
        get => this.get_SubscriberId()
    }

    /**
     * Gets the SIM integrated circuit card identifier (ICCID) for the mobile broadband network device.
     * @remarks
     * You can use the SimIccId value to identify and provision the mobile broadband network device.
     * @see https://learn.microsoft.com/uwp/api/windows.networking.networkoperators.mobilebroadbanddeviceinformation.simiccid
     * @type {HSTRING} 
     */
    SimIccId {
        get => this.get_SimIccId()
    }

    /**
     * Gets a value indicating the type of Mobile Broadband device.
     * @see https://learn.microsoft.com/uwp/api/windows.networking.networkoperators.mobilebroadbanddeviceinformation.devicetype
     * @type {Integer} 
     */
    DeviceType {
        get => this.get_DeviceType()
    }

    /**
     * Gets the [DeviceInformation Id](../windows.devices.enumeration/deviceinformation_id.md) of the mobile broadband device.
     * @see https://learn.microsoft.com/uwp/api/windows.networking.networkoperators.mobilebroadbanddeviceinformation.deviceid
     * @type {HSTRING} 
     */
    DeviceId {
        get => this.get_DeviceId()
    }

    /**
     * Gets a value indicating the radio state of the device.
     * @remarks
     * Mobile operator UWP apps can have access to different states of the device. Access to the device states such as device readiness, account activation state, and device lock status are made available through the [NetworkDeviceStatus](networkdevicestatus.md) enumeration. The radio state information is available through the CurrentRadioState enumeration. Note that these are two different states. For example, a radio state **Off** does not translate to a **DeviceNotReady** state and vice versa.
     * @see https://learn.microsoft.com/uwp/api/windows.networking.networkoperators.mobilebroadbanddeviceinformation.currentradiostate
     * @type {Integer} 
     */
    CurrentRadioState {
        get => this.get_CurrentRadioState()
    }

    /**
     * Gets a [MobileBroadbandPinManager](mobilebroadbandpinmanager.md) object for the mobile broadband device.
     * @see https://learn.microsoft.com/uwp/api/windows.networking.networkoperators.mobilebroadbanddeviceinformation.pinmanager
     * @type {MobileBroadbandPinManager} 
     */
    PinManager {
        get => this.get_PinManager()
    }

    /**
     * Gets the revision of the mobile broadband device.
     * @see https://learn.microsoft.com/uwp/api/windows.networking.networkoperators.mobilebroadbanddeviceinformation.revision
     * @type {HSTRING} 
     */
    Revision {
        get => this.get_Revision()
    }

    /**
     * Gets the serial number of the mobile broadband device.
     * @see https://learn.microsoft.com/uwp/api/windows.networking.networkoperators.mobilebroadbanddeviceinformation.serialnumber
     * @type {HSTRING} 
     */
    SerialNumber {
        get => this.get_SerialNumber()
    }

    /**
     * Gets the Service Provider Name (SPN) for the mobile broadband device.
     * @see https://learn.microsoft.com/uwp/api/windows.networking.networkoperators.mobilebroadbanddeviceinformation.simspn
     * @type {HSTRING} 
     */
    SimSpn {
        get => this.get_SimSpn()
    }

    /**
     * Gets the Public Land Mobile Network (PLMN) name for the mobile broadband device.
     * @see https://learn.microsoft.com/uwp/api/windows.networking.networkoperators.mobilebroadbanddeviceinformation.simpnn
     * @type {HSTRING} 
     */
    SimPnn {
        get => this.get_SimPnn()
    }

    /**
     * Gets the Group Identifier Level 1 (GID1) of the mobile broadband network device.
     * @see https://learn.microsoft.com/uwp/api/windows.networking.networkoperators.mobilebroadbanddeviceinformation.simgid1
     * @type {HSTRING} 
     */
    SimGid1 {
        get => this.get_SimGid1()
    }

    /**
     * Gets the [MobileBroadbandSlotManager](/uwp/api/windows.networking.networkoperators.mobilebroadbandslotmanager) object for the mobile broadband device.
     * 
     * > [!NOTE]
     * > This functionality is available only to mobile operator apps and UWP apps given privileged access by mobile network operators.
     * > 
     * > If you want to use this API and publish your app to the Microsoft Store, then you'll need special approval. For more information, see the **Restricted capabilities** section in the [App capability declarations](/windows/uwp/packaging/app-capability-declarations#restricted-capabilities) topic.
     * @see https://learn.microsoft.com/uwp/api/windows.networking.networkoperators.mobilebroadbanddeviceinformation.slotmanager
     * @type {MobileBroadbandSlotManager} 
     */
    SlotManager {
        get => this.get_SlotManager()
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
    get_NetworkDeviceStatus() {
        if (!this.HasProp("__IMobileBroadbandDeviceInformation")) {
            if ((queryResult := this.QueryInterface(IMobileBroadbandDeviceInformation.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMobileBroadbandDeviceInformation := IMobileBroadbandDeviceInformation(outPtr)
        }

        return this.__IMobileBroadbandDeviceInformation.get_NetworkDeviceStatus()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Manufacturer() {
        if (!this.HasProp("__IMobileBroadbandDeviceInformation")) {
            if ((queryResult := this.QueryInterface(IMobileBroadbandDeviceInformation.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMobileBroadbandDeviceInformation := IMobileBroadbandDeviceInformation(outPtr)
        }

        return this.__IMobileBroadbandDeviceInformation.get_Manufacturer()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Model() {
        if (!this.HasProp("__IMobileBroadbandDeviceInformation")) {
            if ((queryResult := this.QueryInterface(IMobileBroadbandDeviceInformation.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMobileBroadbandDeviceInformation := IMobileBroadbandDeviceInformation(outPtr)
        }

        return this.__IMobileBroadbandDeviceInformation.get_Model()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_FirmwareInformation() {
        if (!this.HasProp("__IMobileBroadbandDeviceInformation")) {
            if ((queryResult := this.QueryInterface(IMobileBroadbandDeviceInformation.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMobileBroadbandDeviceInformation := IMobileBroadbandDeviceInformation(outPtr)
        }

        return this.__IMobileBroadbandDeviceInformation.get_FirmwareInformation()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_CellularClass() {
        if (!this.HasProp("__IMobileBroadbandDeviceInformation")) {
            if ((queryResult := this.QueryInterface(IMobileBroadbandDeviceInformation.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMobileBroadbandDeviceInformation := IMobileBroadbandDeviceInformation(outPtr)
        }

        return this.__IMobileBroadbandDeviceInformation.get_CellularClass()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_DataClasses() {
        if (!this.HasProp("__IMobileBroadbandDeviceInformation")) {
            if ((queryResult := this.QueryInterface(IMobileBroadbandDeviceInformation.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMobileBroadbandDeviceInformation := IMobileBroadbandDeviceInformation(outPtr)
        }

        return this.__IMobileBroadbandDeviceInformation.get_DataClasses()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_CustomDataClass() {
        if (!this.HasProp("__IMobileBroadbandDeviceInformation")) {
            if ((queryResult := this.QueryInterface(IMobileBroadbandDeviceInformation.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMobileBroadbandDeviceInformation := IMobileBroadbandDeviceInformation(outPtr)
        }

        return this.__IMobileBroadbandDeviceInformation.get_CustomDataClass()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_MobileEquipmentId() {
        if (!this.HasProp("__IMobileBroadbandDeviceInformation")) {
            if ((queryResult := this.QueryInterface(IMobileBroadbandDeviceInformation.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMobileBroadbandDeviceInformation := IMobileBroadbandDeviceInformation(outPtr)
        }

        return this.__IMobileBroadbandDeviceInformation.get_MobileEquipmentId()
    }

    /**
     * 
     * @returns {IVectorView<HSTRING>} 
     */
    get_TelephoneNumbers() {
        if (!this.HasProp("__IMobileBroadbandDeviceInformation")) {
            if ((queryResult := this.QueryInterface(IMobileBroadbandDeviceInformation.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMobileBroadbandDeviceInformation := IMobileBroadbandDeviceInformation(outPtr)
        }

        return this.__IMobileBroadbandDeviceInformation.get_TelephoneNumbers()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_SubscriberId() {
        if (!this.HasProp("__IMobileBroadbandDeviceInformation")) {
            if ((queryResult := this.QueryInterface(IMobileBroadbandDeviceInformation.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMobileBroadbandDeviceInformation := IMobileBroadbandDeviceInformation(outPtr)
        }

        return this.__IMobileBroadbandDeviceInformation.get_SubscriberId()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_SimIccId() {
        if (!this.HasProp("__IMobileBroadbandDeviceInformation")) {
            if ((queryResult := this.QueryInterface(IMobileBroadbandDeviceInformation.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMobileBroadbandDeviceInformation := IMobileBroadbandDeviceInformation(outPtr)
        }

        return this.__IMobileBroadbandDeviceInformation.get_SimIccId()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_DeviceType() {
        if (!this.HasProp("__IMobileBroadbandDeviceInformation")) {
            if ((queryResult := this.QueryInterface(IMobileBroadbandDeviceInformation.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMobileBroadbandDeviceInformation := IMobileBroadbandDeviceInformation(outPtr)
        }

        return this.__IMobileBroadbandDeviceInformation.get_DeviceType()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_DeviceId() {
        if (!this.HasProp("__IMobileBroadbandDeviceInformation")) {
            if ((queryResult := this.QueryInterface(IMobileBroadbandDeviceInformation.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMobileBroadbandDeviceInformation := IMobileBroadbandDeviceInformation(outPtr)
        }

        return this.__IMobileBroadbandDeviceInformation.get_DeviceId()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_CurrentRadioState() {
        if (!this.HasProp("__IMobileBroadbandDeviceInformation")) {
            if ((queryResult := this.QueryInterface(IMobileBroadbandDeviceInformation.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMobileBroadbandDeviceInformation := IMobileBroadbandDeviceInformation(outPtr)
        }

        return this.__IMobileBroadbandDeviceInformation.get_CurrentRadioState()
    }

    /**
     * 
     * @returns {MobileBroadbandPinManager} 
     */
    get_PinManager() {
        if (!this.HasProp("__IMobileBroadbandDeviceInformation2")) {
            if ((queryResult := this.QueryInterface(IMobileBroadbandDeviceInformation2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMobileBroadbandDeviceInformation2 := IMobileBroadbandDeviceInformation2(outPtr)
        }

        return this.__IMobileBroadbandDeviceInformation2.get_PinManager()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Revision() {
        if (!this.HasProp("__IMobileBroadbandDeviceInformation2")) {
            if ((queryResult := this.QueryInterface(IMobileBroadbandDeviceInformation2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMobileBroadbandDeviceInformation2 := IMobileBroadbandDeviceInformation2(outPtr)
        }

        return this.__IMobileBroadbandDeviceInformation2.get_Revision()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_SerialNumber() {
        if (!this.HasProp("__IMobileBroadbandDeviceInformation2")) {
            if ((queryResult := this.QueryInterface(IMobileBroadbandDeviceInformation2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMobileBroadbandDeviceInformation2 := IMobileBroadbandDeviceInformation2(outPtr)
        }

        return this.__IMobileBroadbandDeviceInformation2.get_SerialNumber()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_SimSpn() {
        if (!this.HasProp("__IMobileBroadbandDeviceInformation3")) {
            if ((queryResult := this.QueryInterface(IMobileBroadbandDeviceInformation3.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMobileBroadbandDeviceInformation3 := IMobileBroadbandDeviceInformation3(outPtr)
        }

        return this.__IMobileBroadbandDeviceInformation3.get_SimSpn()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_SimPnn() {
        if (!this.HasProp("__IMobileBroadbandDeviceInformation3")) {
            if ((queryResult := this.QueryInterface(IMobileBroadbandDeviceInformation3.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMobileBroadbandDeviceInformation3 := IMobileBroadbandDeviceInformation3(outPtr)
        }

        return this.__IMobileBroadbandDeviceInformation3.get_SimPnn()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_SimGid1() {
        if (!this.HasProp("__IMobileBroadbandDeviceInformation3")) {
            if ((queryResult := this.QueryInterface(IMobileBroadbandDeviceInformation3.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMobileBroadbandDeviceInformation3 := IMobileBroadbandDeviceInformation3(outPtr)
        }

        return this.__IMobileBroadbandDeviceInformation3.get_SimGid1()
    }

    /**
     * 
     * @returns {MobileBroadbandSlotManager} 
     */
    get_SlotManager() {
        if (!this.HasProp("__IMobileBroadbandDeviceInformation4")) {
            if ((queryResult := this.QueryInterface(IMobileBroadbandDeviceInformation4.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMobileBroadbandDeviceInformation4 := IMobileBroadbandDeviceInformation4(outPtr)
        }

        return this.__IMobileBroadbandDeviceInformation4.get_SlotManager()
    }

;@endregion Instance Methods
}
