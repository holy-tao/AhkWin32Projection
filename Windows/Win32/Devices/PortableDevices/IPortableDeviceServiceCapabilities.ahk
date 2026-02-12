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
 * @see https://learn.microsoft.com/windows/win32/api//content/portabledeviceapi/nn-portabledeviceapi-iportabledeviceservicecapabilities
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
     * @see https://learn.microsoft.com/windows/win32/api//content/portabledeviceapi/nf-portabledeviceapi-iportabledeviceservicecapabilities-getsupportedmethods
     */
    GetSupportedMethods() {
        result := ComCall(3, this, "ptr*", &ppMethods := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IPortableDevicePropVariantCollection(ppMethods)
    }

    /**
     * Retrieves the methods supported by the service for the specified format.
     * @param {Pointer<Guid>} Format The format whose supported methods are retrieved.
     * @returns {IPortableDevicePropVariantCollection} The <a href="https://docs.microsoft.com/windows/desktop/wpd_sdk/iportabledevicepropvariantcollection">IPortableDevicePropVariantCollection</a> interface that receives the list of methods.
     * @see https://learn.microsoft.com/windows/win32/api//content/portabledeviceapi/nf-portabledeviceapi-iportabledeviceservicecapabilities-getsupportedmethodsbyformat
     */
    GetSupportedMethodsByFormat(Format) {
        result := ComCall(4, this, "ptr", Format, "ptr*", &ppMethods := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IPortableDevicePropVariantCollection(ppMethods)
    }

    /**
     * Retrieves the attributes used to describe a given method.
     * @remarks
     * Possible attributes include the <a href="https://docs.microsoft.com/windows/desktop/wpd_sdk/wpd-attributes">WPD_METHOD_ATTRIBUTE_NAME</a>, <b>WPD_METHOD_ATTRIBUTE_ASSOCIATED_FORMAT</b>, <b>WPD_METHOD_ATTRIBUTE_ACCESS</b>, and <a href="https://docs.microsoft.com/windows/desktop/wpd_sdk/wpd-method-attributes">WPD_METHOD_ATTRIBUTE_PARAMETERS</a> properties.
     * @param {Pointer<Guid>} Method The method whose attributes are retrieved.
     * @returns {IPortableDeviceValues} The <a href="https://docs.microsoft.com/windows/desktop/wpd_sdk/iportabledevicevalues">IPortableDeviceValues</a> interface that receives the list of attributes.
     * @see https://learn.microsoft.com/windows/win32/api//content/portabledeviceapi/nf-portabledeviceapi-iportabledeviceservicecapabilities-getmethodattributes
     */
    GetMethodAttributes(Method) {
        result := ComCall(5, this, "ptr", Method, "ptr*", &ppAttributes := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IPortableDeviceValues(ppAttributes)
    }

    /**
     * Retrieves the attributes used to describe a given method parameter.
     * @remarks
     * Possible attributes include the <a href="https://docs.microsoft.com/windows/desktop/wpd_sdk/wpd-attributes">WPD_PARAMETER_ATTRIBUTE_ORDER</a>, <b>WPD_PARAMETER_ATTRIBUTE_USAGE</b>, <b>WPD_PARAMETER_ATTRIBUTE_NAME</b>, and <b>WPD_PARAMETER_ATTRIBUTE_VARTYPE</b> properties.
     * @param {Pointer<Guid>} Method The method that contains the parameter whose attributes are retrieved.
     * @param {Pointer<PROPERTYKEY>} Parameter The parameter whose attributes are retrieved.
     * @returns {IPortableDeviceValues} The <a href="https://docs.microsoft.com/windows/desktop/wpd_sdk/iportabledevicevalues">IPortableDeviceValues</a> interface that receives the list of attributes.
     * @see https://learn.microsoft.com/windows/win32/api//content/portabledeviceapi/nf-portabledeviceapi-iportabledeviceservicecapabilities-getmethodparameterattributes
     */
    GetMethodParameterAttributes(Method, Parameter) {
        result := ComCall(6, this, "ptr", Method, "ptr", Parameter, "ptr*", &ppAttributes := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IPortableDeviceValues(ppAttributes)
    }

    /**
     * Retrieves the formats supported by the service.
     * @returns {IPortableDevicePropVariantCollection} The <a href="https://docs.microsoft.com/windows/desktop/wpd_sdk/iportabledevicepropvariantcollection">IPortableDevicePropVariantCollection</a> interface that receives the list of formats.
     * @see https://learn.microsoft.com/windows/win32/api//content/portabledeviceapi/nf-portabledeviceapi-iportabledeviceservicecapabilities-getsupportedformats
     */
    GetSupportedFormats() {
        result := ComCall(7, this, "ptr*", &ppFormats := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IPortableDevicePropVariantCollection(ppFormats)
    }

    /**
     * Retrieves the attributes of a format.
     * @remarks
     * <a href="https://docs.microsoft.com/windows/desktop/wpd_sdk/wpd-format-attributes">WPD_FORMAT_ATTRIBUTE_NAME</a> is an example of a commonly retrieved attribute.
     * @param {Pointer<Guid>} Format The format whose attributes are retrieved.
     * @returns {IPortableDeviceValues} The <a href="https://docs.microsoft.com/windows/desktop/wpd_sdk/iportabledevicevalues">IPortableDeviceValues</a> interface that receives the list of attributes.
     * @see https://learn.microsoft.com/windows/win32/api//content/portabledeviceapi/nf-portabledeviceapi-iportabledeviceservicecapabilities-getformatattributes
     */
    GetFormatAttributes(Format) {
        result := ComCall(8, this, "ptr", Format, "ptr*", &ppAttributes := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IPortableDeviceValues(ppAttributes)
    }

    /**
     * Retrieves the properties supported by the service for the specified format.
     * @remarks
     * The retrieved property collection is a superset of all properties supported by an object of the specified format.
     * 
     * An application can also retrieve the properties for an object by calling the <a href="https://docs.microsoft.com/windows/desktop/api/portabledeviceapi/nf-portabledeviceapi-iportabledeviceservice-sendcommand">IPortableDeviceService::SendCommand</a> method with the <a href="https://docs.microsoft.com/windows/desktop/wpd_sdk/wpd-command-object-properties-get-supported2">WPD_COMMAND_OBJECT_PROPERTIES_GET_SUPPORTED</a> property passed as the command identifier. However, the <b>GetSupportedFormatProperties</b> method is typically faster than the <b>IPortableDeviceService::SendCommand</b> method.
     * @param {Pointer<Guid>} Format The format whose properties are retrieved.
     * @returns {IPortableDeviceKeyCollection} The <a href="https://docs.microsoft.com/windows/desktop/wpd_sdk/iportabledevicekeycollection">IPortableDeviceKeyCollection</a> interface that receives the list of properties.
     * @see https://learn.microsoft.com/windows/win32/api//content/portabledeviceapi/nf-portabledeviceapi-iportabledeviceservicecapabilities-getsupportedformatproperties
     */
    GetSupportedFormatProperties(Format) {
        result := ComCall(9, this, "ptr", Format, "ptr*", &ppKeys := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IPortableDeviceKeyCollection(ppKeys)
    }

    /**
     * Retrieves the attributes of a format property.
     * @remarks
     * A Windows Portable Devices (WPD) driver often treats objects of a given format the same. Many properties will therefore have attributes that are identical across all objects of that format. This method retrieves such attributes.
     * 
     * Note that this method will not retrieve attributes that differ across object instances.
     * @param {Pointer<Guid>} Format The format whose property has its attributes retrieved.
     * @param {Pointer<PROPERTYKEY>} Property_ The property whose attributes are retrieved.
     * @returns {IPortableDeviceValues} The <a href="https://docs.microsoft.com/windows/desktop/wpd_sdk/iportabledevicevalues">IPortableDeviceValues</a> interface that receives the list of attributes.
     * @see https://learn.microsoft.com/windows/win32/api//content/portabledeviceapi/nf-portabledeviceapi-iportabledeviceservicecapabilities-getformatpropertyattributes
     */
    GetFormatPropertyAttributes(Format, Property_) {
        result := ComCall(10, this, "ptr", Format, "ptr", Property_, "ptr*", &ppAttributes := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IPortableDeviceValues(ppAttributes)
    }

    /**
     * Retrieves the events supported by the service.
     * @returns {IPortableDevicePropVariantCollection} The <a href="https://docs.microsoft.com/windows/desktop/wpd_sdk/iportabledevicepropvariantcollection">IPortableDevicePropVariantCollection</a> interface that receives the list of events.
     * @see https://learn.microsoft.com/windows/win32/api//content/portabledeviceapi/nf-portabledeviceapi-iportabledeviceservicecapabilities-getsupportedevents
     */
    GetSupportedEvents() {
        result := ComCall(11, this, "ptr*", &ppEvents := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IPortableDevicePropVariantCollection(ppEvents)
    }

    /**
     * Retrieves the attributes of an event.
     * @remarks
     * Possible attributes include the <a href="https://docs.microsoft.com/windows/desktop/wpd_sdk/wpd-attributes">WPD_EVENT_ATTRIBUTE_NAME</a>, WPD_EVENT_ATTRIBUTE_PARAMETERS, and WPD_EVENT_ATTRIBUTE_OPTIONS properties.
     * @param {Pointer<Guid>} Event The event whose attributes are retrieved.
     * @returns {IPortableDeviceValues} The <a href="https://docs.microsoft.com/windows/desktop/wpd_sdk/iportabledevicevalues">IPortableDeviceValues</a> interface that receives the list of attributes.
     * @see https://learn.microsoft.com/windows/win32/api//content/portabledeviceapi/nf-portabledeviceapi-iportabledeviceservicecapabilities-geteventattributes
     */
    GetEventAttributes(Event) {
        result := ComCall(12, this, "ptr", Event, "ptr*", &ppAttributes := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IPortableDeviceValues(ppAttributes)
    }

    /**
     * Retrieves the attributes of an event parameter.
     * @remarks
     * Possible attribute values include the <a href="https://docs.microsoft.com/windows/desktop/wpd_sdk/wpd-attributes">WPD_PARAMETER_ATTRIBUTE_VARTYPE</a> and WPD_PARAMETER_ATTRIBUTE_FORM properties.
     * @param {Pointer<Guid>} Event The event that contains the parameter whose attributes are retrieved.
     * @param {Pointer<PROPERTYKEY>} Parameter The parameter whose attributes are retrieved.
     * @returns {IPortableDeviceValues} The <a href="https://docs.microsoft.com/windows/desktop/wpd_sdk/iportabledevicevalues">IPortableDeviceValues</a> interface that receives the list of attributes.
     * @see https://learn.microsoft.com/windows/win32/api//content/portabledeviceapi/nf-portabledeviceapi-iportabledeviceservicecapabilities-geteventparameterattributes
     */
    GetEventParameterAttributes(Event, Parameter) {
        result := ComCall(13, this, "ptr", Event, "ptr", Parameter, "ptr*", &ppAttributes := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IPortableDeviceValues(ppAttributes)
    }

    /**
     * Retrieves the services having the specified inheritance type.
     * @remarks
     * Currently, device services may only inherit by implementing an abstract service. This is analogous to how a class implements methods of an abstract interface or a virtual class in object-oriented programming. By implementing an abstract service, a device service will support all formats, properties, and method behavior that the abstract service describes. For instance, a  <b>Contacts</b> service may implement the <b>Anchor Sync</b> abstract service, where the device stores markers indicating which contacts were updated since the last synchronization with the PC. 
     * 
     * Possible values for the <i>dwInheritanceType</i> parameter are those defined in the <a href="https://docs.microsoft.com/windows/desktop/wpd_sdk/wpd-service-inheritance-types2">WPD_SERVICE_INHERITANCE_TYPES</a> enumeration. (For Windows 7, only the <b>WPD_SERVICE_INHERITANCE_IMPLEMENTATION</b> enumeration constant is supported.)
     * 
     * If the value of the <i>dwInheritanceType</i> parameter is <b>WPD_SERVICE_INHERITANCE_IMPLEMENTATION</b>, each item in the collection specified by the <i>ppServices</i> parameter has variant type <b>VT_CLSID</b>.
     * @param {Integer} dwInheritanceType The type of inherited services to retrieve.
     * @returns {IPortableDevicePropVariantCollection} The <a href="https://docs.microsoft.com/windows/desktop/wpd_sdk/iportabledevicepropvariantcollection">IPortableDevicePropVariantCollection</a> interface that receives the list of services. If no inherited services are found, an empty collection is returned.
     * @see https://learn.microsoft.com/windows/win32/api//content/portabledeviceapi/nf-portabledeviceapi-iportabledeviceservicecapabilities-getinheritedservices
     */
    GetInheritedServices(dwInheritanceType) {
        result := ComCall(14, this, "uint", dwInheritanceType, "ptr*", &ppServices := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IPortableDevicePropVariantCollection(ppServices)
    }

    /**
     * Retrieves the rendering profiles of a format.
     * @remarks
     * The rendering profiles are similar to what the <a href="https://docs.microsoft.com/windows/desktop/wpd_sdk/wpd-functional-category-rendering-information">WPD_FUNCTIONAL_CATEGORY_RENDERING_INFORMATION</a> functional object returns for device-wide rendering profiles, so that the <b>DisplayRenderingProfile</b> helper function described in <a href="https://docs.microsoft.com/windows/desktop/wpd_sdk/retrieving-the-rendering-capabilities-supported-by-a-device">Retrieving the Rendering Capabilities Supported by a Device</a> could be used here as well.    But there are differences: The <b>GetFormatRenderingProfiles</b> method retrieves only rendering profiles that apply to the selected service and have been filtered by format.
     * @param {Pointer<Guid>} Format The format whose rendering profiles are retrieved.
     * @returns {IPortableDeviceValuesCollection} The <a href="https://docs.microsoft.com/windows/desktop/wpd_sdk/iportabledevicevaluescollection">IPortableDeviceValuesCollection</a> object that receives the list of rendering profiles.
     * @see https://learn.microsoft.com/windows/win32/api//content/portabledeviceapi/nf-portabledeviceapi-iportabledeviceservicecapabilities-getformatrenderingprofiles
     */
    GetFormatRenderingProfiles(Format) {
        result := ComCall(15, this, "ptr", Format, "ptr*", &ppRenderingProfiles := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IPortableDeviceValuesCollection(ppRenderingProfiles)
    }

    /**
     * Retrieves the commands supported by the service.
     * @returns {IPortableDeviceKeyCollection} The <a href="https://docs.microsoft.com/windows/desktop/wpd_sdk/iportabledevicekeycollection">IPortableDeviceKeyCollection</a> interface that receives the list of commands.
     * @see https://learn.microsoft.com/windows/win32/api//content/portabledeviceapi/nf-portabledeviceapi-iportabledeviceservicecapabilities-getsupportedcommands
     */
    GetSupportedCommands() {
        result := ComCall(16, this, "ptr*", &ppCommands := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IPortableDeviceKeyCollection(ppCommands)
    }

    /**
     * Retrieves the options of a WPD command.
     * @param {Pointer<PROPERTYKEY>} Command The command whose options are retrieved.
     * @returns {IPortableDeviceValues} The <a href="https://docs.microsoft.com/windows/desktop/wpd_sdk/iportabledevicevalues">IPortableDeviceValues</a> interface that receives the list of options.
     * @see https://learn.microsoft.com/windows/win32/api//content/portabledeviceapi/nf-portabledeviceapi-iportabledeviceservicecapabilities-getcommandoptions
     */
    GetCommandOptions(Command) {
        result := ComCall(17, this, "ptr", Command, "ptr*", &ppOptions := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IPortableDeviceValues(ppOptions)
    }

    /**
     * Cancels a pending operation.
     * @remarks
     * This method cancels all pending operations on the current service handle, which corresponds to a session associated with an   <a href="https://docs.microsoft.com/windows/desktop/api/portabledeviceapi/nn-portabledeviceapi-iportabledeviceservice">IPortableDeviceService</a>  interface. The Windows Portable Devices (WPD) API does not support targeted cancellation of specific operations.
     * @returns {HRESULT} If the method succeeds, it returns <b>S_OK</b>. Any other <b>HRESULT</b> value indicates that the call failed.
     * @see https://learn.microsoft.com/windows/win32/api//content/portabledeviceapi/nf-portabledeviceapi-iportabledeviceservicecapabilities-cancel
     */
    Cancel() {
        result := ComCall(18, this, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
