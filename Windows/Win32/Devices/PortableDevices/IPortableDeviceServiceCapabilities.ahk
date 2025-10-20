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

    static sizeof => A_PtrSize
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
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetSupportedMethods", "GetSupportedMethodsByFormat", "GetMethodAttributes", "GetMethodParameterAttributes", "GetSupportedFormats", "GetFormatAttributes", "GetSupportedFormatProperties", "GetFormatPropertyAttributes", "GetSupportedEvents", "GetEventAttributes", "GetEventParameterAttributes", "GetInheritedServices", "GetFormatRenderingProfiles", "GetSupportedCommands", "GetCommandOptions", "Cancel"]

    /**
     * 
     * @param {Pointer<IPortableDevicePropVariantCollection>} ppMethods 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/portabledeviceapi/nf-portabledeviceapi-iportabledeviceservicecapabilities-getsupportedmethods
     */
    GetSupportedMethods(ppMethods) {
        result := ComCall(3, this, "ptr*", ppMethods, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} Format 
     * @param {Pointer<IPortableDevicePropVariantCollection>} ppMethods 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/portabledeviceapi/nf-portabledeviceapi-iportabledeviceservicecapabilities-getsupportedmethodsbyformat
     */
    GetSupportedMethodsByFormat(Format, ppMethods) {
        result := ComCall(4, this, "ptr", Format, "ptr*", ppMethods, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} Method 
     * @param {Pointer<IPortableDeviceValues>} ppAttributes 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/portabledeviceapi/nf-portabledeviceapi-iportabledeviceservicecapabilities-getmethodattributes
     */
    GetMethodAttributes(Method, ppAttributes) {
        result := ComCall(5, this, "ptr", Method, "ptr*", ppAttributes, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} Method 
     * @param {Pointer<PROPERTYKEY>} Parameter 
     * @param {Pointer<IPortableDeviceValues>} ppAttributes 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/portabledeviceapi/nf-portabledeviceapi-iportabledeviceservicecapabilities-getmethodparameterattributes
     */
    GetMethodParameterAttributes(Method, Parameter, ppAttributes) {
        result := ComCall(6, this, "ptr", Method, "ptr", Parameter, "ptr*", ppAttributes, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IPortableDevicePropVariantCollection>} ppFormats 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/portabledeviceapi/nf-portabledeviceapi-iportabledeviceservicecapabilities-getsupportedformats
     */
    GetSupportedFormats(ppFormats) {
        result := ComCall(7, this, "ptr*", ppFormats, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} Format 
     * @param {Pointer<IPortableDeviceValues>} ppAttributes 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/portabledeviceapi/nf-portabledeviceapi-iportabledeviceservicecapabilities-getformatattributes
     */
    GetFormatAttributes(Format, ppAttributes) {
        result := ComCall(8, this, "ptr", Format, "ptr*", ppAttributes, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} Format 
     * @param {Pointer<IPortableDeviceKeyCollection>} ppKeys 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/portabledeviceapi/nf-portabledeviceapi-iportabledeviceservicecapabilities-getsupportedformatproperties
     */
    GetSupportedFormatProperties(Format, ppKeys) {
        result := ComCall(9, this, "ptr", Format, "ptr*", ppKeys, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} Format 
     * @param {Pointer<PROPERTYKEY>} Property 
     * @param {Pointer<IPortableDeviceValues>} ppAttributes 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/portabledeviceapi/nf-portabledeviceapi-iportabledeviceservicecapabilities-getformatpropertyattributes
     */
    GetFormatPropertyAttributes(Format, Property, ppAttributes) {
        result := ComCall(10, this, "ptr", Format, "ptr", Property, "ptr*", ppAttributes, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IPortableDevicePropVariantCollection>} ppEvents 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/portabledeviceapi/nf-portabledeviceapi-iportabledeviceservicecapabilities-getsupportedevents
     */
    GetSupportedEvents(ppEvents) {
        result := ComCall(11, this, "ptr*", ppEvents, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} Event 
     * @param {Pointer<IPortableDeviceValues>} ppAttributes 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/portabledeviceapi/nf-portabledeviceapi-iportabledeviceservicecapabilities-geteventattributes
     */
    GetEventAttributes(Event, ppAttributes) {
        result := ComCall(12, this, "ptr", Event, "ptr*", ppAttributes, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} Event 
     * @param {Pointer<PROPERTYKEY>} Parameter 
     * @param {Pointer<IPortableDeviceValues>} ppAttributes 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/portabledeviceapi/nf-portabledeviceapi-iportabledeviceservicecapabilities-geteventparameterattributes
     */
    GetEventParameterAttributes(Event, Parameter, ppAttributes) {
        result := ComCall(13, this, "ptr", Event, "ptr", Parameter, "ptr*", ppAttributes, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} dwInheritanceType 
     * @param {Pointer<IPortableDevicePropVariantCollection>} ppServices 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/portabledeviceapi/nf-portabledeviceapi-iportabledeviceservicecapabilities-getinheritedservices
     */
    GetInheritedServices(dwInheritanceType, ppServices) {
        result := ComCall(14, this, "uint", dwInheritanceType, "ptr*", ppServices, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} Format 
     * @param {Pointer<IPortableDeviceValuesCollection>} ppRenderingProfiles 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/portabledeviceapi/nf-portabledeviceapi-iportabledeviceservicecapabilities-getformatrenderingprofiles
     */
    GetFormatRenderingProfiles(Format, ppRenderingProfiles) {
        result := ComCall(15, this, "ptr", Format, "ptr*", ppRenderingProfiles, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IPortableDeviceKeyCollection>} ppCommands 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/portabledeviceapi/nf-portabledeviceapi-iportabledeviceservicecapabilities-getsupportedcommands
     */
    GetSupportedCommands(ppCommands) {
        result := ComCall(16, this, "ptr*", ppCommands, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<PROPERTYKEY>} Command 
     * @param {Pointer<IPortableDeviceValues>} ppOptions 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/portabledeviceapi/nf-portabledeviceapi-iportabledeviceservicecapabilities-getcommandoptions
     */
    GetCommandOptions(Command, ppOptions) {
        result := ComCall(17, this, "ptr", Command, "ptr*", ppOptions, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/portabledeviceapi/nf-portabledeviceapi-iportabledeviceservicecapabilities-cancel
     */
    Cancel() {
        result := ComCall(18, this, "HRESULT")
        return result
    }
}
