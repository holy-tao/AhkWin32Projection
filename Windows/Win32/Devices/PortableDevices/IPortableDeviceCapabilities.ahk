#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IPortableDeviceKeyCollection.ahk
#Include .\IPortableDeviceValues.ahk
#Include .\IPortableDevicePropVariantCollection.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The IPortableDeviceCapabilities interface a variety of device capabilities, including supported formats, commands, and functional objects. You can retrieve this interface from a device by calling IPortableDevice::Capabilities.
 * @see https://docs.microsoft.com/windows/win32/api//portabledeviceapi/nn-portabledeviceapi-iportabledevicecapabilities
 * @namespace Windows.Win32.Devices.PortableDevices
 * @version v4.0.30319
 */
class IPortableDeviceCapabilities extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IPortableDeviceCapabilities
     * @type {Guid}
     */
    static IID => Guid("{2c8c6dbf-e3dc-4061-becc-8542e810d126}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetSupportedCommands", "GetCommandOptions", "GetFunctionalCategories", "GetFunctionalObjects", "GetSupportedContentTypes", "GetSupportedFormats", "GetSupportedFormatProperties", "GetFixedPropertyAttributes", "Cancel", "GetSupportedEvents", "GetEventOptions"]

    /**
     * 
     * @returns {IPortableDeviceKeyCollection} 
     * @see https://learn.microsoft.com/windows/win32/api/portabledeviceapi/nf-portabledeviceapi-iportabledevicecapabilities-getsupportedcommands
     */
    GetSupportedCommands() {
        result := ComCall(3, this, "ptr*", &ppCommands := 0, "HRESULT")
        return IPortableDeviceKeyCollection(ppCommands)
    }

    /**
     * 
     * @param {Pointer<PROPERTYKEY>} Command 
     * @returns {IPortableDeviceValues} 
     * @see https://learn.microsoft.com/windows/win32/api/portabledeviceapi/nf-portabledeviceapi-iportabledevicecapabilities-getcommandoptions
     */
    GetCommandOptions(Command) {
        result := ComCall(4, this, "ptr", Command, "ptr*", &ppOptions := 0, "HRESULT")
        return IPortableDeviceValues(ppOptions)
    }

    /**
     * 
     * @returns {IPortableDevicePropVariantCollection} 
     * @see https://learn.microsoft.com/windows/win32/api/portabledeviceapi/nf-portabledeviceapi-iportabledevicecapabilities-getfunctionalcategories
     */
    GetFunctionalCategories() {
        result := ComCall(5, this, "ptr*", &ppCategories := 0, "HRESULT")
        return IPortableDevicePropVariantCollection(ppCategories)
    }

    /**
     * 
     * @param {Pointer<Guid>} Category 
     * @returns {IPortableDevicePropVariantCollection} 
     * @see https://learn.microsoft.com/windows/win32/api/portabledeviceapi/nf-portabledeviceapi-iportabledevicecapabilities-getfunctionalobjects
     */
    GetFunctionalObjects(Category) {
        result := ComCall(6, this, "ptr", Category, "ptr*", &ppObjectIDs := 0, "HRESULT")
        return IPortableDevicePropVariantCollection(ppObjectIDs)
    }

    /**
     * 
     * @param {Pointer<Guid>} Category 
     * @returns {IPortableDevicePropVariantCollection} 
     * @see https://learn.microsoft.com/windows/win32/api/portabledeviceapi/nf-portabledeviceapi-iportabledevicecapabilities-getsupportedcontenttypes
     */
    GetSupportedContentTypes(Category) {
        result := ComCall(7, this, "ptr", Category, "ptr*", &ppContentTypes := 0, "HRESULT")
        return IPortableDevicePropVariantCollection(ppContentTypes)
    }

    /**
     * 
     * @param {Pointer<Guid>} ContentType 
     * @returns {IPortableDevicePropVariantCollection} 
     * @see https://learn.microsoft.com/windows/win32/api/portabledeviceapi/nf-portabledeviceapi-iportabledevicecapabilities-getsupportedformats
     */
    GetSupportedFormats(ContentType) {
        result := ComCall(8, this, "ptr", ContentType, "ptr*", &ppFormats := 0, "HRESULT")
        return IPortableDevicePropVariantCollection(ppFormats)
    }

    /**
     * 
     * @param {Pointer<Guid>} Format 
     * @returns {IPortableDeviceKeyCollection} 
     * @see https://learn.microsoft.com/windows/win32/api/portabledeviceapi/nf-portabledeviceapi-iportabledevicecapabilities-getsupportedformatproperties
     */
    GetSupportedFormatProperties(Format) {
        result := ComCall(9, this, "ptr", Format, "ptr*", &ppKeys := 0, "HRESULT")
        return IPortableDeviceKeyCollection(ppKeys)
    }

    /**
     * 
     * @param {Pointer<Guid>} Format 
     * @param {Pointer<PROPERTYKEY>} Key 
     * @returns {IPortableDeviceValues} 
     * @see https://learn.microsoft.com/windows/win32/api/portabledeviceapi/nf-portabledeviceapi-iportabledevicecapabilities-getfixedpropertyattributes
     */
    GetFixedPropertyAttributes(Format, Key) {
        result := ComCall(10, this, "ptr", Format, "ptr", Key, "ptr*", &ppAttributes := 0, "HRESULT")
        return IPortableDeviceValues(ppAttributes)
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/portabledeviceapi/nf-portabledeviceapi-iportabledevicecapabilities-cancel
     */
    Cancel() {
        result := ComCall(11, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {IPortableDevicePropVariantCollection} 
     * @see https://learn.microsoft.com/windows/win32/api/portabledeviceapi/nf-portabledeviceapi-iportabledevicecapabilities-getsupportedevents
     */
    GetSupportedEvents() {
        result := ComCall(12, this, "ptr*", &ppEvents := 0, "HRESULT")
        return IPortableDevicePropVariantCollection(ppEvents)
    }

    /**
     * 
     * @param {Pointer<Guid>} Event 
     * @returns {IPortableDeviceValues} 
     * @see https://learn.microsoft.com/windows/win32/api/portabledeviceapi/nf-portabledeviceapi-iportabledevicecapabilities-geteventoptions
     */
    GetEventOptions(Event) {
        result := ComCall(13, this, "ptr", Event, "ptr*", &ppOptions := 0, "HRESULT")
        return IPortableDeviceValues(ppOptions)
    }
}
