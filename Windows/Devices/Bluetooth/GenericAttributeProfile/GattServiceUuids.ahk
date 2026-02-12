#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IGattServiceUuidsStatics2.ahk
#Include .\IGattServiceUuidsStatics.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Represents an enumeration of the most well known Service UUID values, and provides convenience methods for working with GATT service UUIDs, and static properties providing service UUIDs for common GATT services. To view a list of all Bluetooth SIG-defined service UUIDs, see [Bluetooth SIG-defined Service UUIDs](https://www.bluetooth.com/specifications/gatt/services/).
  * 
  * > [!NOTE]
  * > For UUIDs for which **GattServiceUuids** doesn't have a named property, you can use [BluetoothUuidHelper.FromShortId](/uwp/api/windows.devices.bluetooth.bluetoothuuidhelper.fromshortid).
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.devices.bluetooth.genericattributeprofile.gattserviceuuids
 * @namespace Windows.Devices.Bluetooth.GenericAttributeProfile
 * @version WindowsRuntime 1.4
 */
class GattServiceUuids extends IInspectable {
;@region Static Properties
    /**
     * Gets the Bluetooth SIG-defined AlertNotification Service UUID.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.bluetooth.genericattributeprofile.gattserviceuuids.alertnotification
     * @type {Guid} 
     */
    static AlertNotification {
        get => GattServiceUuids.get_AlertNotification()
    }

    /**
     * Gets the Bluetooth SIG-defined CurrentTime service UUID.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.bluetooth.genericattributeprofile.gattserviceuuids.currenttime
     * @type {Guid} 
     */
    static CurrentTime {
        get => GattServiceUuids.get_CurrentTime()
    }

    /**
     * Gets the Bluetooth SIG-defined CyclingPower service UUID.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.bluetooth.genericattributeprofile.gattserviceuuids.cyclingpower
     * @type {Guid} 
     */
    static CyclingPower {
        get => GattServiceUuids.get_CyclingPower()
    }

    /**
     * Gets the Bluetooth SIG-defined DeviceInformation service UUID.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.bluetooth.genericattributeprofile.gattserviceuuids.deviceinformation
     * @type {Guid} 
     */
    static DeviceInformation {
        get => GattServiceUuids.get_DeviceInformation()
    }

    /**
     * Gets the Bluetooth SIG-defined HumanInterfaceDevice service UUID.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.bluetooth.genericattributeprofile.gattserviceuuids.humaninterfacedevice
     * @type {Guid} 
     */
    static HumanInterfaceDevice {
        get => GattServiceUuids.get_HumanInterfaceDevice()
    }

    /**
     * Gets the Bluetooth SIG-defined ImmediateAlert service UUID.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.bluetooth.genericattributeprofile.gattserviceuuids.immediatealert
     * @type {Guid} 
     */
    static ImmediateAlert {
        get => GattServiceUuids.get_ImmediateAlert()
    }

    /**
     * Gets the Bluetooth SIG-defined LinkLoss service UUID.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.bluetooth.genericattributeprofile.gattserviceuuids.linkloss
     * @type {Guid} 
     */
    static LinkLoss {
        get => GattServiceUuids.get_LinkLoss()
    }

    /**
     * Gets the Bluetooth SIG-defined LocationAndNavigation service UUID.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.bluetooth.genericattributeprofile.gattserviceuuids.locationandnavigation
     * @type {Guid} 
     */
    static LocationAndNavigation {
        get => GattServiceUuids.get_LocationAndNavigation()
    }

    /**
     * Gets the Bluetooth SIG-defined NextDstChange service UUID.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.bluetooth.genericattributeprofile.gattserviceuuids.nextdstchange
     * @type {Guid} 
     */
    static NextDstChange {
        get => GattServiceUuids.get_NextDstChange()
    }

    /**
     * Gets the Bluetooth SIG-defined PhoneAlertStatus service UUID.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.bluetooth.genericattributeprofile.gattserviceuuids.phonealertstatus
     * @type {Guid} 
     */
    static PhoneAlertStatus {
        get => GattServiceUuids.get_PhoneAlertStatus()
    }

    /**
     * Gets the Bluetooth SIG-defined ReferenceTimeUpdate service UUID.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.bluetooth.genericattributeprofile.gattserviceuuids.referencetimeupdate
     * @type {Guid} 
     */
    static ReferenceTimeUpdate {
        get => GattServiceUuids.get_ReferenceTimeUpdate()
    }

    /**
     * Gets the Bluetooth SIG-defined ScanParameters service UUID.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.bluetooth.genericattributeprofile.gattserviceuuids.scanparameters
     * @type {Guid} 
     */
    static ScanParameters {
        get => GattServiceUuids.get_ScanParameters()
    }

    /**
     * Gets the Bluetooth SIG-defined TxPower service UUID.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.bluetooth.genericattributeprofile.gattserviceuuids.txpower
     * @type {Guid} 
     */
    static TxPower {
        get => GattServiceUuids.get_TxPower()
    }

    /**
     * Gets the Bluetooth SIG-defined Battery Service UUID.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.bluetooth.genericattributeprofile.gattserviceuuids.battery
     * @type {Guid} 
     */
    static Battery {
        get => GattServiceUuids.get_Battery()
    }

    /**
     * Gets the Bluetooth SIG-defined Blood Pressure Service UUID.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.bluetooth.genericattributeprofile.gattserviceuuids.bloodpressure
     * @type {Guid} 
     */
    static BloodPressure {
        get => GattServiceUuids.get_BloodPressure()
    }

    /**
     * Gets the Bluetooth SIG-defined Cycling Speed And Cadence Service UUID.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.bluetooth.genericattributeprofile.gattserviceuuids.cyclingspeedandcadence
     * @type {Guid} 
     */
    static CyclingSpeedAndCadence {
        get => GattServiceUuids.get_CyclingSpeedAndCadence()
    }

    /**
     * Gets the Bluetooth SIG-defined UUID for the Generic Access Service.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.bluetooth.genericattributeprofile.gattserviceuuids.genericaccess
     * @type {Guid} 
     */
    static GenericAccess {
        get => GattServiceUuids.get_GenericAccess()
    }

    /**
     * Gets the Bluetooth SIG-defined UUID for the Generic Attribute Service.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.bluetooth.genericattributeprofile.gattserviceuuids.genericattribute
     * @type {Guid} 
     */
    static GenericAttribute {
        get => GattServiceUuids.get_GenericAttribute()
    }

    /**
     * Gets the Bluetooth SIG-defined Glucose Service UUID.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.bluetooth.genericattributeprofile.gattserviceuuids.glucose
     * @type {Guid} 
     */
    static Glucose {
        get => GattServiceUuids.get_Glucose()
    }

    /**
     * Gets the Bluetooth SIG-defined Health Thermometer Service UUID.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.bluetooth.genericattributeprofile.gattserviceuuids.healththermometer
     * @type {Guid} 
     */
    static HealthThermometer {
        get => GattServiceUuids.get_HealthThermometer()
    }

    /**
     * Gets the Bluetooth SIG-defined Heart Rate Service UUID.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.bluetooth.genericattributeprofile.gattserviceuuids.heartrate
     * @type {Guid} 
     */
    static HeartRate {
        get => GattServiceUuids.get_HeartRate()
    }

    /**
     * Gets the Bluetooth SIG-defined Running Speed And Cadence Service UUID.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.bluetooth.genericattributeprofile.gattserviceuuids.runningspeedandcadence
     * @type {Guid} 
     */
    static RunningSpeedAndCadence {
        get => GattServiceUuids.get_RunningSpeedAndCadence()
    }

;@endregion Static Properties

;@region Static Methods
    /**
     * 
     * @returns {Guid} 
     */
    static get_AlertNotification() {
        if (!GattServiceUuids.HasProp("__IGattServiceUuidsStatics2")) {
            activatableClassId := HSTRING.Create("Windows.Devices.Bluetooth.GenericAttributeProfile.GattServiceUuids")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IGattServiceUuidsStatics2.IID)
            GattServiceUuids.__IGattServiceUuidsStatics2 := IGattServiceUuidsStatics2(factoryPtr)
        }

        return GattServiceUuids.__IGattServiceUuidsStatics2.get_AlertNotification()
    }

    /**
     * 
     * @returns {Guid} 
     */
    static get_CurrentTime() {
        if (!GattServiceUuids.HasProp("__IGattServiceUuidsStatics2")) {
            activatableClassId := HSTRING.Create("Windows.Devices.Bluetooth.GenericAttributeProfile.GattServiceUuids")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IGattServiceUuidsStatics2.IID)
            GattServiceUuids.__IGattServiceUuidsStatics2 := IGattServiceUuidsStatics2(factoryPtr)
        }

        return GattServiceUuids.__IGattServiceUuidsStatics2.get_CurrentTime()
    }

    /**
     * 
     * @returns {Guid} 
     */
    static get_CyclingPower() {
        if (!GattServiceUuids.HasProp("__IGattServiceUuidsStatics2")) {
            activatableClassId := HSTRING.Create("Windows.Devices.Bluetooth.GenericAttributeProfile.GattServiceUuids")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IGattServiceUuidsStatics2.IID)
            GattServiceUuids.__IGattServiceUuidsStatics2 := IGattServiceUuidsStatics2(factoryPtr)
        }

        return GattServiceUuids.__IGattServiceUuidsStatics2.get_CyclingPower()
    }

    /**
     * 
     * @returns {Guid} 
     */
    static get_DeviceInformation() {
        if (!GattServiceUuids.HasProp("__IGattServiceUuidsStatics2")) {
            activatableClassId := HSTRING.Create("Windows.Devices.Bluetooth.GenericAttributeProfile.GattServiceUuids")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IGattServiceUuidsStatics2.IID)
            GattServiceUuids.__IGattServiceUuidsStatics2 := IGattServiceUuidsStatics2(factoryPtr)
        }

        return GattServiceUuids.__IGattServiceUuidsStatics2.get_DeviceInformation()
    }

    /**
     * 
     * @returns {Guid} 
     */
    static get_HumanInterfaceDevice() {
        if (!GattServiceUuids.HasProp("__IGattServiceUuidsStatics2")) {
            activatableClassId := HSTRING.Create("Windows.Devices.Bluetooth.GenericAttributeProfile.GattServiceUuids")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IGattServiceUuidsStatics2.IID)
            GattServiceUuids.__IGattServiceUuidsStatics2 := IGattServiceUuidsStatics2(factoryPtr)
        }

        return GattServiceUuids.__IGattServiceUuidsStatics2.get_HumanInterfaceDevice()
    }

    /**
     * 
     * @returns {Guid} 
     */
    static get_ImmediateAlert() {
        if (!GattServiceUuids.HasProp("__IGattServiceUuidsStatics2")) {
            activatableClassId := HSTRING.Create("Windows.Devices.Bluetooth.GenericAttributeProfile.GattServiceUuids")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IGattServiceUuidsStatics2.IID)
            GattServiceUuids.__IGattServiceUuidsStatics2 := IGattServiceUuidsStatics2(factoryPtr)
        }

        return GattServiceUuids.__IGattServiceUuidsStatics2.get_ImmediateAlert()
    }

    /**
     * 
     * @returns {Guid} 
     */
    static get_LinkLoss() {
        if (!GattServiceUuids.HasProp("__IGattServiceUuidsStatics2")) {
            activatableClassId := HSTRING.Create("Windows.Devices.Bluetooth.GenericAttributeProfile.GattServiceUuids")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IGattServiceUuidsStatics2.IID)
            GattServiceUuids.__IGattServiceUuidsStatics2 := IGattServiceUuidsStatics2(factoryPtr)
        }

        return GattServiceUuids.__IGattServiceUuidsStatics2.get_LinkLoss()
    }

    /**
     * 
     * @returns {Guid} 
     */
    static get_LocationAndNavigation() {
        if (!GattServiceUuids.HasProp("__IGattServiceUuidsStatics2")) {
            activatableClassId := HSTRING.Create("Windows.Devices.Bluetooth.GenericAttributeProfile.GattServiceUuids")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IGattServiceUuidsStatics2.IID)
            GattServiceUuids.__IGattServiceUuidsStatics2 := IGattServiceUuidsStatics2(factoryPtr)
        }

        return GattServiceUuids.__IGattServiceUuidsStatics2.get_LocationAndNavigation()
    }

    /**
     * 
     * @returns {Guid} 
     */
    static get_NextDstChange() {
        if (!GattServiceUuids.HasProp("__IGattServiceUuidsStatics2")) {
            activatableClassId := HSTRING.Create("Windows.Devices.Bluetooth.GenericAttributeProfile.GattServiceUuids")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IGattServiceUuidsStatics2.IID)
            GattServiceUuids.__IGattServiceUuidsStatics2 := IGattServiceUuidsStatics2(factoryPtr)
        }

        return GattServiceUuids.__IGattServiceUuidsStatics2.get_NextDstChange()
    }

    /**
     * 
     * @returns {Guid} 
     */
    static get_PhoneAlertStatus() {
        if (!GattServiceUuids.HasProp("__IGattServiceUuidsStatics2")) {
            activatableClassId := HSTRING.Create("Windows.Devices.Bluetooth.GenericAttributeProfile.GattServiceUuids")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IGattServiceUuidsStatics2.IID)
            GattServiceUuids.__IGattServiceUuidsStatics2 := IGattServiceUuidsStatics2(factoryPtr)
        }

        return GattServiceUuids.__IGattServiceUuidsStatics2.get_PhoneAlertStatus()
    }

    /**
     * 
     * @returns {Guid} 
     */
    static get_ReferenceTimeUpdate() {
        if (!GattServiceUuids.HasProp("__IGattServiceUuidsStatics2")) {
            activatableClassId := HSTRING.Create("Windows.Devices.Bluetooth.GenericAttributeProfile.GattServiceUuids")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IGattServiceUuidsStatics2.IID)
            GattServiceUuids.__IGattServiceUuidsStatics2 := IGattServiceUuidsStatics2(factoryPtr)
        }

        return GattServiceUuids.__IGattServiceUuidsStatics2.get_ReferenceTimeUpdate()
    }

    /**
     * 
     * @returns {Guid} 
     */
    static get_ScanParameters() {
        if (!GattServiceUuids.HasProp("__IGattServiceUuidsStatics2")) {
            activatableClassId := HSTRING.Create("Windows.Devices.Bluetooth.GenericAttributeProfile.GattServiceUuids")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IGattServiceUuidsStatics2.IID)
            GattServiceUuids.__IGattServiceUuidsStatics2 := IGattServiceUuidsStatics2(factoryPtr)
        }

        return GattServiceUuids.__IGattServiceUuidsStatics2.get_ScanParameters()
    }

    /**
     * 
     * @returns {Guid} 
     */
    static get_TxPower() {
        if (!GattServiceUuids.HasProp("__IGattServiceUuidsStatics2")) {
            activatableClassId := HSTRING.Create("Windows.Devices.Bluetooth.GenericAttributeProfile.GattServiceUuids")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IGattServiceUuidsStatics2.IID)
            GattServiceUuids.__IGattServiceUuidsStatics2 := IGattServiceUuidsStatics2(factoryPtr)
        }

        return GattServiceUuids.__IGattServiceUuidsStatics2.get_TxPower()
    }

    /**
     * 
     * @returns {Guid} 
     */
    static get_Battery() {
        if (!GattServiceUuids.HasProp("__IGattServiceUuidsStatics")) {
            activatableClassId := HSTRING.Create("Windows.Devices.Bluetooth.GenericAttributeProfile.GattServiceUuids")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IGattServiceUuidsStatics.IID)
            GattServiceUuids.__IGattServiceUuidsStatics := IGattServiceUuidsStatics(factoryPtr)
        }

        return GattServiceUuids.__IGattServiceUuidsStatics.get_Battery()
    }

    /**
     * 
     * @returns {Guid} 
     */
    static get_BloodPressure() {
        if (!GattServiceUuids.HasProp("__IGattServiceUuidsStatics")) {
            activatableClassId := HSTRING.Create("Windows.Devices.Bluetooth.GenericAttributeProfile.GattServiceUuids")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IGattServiceUuidsStatics.IID)
            GattServiceUuids.__IGattServiceUuidsStatics := IGattServiceUuidsStatics(factoryPtr)
        }

        return GattServiceUuids.__IGattServiceUuidsStatics.get_BloodPressure()
    }

    /**
     * 
     * @returns {Guid} 
     */
    static get_CyclingSpeedAndCadence() {
        if (!GattServiceUuids.HasProp("__IGattServiceUuidsStatics")) {
            activatableClassId := HSTRING.Create("Windows.Devices.Bluetooth.GenericAttributeProfile.GattServiceUuids")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IGattServiceUuidsStatics.IID)
            GattServiceUuids.__IGattServiceUuidsStatics := IGattServiceUuidsStatics(factoryPtr)
        }

        return GattServiceUuids.__IGattServiceUuidsStatics.get_CyclingSpeedAndCadence()
    }

    /**
     * 
     * @returns {Guid} 
     */
    static get_GenericAccess() {
        if (!GattServiceUuids.HasProp("__IGattServiceUuidsStatics")) {
            activatableClassId := HSTRING.Create("Windows.Devices.Bluetooth.GenericAttributeProfile.GattServiceUuids")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IGattServiceUuidsStatics.IID)
            GattServiceUuids.__IGattServiceUuidsStatics := IGattServiceUuidsStatics(factoryPtr)
        }

        return GattServiceUuids.__IGattServiceUuidsStatics.get_GenericAccess()
    }

    /**
     * 
     * @returns {Guid} 
     */
    static get_GenericAttribute() {
        if (!GattServiceUuids.HasProp("__IGattServiceUuidsStatics")) {
            activatableClassId := HSTRING.Create("Windows.Devices.Bluetooth.GenericAttributeProfile.GattServiceUuids")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IGattServiceUuidsStatics.IID)
            GattServiceUuids.__IGattServiceUuidsStatics := IGattServiceUuidsStatics(factoryPtr)
        }

        return GattServiceUuids.__IGattServiceUuidsStatics.get_GenericAttribute()
    }

    /**
     * 
     * @returns {Guid} 
     */
    static get_Glucose() {
        if (!GattServiceUuids.HasProp("__IGattServiceUuidsStatics")) {
            activatableClassId := HSTRING.Create("Windows.Devices.Bluetooth.GenericAttributeProfile.GattServiceUuids")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IGattServiceUuidsStatics.IID)
            GattServiceUuids.__IGattServiceUuidsStatics := IGattServiceUuidsStatics(factoryPtr)
        }

        return GattServiceUuids.__IGattServiceUuidsStatics.get_Glucose()
    }

    /**
     * 
     * @returns {Guid} 
     */
    static get_HealthThermometer() {
        if (!GattServiceUuids.HasProp("__IGattServiceUuidsStatics")) {
            activatableClassId := HSTRING.Create("Windows.Devices.Bluetooth.GenericAttributeProfile.GattServiceUuids")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IGattServiceUuidsStatics.IID)
            GattServiceUuids.__IGattServiceUuidsStatics := IGattServiceUuidsStatics(factoryPtr)
        }

        return GattServiceUuids.__IGattServiceUuidsStatics.get_HealthThermometer()
    }

    /**
     * 
     * @returns {Guid} 
     */
    static get_HeartRate() {
        if (!GattServiceUuids.HasProp("__IGattServiceUuidsStatics")) {
            activatableClassId := HSTRING.Create("Windows.Devices.Bluetooth.GenericAttributeProfile.GattServiceUuids")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IGattServiceUuidsStatics.IID)
            GattServiceUuids.__IGattServiceUuidsStatics := IGattServiceUuidsStatics(factoryPtr)
        }

        return GattServiceUuids.__IGattServiceUuidsStatics.get_HeartRate()
    }

    /**
     * 
     * @returns {Guid} 
     */
    static get_RunningSpeedAndCadence() {
        if (!GattServiceUuids.HasProp("__IGattServiceUuidsStatics")) {
            activatableClassId := HSTRING.Create("Windows.Devices.Bluetooth.GenericAttributeProfile.GattServiceUuids")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IGattServiceUuidsStatics.IID)
            GattServiceUuids.__IGattServiceUuidsStatics := IGattServiceUuidsStatics(factoryPtr)
        }

        return GattServiceUuids.__IGattServiceUuidsStatics.get_RunningSpeedAndCadence()
    }

;@endregion Static Methods

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

;@endregion Instance Methods
}
