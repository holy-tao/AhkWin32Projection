#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IGattDescriptorUuidsStatics.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Represents an enumeration of the most well known Descriptor UUID values, and provides convenience methods for working with GATT descriptor UUIDs, and static properties providing descriptor UUIDs for common GATT descriptors.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.devices.bluetooth.genericattributeprofile.gattdescriptoruuids
 * @namespace Windows.Devices.Bluetooth.GenericAttributeProfile
 * @version WindowsRuntime 1.4
 */
class GattDescriptorUuids extends IInspectable {
;@region Static Properties
    /**
     * Gets the Bluetooth SIG-defined Characteristic Aggregate Format Descriptor UUID.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.bluetooth.genericattributeprofile.gattdescriptoruuids.characteristicaggregateformat
     * @type {Guid} 
     */
    static CharacteristicAggregateFormat {
        get => GattDescriptorUuids.get_CharacteristicAggregateFormat()
    }

    /**
     * Gets the Bluetooth SIG-defined Characteristic Extended Properties Descriptor UUID.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.bluetooth.genericattributeprofile.gattdescriptoruuids.characteristicextendedproperties
     * @type {Guid} 
     */
    static CharacteristicExtendedProperties {
        get => GattDescriptorUuids.get_CharacteristicExtendedProperties()
    }

    /**
     * Gets the Bluetooth SIG-defined Characteristic Presentation Format Descriptor UUID.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.bluetooth.genericattributeprofile.gattdescriptoruuids.characteristicpresentationformat
     * @type {Guid} 
     */
    static CharacteristicPresentationFormat {
        get => GattDescriptorUuids.get_CharacteristicPresentationFormat()
    }

    /**
     * Gets the Bluetooth SIG-defined Characteristic User Description Descriptor UUID.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.bluetooth.genericattributeprofile.gattdescriptoruuids.characteristicuserdescription
     * @type {Guid} 
     */
    static CharacteristicUserDescription {
        get => GattDescriptorUuids.get_CharacteristicUserDescription()
    }

    /**
     * Gets the Bluetooth SIG-defined Client Characteristic Configuration Descriptor UUID.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.bluetooth.genericattributeprofile.gattdescriptoruuids.clientcharacteristicconfiguration
     * @type {Guid} 
     */
    static ClientCharacteristicConfiguration {
        get => GattDescriptorUuids.get_ClientCharacteristicConfiguration()
    }

    /**
     * Gets the Bluetooth SIG-defined Server Characteristic Configuration Descriptor UUID.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.bluetooth.genericattributeprofile.gattdescriptoruuids.servercharacteristicconfiguration
     * @type {Guid} 
     */
    static ServerCharacteristicConfiguration {
        get => GattDescriptorUuids.get_ServerCharacteristicConfiguration()
    }

;@endregion Static Properties

;@region Static Methods
    /**
     * 
     * @returns {Guid} 
     */
    static get_CharacteristicAggregateFormat() {
        if (!GattDescriptorUuids.HasProp("__IGattDescriptorUuidsStatics")) {
            activatableClassId := HSTRING.Create("Windows.Devices.Bluetooth.GenericAttributeProfile.GattDescriptorUuids")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IGattDescriptorUuidsStatics.IID)
            GattDescriptorUuids.__IGattDescriptorUuidsStatics := IGattDescriptorUuidsStatics(factoryPtr)
        }

        return GattDescriptorUuids.__IGattDescriptorUuidsStatics.get_CharacteristicAggregateFormat()
    }

    /**
     * 
     * @returns {Guid} 
     */
    static get_CharacteristicExtendedProperties() {
        if (!GattDescriptorUuids.HasProp("__IGattDescriptorUuidsStatics")) {
            activatableClassId := HSTRING.Create("Windows.Devices.Bluetooth.GenericAttributeProfile.GattDescriptorUuids")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IGattDescriptorUuidsStatics.IID)
            GattDescriptorUuids.__IGattDescriptorUuidsStatics := IGattDescriptorUuidsStatics(factoryPtr)
        }

        return GattDescriptorUuids.__IGattDescriptorUuidsStatics.get_CharacteristicExtendedProperties()
    }

    /**
     * 
     * @returns {Guid} 
     */
    static get_CharacteristicPresentationFormat() {
        if (!GattDescriptorUuids.HasProp("__IGattDescriptorUuidsStatics")) {
            activatableClassId := HSTRING.Create("Windows.Devices.Bluetooth.GenericAttributeProfile.GattDescriptorUuids")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IGattDescriptorUuidsStatics.IID)
            GattDescriptorUuids.__IGattDescriptorUuidsStatics := IGattDescriptorUuidsStatics(factoryPtr)
        }

        return GattDescriptorUuids.__IGattDescriptorUuidsStatics.get_CharacteristicPresentationFormat()
    }

    /**
     * 
     * @returns {Guid} 
     */
    static get_CharacteristicUserDescription() {
        if (!GattDescriptorUuids.HasProp("__IGattDescriptorUuidsStatics")) {
            activatableClassId := HSTRING.Create("Windows.Devices.Bluetooth.GenericAttributeProfile.GattDescriptorUuids")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IGattDescriptorUuidsStatics.IID)
            GattDescriptorUuids.__IGattDescriptorUuidsStatics := IGattDescriptorUuidsStatics(factoryPtr)
        }

        return GattDescriptorUuids.__IGattDescriptorUuidsStatics.get_CharacteristicUserDescription()
    }

    /**
     * 
     * @returns {Guid} 
     */
    static get_ClientCharacteristicConfiguration() {
        if (!GattDescriptorUuids.HasProp("__IGattDescriptorUuidsStatics")) {
            activatableClassId := HSTRING.Create("Windows.Devices.Bluetooth.GenericAttributeProfile.GattDescriptorUuids")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IGattDescriptorUuidsStatics.IID)
            GattDescriptorUuids.__IGattDescriptorUuidsStatics := IGattDescriptorUuidsStatics(factoryPtr)
        }

        return GattDescriptorUuids.__IGattDescriptorUuidsStatics.get_ClientCharacteristicConfiguration()
    }

    /**
     * 
     * @returns {Guid} 
     */
    static get_ServerCharacteristicConfiguration() {
        if (!GattDescriptorUuids.HasProp("__IGattDescriptorUuidsStatics")) {
            activatableClassId := HSTRING.Create("Windows.Devices.Bluetooth.GenericAttributeProfile.GattDescriptorUuids")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IGattDescriptorUuidsStatics.IID)
            GattDescriptorUuids.__IGattDescriptorUuidsStatics := IGattDescriptorUuidsStatics(factoryPtr)
        }

        return GattDescriptorUuids.__IGattDescriptorUuidsStatics.get_ServerCharacteristicConfiguration()
    }

;@endregion Static Methods

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

;@endregion Instance Methods
}
