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
     * Retrieves the methods supported by the service.
     * @returns {IPortableDevicePropVariantCollection} The <a href="https://docs.microsoft.com/windows/desktop/wpd_sdk/iportabledevicepropvariantcollection">IPortableDevicePropVariantCollection</a> interface that receives the list of methods.
     * @see https://docs.microsoft.com/windows/win32/api//portabledeviceapi/nf-portabledeviceapi-iportabledeviceservicecapabilities-getsupportedmethods
     */
    GetSupportedMethods() {
        result := ComCall(3, this, "ptr*", &ppMethods := 0, "HRESULT")
        return IPortableDevicePropVariantCollection(ppMethods)
    }

    /**
     * Retrieves the methods supported by the service for the specified format.
     * @param {Pointer<Guid>} Format The format whose supported methods are retrieved.
     * @returns {IPortableDevicePropVariantCollection} The <a href="https://docs.microsoft.com/windows/desktop/wpd_sdk/iportabledevicepropvariantcollection">IPortableDevicePropVariantCollection</a> interface that receives the list of methods.
     * @see https://docs.microsoft.com/windows/win32/api//portabledeviceapi/nf-portabledeviceapi-iportabledeviceservicecapabilities-getsupportedmethodsbyformat
     */
    GetSupportedMethodsByFormat(Format) {
        result := ComCall(4, this, "ptr", Format, "ptr*", &ppMethods := 0, "HRESULT")
        return IPortableDevicePropVariantCollection(ppMethods)
    }

    /**
     * Retrieves the attributes used to describe a given method.
     * @param {Pointer<Guid>} Method The method whose attributes are retrieved.
     * @returns {IPortableDeviceValues} The <a href="https://docs.microsoft.com/windows/desktop/wpd_sdk/iportabledevicevalues">IPortableDeviceValues</a> interface that receives the list of attributes.
     * @see https://docs.microsoft.com/windows/win32/api//portabledeviceapi/nf-portabledeviceapi-iportabledeviceservicecapabilities-getmethodattributes
     */
    GetMethodAttributes(Method) {
        result := ComCall(5, this, "ptr", Method, "ptr*", &ppAttributes := 0, "HRESULT")
        return IPortableDeviceValues(ppAttributes)
    }

    /**
     * Retrieves the attributes used to describe a given method parameter.
     * @param {Pointer<Guid>} Method The method that contains the parameter whose attributes are retrieved.
     * @param {Pointer<PROPERTYKEY>} Parameter The parameter whose attributes are retrieved.
     * @returns {IPortableDeviceValues} The <a href="https://docs.microsoft.com/windows/desktop/wpd_sdk/iportabledevicevalues">IPortableDeviceValues</a> interface that receives the list of attributes.
     * @see https://docs.microsoft.com/windows/win32/api//portabledeviceapi/nf-portabledeviceapi-iportabledeviceservicecapabilities-getmethodparameterattributes
     */
    GetMethodParameterAttributes(Method, Parameter) {
        result := ComCall(6, this, "ptr", Method, "ptr", Parameter, "ptr*", &ppAttributes := 0, "HRESULT")
        return IPortableDeviceValues(ppAttributes)
    }

    /**
     * Retrieves the formats supported by the service.
     * @returns {IPortableDevicePropVariantCollection} The <a href="https://docs.microsoft.com/windows/desktop/wpd_sdk/iportabledevicepropvariantcollection">IPortableDevicePropVariantCollection</a> interface that receives the list of formats.
     * @see https://docs.microsoft.com/windows/win32/api//portabledeviceapi/nf-portabledeviceapi-iportabledeviceservicecapabilities-getsupportedformats
     */
    GetSupportedFormats() {
        result := ComCall(7, this, "ptr*", &ppFormats := 0, "HRESULT")
        return IPortableDevicePropVariantCollection(ppFormats)
    }

    /**
     * Retrieves the attributes of a format.
     * @param {Pointer<Guid>} Format The format whose attributes are retrieved.
     * @returns {IPortableDeviceValues} The <a href="https://docs.microsoft.com/windows/desktop/wpd_sdk/iportabledevicevalues">IPortableDeviceValues</a> interface that receives the list of attributes.
     * @see https://docs.microsoft.com/windows/win32/api//portabledeviceapi/nf-portabledeviceapi-iportabledeviceservicecapabilities-getformatattributes
     */
    GetFormatAttributes(Format) {
        result := ComCall(8, this, "ptr", Format, "ptr*", &ppAttributes := 0, "HRESULT")
        return IPortableDeviceValues(ppAttributes)
    }

    /**
     * Retrieves the properties supported by the service for the specified format.
     * @param {Pointer<Guid>} Format The format whose properties are retrieved.
     * @returns {IPortableDeviceKeyCollection} The <a href="https://docs.microsoft.com/windows/desktop/wpd_sdk/iportabledevicekeycollection">IPortableDeviceKeyCollection</a> interface that receives the list of properties.
     * @see https://docs.microsoft.com/windows/win32/api//portabledeviceapi/nf-portabledeviceapi-iportabledeviceservicecapabilities-getsupportedformatproperties
     */
    GetSupportedFormatProperties(Format) {
        result := ComCall(9, this, "ptr", Format, "ptr*", &ppKeys := 0, "HRESULT")
        return IPortableDeviceKeyCollection(ppKeys)
    }

    /**
     * Retrieves the attributes of a format property.
     * @param {Pointer<Guid>} Format The format whose property has its attributes retrieved.
     * @param {Pointer<PROPERTYKEY>} Property The property whose attributes are retrieved.
     * @returns {IPortableDeviceValues} The <a href="https://docs.microsoft.com/windows/desktop/wpd_sdk/iportabledevicevalues">IPortableDeviceValues</a> interface that receives the list of attributes.
     * @see https://docs.microsoft.com/windows/win32/api//portabledeviceapi/nf-portabledeviceapi-iportabledeviceservicecapabilities-getformatpropertyattributes
     */
    GetFormatPropertyAttributes(Format, Property) {
        result := ComCall(10, this, "ptr", Format, "ptr", Property, "ptr*", &ppAttributes := 0, "HRESULT")
        return IPortableDeviceValues(ppAttributes)
    }

    /**
     * Retrieves the events supported by the service.
     * @returns {IPortableDevicePropVariantCollection} The <a href="https://docs.microsoft.com/windows/desktop/wpd_sdk/iportabledevicepropvariantcollection">IPortableDevicePropVariantCollection</a> interface that receives the list of events.
     * @see https://docs.microsoft.com/windows/win32/api//portabledeviceapi/nf-portabledeviceapi-iportabledeviceservicecapabilities-getsupportedevents
     */
    GetSupportedEvents() {
        result := ComCall(11, this, "ptr*", &ppEvents := 0, "HRESULT")
        return IPortableDevicePropVariantCollection(ppEvents)
    }

    /**
     * Retrieves the attributes of an event.
     * @param {Pointer<Guid>} Event The event whose attributes are retrieved.
     * @returns {IPortableDeviceValues} The <a href="https://docs.microsoft.com/windows/desktop/wpd_sdk/iportabledevicevalues">IPortableDeviceValues</a> interface that receives the list of attributes.
     * @see https://docs.microsoft.com/windows/win32/api//portabledeviceapi/nf-portabledeviceapi-iportabledeviceservicecapabilities-geteventattributes
     */
    GetEventAttributes(Event) {
        result := ComCall(12, this, "ptr", Event, "ptr*", &ppAttributes := 0, "HRESULT")
        return IPortableDeviceValues(ppAttributes)
    }

    /**
     * Retrieves the attributes of an event parameter.
     * @param {Pointer<Guid>} Event The event that contains the parameter whose attributes are retrieved.
     * @param {Pointer<PROPERTYKEY>} Parameter The parameter whose attributes are retrieved.
     * @returns {IPortableDeviceValues} The <a href="https://docs.microsoft.com/windows/desktop/wpd_sdk/iportabledevicevalues">IPortableDeviceValues</a> interface that receives the list of attributes.
     * @see https://docs.microsoft.com/windows/win32/api//portabledeviceapi/nf-portabledeviceapi-iportabledeviceservicecapabilities-geteventparameterattributes
     */
    GetEventParameterAttributes(Event, Parameter) {
        result := ComCall(13, this, "ptr", Event, "ptr", Parameter, "ptr*", &ppAttributes := 0, "HRESULT")
        return IPortableDeviceValues(ppAttributes)
    }

    /**
     * Retrieves the services having the specified inheritance type.
     * @param {Integer} dwInheritanceType The type of inherited services to retrieve.
     * @returns {IPortableDevicePropVariantCollection} The <a href="https://docs.microsoft.com/windows/desktop/wpd_sdk/iportabledevicepropvariantcollection">IPortableDevicePropVariantCollection</a> interface that receives the list of services. If no inherited services are found, an empty collection is returned.
     * @see https://docs.microsoft.com/windows/win32/api//portabledeviceapi/nf-portabledeviceapi-iportabledeviceservicecapabilities-getinheritedservices
     */
    GetInheritedServices(dwInheritanceType) {
        result := ComCall(14, this, "uint", dwInheritanceType, "ptr*", &ppServices := 0, "HRESULT")
        return IPortableDevicePropVariantCollection(ppServices)
    }

    /**
     * Retrieves the rendering profiles of a format.
     * @param {Pointer<Guid>} Format The format whose rendering profiles are retrieved.
     * @returns {IPortableDeviceValuesCollection} The <a href="https://docs.microsoft.com/windows/desktop/wpd_sdk/iportabledevicevaluescollection">IPortableDeviceValuesCollection</a> object that receives the list of rendering profiles.
     * @see https://docs.microsoft.com/windows/win32/api//portabledeviceapi/nf-portabledeviceapi-iportabledeviceservicecapabilities-getformatrenderingprofiles
     */
    GetFormatRenderingProfiles(Format) {
        result := ComCall(15, this, "ptr", Format, "ptr*", &ppRenderingProfiles := 0, "HRESULT")
        return IPortableDeviceValuesCollection(ppRenderingProfiles)
    }

    /**
     * Retrieves the commands supported by the service.
     * @returns {IPortableDeviceKeyCollection} The <a href="https://docs.microsoft.com/windows/desktop/wpd_sdk/iportabledevicekeycollection">IPortableDeviceKeyCollection</a> interface that receives the list of commands.
     * @see https://docs.microsoft.com/windows/win32/api//portabledeviceapi/nf-portabledeviceapi-iportabledeviceservicecapabilities-getsupportedcommands
     */
    GetSupportedCommands() {
        result := ComCall(16, this, "ptr*", &ppCommands := 0, "HRESULT")
        return IPortableDeviceKeyCollection(ppCommands)
    }

    /**
     * Retrieves the options of a WPD command.
     * @param {Pointer<PROPERTYKEY>} Command The command whose options are retrieved.
     * @returns {IPortableDeviceValues} The <a href="https://docs.microsoft.com/windows/desktop/wpd_sdk/iportabledevicevalues">IPortableDeviceValues</a> interface that receives the list of options.
     * @see https://docs.microsoft.com/windows/win32/api//portabledeviceapi/nf-portabledeviceapi-iportabledeviceservicecapabilities-getcommandoptions
     */
    GetCommandOptions(Command) {
        result := ComCall(17, this, "ptr", Command, "ptr*", &ppOptions := 0, "HRESULT")
        return IPortableDeviceValues(ppOptions)
    }

    /**
     * Cancels a pending operation.
     * @returns {HRESULT} If the method succeeds, it returns <b>S_OK</b>. Any other <b>HRESULT</b> value indicates that the call failed.
     * @see https://docs.microsoft.com/windows/win32/api//portabledeviceapi/nf-portabledeviceapi-iportabledeviceservicecapabilities-cancel
     */
    Cancel() {
        result := ComCall(18, this, "HRESULT")
        return result
    }
}
