#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IGattPresentationFormatTypesStatics.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Represents the different well-known values that the GattPresentationFormat.FormatType property can take.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.devices.bluetooth.genericattributeprofile.gattpresentationformattypes
 * @namespace Windows.Devices.Bluetooth.GenericAttributeProfile
 * @version WindowsRuntime 1.4
 */
class GattPresentationFormatTypes extends IInspectable {
;@region Static Properties
    /**
     * Gets the value of the Boolean Format Type.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.bluetooth.genericattributeprofile.gattpresentationformattypes.boolean
     * @type {Integer} 
     */
    static Boolean {
        get => GattPresentationFormatTypes.get_Boolean()
    }

    /**
     * Gets the value of the Bit2 Format Type.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.bluetooth.genericattributeprofile.gattpresentationformattypes.bit2
     * @type {Integer} 
     */
    static Bit2 {
        get => GattPresentationFormatTypes.get_Bit2()
    }

    /**
     * Gets the value of the Nibble Format Type.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.bluetooth.genericattributeprofile.gattpresentationformattypes.nibble
     * @type {Integer} 
     */
    static Nibble {
        get => GattPresentationFormatTypes.get_Nibble()
    }

    /**
     * Gets the value of the UInt8 Format Type.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.bluetooth.genericattributeprofile.gattpresentationformattypes.uint8
     * @type {Integer} 
     */
    static UInt8 {
        get => GattPresentationFormatTypes.get_UInt8()
    }

    /**
     * Gets the value of the UInt12 Format Type.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.bluetooth.genericattributeprofile.gattpresentationformattypes.uint12
     * @type {Integer} 
     */
    static UInt12 {
        get => GattPresentationFormatTypes.get_UInt12()
    }

    /**
     * Gets the value of the UInt16 Format Type.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.bluetooth.genericattributeprofile.gattpresentationformattypes.uint16
     * @type {Integer} 
     */
    static UInt16 {
        get => GattPresentationFormatTypes.get_UInt16()
    }

    /**
     * Gets the value of the UInt24 Format Type.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.bluetooth.genericattributeprofile.gattpresentationformattypes.uint24
     * @type {Integer} 
     */
    static UInt24 {
        get => GattPresentationFormatTypes.get_UInt24()
    }

    /**
     * Gets the value of the UInt32 Format Type.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.bluetooth.genericattributeprofile.gattpresentationformattypes.uint32
     * @type {Integer} 
     */
    static UInt32 {
        get => GattPresentationFormatTypes.get_UInt32()
    }

    /**
     * Gets the value of the UInt48 Format Type.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.bluetooth.genericattributeprofile.gattpresentationformattypes.uint48
     * @type {Integer} 
     */
    static UInt48 {
        get => GattPresentationFormatTypes.get_UInt48()
    }

    /**
     * Gets the value of the UInt64 Format Type.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.bluetooth.genericattributeprofile.gattpresentationformattypes.uint64
     * @type {Integer} 
     */
    static UInt64 {
        get => GattPresentationFormatTypes.get_UInt64()
    }

    /**
     * Gets the value of the UInt128 Format Type.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.bluetooth.genericattributeprofile.gattpresentationformattypes.uint128
     * @type {Integer} 
     */
    static UInt128 {
        get => GattPresentationFormatTypes.get_UInt128()
    }

    /**
     * Gets the value of the SInt8 Format Type.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.bluetooth.genericattributeprofile.gattpresentationformattypes.sint8
     * @type {Integer} 
     */
    static SInt8 {
        get => GattPresentationFormatTypes.get_SInt8()
    }

    /**
     * Gets the value of the SInt12 Format Type.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.bluetooth.genericattributeprofile.gattpresentationformattypes.sint12
     * @type {Integer} 
     */
    static SInt12 {
        get => GattPresentationFormatTypes.get_SInt12()
    }

    /**
     * Gets the value of the SInt16 Format Type.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.bluetooth.genericattributeprofile.gattpresentationformattypes.sint16
     * @type {Integer} 
     */
    static SInt16 {
        get => GattPresentationFormatTypes.get_SInt16()
    }

    /**
     * Gets the value of the SInt24 Format Type.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.bluetooth.genericattributeprofile.gattpresentationformattypes.sint24
     * @type {Integer} 
     */
    static SInt24 {
        get => GattPresentationFormatTypes.get_SInt24()
    }

    /**
     * Gets the value of the SInt32 Format Type.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.bluetooth.genericattributeprofile.gattpresentationformattypes.sint32
     * @type {Integer} 
     */
    static SInt32 {
        get => GattPresentationFormatTypes.get_SInt32()
    }

    /**
     * Gets the value of the SInt48 Format Type.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.bluetooth.genericattributeprofile.gattpresentationformattypes.sint48
     * @type {Integer} 
     */
    static SInt48 {
        get => GattPresentationFormatTypes.get_SInt48()
    }

    /**
     * Gets the value of the SInt64 Format Type.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.bluetooth.genericattributeprofile.gattpresentationformattypes.sint64
     * @type {Integer} 
     */
    static SInt64 {
        get => GattPresentationFormatTypes.get_SInt64()
    }

    /**
     * Gets the value of the SInt128 Format Type.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.bluetooth.genericattributeprofile.gattpresentationformattypes.sint128
     * @type {Integer} 
     */
    static SInt128 {
        get => GattPresentationFormatTypes.get_SInt128()
    }

    /**
     * Gets the value of the Float32 Format Type.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.bluetooth.genericattributeprofile.gattpresentationformattypes.float32
     * @type {Integer} 
     */
    static Float32 {
        get => GattPresentationFormatTypes.get_Float32()
    }

    /**
     * Gets the value of the Float64 Format Type.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.bluetooth.genericattributeprofile.gattpresentationformattypes.float64
     * @type {Integer} 
     */
    static Float64 {
        get => GattPresentationFormatTypes.get_Float64()
    }

    /**
     * Gets the value of the SFloat Format Type.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.bluetooth.genericattributeprofile.gattpresentationformattypes.sfloat
     * @type {Integer} 
     */
    static SFloat {
        get => GattPresentationFormatTypes.get_SFloat()
    }

    /**
     * Gets the value of the Float Format Type.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.bluetooth.genericattributeprofile.gattpresentationformattypes.float
     * @type {Integer} 
     */
    static Float {
        get => GattPresentationFormatTypes.get_Float()
    }

    /**
     * Gets the value of the DUInt16 Format Type.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.bluetooth.genericattributeprofile.gattpresentationformattypes.duint16
     * @type {Integer} 
     */
    static DUInt16 {
        get => GattPresentationFormatTypes.get_DUInt16()
    }

    /**
     * Gets the value of the Utf8 Format Type.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.bluetooth.genericattributeprofile.gattpresentationformattypes.utf8
     * @type {Integer} 
     */
    static Utf8 {
        get => GattPresentationFormatTypes.get_Utf8()
    }

    /**
     * Gets the value of the Utf16 Format Type.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.bluetooth.genericattributeprofile.gattpresentationformattypes.utf16
     * @type {Integer} 
     */
    static Utf16 {
        get => GattPresentationFormatTypes.get_Utf16()
    }

    /**
     * Gets the value of the Struct Format Type.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.bluetooth.genericattributeprofile.gattpresentationformattypes.struct
     * @type {Integer} 
     */
    static Struct {
        get => GattPresentationFormatTypes.get_Struct()
    }

;@endregion Static Properties

;@region Static Methods
    /**
     * 
     * @returns {Integer} 
     */
    static get_Boolean() {
        if (!GattPresentationFormatTypes.HasProp("__IGattPresentationFormatTypesStatics")) {
            activatableClassId := HSTRING.Create("Windows.Devices.Bluetooth.GenericAttributeProfile.GattPresentationFormatTypes")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IGattPresentationFormatTypesStatics.IID)
            GattPresentationFormatTypes.__IGattPresentationFormatTypesStatics := IGattPresentationFormatTypesStatics(factoryPtr)
        }

        return GattPresentationFormatTypes.__IGattPresentationFormatTypesStatics.get_Boolean()
    }

    /**
     * 
     * @returns {Integer} 
     */
    static get_Bit2() {
        if (!GattPresentationFormatTypes.HasProp("__IGattPresentationFormatTypesStatics")) {
            activatableClassId := HSTRING.Create("Windows.Devices.Bluetooth.GenericAttributeProfile.GattPresentationFormatTypes")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IGattPresentationFormatTypesStatics.IID)
            GattPresentationFormatTypes.__IGattPresentationFormatTypesStatics := IGattPresentationFormatTypesStatics(factoryPtr)
        }

        return GattPresentationFormatTypes.__IGattPresentationFormatTypesStatics.get_Bit2()
    }

    /**
     * 
     * @returns {Integer} 
     */
    static get_Nibble() {
        if (!GattPresentationFormatTypes.HasProp("__IGattPresentationFormatTypesStatics")) {
            activatableClassId := HSTRING.Create("Windows.Devices.Bluetooth.GenericAttributeProfile.GattPresentationFormatTypes")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IGattPresentationFormatTypesStatics.IID)
            GattPresentationFormatTypes.__IGattPresentationFormatTypesStatics := IGattPresentationFormatTypesStatics(factoryPtr)
        }

        return GattPresentationFormatTypes.__IGattPresentationFormatTypesStatics.get_Nibble()
    }

    /**
     * 
     * @returns {Integer} 
     */
    static get_UInt8() {
        if (!GattPresentationFormatTypes.HasProp("__IGattPresentationFormatTypesStatics")) {
            activatableClassId := HSTRING.Create("Windows.Devices.Bluetooth.GenericAttributeProfile.GattPresentationFormatTypes")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IGattPresentationFormatTypesStatics.IID)
            GattPresentationFormatTypes.__IGattPresentationFormatTypesStatics := IGattPresentationFormatTypesStatics(factoryPtr)
        }

        return GattPresentationFormatTypes.__IGattPresentationFormatTypesStatics.get_UInt8()
    }

    /**
     * 
     * @returns {Integer} 
     */
    static get_UInt12() {
        if (!GattPresentationFormatTypes.HasProp("__IGattPresentationFormatTypesStatics")) {
            activatableClassId := HSTRING.Create("Windows.Devices.Bluetooth.GenericAttributeProfile.GattPresentationFormatTypes")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IGattPresentationFormatTypesStatics.IID)
            GattPresentationFormatTypes.__IGattPresentationFormatTypesStatics := IGattPresentationFormatTypesStatics(factoryPtr)
        }

        return GattPresentationFormatTypes.__IGattPresentationFormatTypesStatics.get_UInt12()
    }

    /**
     * 
     * @returns {Integer} 
     */
    static get_UInt16() {
        if (!GattPresentationFormatTypes.HasProp("__IGattPresentationFormatTypesStatics")) {
            activatableClassId := HSTRING.Create("Windows.Devices.Bluetooth.GenericAttributeProfile.GattPresentationFormatTypes")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IGattPresentationFormatTypesStatics.IID)
            GattPresentationFormatTypes.__IGattPresentationFormatTypesStatics := IGattPresentationFormatTypesStatics(factoryPtr)
        }

        return GattPresentationFormatTypes.__IGattPresentationFormatTypesStatics.get_UInt16()
    }

    /**
     * 
     * @returns {Integer} 
     */
    static get_UInt24() {
        if (!GattPresentationFormatTypes.HasProp("__IGattPresentationFormatTypesStatics")) {
            activatableClassId := HSTRING.Create("Windows.Devices.Bluetooth.GenericAttributeProfile.GattPresentationFormatTypes")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IGattPresentationFormatTypesStatics.IID)
            GattPresentationFormatTypes.__IGattPresentationFormatTypesStatics := IGattPresentationFormatTypesStatics(factoryPtr)
        }

        return GattPresentationFormatTypes.__IGattPresentationFormatTypesStatics.get_UInt24()
    }

    /**
     * 
     * @returns {Integer} 
     */
    static get_UInt32() {
        if (!GattPresentationFormatTypes.HasProp("__IGattPresentationFormatTypesStatics")) {
            activatableClassId := HSTRING.Create("Windows.Devices.Bluetooth.GenericAttributeProfile.GattPresentationFormatTypes")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IGattPresentationFormatTypesStatics.IID)
            GattPresentationFormatTypes.__IGattPresentationFormatTypesStatics := IGattPresentationFormatTypesStatics(factoryPtr)
        }

        return GattPresentationFormatTypes.__IGattPresentationFormatTypesStatics.get_UInt32()
    }

    /**
     * 
     * @returns {Integer} 
     */
    static get_UInt48() {
        if (!GattPresentationFormatTypes.HasProp("__IGattPresentationFormatTypesStatics")) {
            activatableClassId := HSTRING.Create("Windows.Devices.Bluetooth.GenericAttributeProfile.GattPresentationFormatTypes")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IGattPresentationFormatTypesStatics.IID)
            GattPresentationFormatTypes.__IGattPresentationFormatTypesStatics := IGattPresentationFormatTypesStatics(factoryPtr)
        }

        return GattPresentationFormatTypes.__IGattPresentationFormatTypesStatics.get_UInt48()
    }

    /**
     * 
     * @returns {Integer} 
     */
    static get_UInt64() {
        if (!GattPresentationFormatTypes.HasProp("__IGattPresentationFormatTypesStatics")) {
            activatableClassId := HSTRING.Create("Windows.Devices.Bluetooth.GenericAttributeProfile.GattPresentationFormatTypes")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IGattPresentationFormatTypesStatics.IID)
            GattPresentationFormatTypes.__IGattPresentationFormatTypesStatics := IGattPresentationFormatTypesStatics(factoryPtr)
        }

        return GattPresentationFormatTypes.__IGattPresentationFormatTypesStatics.get_UInt64()
    }

    /**
     * 
     * @returns {Integer} 
     */
    static get_UInt128() {
        if (!GattPresentationFormatTypes.HasProp("__IGattPresentationFormatTypesStatics")) {
            activatableClassId := HSTRING.Create("Windows.Devices.Bluetooth.GenericAttributeProfile.GattPresentationFormatTypes")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IGattPresentationFormatTypesStatics.IID)
            GattPresentationFormatTypes.__IGattPresentationFormatTypesStatics := IGattPresentationFormatTypesStatics(factoryPtr)
        }

        return GattPresentationFormatTypes.__IGattPresentationFormatTypesStatics.get_UInt128()
    }

    /**
     * 
     * @returns {Integer} 
     */
    static get_SInt8() {
        if (!GattPresentationFormatTypes.HasProp("__IGattPresentationFormatTypesStatics")) {
            activatableClassId := HSTRING.Create("Windows.Devices.Bluetooth.GenericAttributeProfile.GattPresentationFormatTypes")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IGattPresentationFormatTypesStatics.IID)
            GattPresentationFormatTypes.__IGattPresentationFormatTypesStatics := IGattPresentationFormatTypesStatics(factoryPtr)
        }

        return GattPresentationFormatTypes.__IGattPresentationFormatTypesStatics.get_SInt8()
    }

    /**
     * 
     * @returns {Integer} 
     */
    static get_SInt12() {
        if (!GattPresentationFormatTypes.HasProp("__IGattPresentationFormatTypesStatics")) {
            activatableClassId := HSTRING.Create("Windows.Devices.Bluetooth.GenericAttributeProfile.GattPresentationFormatTypes")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IGattPresentationFormatTypesStatics.IID)
            GattPresentationFormatTypes.__IGattPresentationFormatTypesStatics := IGattPresentationFormatTypesStatics(factoryPtr)
        }

        return GattPresentationFormatTypes.__IGattPresentationFormatTypesStatics.get_SInt12()
    }

    /**
     * 
     * @returns {Integer} 
     */
    static get_SInt16() {
        if (!GattPresentationFormatTypes.HasProp("__IGattPresentationFormatTypesStatics")) {
            activatableClassId := HSTRING.Create("Windows.Devices.Bluetooth.GenericAttributeProfile.GattPresentationFormatTypes")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IGattPresentationFormatTypesStatics.IID)
            GattPresentationFormatTypes.__IGattPresentationFormatTypesStatics := IGattPresentationFormatTypesStatics(factoryPtr)
        }

        return GattPresentationFormatTypes.__IGattPresentationFormatTypesStatics.get_SInt16()
    }

    /**
     * 
     * @returns {Integer} 
     */
    static get_SInt24() {
        if (!GattPresentationFormatTypes.HasProp("__IGattPresentationFormatTypesStatics")) {
            activatableClassId := HSTRING.Create("Windows.Devices.Bluetooth.GenericAttributeProfile.GattPresentationFormatTypes")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IGattPresentationFormatTypesStatics.IID)
            GattPresentationFormatTypes.__IGattPresentationFormatTypesStatics := IGattPresentationFormatTypesStatics(factoryPtr)
        }

        return GattPresentationFormatTypes.__IGattPresentationFormatTypesStatics.get_SInt24()
    }

    /**
     * 
     * @returns {Integer} 
     */
    static get_SInt32() {
        if (!GattPresentationFormatTypes.HasProp("__IGattPresentationFormatTypesStatics")) {
            activatableClassId := HSTRING.Create("Windows.Devices.Bluetooth.GenericAttributeProfile.GattPresentationFormatTypes")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IGattPresentationFormatTypesStatics.IID)
            GattPresentationFormatTypes.__IGattPresentationFormatTypesStatics := IGattPresentationFormatTypesStatics(factoryPtr)
        }

        return GattPresentationFormatTypes.__IGattPresentationFormatTypesStatics.get_SInt32()
    }

    /**
     * 
     * @returns {Integer} 
     */
    static get_SInt48() {
        if (!GattPresentationFormatTypes.HasProp("__IGattPresentationFormatTypesStatics")) {
            activatableClassId := HSTRING.Create("Windows.Devices.Bluetooth.GenericAttributeProfile.GattPresentationFormatTypes")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IGattPresentationFormatTypesStatics.IID)
            GattPresentationFormatTypes.__IGattPresentationFormatTypesStatics := IGattPresentationFormatTypesStatics(factoryPtr)
        }

        return GattPresentationFormatTypes.__IGattPresentationFormatTypesStatics.get_SInt48()
    }

    /**
     * 
     * @returns {Integer} 
     */
    static get_SInt64() {
        if (!GattPresentationFormatTypes.HasProp("__IGattPresentationFormatTypesStatics")) {
            activatableClassId := HSTRING.Create("Windows.Devices.Bluetooth.GenericAttributeProfile.GattPresentationFormatTypes")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IGattPresentationFormatTypesStatics.IID)
            GattPresentationFormatTypes.__IGattPresentationFormatTypesStatics := IGattPresentationFormatTypesStatics(factoryPtr)
        }

        return GattPresentationFormatTypes.__IGattPresentationFormatTypesStatics.get_SInt64()
    }

    /**
     * 
     * @returns {Integer} 
     */
    static get_SInt128() {
        if (!GattPresentationFormatTypes.HasProp("__IGattPresentationFormatTypesStatics")) {
            activatableClassId := HSTRING.Create("Windows.Devices.Bluetooth.GenericAttributeProfile.GattPresentationFormatTypes")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IGattPresentationFormatTypesStatics.IID)
            GattPresentationFormatTypes.__IGattPresentationFormatTypesStatics := IGattPresentationFormatTypesStatics(factoryPtr)
        }

        return GattPresentationFormatTypes.__IGattPresentationFormatTypesStatics.get_SInt128()
    }

    /**
     * 
     * @returns {Integer} 
     */
    static get_Float32() {
        if (!GattPresentationFormatTypes.HasProp("__IGattPresentationFormatTypesStatics")) {
            activatableClassId := HSTRING.Create("Windows.Devices.Bluetooth.GenericAttributeProfile.GattPresentationFormatTypes")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IGattPresentationFormatTypesStatics.IID)
            GattPresentationFormatTypes.__IGattPresentationFormatTypesStatics := IGattPresentationFormatTypesStatics(factoryPtr)
        }

        return GattPresentationFormatTypes.__IGattPresentationFormatTypesStatics.get_Float32()
    }

    /**
     * 
     * @returns {Integer} 
     */
    static get_Float64() {
        if (!GattPresentationFormatTypes.HasProp("__IGattPresentationFormatTypesStatics")) {
            activatableClassId := HSTRING.Create("Windows.Devices.Bluetooth.GenericAttributeProfile.GattPresentationFormatTypes")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IGattPresentationFormatTypesStatics.IID)
            GattPresentationFormatTypes.__IGattPresentationFormatTypesStatics := IGattPresentationFormatTypesStatics(factoryPtr)
        }

        return GattPresentationFormatTypes.__IGattPresentationFormatTypesStatics.get_Float64()
    }

    /**
     * 
     * @returns {Integer} 
     */
    static get_SFloat() {
        if (!GattPresentationFormatTypes.HasProp("__IGattPresentationFormatTypesStatics")) {
            activatableClassId := HSTRING.Create("Windows.Devices.Bluetooth.GenericAttributeProfile.GattPresentationFormatTypes")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IGattPresentationFormatTypesStatics.IID)
            GattPresentationFormatTypes.__IGattPresentationFormatTypesStatics := IGattPresentationFormatTypesStatics(factoryPtr)
        }

        return GattPresentationFormatTypes.__IGattPresentationFormatTypesStatics.get_SFloat()
    }

    /**
     * 
     * @returns {Integer} 
     */
    static get_Float() {
        if (!GattPresentationFormatTypes.HasProp("__IGattPresentationFormatTypesStatics")) {
            activatableClassId := HSTRING.Create("Windows.Devices.Bluetooth.GenericAttributeProfile.GattPresentationFormatTypes")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IGattPresentationFormatTypesStatics.IID)
            GattPresentationFormatTypes.__IGattPresentationFormatTypesStatics := IGattPresentationFormatTypesStatics(factoryPtr)
        }

        return GattPresentationFormatTypes.__IGattPresentationFormatTypesStatics.get_Float()
    }

    /**
     * 
     * @returns {Integer} 
     */
    static get_DUInt16() {
        if (!GattPresentationFormatTypes.HasProp("__IGattPresentationFormatTypesStatics")) {
            activatableClassId := HSTRING.Create("Windows.Devices.Bluetooth.GenericAttributeProfile.GattPresentationFormatTypes")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IGattPresentationFormatTypesStatics.IID)
            GattPresentationFormatTypes.__IGattPresentationFormatTypesStatics := IGattPresentationFormatTypesStatics(factoryPtr)
        }

        return GattPresentationFormatTypes.__IGattPresentationFormatTypesStatics.get_DUInt16()
    }

    /**
     * 
     * @returns {Integer} 
     */
    static get_Utf8() {
        if (!GattPresentationFormatTypes.HasProp("__IGattPresentationFormatTypesStatics")) {
            activatableClassId := HSTRING.Create("Windows.Devices.Bluetooth.GenericAttributeProfile.GattPresentationFormatTypes")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IGattPresentationFormatTypesStatics.IID)
            GattPresentationFormatTypes.__IGattPresentationFormatTypesStatics := IGattPresentationFormatTypesStatics(factoryPtr)
        }

        return GattPresentationFormatTypes.__IGattPresentationFormatTypesStatics.get_Utf8()
    }

    /**
     * 
     * @returns {Integer} 
     */
    static get_Utf16() {
        if (!GattPresentationFormatTypes.HasProp("__IGattPresentationFormatTypesStatics")) {
            activatableClassId := HSTRING.Create("Windows.Devices.Bluetooth.GenericAttributeProfile.GattPresentationFormatTypes")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IGattPresentationFormatTypesStatics.IID)
            GattPresentationFormatTypes.__IGattPresentationFormatTypesStatics := IGattPresentationFormatTypesStatics(factoryPtr)
        }

        return GattPresentationFormatTypes.__IGattPresentationFormatTypesStatics.get_Utf16()
    }

    /**
     * 
     * @returns {Integer} 
     */
    static get_Struct() {
        if (!GattPresentationFormatTypes.HasProp("__IGattPresentationFormatTypesStatics")) {
            activatableClassId := HSTRING.Create("Windows.Devices.Bluetooth.GenericAttributeProfile.GattPresentationFormatTypes")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IGattPresentationFormatTypesStatics.IID)
            GattPresentationFormatTypes.__IGattPresentationFormatTypesStatics := IGattPresentationFormatTypesStatics(factoryPtr)
        }

        return GattPresentationFormatTypes.__IGattPresentationFormatTypesStatics.get_Struct()
    }

;@endregion Static Methods

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

;@endregion Instance Methods
}
