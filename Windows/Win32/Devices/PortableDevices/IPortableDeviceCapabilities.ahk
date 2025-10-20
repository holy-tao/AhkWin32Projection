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
     * 
     * @param {Pointer<IPortableDeviceKeyCollection>} ppCommands 
     * @returns {HRESULT} 
     */
    GetSupportedCommands(ppCommands) {
        result := ComCall(3, this, "ptr", ppCommands, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<PROPERTYKEY>} Command 
     * @param {Pointer<IPortableDeviceValues>} ppOptions 
     * @returns {HRESULT} 
     */
    GetCommandOptions(Command, ppOptions) {
        result := ComCall(4, this, "ptr", Command, "ptr", ppOptions, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IPortableDevicePropVariantCollection>} ppCategories 
     * @returns {HRESULT} 
     */
    GetFunctionalCategories(ppCategories) {
        result := ComCall(5, this, "ptr", ppCategories, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} Category 
     * @param {Pointer<IPortableDevicePropVariantCollection>} ppObjectIDs 
     * @returns {HRESULT} 
     */
    GetFunctionalObjects(Category, ppObjectIDs) {
        result := ComCall(6, this, "ptr", Category, "ptr", ppObjectIDs, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} Category 
     * @param {Pointer<IPortableDevicePropVariantCollection>} ppContentTypes 
     * @returns {HRESULT} 
     */
    GetSupportedContentTypes(Category, ppContentTypes) {
        result := ComCall(7, this, "ptr", Category, "ptr", ppContentTypes, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} ContentType 
     * @param {Pointer<IPortableDevicePropVariantCollection>} ppFormats 
     * @returns {HRESULT} 
     */
    GetSupportedFormats(ContentType, ppFormats) {
        result := ComCall(8, this, "ptr", ContentType, "ptr", ppFormats, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} Format 
     * @param {Pointer<IPortableDeviceKeyCollection>} ppKeys 
     * @returns {HRESULT} 
     */
    GetSupportedFormatProperties(Format, ppKeys) {
        result := ComCall(9, this, "ptr", Format, "ptr", ppKeys, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} Format 
     * @param {Pointer<PROPERTYKEY>} Key 
     * @param {Pointer<IPortableDeviceValues>} ppAttributes 
     * @returns {HRESULT} 
     */
    GetFixedPropertyAttributes(Format, Key, ppAttributes) {
        result := ComCall(10, this, "ptr", Format, "ptr", Key, "ptr", ppAttributes, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    Cancel() {
        result := ComCall(11, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IPortableDevicePropVariantCollection>} ppEvents 
     * @returns {HRESULT} 
     */
    GetSupportedEvents(ppEvents) {
        result := ComCall(12, this, "ptr", ppEvents, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} Event 
     * @param {Pointer<IPortableDeviceValues>} ppOptions 
     * @returns {HRESULT} 
     */
    GetEventOptions(Event, ppOptions) {
        result := ComCall(13, this, "ptr", Event, "ptr", ppOptions, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
