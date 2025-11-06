#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IPortableDevicePropVariantCollection.ahk
#Include .\IPortableDeviceValues.ahk
#Include .\IPortableDeviceKeyCollection.ahk
#Include .\IPortableDeviceValuesCollection.ahk
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
     * @returns {IPortableDevicePropVariantCollection} 
     * @see https://learn.microsoft.com/windows/win32/api/portabledeviceapi/nf-portabledeviceapi-iportabledeviceservicecapabilities-getsupportedmethods
     */
    GetSupportedMethods() {
        result := ComCall(3, this, "ptr*", &ppMethods := 0, "HRESULT")
        return IPortableDevicePropVariantCollection(ppMethods)
    }

    /**
     * 
     * @param {Pointer<Guid>} Format 
     * @returns {IPortableDevicePropVariantCollection} 
     * @see https://learn.microsoft.com/windows/win32/api/portabledeviceapi/nf-portabledeviceapi-iportabledeviceservicecapabilities-getsupportedmethodsbyformat
     */
    GetSupportedMethodsByFormat(Format) {
        result := ComCall(4, this, "ptr", Format, "ptr*", &ppMethods := 0, "HRESULT")
        return IPortableDevicePropVariantCollection(ppMethods)
    }

    /**
     * 
     * @param {Pointer<Guid>} Method 
     * @returns {IPortableDeviceValues} 
     * @see https://learn.microsoft.com/windows/win32/api/portabledeviceapi/nf-portabledeviceapi-iportabledeviceservicecapabilities-getmethodattributes
     */
    GetMethodAttributes(Method) {
        result := ComCall(5, this, "ptr", Method, "ptr*", &ppAttributes := 0, "HRESULT")
        return IPortableDeviceValues(ppAttributes)
    }

    /**
     * 
     * @param {Pointer<Guid>} Method 
     * @param {Pointer<PROPERTYKEY>} Parameter 
     * @returns {IPortableDeviceValues} 
     * @see https://learn.microsoft.com/windows/win32/api/portabledeviceapi/nf-portabledeviceapi-iportabledeviceservicecapabilities-getmethodparameterattributes
     */
    GetMethodParameterAttributes(Method, Parameter) {
        result := ComCall(6, this, "ptr", Method, "ptr", Parameter, "ptr*", &ppAttributes := 0, "HRESULT")
        return IPortableDeviceValues(ppAttributes)
    }

    /**
     * 
     * @returns {IPortableDevicePropVariantCollection} 
     * @see https://learn.microsoft.com/windows/win32/api/portabledeviceapi/nf-portabledeviceapi-iportabledeviceservicecapabilities-getsupportedformats
     */
    GetSupportedFormats() {
        result := ComCall(7, this, "ptr*", &ppFormats := 0, "HRESULT")
        return IPortableDevicePropVariantCollection(ppFormats)
    }

    /**
     * 
     * @param {Pointer<Guid>} Format 
     * @returns {IPortableDeviceValues} 
     * @see https://learn.microsoft.com/windows/win32/api/portabledeviceapi/nf-portabledeviceapi-iportabledeviceservicecapabilities-getformatattributes
     */
    GetFormatAttributes(Format) {
        result := ComCall(8, this, "ptr", Format, "ptr*", &ppAttributes := 0, "HRESULT")
        return IPortableDeviceValues(ppAttributes)
    }

    /**
     * 
     * @param {Pointer<Guid>} Format 
     * @returns {IPortableDeviceKeyCollection} 
     * @see https://learn.microsoft.com/windows/win32/api/portabledeviceapi/nf-portabledeviceapi-iportabledeviceservicecapabilities-getsupportedformatproperties
     */
    GetSupportedFormatProperties(Format) {
        result := ComCall(9, this, "ptr", Format, "ptr*", &ppKeys := 0, "HRESULT")
        return IPortableDeviceKeyCollection(ppKeys)
    }

    /**
     * 
     * @param {Pointer<Guid>} Format 
     * @param {Pointer<PROPERTYKEY>} Property 
     * @returns {IPortableDeviceValues} 
     * @see https://learn.microsoft.com/windows/win32/api/portabledeviceapi/nf-portabledeviceapi-iportabledeviceservicecapabilities-getformatpropertyattributes
     */
    GetFormatPropertyAttributes(Format, Property) {
        result := ComCall(10, this, "ptr", Format, "ptr", Property, "ptr*", &ppAttributes := 0, "HRESULT")
        return IPortableDeviceValues(ppAttributes)
    }

    /**
     * 
     * @returns {IPortableDevicePropVariantCollection} 
     * @see https://learn.microsoft.com/windows/win32/api/portabledeviceapi/nf-portabledeviceapi-iportabledeviceservicecapabilities-getsupportedevents
     */
    GetSupportedEvents() {
        result := ComCall(11, this, "ptr*", &ppEvents := 0, "HRESULT")
        return IPortableDevicePropVariantCollection(ppEvents)
    }

    /**
     * 
     * @param {Pointer<Guid>} Event 
     * @returns {IPortableDeviceValues} 
     * @see https://learn.microsoft.com/windows/win32/api/portabledeviceapi/nf-portabledeviceapi-iportabledeviceservicecapabilities-geteventattributes
     */
    GetEventAttributes(Event) {
        result := ComCall(12, this, "ptr", Event, "ptr*", &ppAttributes := 0, "HRESULT")
        return IPortableDeviceValues(ppAttributes)
    }

    /**
     * 
     * @param {Pointer<Guid>} Event 
     * @param {Pointer<PROPERTYKEY>} Parameter 
     * @returns {IPortableDeviceValues} 
     * @see https://learn.microsoft.com/windows/win32/api/portabledeviceapi/nf-portabledeviceapi-iportabledeviceservicecapabilities-geteventparameterattributes
     */
    GetEventParameterAttributes(Event, Parameter) {
        result := ComCall(13, this, "ptr", Event, "ptr", Parameter, "ptr*", &ppAttributes := 0, "HRESULT")
        return IPortableDeviceValues(ppAttributes)
    }

    /**
     * 
     * @param {Integer} dwInheritanceType 
     * @returns {IPortableDevicePropVariantCollection} 
     * @see https://learn.microsoft.com/windows/win32/api/portabledeviceapi/nf-portabledeviceapi-iportabledeviceservicecapabilities-getinheritedservices
     */
    GetInheritedServices(dwInheritanceType) {
        result := ComCall(14, this, "uint", dwInheritanceType, "ptr*", &ppServices := 0, "HRESULT")
        return IPortableDevicePropVariantCollection(ppServices)
    }

    /**
     * 
     * @param {Pointer<Guid>} Format 
     * @returns {IPortableDeviceValuesCollection} 
     * @see https://learn.microsoft.com/windows/win32/api/portabledeviceapi/nf-portabledeviceapi-iportabledeviceservicecapabilities-getformatrenderingprofiles
     */
    GetFormatRenderingProfiles(Format) {
        result := ComCall(15, this, "ptr", Format, "ptr*", &ppRenderingProfiles := 0, "HRESULT")
        return IPortableDeviceValuesCollection(ppRenderingProfiles)
    }

    /**
     * 
     * @returns {IPortableDeviceKeyCollection} 
     * @see https://learn.microsoft.com/windows/win32/api/portabledeviceapi/nf-portabledeviceapi-iportabledeviceservicecapabilities-getsupportedcommands
     */
    GetSupportedCommands() {
        result := ComCall(16, this, "ptr*", &ppCommands := 0, "HRESULT")
        return IPortableDeviceKeyCollection(ppCommands)
    }

    /**
     * 
     * @param {Pointer<PROPERTYKEY>} Command 
     * @returns {IPortableDeviceValues} 
     * @see https://learn.microsoft.com/windows/win32/api/portabledeviceapi/nf-portabledeviceapi-iportabledeviceservicecapabilities-getcommandoptions
     */
    GetCommandOptions(Command) {
        result := ComCall(17, this, "ptr", Command, "ptr*", &ppOptions := 0, "HRESULT")
        return IPortableDeviceValues(ppOptions)
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
