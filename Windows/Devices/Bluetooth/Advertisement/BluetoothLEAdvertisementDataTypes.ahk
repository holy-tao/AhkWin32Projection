#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IBluetoothLEAdvertisementDataTypesStatics.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Some of the Bluetooth LE advertisement types defined in the Generic Access Profile (GAP) by the Bluetooth Special Interest Group (SIG).
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.devices.bluetooth.advertisement.bluetoothleadvertisementdatatypes
 * @namespace Windows.Devices.Bluetooth.Advertisement
 * @version WindowsRuntime 1.4
 */
class BluetoothLEAdvertisementDataTypes extends IInspectable {
;@region Static Properties
    /**
     * Section data type for a set of flags for internal use.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.bluetooth.advertisement.bluetoothleadvertisementdatatypes.flags
     * @type {Integer} 
     */
    static Flags {
        get => BluetoothLEAdvertisementDataTypes.get_Flags()
    }

    /**
     * Section data type for an incomplete list of 16-bit Bluetooth LE service UUIDs.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.bluetooth.advertisement.bluetoothleadvertisementdatatypes.incompleteservice16bituuids
     * @type {Integer} 
     */
    static IncompleteService16BitUuids {
        get => BluetoothLEAdvertisementDataTypes.get_IncompleteService16BitUuids()
    }

    /**
     * Section data type for the complete list of 16-bit Bluetooth LE service UUIDs
     * @see https://learn.microsoft.com/uwp/api/windows.devices.bluetooth.advertisement.bluetoothleadvertisementdatatypes.completeservice16bituuids
     * @type {Integer} 
     */
    static CompleteService16BitUuids {
        get => BluetoothLEAdvertisementDataTypes.get_CompleteService16BitUuids()
    }

    /**
     * Section data type for an incomplete list of 32-bit Bluetooth LE service UUIDs.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.bluetooth.advertisement.bluetoothleadvertisementdatatypes.incompleteservice32bituuids
     * @type {Integer} 
     */
    static IncompleteService32BitUuids {
        get => BluetoothLEAdvertisementDataTypes.get_IncompleteService32BitUuids()
    }

    /**
     * Section data type for the complete list of 32-bit Bluetooth LE service UUIDs
     * @see https://learn.microsoft.com/uwp/api/windows.devices.bluetooth.advertisement.bluetoothleadvertisementdatatypes.completeservice32bituuids
     * @type {Integer} 
     */
    static CompleteService32BitUuids {
        get => BluetoothLEAdvertisementDataTypes.get_CompleteService32BitUuids()
    }

    /**
     * Section data type for an incomplete list of 128-bit Bluetooth LE service UUIDs.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.bluetooth.advertisement.bluetoothleadvertisementdatatypes.incompleteservice128bituuids
     * @type {Integer} 
     */
    static IncompleteService128BitUuids {
        get => BluetoothLEAdvertisementDataTypes.get_IncompleteService128BitUuids()
    }

    /**
     * Section data type for the complete list of 128-bit Bluetooth LE service UUIDs
     * @see https://learn.microsoft.com/uwp/api/windows.devices.bluetooth.advertisement.bluetoothleadvertisementdatatypes.completeservice128bituuids
     * @type {Integer} 
     */
    static CompleteService128BitUuids {
        get => BluetoothLEAdvertisementDataTypes.get_CompleteService128BitUuids()
    }

    /**
     * Section data type for a shortened local name.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.bluetooth.advertisement.bluetoothleadvertisementdatatypes.shortenedlocalname
     * @type {Integer} 
     */
    static ShortenedLocalName {
        get => BluetoothLEAdvertisementDataTypes.get_ShortenedLocalName()
    }

    /**
     * Section data type for the Bluetooth LE complete local name.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.bluetooth.advertisement.bluetoothleadvertisementdatatypes.completelocalname
     * @type {Integer} 
     */
    static CompleteLocalName {
        get => BluetoothLEAdvertisementDataTypes.get_CompleteLocalName()
    }

    /**
     * Section data type for the Bluetooth LE transmit power level.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.bluetooth.advertisement.bluetoothleadvertisementdatatypes.txpowerlevel
     * @type {Integer} 
     */
    static TxPowerLevel {
        get => BluetoothLEAdvertisementDataTypes.get_TxPowerLevel()
    }

    /**
     * Section data type for the Peripheral connection interval range.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.bluetooth.advertisement.bluetoothleadvertisementdatatypes.peripheralconnectionintervalrange
     * @type {Integer} 
     */
    static PeripheralConnectionIntervalRange {
        get => BluetoothLEAdvertisementDataTypes.get_PeripheralConnectionIntervalRange()
    }

    /**
     * Section data type for a list of 16-bit Bluetooth LE service solicitation UUIDs.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.bluetooth.advertisement.bluetoothleadvertisementdatatypes.servicesolicitation16bituuids
     * @type {Integer} 
     */
    static ServiceSolicitation16BitUuids {
        get => BluetoothLEAdvertisementDataTypes.get_ServiceSolicitation16BitUuids()
    }

    /**
     * Section data type for a list of 32-bit Bluetooth LE service solicitation UUIDs.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.bluetooth.advertisement.bluetoothleadvertisementdatatypes.servicesolicitation32bituuids
     * @type {Integer} 
     */
    static ServiceSolicitation32BitUuids {
        get => BluetoothLEAdvertisementDataTypes.get_ServiceSolicitation32BitUuids()
    }

    /**
     * Section data type for a list of 128-bit Bluetooth LE service solicitation UUIDs.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.bluetooth.advertisement.bluetoothleadvertisementdatatypes.servicesolicitation128bituuids
     * @type {Integer} 
     */
    static ServiceSolicitation128BitUuids {
        get => BluetoothLEAdvertisementDataTypes.get_ServiceSolicitation128BitUuids()
    }

    /**
     * Section data type for service data for 16-bit Bluetooth LE UUIDs.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.bluetooth.advertisement.bluetoothleadvertisementdatatypes.servicedata16bituuids
     * @type {Integer} 
     */
    static ServiceData16BitUuids {
        get => BluetoothLEAdvertisementDataTypes.get_ServiceData16BitUuids()
    }

    /**
     * Section data type for service data for 32-bit Bluetooth LE UUIDs..
     * @see https://learn.microsoft.com/uwp/api/windows.devices.bluetooth.advertisement.bluetoothleadvertisementdatatypes.servicedata32bituuids
     * @type {Integer} 
     */
    static ServiceData32BitUuids {
        get => BluetoothLEAdvertisementDataTypes.get_ServiceData32BitUuids()
    }

    /**
     * Section data type for service data for 128-bit Bluetooth LE UUIDs.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.bluetooth.advertisement.bluetoothleadvertisementdatatypes.servicedata128bituuids
     * @type {Integer} 
     */
    static ServiceData128BitUuids {
        get => BluetoothLEAdvertisementDataTypes.get_ServiceData128BitUuids()
    }

    /**
     * Section data type for a list of public Bluetooth LE target addresses.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.bluetooth.advertisement.bluetoothleadvertisementdatatypes.publictargetaddress
     * @type {Integer} 
     */
    static PublicTargetAddress {
        get => BluetoothLEAdvertisementDataTypes.get_PublicTargetAddress()
    }

    /**
     * Section data type for a list of random Bluetooth LE target addresses.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.bluetooth.advertisement.bluetoothleadvertisementdatatypes.randomtargetaddress
     * @type {Integer} 
     */
    static RandomTargetAddress {
        get => BluetoothLEAdvertisementDataTypes.get_RandomTargetAddress()
    }

    /**
     * Section data type for the Bluetooth LE advertising appearance.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.bluetooth.advertisement.bluetoothleadvertisementdatatypes.appearance
     * @type {Integer} 
     */
    static Appearance {
        get => BluetoothLEAdvertisementDataTypes.get_Appearance()
    }

    /**
     * Section data type for the Bluetooth LE advertising interval.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.bluetooth.advertisement.bluetoothleadvertisementdatatypes.advertisinginterval
     * @type {Integer} 
     */
    static AdvertisingInterval {
        get => BluetoothLEAdvertisementDataTypes.get_AdvertisingInterval()
    }

    /**
     * Section data type for manufacturer-specific data for a Bluetooth LE advertisements.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.bluetooth.advertisement.bluetoothleadvertisementdatatypes.manufacturerspecificdata
     * @type {Integer} 
     */
    static ManufacturerSpecificData {
        get => BluetoothLEAdvertisementDataTypes.get_ManufacturerSpecificData()
    }

;@endregion Static Properties

;@region Static Methods
    /**
     * 
     * @returns {Integer} 
     */
    static get_Flags() {
        if (!BluetoothLEAdvertisementDataTypes.HasProp("__IBluetoothLEAdvertisementDataTypesStatics")) {
            activatableClassId := HSTRING.Create("Windows.Devices.Bluetooth.Advertisement.BluetoothLEAdvertisementDataTypes")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IBluetoothLEAdvertisementDataTypesStatics.IID)
            BluetoothLEAdvertisementDataTypes.__IBluetoothLEAdvertisementDataTypesStatics := IBluetoothLEAdvertisementDataTypesStatics(factoryPtr)
        }

        return BluetoothLEAdvertisementDataTypes.__IBluetoothLEAdvertisementDataTypesStatics.get_Flags()
    }

    /**
     * 
     * @returns {Integer} 
     */
    static get_IncompleteService16BitUuids() {
        if (!BluetoothLEAdvertisementDataTypes.HasProp("__IBluetoothLEAdvertisementDataTypesStatics")) {
            activatableClassId := HSTRING.Create("Windows.Devices.Bluetooth.Advertisement.BluetoothLEAdvertisementDataTypes")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IBluetoothLEAdvertisementDataTypesStatics.IID)
            BluetoothLEAdvertisementDataTypes.__IBluetoothLEAdvertisementDataTypesStatics := IBluetoothLEAdvertisementDataTypesStatics(factoryPtr)
        }

        return BluetoothLEAdvertisementDataTypes.__IBluetoothLEAdvertisementDataTypesStatics.get_IncompleteService16BitUuids()
    }

    /**
     * 
     * @returns {Integer} 
     */
    static get_CompleteService16BitUuids() {
        if (!BluetoothLEAdvertisementDataTypes.HasProp("__IBluetoothLEAdvertisementDataTypesStatics")) {
            activatableClassId := HSTRING.Create("Windows.Devices.Bluetooth.Advertisement.BluetoothLEAdvertisementDataTypes")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IBluetoothLEAdvertisementDataTypesStatics.IID)
            BluetoothLEAdvertisementDataTypes.__IBluetoothLEAdvertisementDataTypesStatics := IBluetoothLEAdvertisementDataTypesStatics(factoryPtr)
        }

        return BluetoothLEAdvertisementDataTypes.__IBluetoothLEAdvertisementDataTypesStatics.get_CompleteService16BitUuids()
    }

    /**
     * 
     * @returns {Integer} 
     */
    static get_IncompleteService32BitUuids() {
        if (!BluetoothLEAdvertisementDataTypes.HasProp("__IBluetoothLEAdvertisementDataTypesStatics")) {
            activatableClassId := HSTRING.Create("Windows.Devices.Bluetooth.Advertisement.BluetoothLEAdvertisementDataTypes")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IBluetoothLEAdvertisementDataTypesStatics.IID)
            BluetoothLEAdvertisementDataTypes.__IBluetoothLEAdvertisementDataTypesStatics := IBluetoothLEAdvertisementDataTypesStatics(factoryPtr)
        }

        return BluetoothLEAdvertisementDataTypes.__IBluetoothLEAdvertisementDataTypesStatics.get_IncompleteService32BitUuids()
    }

    /**
     * 
     * @returns {Integer} 
     */
    static get_CompleteService32BitUuids() {
        if (!BluetoothLEAdvertisementDataTypes.HasProp("__IBluetoothLEAdvertisementDataTypesStatics")) {
            activatableClassId := HSTRING.Create("Windows.Devices.Bluetooth.Advertisement.BluetoothLEAdvertisementDataTypes")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IBluetoothLEAdvertisementDataTypesStatics.IID)
            BluetoothLEAdvertisementDataTypes.__IBluetoothLEAdvertisementDataTypesStatics := IBluetoothLEAdvertisementDataTypesStatics(factoryPtr)
        }

        return BluetoothLEAdvertisementDataTypes.__IBluetoothLEAdvertisementDataTypesStatics.get_CompleteService32BitUuids()
    }

    /**
     * 
     * @returns {Integer} 
     */
    static get_IncompleteService128BitUuids() {
        if (!BluetoothLEAdvertisementDataTypes.HasProp("__IBluetoothLEAdvertisementDataTypesStatics")) {
            activatableClassId := HSTRING.Create("Windows.Devices.Bluetooth.Advertisement.BluetoothLEAdvertisementDataTypes")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IBluetoothLEAdvertisementDataTypesStatics.IID)
            BluetoothLEAdvertisementDataTypes.__IBluetoothLEAdvertisementDataTypesStatics := IBluetoothLEAdvertisementDataTypesStatics(factoryPtr)
        }

        return BluetoothLEAdvertisementDataTypes.__IBluetoothLEAdvertisementDataTypesStatics.get_IncompleteService128BitUuids()
    }

    /**
     * 
     * @returns {Integer} 
     */
    static get_CompleteService128BitUuids() {
        if (!BluetoothLEAdvertisementDataTypes.HasProp("__IBluetoothLEAdvertisementDataTypesStatics")) {
            activatableClassId := HSTRING.Create("Windows.Devices.Bluetooth.Advertisement.BluetoothLEAdvertisementDataTypes")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IBluetoothLEAdvertisementDataTypesStatics.IID)
            BluetoothLEAdvertisementDataTypes.__IBluetoothLEAdvertisementDataTypesStatics := IBluetoothLEAdvertisementDataTypesStatics(factoryPtr)
        }

        return BluetoothLEAdvertisementDataTypes.__IBluetoothLEAdvertisementDataTypesStatics.get_CompleteService128BitUuids()
    }

    /**
     * 
     * @returns {Integer} 
     */
    static get_ShortenedLocalName() {
        if (!BluetoothLEAdvertisementDataTypes.HasProp("__IBluetoothLEAdvertisementDataTypesStatics")) {
            activatableClassId := HSTRING.Create("Windows.Devices.Bluetooth.Advertisement.BluetoothLEAdvertisementDataTypes")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IBluetoothLEAdvertisementDataTypesStatics.IID)
            BluetoothLEAdvertisementDataTypes.__IBluetoothLEAdvertisementDataTypesStatics := IBluetoothLEAdvertisementDataTypesStatics(factoryPtr)
        }

        return BluetoothLEAdvertisementDataTypes.__IBluetoothLEAdvertisementDataTypesStatics.get_ShortenedLocalName()
    }

    /**
     * 
     * @returns {Integer} 
     */
    static get_CompleteLocalName() {
        if (!BluetoothLEAdvertisementDataTypes.HasProp("__IBluetoothLEAdvertisementDataTypesStatics")) {
            activatableClassId := HSTRING.Create("Windows.Devices.Bluetooth.Advertisement.BluetoothLEAdvertisementDataTypes")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IBluetoothLEAdvertisementDataTypesStatics.IID)
            BluetoothLEAdvertisementDataTypes.__IBluetoothLEAdvertisementDataTypesStatics := IBluetoothLEAdvertisementDataTypesStatics(factoryPtr)
        }

        return BluetoothLEAdvertisementDataTypes.__IBluetoothLEAdvertisementDataTypesStatics.get_CompleteLocalName()
    }

    /**
     * 
     * @returns {Integer} 
     */
    static get_TxPowerLevel() {
        if (!BluetoothLEAdvertisementDataTypes.HasProp("__IBluetoothLEAdvertisementDataTypesStatics")) {
            activatableClassId := HSTRING.Create("Windows.Devices.Bluetooth.Advertisement.BluetoothLEAdvertisementDataTypes")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IBluetoothLEAdvertisementDataTypesStatics.IID)
            BluetoothLEAdvertisementDataTypes.__IBluetoothLEAdvertisementDataTypesStatics := IBluetoothLEAdvertisementDataTypesStatics(factoryPtr)
        }

        return BluetoothLEAdvertisementDataTypes.__IBluetoothLEAdvertisementDataTypesStatics.get_TxPowerLevel()
    }

    /**
     * 
     * @returns {Integer} 
     */
    static get_PeripheralConnectionIntervalRange() {
        if (!BluetoothLEAdvertisementDataTypes.HasProp("__IBluetoothLEAdvertisementDataTypesStatics")) {
            activatableClassId := HSTRING.Create("Windows.Devices.Bluetooth.Advertisement.BluetoothLEAdvertisementDataTypes")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IBluetoothLEAdvertisementDataTypesStatics.IID)
            BluetoothLEAdvertisementDataTypes.__IBluetoothLEAdvertisementDataTypesStatics := IBluetoothLEAdvertisementDataTypesStatics(factoryPtr)
        }

        return BluetoothLEAdvertisementDataTypes.__IBluetoothLEAdvertisementDataTypesStatics.get_PeripheralConnectionIntervalRange()
    }

    /**
     * 
     * @returns {Integer} 
     */
    static get_ServiceSolicitation16BitUuids() {
        if (!BluetoothLEAdvertisementDataTypes.HasProp("__IBluetoothLEAdvertisementDataTypesStatics")) {
            activatableClassId := HSTRING.Create("Windows.Devices.Bluetooth.Advertisement.BluetoothLEAdvertisementDataTypes")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IBluetoothLEAdvertisementDataTypesStatics.IID)
            BluetoothLEAdvertisementDataTypes.__IBluetoothLEAdvertisementDataTypesStatics := IBluetoothLEAdvertisementDataTypesStatics(factoryPtr)
        }

        return BluetoothLEAdvertisementDataTypes.__IBluetoothLEAdvertisementDataTypesStatics.get_ServiceSolicitation16BitUuids()
    }

    /**
     * 
     * @returns {Integer} 
     */
    static get_ServiceSolicitation32BitUuids() {
        if (!BluetoothLEAdvertisementDataTypes.HasProp("__IBluetoothLEAdvertisementDataTypesStatics")) {
            activatableClassId := HSTRING.Create("Windows.Devices.Bluetooth.Advertisement.BluetoothLEAdvertisementDataTypes")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IBluetoothLEAdvertisementDataTypesStatics.IID)
            BluetoothLEAdvertisementDataTypes.__IBluetoothLEAdvertisementDataTypesStatics := IBluetoothLEAdvertisementDataTypesStatics(factoryPtr)
        }

        return BluetoothLEAdvertisementDataTypes.__IBluetoothLEAdvertisementDataTypesStatics.get_ServiceSolicitation32BitUuids()
    }

    /**
     * 
     * @returns {Integer} 
     */
    static get_ServiceSolicitation128BitUuids() {
        if (!BluetoothLEAdvertisementDataTypes.HasProp("__IBluetoothLEAdvertisementDataTypesStatics")) {
            activatableClassId := HSTRING.Create("Windows.Devices.Bluetooth.Advertisement.BluetoothLEAdvertisementDataTypes")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IBluetoothLEAdvertisementDataTypesStatics.IID)
            BluetoothLEAdvertisementDataTypes.__IBluetoothLEAdvertisementDataTypesStatics := IBluetoothLEAdvertisementDataTypesStatics(factoryPtr)
        }

        return BluetoothLEAdvertisementDataTypes.__IBluetoothLEAdvertisementDataTypesStatics.get_ServiceSolicitation128BitUuids()
    }

    /**
     * 
     * @returns {Integer} 
     */
    static get_ServiceData16BitUuids() {
        if (!BluetoothLEAdvertisementDataTypes.HasProp("__IBluetoothLEAdvertisementDataTypesStatics")) {
            activatableClassId := HSTRING.Create("Windows.Devices.Bluetooth.Advertisement.BluetoothLEAdvertisementDataTypes")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IBluetoothLEAdvertisementDataTypesStatics.IID)
            BluetoothLEAdvertisementDataTypes.__IBluetoothLEAdvertisementDataTypesStatics := IBluetoothLEAdvertisementDataTypesStatics(factoryPtr)
        }

        return BluetoothLEAdvertisementDataTypes.__IBluetoothLEAdvertisementDataTypesStatics.get_ServiceData16BitUuids()
    }

    /**
     * 
     * @returns {Integer} 
     */
    static get_ServiceData32BitUuids() {
        if (!BluetoothLEAdvertisementDataTypes.HasProp("__IBluetoothLEAdvertisementDataTypesStatics")) {
            activatableClassId := HSTRING.Create("Windows.Devices.Bluetooth.Advertisement.BluetoothLEAdvertisementDataTypes")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IBluetoothLEAdvertisementDataTypesStatics.IID)
            BluetoothLEAdvertisementDataTypes.__IBluetoothLEAdvertisementDataTypesStatics := IBluetoothLEAdvertisementDataTypesStatics(factoryPtr)
        }

        return BluetoothLEAdvertisementDataTypes.__IBluetoothLEAdvertisementDataTypesStatics.get_ServiceData32BitUuids()
    }

    /**
     * 
     * @returns {Integer} 
     */
    static get_ServiceData128BitUuids() {
        if (!BluetoothLEAdvertisementDataTypes.HasProp("__IBluetoothLEAdvertisementDataTypesStatics")) {
            activatableClassId := HSTRING.Create("Windows.Devices.Bluetooth.Advertisement.BluetoothLEAdvertisementDataTypes")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IBluetoothLEAdvertisementDataTypesStatics.IID)
            BluetoothLEAdvertisementDataTypes.__IBluetoothLEAdvertisementDataTypesStatics := IBluetoothLEAdvertisementDataTypesStatics(factoryPtr)
        }

        return BluetoothLEAdvertisementDataTypes.__IBluetoothLEAdvertisementDataTypesStatics.get_ServiceData128BitUuids()
    }

    /**
     * 
     * @returns {Integer} 
     */
    static get_PublicTargetAddress() {
        if (!BluetoothLEAdvertisementDataTypes.HasProp("__IBluetoothLEAdvertisementDataTypesStatics")) {
            activatableClassId := HSTRING.Create("Windows.Devices.Bluetooth.Advertisement.BluetoothLEAdvertisementDataTypes")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IBluetoothLEAdvertisementDataTypesStatics.IID)
            BluetoothLEAdvertisementDataTypes.__IBluetoothLEAdvertisementDataTypesStatics := IBluetoothLEAdvertisementDataTypesStatics(factoryPtr)
        }

        return BluetoothLEAdvertisementDataTypes.__IBluetoothLEAdvertisementDataTypesStatics.get_PublicTargetAddress()
    }

    /**
     * 
     * @returns {Integer} 
     */
    static get_RandomTargetAddress() {
        if (!BluetoothLEAdvertisementDataTypes.HasProp("__IBluetoothLEAdvertisementDataTypesStatics")) {
            activatableClassId := HSTRING.Create("Windows.Devices.Bluetooth.Advertisement.BluetoothLEAdvertisementDataTypes")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IBluetoothLEAdvertisementDataTypesStatics.IID)
            BluetoothLEAdvertisementDataTypes.__IBluetoothLEAdvertisementDataTypesStatics := IBluetoothLEAdvertisementDataTypesStatics(factoryPtr)
        }

        return BluetoothLEAdvertisementDataTypes.__IBluetoothLEAdvertisementDataTypesStatics.get_RandomTargetAddress()
    }

    /**
     * 
     * @returns {Integer} 
     */
    static get_Appearance() {
        if (!BluetoothLEAdvertisementDataTypes.HasProp("__IBluetoothLEAdvertisementDataTypesStatics")) {
            activatableClassId := HSTRING.Create("Windows.Devices.Bluetooth.Advertisement.BluetoothLEAdvertisementDataTypes")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IBluetoothLEAdvertisementDataTypesStatics.IID)
            BluetoothLEAdvertisementDataTypes.__IBluetoothLEAdvertisementDataTypesStatics := IBluetoothLEAdvertisementDataTypesStatics(factoryPtr)
        }

        return BluetoothLEAdvertisementDataTypes.__IBluetoothLEAdvertisementDataTypesStatics.get_Appearance()
    }

    /**
     * 
     * @returns {Integer} 
     */
    static get_AdvertisingInterval() {
        if (!BluetoothLEAdvertisementDataTypes.HasProp("__IBluetoothLEAdvertisementDataTypesStatics")) {
            activatableClassId := HSTRING.Create("Windows.Devices.Bluetooth.Advertisement.BluetoothLEAdvertisementDataTypes")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IBluetoothLEAdvertisementDataTypesStatics.IID)
            BluetoothLEAdvertisementDataTypes.__IBluetoothLEAdvertisementDataTypesStatics := IBluetoothLEAdvertisementDataTypesStatics(factoryPtr)
        }

        return BluetoothLEAdvertisementDataTypes.__IBluetoothLEAdvertisementDataTypesStatics.get_AdvertisingInterval()
    }

    /**
     * 
     * @returns {Integer} 
     */
    static get_ManufacturerSpecificData() {
        if (!BluetoothLEAdvertisementDataTypes.HasProp("__IBluetoothLEAdvertisementDataTypesStatics")) {
            activatableClassId := HSTRING.Create("Windows.Devices.Bluetooth.Advertisement.BluetoothLEAdvertisementDataTypes")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IBluetoothLEAdvertisementDataTypesStatics.IID)
            BluetoothLEAdvertisementDataTypes.__IBluetoothLEAdvertisementDataTypesStatics := IBluetoothLEAdvertisementDataTypesStatics(factoryPtr)
        }

        return BluetoothLEAdvertisementDataTypes.__IBluetoothLEAdvertisementDataTypesStatics.get_ManufacturerSpecificData()
    }

;@endregion Static Methods

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

;@endregion Instance Methods
}
