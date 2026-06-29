#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\IPortableDeviceKeyCollection.ahk" { IPortableDeviceKeyCollection }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import ".\IPortableDeviceValues.ahk" { IPortableDeviceValues }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\Foundation\PROPERTYKEY.ahk" { PROPERTYKEY }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * The IPortableDeviceProperties interface retrieves, adds, or deletes properties from an object on a device, or the device itself.
 * @see https://learn.microsoft.com/windows/win32/api/portabledeviceapi/nn-portabledeviceapi-iportabledeviceproperties
 * @namespace Windows.Win32.Devices.PortableDevices
 */
export default struct IPortableDeviceProperties extends IUnknown {
    /**
     * The interface identifier for IPortableDeviceProperties
     * @type {Guid}
     */
    static IID := Guid("{7f6d695c-03df-4439-a809-59266beee3a6}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IPortableDeviceProperties interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        GetSupportedProperties : IntPtr
        GetPropertyAttributes  : IntPtr
        GetValues              : IntPtr
        SetValues              : IntPtr
        Delete                 : IntPtr
        Cancel                 : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IPortableDeviceProperties.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * The GetSupportedProperties method retrieves a list of properties that a specified object supports. Note that not all of these properties may actually have values.
     * @remarks
     * To get the values of supported properties, call <b>GetPropertyAttributes</b>.
     * @param {PWSTR} pszObjectID Pointer to a null-terminated string that contains the object ID of the object to query. To specify the device, use <b>WPD_DEVICE_OBJECT_ID</b>.
     * @returns {IPortableDeviceKeyCollection} Address of a variable that receives a pointer to an <a href="https://docs.microsoft.com/windows/desktop/wpd_sdk/iportabledevicekeycollection">IPortableDeviceKeyCollection</a> interface that contains the supported properties. For a list of properties defined by Windows Portable Devices, see <a href="https://docs.microsoft.com/windows/desktop/wpd_sdk/properties-and-attributes">Properties and Attributes</a>. The caller must release this interface when it is done with it.
     * @see https://learn.microsoft.com/windows/win32/api/portabledeviceapi/nf-portabledeviceapi-iportabledeviceproperties-getsupportedproperties
     */
    GetSupportedProperties(pszObjectID) {
        pszObjectID := pszObjectID is String ? StrPtr(pszObjectID) : pszObjectID

        result := ComCall(3, this, "ptr", pszObjectID, "ptr*", &ppKeys := 0, "HRESULT")
        return IPortableDeviceKeyCollection(ppKeys)
    }

    /**
     * The GetPropertyAttributes method retrieves attributes of a specified object property on a device.
     * @remarks
     * Property attributes describe a property's access rights, valid values, and other information. For example, a property can have a WPD_PROPERTY_ATTRIBUTE_CAN_DELETE value set to False to prevent deletion, and have a range of valid values stored as individual entries.
     * @param {PWSTR} pszObjectID Pointer to a null-terminated string that contains the object ID of the object to query. To specify the device, use <b>WPD_DEVICE_OBJECT_ID</b>.
     * @param {Pointer<PROPERTYKEY>} Key A <b>REFPROPERTYKEY</b> that specifies the property to query for. You can retrieve a list of supported properties by calling <a href="https://docs.microsoft.com/windows/desktop/api/portabledeviceapi/nf-portabledeviceapi-iportabledeviceproperties-getsupportedproperties">GetSupportedProperties</a>. For a list of properties that are defined by Windows Portable Devices, see <a href="https://docs.microsoft.com/windows/desktop/wpd_sdk/properties-and-attributes">Properties and Attributes</a>.
     * @returns {IPortableDeviceValues} Address of a variable that receives a pointer to an <a href="https://docs.microsoft.com/windows/desktop/wpd_sdk/iportabledevicevalues">IPortableDeviceValues</a> interface that holds the retrieved property attributes. These are PROPERTYKEY/value pairs, where the <b>PROPERTYKEY</b> is the property, and the value data type depends on the specific property. The caller must release this interface when it is done with it. Attributes defined by Windows Portable Devices can be found on the <a href="https://docs.microsoft.com/windows/desktop/wpd_sdk/properties-and-attributes">Properties and Attributes</a> page.
     * @see https://learn.microsoft.com/windows/win32/api/portabledeviceapi/nf-portabledeviceapi-iportabledeviceproperties-getpropertyattributes
     */
    GetPropertyAttributes(pszObjectID, Key) {
        pszObjectID := pszObjectID is String ? StrPtr(pszObjectID) : pszObjectID

        result := ComCall(4, this, "ptr", pszObjectID, PROPERTYKEY.Ptr, Key, "ptr*", &ppAttributes := 0, "HRESULT")
        return IPortableDeviceValues(ppAttributes)
    }

    /**
     * The GetValues method retrieves a list of specified properties from a specified object on a device.
     * @param {PWSTR} pszObjectID Pointer to a null-terminated string that contains the ID of the object to query. To specify the device, use WPD_DEVICE_OBJECT_ID.
     * @param {IPortableDeviceKeyCollection} pKeys Pointer to an <a href="https://docs.microsoft.com/windows/desktop/wpd_sdk/iportabledevicekeycollection">IPortableDeviceKeyCollection</a> interface that contains one or more properties to query for. If this is <b>NULL</b>, all properties will be retrieved. See <a href="https://docs.microsoft.com/windows/desktop/wpd_sdk/properties-and-attributes">Properties and Attributes</a> for a list of properties that are defined by Windows Portable Devices.
     * @returns {IPortableDeviceValues} Address of a variable that receives a pointer to an <a href="https://docs.microsoft.com/windows/desktop/wpd_sdk/iportabledevicevalues">IPortableDeviceValues</a> interface that contains the requested property values. These will be returned as PROPERTYKEY/value pairs, where the data type of the value depends on the property. If a value could not be retrieved for some reason, the returned type will be VT_ERROR, and contain an HRESULT value describing the retrieval error. The caller must release this interface when it is done with it.
     * @see https://learn.microsoft.com/windows/win32/api/portabledeviceapi/nf-portabledeviceapi-iportabledeviceproperties-getvalues
     */
    GetValues(pszObjectID, pKeys) {
        pszObjectID := pszObjectID is String ? StrPtr(pszObjectID) : pszObjectID

        result := ComCall(5, this, "ptr", pszObjectID, "ptr", pKeys, "ptr*", &ppValues := 0, "HRESULT")
        return IPortableDeviceValues(ppValues)
    }

    /**
     * The SetValues method adds or modifies one or more properties on a specified object on a device.
     * @remarks
     * To delete a property, call <a href="https://docs.microsoft.com/windows/desktop/api/portabledeviceapi/nf-portabledeviceapi-iportabledeviceproperties-delete">IPortableDeviceProperties::Delete</a>. A property can be deleted only if its WPD_PROPERTY_ATTRIBUTE_CAN_WRITE attribute is True. This attribute can be retrieved by calling <a href="https://docs.microsoft.com/windows/desktop/api/portabledeviceapi/nf-portabledeviceapi-iportabledeviceproperties-getpropertyattributes">GetPropertyAttributes</a>.
     * @param {PWSTR} pszObjectID Pointer to a null-terminated string that contains the object ID of the object to modify. To specify the device, use WPD_DEVICE_OBJECT_ID.
     * @param {IPortableDeviceValues} pValues Pointer to an <a href="https://docs.microsoft.com/windows/desktop/wpd_sdk/iportabledevicevalues">IPortableDeviceValues</a> interface that contains one or more property/value pairs to set. Existing values will be overwritten.
     * @returns {IPortableDeviceValues} Address of a variable that receives a pointer to an <b>IPortableDeviceValues</b> interface that contains a collection of property/HRESULT values. Each value (type VT_ERROR) describes the success or failure of the property set attempt. The caller must release this interface when it is done with it.
     * @see https://learn.microsoft.com/windows/win32/api/portabledeviceapi/nf-portabledeviceapi-iportabledeviceproperties-setvalues
     */
    SetValues(pszObjectID, pValues) {
        pszObjectID := pszObjectID is String ? StrPtr(pszObjectID) : pszObjectID

        result := ComCall(6, this, "ptr", pszObjectID, "ptr", pValues, "ptr*", &ppResults := 0, "HRESULT")
        return IPortableDeviceValues(ppResults)
    }

    /**
     * The Delete method deletes specified properties from a specified object on a device.
     * @remarks
     * Properties can be deleted only if their WPD_PROPERTY_ATTRIBUTE_CAN_DELETE attribute is True. This attribute can be retrieved by calling <a href="https://docs.microsoft.com/windows/desktop/api/portabledeviceapi/nf-portabledeviceapi-iportabledeviceproperties-getpropertyattributes">GetPropertyAttributes</a>.
     * 
     * The driver has no way to indicate partial success; that is, if only some properties could be deleted, the driver will return <b>S_FALSE</b>, but this method does not indicate which properties were successfully deleted. The only way to learn which properties were deleted is to request all properties by calling <a href="https://docs.microsoft.com/windows/desktop/api/portabledeviceapi/nf-portabledeviceapi-iportabledeviceproperties-getvalues">IPortableDeviceProperties::GetValues</a>.
     * @param {PWSTR} pszObjectID Pointer to a null-terminated string that specifies the ID of the object whose properties you will delete. To specify the device, use <b>WPD_DEVICE_OBJECT_ID</b>.
     * @param {IPortableDeviceKeyCollection} pKeys Pointer to an <a href="https://docs.microsoft.com/windows/desktop/wpd_sdk/iportabledevicekeycollection">IPortableDeviceKeyCollection</a> interface that specifies which properties to delete. For a list of properties defined by Windows Portable Devices, see <a href="https://docs.microsoft.com/windows/desktop/wpd_sdk/properties-and-attributes">Properties and Attributes</a>.
     * @returns {HRESULT} The method returns an <b>HRESULT</b>. Possible values include, but are not limited to, those in the following table.
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
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_FALSE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * One or more property values could not be deleted.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_POINTER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The required pointer argument was <b>NULL</b>.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/portabledeviceapi/nf-portabledeviceapi-iportabledeviceproperties-delete
     */
    Delete(pszObjectID, pKeys) {
        pszObjectID := pszObjectID is String ? StrPtr(pszObjectID) : pszObjectID

        result := ComCall(7, this, "ptr", pszObjectID, "ptr", pKeys, "HRESULT")
        return result
    }

    /**
     * The Cancel method cancels a pending call.
     * @remarks
     * This method cancels all pending operations on the current device handle, which corresponds to a session associated with an <a href="https://docs.microsoft.com/windows/desktop/api/portabledeviceapi/nn-portabledeviceapi-iportabledevice">IPortableDevice</a> interface. The Windows Portable Devices (WPD) API does not support targeted cancellation of specific operations.
     * @returns {HRESULT} The method returns an <b>HRESULT</b>. Possible values include, but are not limited to, those in the following table.
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
     * @see https://learn.microsoft.com/windows/win32/api/portabledeviceapi/nf-portabledeviceapi-iportabledeviceproperties-cancel
     */
    Cancel() {
        result := ComCall(8, this, "HRESULT")
        return result
    }

    Query(iid) {
        if (IPortableDeviceProperties.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetSupportedProperties := CallbackCreate(GetMethod(implObj, "GetSupportedProperties"), flags, 3)
        this.vtbl.GetPropertyAttributes := CallbackCreate(GetMethod(implObj, "GetPropertyAttributes"), flags, 4)
        this.vtbl.GetValues := CallbackCreate(GetMethod(implObj, "GetValues"), flags, 4)
        this.vtbl.SetValues := CallbackCreate(GetMethod(implObj, "SetValues"), flags, 4)
        this.vtbl.Delete := CallbackCreate(GetMethod(implObj, "Delete"), flags, 3)
        this.vtbl.Cancel := CallbackCreate(GetMethod(implObj, "Cancel"), flags, 1)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetSupportedProperties)
        CallbackFree(this.vtbl.GetPropertyAttributes)
        CallbackFree(this.vtbl.GetValues)
        CallbackFree(this.vtbl.SetValues)
        CallbackFree(this.vtbl.Delete)
        CallbackFree(this.vtbl.Cancel)
    }
}
