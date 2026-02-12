#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IPortableDeviceKeyCollection.ahk
#Include .\IPortableDeviceValues.ahk
#Include .\IPortableDevicePropVariantCollection.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The IPortableDeviceCapabilities interface a variety of device capabilities, including supported formats, commands, and functional objects. You can retrieve this interface from a device by calling IPortableDevice::Capabilities.
 * @see https://learn.microsoft.com/windows/win32/api//content/portabledeviceapi/nn-portabledeviceapi-iportabledevicecapabilities
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
     * The GetSupportedCommands method retrieves a list of all the supported commands for this device.
     * @remarks
     * None.
     * @returns {IPortableDeviceKeyCollection} Address of a variable that receives a pointer to an <a href="https://docs.microsoft.com/windows/desktop/wpd_sdk/iportabledevicekeycollection">IPortableDeviceKeyCollection</a> interface that holds all the valid commands. For a list of commands that are defined by Windows Portable Devices, see <a href="https://docs.microsoft.com/windows/desktop/wpd_sdk/commands">Commands</a>. The caller must release this interface when it is done with it.
     * @see https://learn.microsoft.com/windows/win32/api//content/portabledeviceapi/nf-portabledeviceapi-iportabledevicecapabilities-getsupportedcommands
     */
    GetSupportedCommands() {
        result := ComCall(3, this, "ptr*", &ppCommands := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IPortableDeviceKeyCollection(ppCommands)
    }

    /**
     * The GetCommandOptions method retrieves all the supported options for the specified command on the device.
     * @remarks
     * This method is called by applications that want to call a command directly on the driver by calling <a href="https://docs.microsoft.com/windows/desktop/api/portabledeviceapi/nf-portabledeviceapi-iportabledevice-sendcommand">IPortableDevice::SendCommand</a>. Some commands allow the caller to specify additional options. For example, some drivers support recursive child deletion when deleting an object using the WPD_COMMAND_OBJECT_MANAGEMENT_DELETE_OBJECTS command.
     *       
     * 
     * If an option is a simple Boolean value, the key of the retrieved <a href="https://docs.microsoft.com/windows/desktop/wpd_sdk/iportabledevicevalues">IPortableDeviceValues</a> interface will be the name of the option, and the <b>PROPVARIANT</b> value will be a VT_BOOL value of True or False. If an option has several values, the retrieved <b>PROPVARIANT</b> value will be a collection type that holds the supported values.
     *       
     * 
     * If this method is called for the WPD_COMMAND_STORAGE_FORMAT command and the <i>ppOptions</i> parameter is set to WPD_OPTION_VALID_OBJECT_IDS, the driver will return an <a href="https://docs.microsoft.com/windows/desktop/wpd_sdk/iportabledevicepropvariantcollection">IPortableDevicePropVariant</a> collection of type VT_LPWSTR that specifies the identifiers for each object on the device that can be formatted. (If this option does not exist, the format command is available for all objects.)
     * @param {Pointer<PROPERTYKEY>} Command A <b>REFPROPERTYKEY</b> that specifies a command to query for supported options. For a list of the commands that are defined by Windows Portable Devices, see <a href="https://docs.microsoft.com/windows/desktop/wpd_sdk/commands">Commands</a>.
     * @returns {IPortableDeviceValues} Address of a variable that receives a pointer to an <a href="https://docs.microsoft.com/windows/desktop/wpd_sdk/iportabledevicevalues">IPortableDeviceValues</a> interface that contains the supported options. If no options are supported, this will not contain any values. The caller must release this interface when it is done with it. For more information, see Remarks.
     * @see https://learn.microsoft.com/windows/win32/api//content/portabledeviceapi/nf-portabledeviceapi-iportabledevicecapabilities-getcommandoptions
     */
    GetCommandOptions(Command) {
        result := ComCall(4, this, "ptr", Command, "ptr*", &ppOptions := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IPortableDeviceValues(ppOptions)
    }

    /**
     * The GetFunctionalCategories method retrieves all functional categories supported by the device.
     * @remarks
     * Functional categories describe the types of functions that a device can perform, such as image capture, audio capture, and storage. This method is typically very fast, because the driver usually queries the device only on startup and caches the results.
     * @returns {IPortableDevicePropVariantCollection} Address of a variable that receives a pointer to an <a href="https://docs.microsoft.com/windows/desktop/wpd_sdk/iportabledevicepropvariantcollection">IPortableDevicePropVariantCollection</a> interface that holds all the functional categories for this device. The values will be <b>GUID</b>s  of type VT_CLSID in the retrieved <b>PROPVARIANT</b> values. The caller must release this interface when it is done with it.
     * @see https://learn.microsoft.com/windows/win32/api//content/portabledeviceapi/nf-portabledeviceapi-iportabledevicecapabilities-getfunctionalcategories
     */
    GetFunctionalCategories() {
        result := ComCall(5, this, "ptr*", &ppCategories := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IPortableDevicePropVariantCollection(ppCategories)
    }

    /**
     * The GetFunctionalObjects method retrieves all functional objects that match a specified category on the device.
     * @remarks
     * This operation is usually fast, because the driver does not need to perform a full content enumeration, and the number of retrieved functional objects is typically less than 10. If no objects of the requested type are found, this method will not return an error, but returns an empty collection for <i>ppObjectIDs</i>.
     * @param {Pointer<Guid>} Category A <b>REFGUID</b> that specifies the category to search for. This can be WPD_FUNCTIONAL_CATEGORY_ALL to return all functional objects.
     * @returns {IPortableDevicePropVariantCollection} Address of a variable that receives a pointer to an <a href="https://docs.microsoft.com/windows/desktop/wpd_sdk/iportabledevicepropvariantcollection">IPortableDevicePropVariantCollection</a> interface that contains the object IDs of the functional objects as strings (type VT_LPWSTR in the retrieved <b>PROPVARIANT</b> items). If no objects of the requested type are found, this will be an empty collection (not <b>NULL</b>). The caller must release this interface when it is done with it.
     * @see https://learn.microsoft.com/windows/win32/api//content/portabledeviceapi/nf-portabledeviceapi-iportabledevicecapabilities-getfunctionalobjects
     */
    GetFunctionalObjects(Category) {
        result := ComCall(6, this, "ptr", Category, "ptr*", &ppObjectIDs := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IPortableDevicePropVariantCollection(ppObjectIDs)
    }

    /**
     * The GetSupportedContentTypes method retrieves all supported content types for a specified functional object type on a device.
     * @param {Pointer<Guid>} Category A <b>REFGUID</b> that specifies a functional object category. To get a list of functional categories on the device, call <a href="https://docs.microsoft.com/windows/desktop/api/portabledeviceapi/nf-portabledeviceapi-iportabledevicecapabilities-getfunctionalcategories">IPortableDeviceCapabilities::GetFunctionalCategories</a>.
     * @returns {IPortableDevicePropVariantCollection} Address of a variable that receives a pointer to an <a href="https://docs.microsoft.com/windows/desktop/wpd_sdk/iportabledevicepropvariantcollection">IPortableDevicePropVariantCollection</a> interface that lists all the supported object types for the specified functional object category. These object types will be <b>GUID</b> values of type VT_CLSID in the retrieved <b>PROPVARIANT</b> items. See <a href="https://docs.microsoft.com/windows/desktop/wpd_sdk/requirements-for-objects">Requirements for Objects</a> for a list of object types defined by Windows Portable Devices. The caller must release this interface when it is done with it.
     * @see https://learn.microsoft.com/windows/win32/api//content/portabledeviceapi/nf-portabledeviceapi-iportabledevicecapabilities-getsupportedcontenttypes
     */
    GetSupportedContentTypes(Category) {
        result := ComCall(7, this, "ptr", Category, "ptr*", &ppContentTypes := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IPortableDevicePropVariantCollection(ppContentTypes)
    }

    /**
     * The GetSupportedFormats method retrieves the supported formats for a specified object type on the device. For example, specifying audio objects might return WPD_OBJECT_FORMAT_WMA, WPD_OBJECT_FORMAT_WAV, and WPD_OBJECT_FORMAT_MP3.
     * @param {Pointer<Guid>} ContentType A <b>REFGUID</b> that specifies a content type, such as image, audio, or video. For a list of content types that are defined by Windows Portable Devices, see <a href="https://docs.microsoft.com/windows/desktop/wpd_sdk/requirements-for-objects">Requirements for Objects</a>.
     * @returns {IPortableDevicePropVariantCollection} Address of a variable that receives a pointer to an <a href="https://docs.microsoft.com/windows/desktop/wpd_sdk/iportabledevicepropvariantcollection">IPortableDevicePropVariantCollection</a> interface that lists the supported formats for the specified content type. These are GUID values (type VT_CLSID) in the retrieved collection items. For a list of formats that are supported by Windows Portable Devices, see <a href="https://docs.microsoft.com/windows/desktop/wpd_sdk/object-format-guids">Object Formats</a>. The caller must release this interface when it is done with it.
     * @see https://learn.microsoft.com/windows/win32/api//content/portabledeviceapi/nf-portabledeviceapi-iportabledevicecapabilities-getsupportedformats
     */
    GetSupportedFormats(ContentType) {
        result := ComCall(8, this, "ptr", ContentType, "ptr*", &ppFormats := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IPortableDevicePropVariantCollection(ppFormats)
    }

    /**
     * The GetSupportedFormatProperties method retrieves the properties supported by objects of a specified format on the device.
     * @remarks
     * You can specify <b>WPD_OBJECT_FORMAT_ALL</b> for the <i>Format</i> parameter to retrieve the complete set of property attributes.
     *       
     * 
     * If an object does not have a value assigned to a specific property, or if the property was deleted, a device might not report the property at all when enumerating its properties. Another device might report the property, but with an empty string or a value of zero. In order to avoid this inconsistency, you can call this method to learn all the properties you can set on a specific object.
     * @param {Pointer<Guid>} Format A <b>REFGUID</b> that specifies the format of the object. For a list of formats that are defined by Windows Portable Devices, see <a href="https://docs.microsoft.com/windows/desktop/wpd_sdk/object-format-guids">Object Formats</a>.
     * @returns {IPortableDeviceKeyCollection} Address of a variable that receives a pointer to an <a href="https://docs.microsoft.com/windows/desktop/wpd_sdk/iportabledevicekeycollection">IPortableDeviceKeyCollection</a> interface that contains the supported properties for the specified format. For a list of properties defined by Windows Portable Devices, see <a href="https://docs.microsoft.com/windows/desktop/wpd_sdk/properties-and-attributes">Properties and Attributes</a>. The caller must release this interface when it is done with it.
     * @see https://learn.microsoft.com/windows/win32/api//content/portabledeviceapi/nf-portabledeviceapi-iportabledevicecapabilities-getsupportedformatproperties
     */
    GetSupportedFormatProperties(Format) {
        result := ComCall(9, this, "ptr", Format, "ptr*", &ppKeys := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IPortableDeviceKeyCollection(ppKeys)
    }

    /**
     * The GetFixedPropertyAttributes method retrieves the standard property attributes for a specified property and format.
     * @remarks
     * You can specify <b>WPD_OBJECT_FORMAT_ALL</b> for the <i>Format</i> parameter to retrieve the complete set of property attributes.
     *       
     * 
     * Attributes describe properties. Example attributes are <b>WPD_PROPERTY_ATTRIBUTE_CAN_READ</b> and <b>WPD_PROPERTY_ATTRIBUTE_CAN_WRITE</b>. This method does not retrieve resource attributes.
     * @param {Pointer<Guid>} Format A <b>REFGUID</b> that specifies the format of the objects of interest. For format <b>GUID</b> values, see <a href="https://docs.microsoft.com/windows/desktop/wpd_sdk/object-format-guids">Object Formats</a>.
     * @param {Pointer<PROPERTYKEY>} Key A <b>REFPROPERTYKEY</b> that specifies the property that you want to know the attributes of. Properties defined by Windows Portable Devices are listed in <a href="https://docs.microsoft.com/windows/desktop/wpd_sdk/properties-and-attributes">Properties and Attributes</a>.
     * @returns {IPortableDeviceValues} Address of a variable that receives a pointer to an <a href="https://docs.microsoft.com/windows/desktop/wpd_sdk/iportabledevicevalues">IPortableDeviceValues</a> interface that holds the attributes and their values. The caller must release this interface when it is done with it.
     * @see https://learn.microsoft.com/windows/win32/api//content/portabledeviceapi/nf-portabledeviceapi-iportabledevicecapabilities-getfixedpropertyattributes
     */
    GetFixedPropertyAttributes(Format, Key) {
        result := ComCall(10, this, "ptr", Format, "ptr", Key, "ptr*", &ppAttributes := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IPortableDeviceValues(ppAttributes)
    }

    /**
     * The Cancel method cancels a pending request on this interface.
     * @remarks
     * This method cancels all pending operations on the current device handle, which corresponds to a session associated with an <a href="https://docs.microsoft.com/windows/desktop/api/portabledeviceapi/nn-portabledeviceapi-iportabledevice">IPortableDevice</a> interface. The Windows Portable Devices (WPD) API does not support targeted cancellation of specific operations.
     * @returns {HRESULT} The method returns an <b>HRESULT</b>. Possible values include, but are not limited to, those in the following table.
     *           
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The method succeeded.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api//content/portabledeviceapi/nf-portabledeviceapi-iportabledevicecapabilities-cancel
     */
    Cancel() {
        result := ComCall(11, this, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * The GetSupportedEvents method retrieves the supported events for this device.
     * @returns {IPortableDevicePropVariantCollection} Address of a variable that receives a pointer to an <a href="https://docs.microsoft.com/windows/desktop/wpd_sdk/iportabledevicepropvariantcollection">IPortableDevicePropVariantCollection</a> interface that lists the supported events. The caller must release this interface when it is done with it.
     * @see https://learn.microsoft.com/windows/win32/api//content/portabledeviceapi/nf-portabledeviceapi-iportabledevicecapabilities-getsupportedevents
     */
    GetSupportedEvents() {
        result := ComCall(12, this, "ptr*", &ppEvents := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IPortableDevicePropVariantCollection(ppEvents)
    }

    /**
     * The GetEventOptions method retrieves all the supported options for the specified event on the device.
     * @param {Pointer<Guid>} Event A <b>REFGUID</b> that specifies a event to query for supported options. For a list of the events that are defined by Windows Portable Devices, see <a href="https://docs.microsoft.com/windows/desktop/wpd_sdk/commands">Events</a>.
     * @returns {IPortableDeviceValues} Address of a variable that receives a pointer to an <a href="https://docs.microsoft.com/windows/desktop/wpd_sdk/iportabledevicevalues">IPortableDeviceValues</a> interface that contains the supported options. If no options are supported, this will not contain any values. The caller must release this interface when it is done with it.
     * @see https://learn.microsoft.com/windows/win32/api//content/portabledeviceapi/nf-portabledeviceapi-iportabledevicecapabilities-geteventoptions
     */
    GetEventOptions(Event) {
        result := ComCall(13, this, "ptr", Event, "ptr*", &ppOptions := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IPortableDeviceValues(ppOptions)
    }
}
