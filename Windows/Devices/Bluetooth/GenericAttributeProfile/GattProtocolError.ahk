#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IGattProtocolErrorStatics.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * This class contains byte values for GATT protocol errors.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.devices.bluetooth.genericattributeprofile.gattprotocolerror
 * @namespace Windows.Devices.Bluetooth.GenericAttributeProfile
 * @version WindowsRuntime 1.4
 */
class GattProtocolError extends IInspectable {
;@region Static Properties
    /**
     * Gets the byte value for an invalid handle error.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.bluetooth.genericattributeprofile.gattprotocolerror.invalidhandle
     * @type {Integer} 
     */
    static InvalidHandle {
        get => GattProtocolError.get_InvalidHandle()
    }

    /**
     * Gets the byte value for a read not permitted error.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.bluetooth.genericattributeprofile.gattprotocolerror.readnotpermitted
     * @type {Integer} 
     */
    static ReadNotPermitted {
        get => GattProtocolError.get_ReadNotPermitted()
    }

    /**
     * Gets the byte value for a write not permitted error.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.bluetooth.genericattributeprofile.gattprotocolerror.writenotpermitted
     * @type {Integer} 
     */
    static WriteNotPermitted {
        get => GattProtocolError.get_WriteNotPermitted()
    }

    /**
     * Gets the byte value for an invalid PDU error.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.bluetooth.genericattributeprofile.gattprotocolerror.invalidpdu
     * @type {Integer} 
     */
    static InvalidPdu {
        get => GattProtocolError.get_InvalidPdu()
    }

    /**
     * Gets the byte value for an insufficient authentication error.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.bluetooth.genericattributeprofile.gattprotocolerror.insufficientauthentication
     * @type {Integer} 
     */
    static InsufficientAuthentication {
        get => GattProtocolError.get_InsufficientAuthentication()
    }

    /**
     * Gets the byte value for a request not supported error.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.bluetooth.genericattributeprofile.gattprotocolerror.requestnotsupported
     * @type {Integer} 
     */
    static RequestNotSupported {
        get => GattProtocolError.get_RequestNotSupported()
    }

    /**
     * Gets the byte value for an invalid offset error.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.bluetooth.genericattributeprofile.gattprotocolerror.invalidoffset
     * @type {Integer} 
     */
    static InvalidOffset {
        get => GattProtocolError.get_InvalidOffset()
    }

    /**
     * Gets the byte value for an insufficient authorization error.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.bluetooth.genericattributeprofile.gattprotocolerror.insufficientauthorization
     * @type {Integer} 
     */
    static InsufficientAuthorization {
        get => GattProtocolError.get_InsufficientAuthorization()
    }

    /**
     * Gets the byte value for a prepare queue full error.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.bluetooth.genericattributeprofile.gattprotocolerror.preparequeuefull
     * @type {Integer} 
     */
    static PrepareQueueFull {
        get => GattProtocolError.get_PrepareQueueFull()
    }

    /**
     * Gets the byte value for an attribute not found error.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.bluetooth.genericattributeprofile.gattprotocolerror.attributenotfound
     * @type {Integer} 
     */
    static AttributeNotFound {
        get => GattProtocolError.get_AttributeNotFound()
    }

    /**
     * Gets the byte value for an attribute not long error.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.bluetooth.genericattributeprofile.gattprotocolerror.attributenotlong
     * @type {Integer} 
     */
    static AttributeNotLong {
        get => GattProtocolError.get_AttributeNotLong()
    }

    /**
     * Gets the byte value for an insufficient encryption key size error.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.bluetooth.genericattributeprofile.gattprotocolerror.insufficientencryptionkeysize
     * @type {Integer} 
     */
    static InsufficientEncryptionKeySize {
        get => GattProtocolError.get_InsufficientEncryptionKeySize()
    }

    /**
     * Gets the byte value for an invalid attribute value length error.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.bluetooth.genericattributeprofile.gattprotocolerror.invalidattributevaluelength
     * @type {Integer} 
     */
    static InvalidAttributeValueLength {
        get => GattProtocolError.get_InvalidAttributeValueLength()
    }

    /**
     * Gets the byte value for an unlikely error.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.bluetooth.genericattributeprofile.gattprotocolerror.unlikelyerror
     * @type {Integer} 
     */
    static UnlikelyError {
        get => GattProtocolError.get_UnlikelyError()
    }

    /**
     * Gets the byte value for an insufficient encryption error.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.bluetooth.genericattributeprofile.gattprotocolerror.insufficientencryption
     * @type {Integer} 
     */
    static InsufficientEncryption {
        get => GattProtocolError.get_InsufficientEncryption()
    }

    /**
     * Gets the byte value for an unsupported group type error.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.bluetooth.genericattributeprofile.gattprotocolerror.unsupportedgrouptype
     * @type {Integer} 
     */
    static UnsupportedGroupType {
        get => GattProtocolError.get_UnsupportedGroupType()
    }

    /**
     * Gets the byte value for an insufficient resources error.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.bluetooth.genericattributeprofile.gattprotocolerror.insufficientresources
     * @type {Integer} 
     */
    static InsufficientResources {
        get => GattProtocolError.get_InsufficientResources()
    }

;@endregion Static Properties

;@region Static Methods
    /**
     * 
     * @returns {Integer} 
     */
    static get_InvalidHandle() {
        if (!GattProtocolError.HasProp("__IGattProtocolErrorStatics")) {
            activatableClassId := HSTRING.Create("Windows.Devices.Bluetooth.GenericAttributeProfile.GattProtocolError")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IGattProtocolErrorStatics.IID)
            GattProtocolError.__IGattProtocolErrorStatics := IGattProtocolErrorStatics(factoryPtr)
        }

        return GattProtocolError.__IGattProtocolErrorStatics.get_InvalidHandle()
    }

    /**
     * 
     * @returns {Integer} 
     */
    static get_ReadNotPermitted() {
        if (!GattProtocolError.HasProp("__IGattProtocolErrorStatics")) {
            activatableClassId := HSTRING.Create("Windows.Devices.Bluetooth.GenericAttributeProfile.GattProtocolError")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IGattProtocolErrorStatics.IID)
            GattProtocolError.__IGattProtocolErrorStatics := IGattProtocolErrorStatics(factoryPtr)
        }

        return GattProtocolError.__IGattProtocolErrorStatics.get_ReadNotPermitted()
    }

    /**
     * 
     * @returns {Integer} 
     */
    static get_WriteNotPermitted() {
        if (!GattProtocolError.HasProp("__IGattProtocolErrorStatics")) {
            activatableClassId := HSTRING.Create("Windows.Devices.Bluetooth.GenericAttributeProfile.GattProtocolError")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IGattProtocolErrorStatics.IID)
            GattProtocolError.__IGattProtocolErrorStatics := IGattProtocolErrorStatics(factoryPtr)
        }

        return GattProtocolError.__IGattProtocolErrorStatics.get_WriteNotPermitted()
    }

    /**
     * 
     * @returns {Integer} 
     */
    static get_InvalidPdu() {
        if (!GattProtocolError.HasProp("__IGattProtocolErrorStatics")) {
            activatableClassId := HSTRING.Create("Windows.Devices.Bluetooth.GenericAttributeProfile.GattProtocolError")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IGattProtocolErrorStatics.IID)
            GattProtocolError.__IGattProtocolErrorStatics := IGattProtocolErrorStatics(factoryPtr)
        }

        return GattProtocolError.__IGattProtocolErrorStatics.get_InvalidPdu()
    }

    /**
     * 
     * @returns {Integer} 
     */
    static get_InsufficientAuthentication() {
        if (!GattProtocolError.HasProp("__IGattProtocolErrorStatics")) {
            activatableClassId := HSTRING.Create("Windows.Devices.Bluetooth.GenericAttributeProfile.GattProtocolError")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IGattProtocolErrorStatics.IID)
            GattProtocolError.__IGattProtocolErrorStatics := IGattProtocolErrorStatics(factoryPtr)
        }

        return GattProtocolError.__IGattProtocolErrorStatics.get_InsufficientAuthentication()
    }

    /**
     * 
     * @returns {Integer} 
     */
    static get_RequestNotSupported() {
        if (!GattProtocolError.HasProp("__IGattProtocolErrorStatics")) {
            activatableClassId := HSTRING.Create("Windows.Devices.Bluetooth.GenericAttributeProfile.GattProtocolError")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IGattProtocolErrorStatics.IID)
            GattProtocolError.__IGattProtocolErrorStatics := IGattProtocolErrorStatics(factoryPtr)
        }

        return GattProtocolError.__IGattProtocolErrorStatics.get_RequestNotSupported()
    }

    /**
     * 
     * @returns {Integer} 
     */
    static get_InvalidOffset() {
        if (!GattProtocolError.HasProp("__IGattProtocolErrorStatics")) {
            activatableClassId := HSTRING.Create("Windows.Devices.Bluetooth.GenericAttributeProfile.GattProtocolError")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IGattProtocolErrorStatics.IID)
            GattProtocolError.__IGattProtocolErrorStatics := IGattProtocolErrorStatics(factoryPtr)
        }

        return GattProtocolError.__IGattProtocolErrorStatics.get_InvalidOffset()
    }

    /**
     * 
     * @returns {Integer} 
     */
    static get_InsufficientAuthorization() {
        if (!GattProtocolError.HasProp("__IGattProtocolErrorStatics")) {
            activatableClassId := HSTRING.Create("Windows.Devices.Bluetooth.GenericAttributeProfile.GattProtocolError")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IGattProtocolErrorStatics.IID)
            GattProtocolError.__IGattProtocolErrorStatics := IGattProtocolErrorStatics(factoryPtr)
        }

        return GattProtocolError.__IGattProtocolErrorStatics.get_InsufficientAuthorization()
    }

    /**
     * 
     * @returns {Integer} 
     */
    static get_PrepareQueueFull() {
        if (!GattProtocolError.HasProp("__IGattProtocolErrorStatics")) {
            activatableClassId := HSTRING.Create("Windows.Devices.Bluetooth.GenericAttributeProfile.GattProtocolError")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IGattProtocolErrorStatics.IID)
            GattProtocolError.__IGattProtocolErrorStatics := IGattProtocolErrorStatics(factoryPtr)
        }

        return GattProtocolError.__IGattProtocolErrorStatics.get_PrepareQueueFull()
    }

    /**
     * 
     * @returns {Integer} 
     */
    static get_AttributeNotFound() {
        if (!GattProtocolError.HasProp("__IGattProtocolErrorStatics")) {
            activatableClassId := HSTRING.Create("Windows.Devices.Bluetooth.GenericAttributeProfile.GattProtocolError")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IGattProtocolErrorStatics.IID)
            GattProtocolError.__IGattProtocolErrorStatics := IGattProtocolErrorStatics(factoryPtr)
        }

        return GattProtocolError.__IGattProtocolErrorStatics.get_AttributeNotFound()
    }

    /**
     * 
     * @returns {Integer} 
     */
    static get_AttributeNotLong() {
        if (!GattProtocolError.HasProp("__IGattProtocolErrorStatics")) {
            activatableClassId := HSTRING.Create("Windows.Devices.Bluetooth.GenericAttributeProfile.GattProtocolError")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IGattProtocolErrorStatics.IID)
            GattProtocolError.__IGattProtocolErrorStatics := IGattProtocolErrorStatics(factoryPtr)
        }

        return GattProtocolError.__IGattProtocolErrorStatics.get_AttributeNotLong()
    }

    /**
     * 
     * @returns {Integer} 
     */
    static get_InsufficientEncryptionKeySize() {
        if (!GattProtocolError.HasProp("__IGattProtocolErrorStatics")) {
            activatableClassId := HSTRING.Create("Windows.Devices.Bluetooth.GenericAttributeProfile.GattProtocolError")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IGattProtocolErrorStatics.IID)
            GattProtocolError.__IGattProtocolErrorStatics := IGattProtocolErrorStatics(factoryPtr)
        }

        return GattProtocolError.__IGattProtocolErrorStatics.get_InsufficientEncryptionKeySize()
    }

    /**
     * 
     * @returns {Integer} 
     */
    static get_InvalidAttributeValueLength() {
        if (!GattProtocolError.HasProp("__IGattProtocolErrorStatics")) {
            activatableClassId := HSTRING.Create("Windows.Devices.Bluetooth.GenericAttributeProfile.GattProtocolError")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IGattProtocolErrorStatics.IID)
            GattProtocolError.__IGattProtocolErrorStatics := IGattProtocolErrorStatics(factoryPtr)
        }

        return GattProtocolError.__IGattProtocolErrorStatics.get_InvalidAttributeValueLength()
    }

    /**
     * 
     * @returns {Integer} 
     */
    static get_UnlikelyError() {
        if (!GattProtocolError.HasProp("__IGattProtocolErrorStatics")) {
            activatableClassId := HSTRING.Create("Windows.Devices.Bluetooth.GenericAttributeProfile.GattProtocolError")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IGattProtocolErrorStatics.IID)
            GattProtocolError.__IGattProtocolErrorStatics := IGattProtocolErrorStatics(factoryPtr)
        }

        return GattProtocolError.__IGattProtocolErrorStatics.get_UnlikelyError()
    }

    /**
     * 
     * @returns {Integer} 
     */
    static get_InsufficientEncryption() {
        if (!GattProtocolError.HasProp("__IGattProtocolErrorStatics")) {
            activatableClassId := HSTRING.Create("Windows.Devices.Bluetooth.GenericAttributeProfile.GattProtocolError")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IGattProtocolErrorStatics.IID)
            GattProtocolError.__IGattProtocolErrorStatics := IGattProtocolErrorStatics(factoryPtr)
        }

        return GattProtocolError.__IGattProtocolErrorStatics.get_InsufficientEncryption()
    }

    /**
     * 
     * @returns {Integer} 
     */
    static get_UnsupportedGroupType() {
        if (!GattProtocolError.HasProp("__IGattProtocolErrorStatics")) {
            activatableClassId := HSTRING.Create("Windows.Devices.Bluetooth.GenericAttributeProfile.GattProtocolError")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IGattProtocolErrorStatics.IID)
            GattProtocolError.__IGattProtocolErrorStatics := IGattProtocolErrorStatics(factoryPtr)
        }

        return GattProtocolError.__IGattProtocolErrorStatics.get_UnsupportedGroupType()
    }

    /**
     * 
     * @returns {Integer} 
     */
    static get_InsufficientResources() {
        if (!GattProtocolError.HasProp("__IGattProtocolErrorStatics")) {
            activatableClassId := HSTRING.Create("Windows.Devices.Bluetooth.GenericAttributeProfile.GattProtocolError")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IGattProtocolErrorStatics.IID)
            GattProtocolError.__IGattProtocolErrorStatics := IGattProtocolErrorStatics(factoryPtr)
        }

        return GattProtocolError.__IGattProtocolErrorStatics.get_InsufficientResources()
    }

;@endregion Static Methods

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

;@endregion Instance Methods
}
