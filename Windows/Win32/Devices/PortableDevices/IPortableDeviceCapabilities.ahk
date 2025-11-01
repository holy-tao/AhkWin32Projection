#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
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
     * @param {Pointer<IPortableDeviceKeyCollection>} ppCommands 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/portabledeviceapi/nf-portabledeviceapi-iportabledevicecapabilities-getsupportedcommands
     */
    GetSupportedCommands(ppCommands) {
        result := ComCall(3, this, "ptr*", ppCommands, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<PROPERTYKEY>} Command 
     * @param {Pointer<IPortableDeviceValues>} ppOptions 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/portabledeviceapi/nf-portabledeviceapi-iportabledevicecapabilities-getcommandoptions
     */
    GetCommandOptions(Command, ppOptions) {
        result := ComCall(4, this, "ptr", Command, "ptr*", ppOptions, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IPortableDevicePropVariantCollection>} ppCategories 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/portabledeviceapi/nf-portabledeviceapi-iportabledevicecapabilities-getfunctionalcategories
     */
    GetFunctionalCategories(ppCategories) {
        result := ComCall(5, this, "ptr*", ppCategories, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} Category 
     * @param {Pointer<IPortableDevicePropVariantCollection>} ppObjectIDs 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/portabledeviceapi/nf-portabledeviceapi-iportabledevicecapabilities-getfunctionalobjects
     */
    GetFunctionalObjects(Category, ppObjectIDs) {
        result := ComCall(6, this, "ptr", Category, "ptr*", ppObjectIDs, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} Category 
     * @param {Pointer<IPortableDevicePropVariantCollection>} ppContentTypes 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/portabledeviceapi/nf-portabledeviceapi-iportabledevicecapabilities-getsupportedcontenttypes
     */
    GetSupportedContentTypes(Category, ppContentTypes) {
        result := ComCall(7, this, "ptr", Category, "ptr*", ppContentTypes, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} ContentType 
     * @param {Pointer<IPortableDevicePropVariantCollection>} ppFormats 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/portabledeviceapi/nf-portabledeviceapi-iportabledevicecapabilities-getsupportedformats
     */
    GetSupportedFormats(ContentType, ppFormats) {
        result := ComCall(8, this, "ptr", ContentType, "ptr*", ppFormats, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} Format 
     * @param {Pointer<IPortableDeviceKeyCollection>} ppKeys 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/portabledeviceapi/nf-portabledeviceapi-iportabledevicecapabilities-getsupportedformatproperties
     */
    GetSupportedFormatProperties(Format, ppKeys) {
        result := ComCall(9, this, "ptr", Format, "ptr*", ppKeys, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} Format 
     * @param {Pointer<PROPERTYKEY>} Key 
     * @param {Pointer<IPortableDeviceValues>} ppAttributes 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/portabledeviceapi/nf-portabledeviceapi-iportabledevicecapabilities-getfixedpropertyattributes
     */
    GetFixedPropertyAttributes(Format, Key, ppAttributes) {
        result := ComCall(10, this, "ptr", Format, "ptr", Key, "ptr*", ppAttributes, "HRESULT")
        return result
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
     * @param {Pointer<IPortableDevicePropVariantCollection>} ppEvents 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/portabledeviceapi/nf-portabledeviceapi-iportabledevicecapabilities-getsupportedevents
     */
    GetSupportedEvents(ppEvents) {
        result := ComCall(12, this, "ptr*", ppEvents, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} Event 
     * @param {Pointer<IPortableDeviceValues>} ppOptions 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/portabledeviceapi/nf-portabledeviceapi-iportabledevicecapabilities-geteventoptions
     */
    GetEventOptions(Event, ppOptions) {
        result := ComCall(13, this, "ptr", Event, "ptr*", ppOptions, "HRESULT")
        return result
    }
}
