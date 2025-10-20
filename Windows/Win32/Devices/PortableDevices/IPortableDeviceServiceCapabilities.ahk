#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Retrieves information describing the capabilities of a service.
 * @see https://docs.microsoft.com/windows/win32/api//portabledeviceapi/nn-portabledeviceapi-iportabledeviceservicecapabilities
 * @namespace Windows.Win32.Devices.PortableDevices
 * @version v4.0.30319
 */
class IPortableDeviceServiceCapabilities extends IUnknown{
    /**
     * The interface identifier for IPortableDeviceServiceCapabilities
     * @type {Guid}
     */
    static IID => Guid("{24dbd89d-413e-43e0-bd5b-197f3c56c886}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Pointer<IPortableDevicePropVariantCollection>} ppMethods 
     * @returns {HRESULT} 
     */
    GetSupportedMethods(ppMethods) {
        result := ComCall(3, this, "ptr", ppMethods, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} Format 
     * @param {Pointer<IPortableDevicePropVariantCollection>} ppMethods 
     * @returns {HRESULT} 
     */
    GetSupportedMethodsByFormat(Format, ppMethods) {
        result := ComCall(4, this, "ptr", Format, "ptr", ppMethods, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} Method 
     * @param {Pointer<IPortableDeviceValues>} ppAttributes 
     * @returns {HRESULT} 
     */
    GetMethodAttributes(Method, ppAttributes) {
        result := ComCall(5, this, "ptr", Method, "ptr", ppAttributes, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} Method 
     * @param {Pointer<PROPERTYKEY>} Parameter 
     * @param {Pointer<IPortableDeviceValues>} ppAttributes 
     * @returns {HRESULT} 
     */
    GetMethodParameterAttributes(Method, Parameter, ppAttributes) {
        result := ComCall(6, this, "ptr", Method, "ptr", Parameter, "ptr", ppAttributes, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IPortableDevicePropVariantCollection>} ppFormats 
     * @returns {HRESULT} 
     */
    GetSupportedFormats(ppFormats) {
        result := ComCall(7, this, "ptr", ppFormats, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} Format 
     * @param {Pointer<IPortableDeviceValues>} ppAttributes 
     * @returns {HRESULT} 
     */
    GetFormatAttributes(Format, ppAttributes) {
        result := ComCall(8, this, "ptr", Format, "ptr", ppAttributes, "int")
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
     * @param {Pointer<PROPERTYKEY>} Property 
     * @param {Pointer<IPortableDeviceValues>} ppAttributes 
     * @returns {HRESULT} 
     */
    GetFormatPropertyAttributes(Format, Property, ppAttributes) {
        result := ComCall(10, this, "ptr", Format, "ptr", Property, "ptr", ppAttributes, "int")
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
        result := ComCall(11, this, "ptr", ppEvents, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} Event 
     * @param {Pointer<IPortableDeviceValues>} ppAttributes 
     * @returns {HRESULT} 
     */
    GetEventAttributes(Event, ppAttributes) {
        result := ComCall(12, this, "ptr", Event, "ptr", ppAttributes, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} Event 
     * @param {Pointer<PROPERTYKEY>} Parameter 
     * @param {Pointer<IPortableDeviceValues>} ppAttributes 
     * @returns {HRESULT} 
     */
    GetEventParameterAttributes(Event, Parameter, ppAttributes) {
        result := ComCall(13, this, "ptr", Event, "ptr", Parameter, "ptr", ppAttributes, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} dwInheritanceType 
     * @param {Pointer<IPortableDevicePropVariantCollection>} ppServices 
     * @returns {HRESULT} 
     */
    GetInheritedServices(dwInheritanceType, ppServices) {
        result := ComCall(14, this, "uint", dwInheritanceType, "ptr", ppServices, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} Format 
     * @param {Pointer<IPortableDeviceValuesCollection>} ppRenderingProfiles 
     * @returns {HRESULT} 
     */
    GetFormatRenderingProfiles(Format, ppRenderingProfiles) {
        result := ComCall(15, this, "ptr", Format, "ptr", ppRenderingProfiles, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IPortableDeviceKeyCollection>} ppCommands 
     * @returns {HRESULT} 
     */
    GetSupportedCommands(ppCommands) {
        result := ComCall(16, this, "ptr", ppCommands, "int")
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
        result := ComCall(17, this, "ptr", Command, "ptr", ppOptions, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    Cancel() {
        result := ComCall(18, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
