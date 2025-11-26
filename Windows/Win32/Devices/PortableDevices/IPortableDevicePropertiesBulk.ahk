#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The IPortableDevicePropertiesBulk interface queries or sets multiple properties on multiple objects on a device, asynchronously.
 * @see https://docs.microsoft.com/windows/win32/api//portabledeviceapi/nn-portabledeviceapi-iportabledevicepropertiesbulk
 * @namespace Windows.Win32.Devices.PortableDevices
 * @version v4.0.30319
 */
class IPortableDevicePropertiesBulk extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IPortableDevicePropertiesBulk
     * @type {Guid}
     */
    static IID => Guid("{482b05c0-4056-44ed-9e0f-5e23b009da93}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["QueueGetValuesByObjectList", "QueueGetValuesByObjectFormat", "QueueSetValuesByObjectList", "Start", "Cancel"]

    /**
     * The QueueGetValuesByObjectList method queues a request for one or more specified properties from one or more specified objects on the device.
     * @param {IPortableDevicePropVariantCollection} pObjectIDs Pointer to an <a href="https://docs.microsoft.com/windows/desktop/wpd_sdk/iportabledevicepropvariantcollection">IPortableDevicePropVariantCollection</a> interface that lists the object IDs of all the objects to query. These will be of type VT_LPWSTR.
     * @param {IPortableDeviceKeyCollection} pKeys Pointer to an <a href="https://docs.microsoft.com/windows/desktop/wpd_sdk/iportabledevicekeycollection">IPortableDeviceKeyCollection</a> interface that specifies the properties to request. For a list of properties defined by Windows Portable Devices, see <a href="https://docs.microsoft.com/windows/desktop/wpd_sdk/properties-and-attributes">Properties and Attributes</a>. Specify <b>NULL</b> to indicate all properties from the specified objects.
     * @param {IPortableDevicePropertiesBulkCallback} pCallback Pointer to an application-implemented <a href="https://docs.microsoft.com/windows/desktop/api/portabledeviceapi/nn-portabledeviceapi-iportabledevicepropertiesbulkcallback">IPortableDevicePropertiesBulkCallback</a> interface that will receive the information as it is retrieved.
     * @returns {Guid} Pointer to a GUID that is used to start, cancel, or identify the request <b>IPortableDevicePropertiesBulkCallback</b> callbacks, if implemented.
     * @see https://docs.microsoft.com/windows/win32/api//portabledeviceapi/nf-portabledeviceapi-iportabledevicepropertiesbulk-queuegetvaluesbyobjectlist
     */
    QueueGetValuesByObjectList(pObjectIDs, pKeys, pCallback) {
        pContext := Guid()
        result := ComCall(3, this, "ptr", pObjectIDs, "ptr", pKeys, "ptr", pCallback, "ptr", pContext, "HRESULT")
        return pContext
    }

    /**
     * The QueueGetValuesByObjectFormat interface queues a request for properties of objects of a specific format on a device.
     * @param {Pointer<Guid>} pguidObjectFormat Pointer to a <b>GUID</b> that specifies the object format. Only objects of this type are queried.
     * @param {PWSTR} pszParentObjectID Pointer to a null-terminated string that contains the object ID of the parent object where the search should begin. To search all the objects on a device, specify <b>WPD_DEVICE_OBJECT_ID</b>.
     * @param {Integer} dwDepth The maximum depth to search below the parent, where 1 means immediate children only. It is acceptable for this number to be greater than the actual number of levels. To search to any depth, specify 0xFFFFFFFF
     * @param {IPortableDeviceKeyCollection} pKeys Pointer to an <b>IPortableDeviceKeyCollection</b> interface that contains the properties to retrieve. For a list of properties that are defined by Windows Portable Devices, see <a href="https://docs.microsoft.com/windows/desktop/wpd_sdk/properties-and-attributes">Properties and Attributes</a>. Specify <b>NULL</b> to indicate all properties from the specified format.
     * @param {IPortableDevicePropertiesBulkCallback} pCallback Pointer to an application-implemented <a href="https://docs.microsoft.com/windows/desktop/api/portabledeviceapi/nn-portabledeviceapi-iportabledevicepropertiesbulkcallback">IPortableDevicePropertiesBulkCallback</a> interface that will receive the information as it is retrieved.
     * @returns {Guid} Pointer to a GUID that will be used to start, cancel, or identify the request in <b>IPortableDevicePropertiesBulkCallback</b> callbacks, if implemented.
     * @see https://docs.microsoft.com/windows/win32/api//portabledeviceapi/nf-portabledeviceapi-iportabledevicepropertiesbulk-queuegetvaluesbyobjectformat
     */
    QueueGetValuesByObjectFormat(pguidObjectFormat, pszParentObjectID, dwDepth, pKeys, pCallback) {
        pszParentObjectID := pszParentObjectID is String ? StrPtr(pszParentObjectID) : pszParentObjectID

        pContext := Guid()
        result := ComCall(4, this, "ptr", pguidObjectFormat, "ptr", pszParentObjectID, "uint", dwDepth, "ptr", pKeys, "ptr", pCallback, "ptr", pContext, "HRESULT")
        return pContext
    }

    /**
     * The QueueSetValuesByObjectList method queues a request to set one or more specified values on one or more specified objects on the device.
     * @param {IPortableDeviceValuesCollection} pObjectValues Pointer to an <a href="https://docs.microsoft.com/windows/desktop/wpd_sdk/iportabledevicevaluescollection">IPortableDeviceValuesCollection</a> interface that contains the properties and values to set on specified objects. This interface holds one or more <a href="https://docs.microsoft.com/windows/desktop/wpd_sdk/iportabledevicevalues">IPortableDeviceValues</a> interfaces, each representing a single object. Each <b>IPortableDeviceValues</b> interface holds a collection of key/value pairs, where the key is the <b>PROPERTYKEY</b> identifying the property, and the value is a data type that varies by property. Each <b>IPortableDeviceValues</b> interface also holds one WPD_OBJECT_ID property that identifies the object to which this interface refers.
     * @param {IPortableDevicePropertiesBulkCallback} pCallback Pointer to an application-implemented <a href="https://docs.microsoft.com/windows/desktop/api/portabledeviceapi/nn-portabledeviceapi-iportabledevicepropertiesbulkcallback">IPortableDevicePropertiesBulkCallback</a> interface that will receive the information as it is retrieved.
     * @returns {Guid} Pointer to a GUID that is used to start, cancel, or identify the request to any client-implemented <b>IPortableDevicePropertiesBulkCallback</b> callbacks.
     * @see https://docs.microsoft.com/windows/win32/api//portabledeviceapi/nf-portabledeviceapi-iportabledevicepropertiesbulk-queuesetvaluesbyobjectlist
     */
    QueueSetValuesByObjectList(pObjectValues, pCallback) {
        pContext := Guid()
        result := ComCall(5, this, "ptr", pObjectValues, "ptr", pCallback, "ptr", pContext, "HRESULT")
        return pContext
    }

    /**
     * The Start method starts a queued operation.
     * @param {Pointer<Guid>} pContext A pointer to a GUID that identifies the operation to start. This value is generated by a <b>Queue...</b> method of this interface.
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
     * <dt><b>HRESULT_FROM_WIN32(ERROR_NOT_FOUND)</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The GUID passed to <i>pContext</i> does not match a queued operation.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//portabledeviceapi/nf-portabledeviceapi-iportabledevicepropertiesbulk-start
     */
    Start(pContext) {
        result := ComCall(6, this, "ptr", pContext, "HRESULT")
        return result
    }

    /**
     * The Cancel method cancels a pending properties request.
     * @param {Pointer<Guid>} pContext Pointer to a context GUID that was retrieved when an asynchronous request was started by calling one of the <b>Queue...</b> methods.
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
     * @see https://docs.microsoft.com/windows/win32/api//portabledeviceapi/nf-portabledeviceapi-iportabledevicepropertiesbulk-cancel
     */
    Cancel(pContext) {
        result := ComCall(7, this, "ptr", pContext, "HRESULT")
        return result
    }
}
