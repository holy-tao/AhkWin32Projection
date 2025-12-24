#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IEnumPortableDeviceObjectIDs.ahk
#Include .\IPortableDeviceProperties.ahk
#Include .\IPortableDeviceResources.ahk
#Include ..\..\System\Com\IStream.ahk
#Include .\IPortableDevicePropVariantCollection.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The IPortableDeviceContent interface provides methods to create, enumerate, examine, and delete content on a device. To get this interface, call IPortableDevice::Content.
 * @see https://docs.microsoft.com/windows/win32/api//portabledeviceapi/nn-portabledeviceapi-iportabledevicecontent
 * @namespace Windows.Win32.Devices.PortableDevices
 * @version v4.0.30319
 */
class IPortableDeviceContent extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IPortableDeviceContent
     * @type {Guid}
     */
    static IID => Guid("{6a96ed84-7c73-4480-9938-bf5af477d426}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["EnumObjects", "Properties", "Transfer", "CreateObjectWithPropertiesOnly", "CreateObjectWithPropertiesAndData", "Delete", "GetObjectIDsFromPersistentUniqueIDs", "Cancel", "Move", "Copy"]

    /**
     * The EnumObjects method retrieves an interface that is used to enumerate the immediate child objects of an object. It has an optional filter that can enumerate objects with specific properties.
     * @param {Integer} dwFlags Currently ignored; specify zero.
     * @param {PWSTR} pszParentObjectID Pointer to a null-terminated string that specifies the ID of the parent. This can be an empty string (but not a <b>NULL</b> pointer) or the defined constant <b>WPD_DEVICE_OBJECT_ID</b> to indicate the device root.
     * @param {IPortableDeviceValues} pFilter This parameter is ignored and should be set to <b>NULL</b>.
     * @returns {IEnumPortableDeviceObjectIDs} Address of a variable that receives a pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/portabledeviceapi/nn-portabledeviceapi-ienumportabledeviceobjectids">IEnumPortableDeviceObjectIDs</a> interface that is used to enumerate the objects that are found. The caller must release this interface when it is done with it.
     * @see https://docs.microsoft.com/windows/win32/api//portabledeviceapi/nf-portabledeviceapi-iportabledevicecontent-enumobjects
     */
    EnumObjects(dwFlags, pszParentObjectID, pFilter) {
        pszParentObjectID := pszParentObjectID is String ? StrPtr(pszParentObjectID) : pszParentObjectID

        result := ComCall(3, this, "uint", dwFlags, "ptr", pszParentObjectID, "ptr", pFilter, "ptr*", &ppEnum := 0, "HRESULT")
        return IEnumPortableDeviceObjectIDs(ppEnum)
    }

    /**
     * The Properties method retrieves the interface that is required to get or set properties on an object on the device.
     * @returns {IPortableDeviceProperties} Address of a variable that receives a pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/portabledeviceapi/nn-portabledeviceapi-iportabledeviceproperties">IPortableDeviceProperties</a> interface that is used to get or set object properties. The caller must release this interface when it is done with it.
     * @see https://docs.microsoft.com/windows/win32/api//portabledeviceapi/nf-portabledeviceapi-iportabledevicecontent-properties
     */
    Properties() {
        result := ComCall(4, this, "ptr*", &ppProperties := 0, "HRESULT")
        return IPortableDeviceProperties(ppProperties)
    }

    /**
     * The Transfer method retrieves an interface that is used to read from or write to the content data of an existing object resource.
     * @returns {IPortableDeviceResources} Address of a variable that receives a pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/portabledeviceapi/nn-portabledeviceapi-iportabledeviceresources">IPortableDeviceResources</a> interface that is used to modify an object's resources. The caller must release this interface when it is done with it.
     * @see https://docs.microsoft.com/windows/win32/api//portabledeviceapi/nf-portabledeviceapi-iportabledevicecontent-transfer
     */
    Transfer() {
        result := ComCall(5, this, "ptr*", &ppResources := 0, "HRESULT")
        return IPortableDeviceResources(ppResources)
    }

    /**
     * The CreateObjectWithPropertiesOnly method creates an object with only properties on the device.
     * @param {IPortableDeviceValues} pValues An IPortableDeviceValues collection of properties to assign to the object. For a list of required and optional properties for an object, see <a href="https://docs.microsoft.com/windows/desktop/wpd_sdk/requirements-for-objects">Requirements for Objects</a>.
     * @param {Pointer<PWSTR>} ppszObjectID An optional string pointer to receive the name of the new object. Can be <b>NULL</b>, if not needed. Windows Portable Devices defines the constant WPD_DEVICE_OBJECT_ID to represent a device. The SDK allocates this memory; the caller must release it using <b>CoTaskMemFree</b>.
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
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_POINTER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * At least one of the required arguments was a <b>NULL</b> pointer.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//portabledeviceapi/nf-portabledeviceapi-iportabledevicecontent-createobjectwithpropertiesonly
     */
    CreateObjectWithPropertiesOnly(pValues, ppszObjectID) {
        ppszObjectIDMarshal := ppszObjectID is VarRef ? "ptr*" : "ptr"

        result := ComCall(6, this, "ptr", pValues, ppszObjectIDMarshal, ppszObjectID, "HRESULT")
        return result
    }

    /**
     * The CreateObjectWithPropertiesAndData method creates an object with both properties and data on the device.
     * @param {IPortableDeviceValues} pValues An <b>IPortableDeviceValues</b> collection of properties to assign to the object. For a list of required and optional properties for an object, see <a href="https://docs.microsoft.com/windows/desktop/wpd_sdk/requirements-for-objects">Requirements for Objects</a>.
     * @param {Pointer<Integer>} pdwOptimalWriteBufferSize An optional <b>DWORD</b> pointer that specifies the optimal buffer size for the application to use when writing the data to <i>ppData</i>. The application can specify <b>TRUE</b> to ignore this.
     * @param {Pointer<PWSTR>} ppszCookie An optional unique, null-terminated string ID that is used to identify this creation request in the application's implementation of <a href="https://docs.microsoft.com/windows/desktop/api/portabledeviceapi/nn-portabledeviceapi-iportabledeviceeventcallback">IPortableDeviceEventCallback</a> (if implemented). When the device finishes creating the object, it will send this identifier to the callback function. This identifier allows an application to monitor object creation in a different thread from the one that called <a href="https://docs.microsoft.com/windows/desktop/api/portabledeviceapi/nf-portabledeviceapi-iportabledevicecontent-createobjectwithpropertiesonly">CreateObjectWithPropertiesOnly</a>. The SDK allocates this memory, and the caller must release it using <b>CoTaskMemFree</b>.
     * @returns {IStream} Address of a variable that receives a pointer to an <b>IStream</b> interface that the application uses to send the object data to the device. The object will not be created on the device until the application sends the data by calling <i>ppData</i>-&gt;<b>Commit</b>. To abandon a data transfer in progress, you can call <i>ppData</i> -&gt; <b>Revert</b>. The caller must release this interface when it is done with it. The underlying object extends both <b>IStream</b> and <a href="https://docs.microsoft.com/windows/desktop/api/portabledeviceapi/nn-portabledeviceapi-iportabledevicedatastream">IPortableDeviceDataStream</a>.
     * @see https://docs.microsoft.com/windows/win32/api//portabledeviceapi/nf-portabledeviceapi-iportabledevicecontent-createobjectwithpropertiesanddata
     */
    CreateObjectWithPropertiesAndData(pValues, pdwOptimalWriteBufferSize, ppszCookie) {
        pdwOptimalWriteBufferSizeMarshal := pdwOptimalWriteBufferSize is VarRef ? "uint*" : "ptr"
        ppszCookieMarshal := ppszCookie is VarRef ? "ptr*" : "ptr"

        result := ComCall(7, this, "ptr", pValues, "ptr*", &ppData := 0, pdwOptimalWriteBufferSizeMarshal, pdwOptimalWriteBufferSize, ppszCookieMarshal, ppszCookie, "HRESULT")
        return IStream(ppData)
    }

    /**
     * The Delete method deletes one or more objects from the device.
     * @param {Integer} dwOptions One of the <a href="https://docs.microsoft.com/windows/desktop/wpd_sdk/delete-object-options">DELETE_OBJECT_OPTIONS</a> enumerators.
     * @param {IPortableDevicePropVariantCollection} pObjectIDs Pointer to an <a href="https://docs.microsoft.com/windows/desktop/wpd_sdk/iportabledevicepropvariantcollection">IPortableDevicePropVariantCollection</a> interface that holds one or more null-terminated strings (type VT_LPWSTR) specifying the object IDs of the objects to delete.
     * @param {Pointer<IPortableDevicePropVariantCollection>} ppResults Optional. On return, this parameter contains a collection of VT_ERROR values indicating the success or failure of the operation. The first element returned in <i>ppResults</i> corresponds to the first object in the <i>pObjectIDs</i> collection, the second element returned in <i>ppResults</i> corresponds to the second object in the <i>pObjectIDs</i> collection, and so on. This parameter can be <b>NULL</b> if the application is not concerned with the results.
     * @returns {HRESULT} The method returns an <b>HRESULT</b>. Possible values include, but are not limited to, those in the following table. If any error value is returned, no objects were deleted on the device.
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
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_FALSE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * At least one object could not be deleted. The <i>ppResults</i> parameter, if specified, contains the per-object error code.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_XXXXXXXX</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The driver did not delete any objects.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An invalid value was specified for <i>dwOptions</i>.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_ACCESSDENIED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The application does not have permission to delete the object.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>HRESULT_FROM_WIN32(ERROR_DIR_NOT_EMPTY)</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The specified folder or directory could not be deleted because it was not empty.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>HRESULT_FROM_WIN32(ERROR_INVALID_OPERATION)</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The application specified PORTABLE_DEVICE_DELETE_NO_RECURSION, and the object has children.
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
     * The object could not be deleted because it does not exist on the device.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//portabledeviceapi/nf-portabledeviceapi-iportabledevicecontent-delete
     */
    Delete(dwOptions, pObjectIDs, ppResults) {
        result := ComCall(8, this, "uint", dwOptions, "ptr", pObjectIDs, "ptr*", ppResults, "HRESULT")
        return result
    }

    /**
     * The GetObjectIDsFromPersistentUniqueIDs method retrieves the current object ID of one or more objects, given their persistent unique IDs (PUIDs).
     * @param {IPortableDevicePropVariantCollection} pPersistentUniqueIDs Pointer to an <a href="https://docs.microsoft.com/windows/desktop/wpd_sdk/iportabledevicepropvariantcollection">IPortableDevicePropVariantCollection</a> interface that contains one or more persistent unique ID (PUID) string values (type VT_LPWSTR).
     * @returns {IPortableDevicePropVariantCollection} Pointer to an <b>IPortableDevicePropVariantCollection</b> interface pointer that contains the retrieved object IDs, as type <b>VT_LPWSTR</b>. The retrieved IDs will be in the same order as the submitted PUIDs; if a value could not be found, it is indicated by an empty string. The caller must release this interface when it is done with it.
     * @see https://docs.microsoft.com/windows/win32/api//portabledeviceapi/nf-portabledeviceapi-iportabledevicecontent-getobjectidsfrompersistentuniqueids
     */
    GetObjectIDsFromPersistentUniqueIDs(pPersistentUniqueIDs) {
        result := ComCall(9, this, "ptr", pPersistentUniqueIDs, "ptr*", &ppObjectIDs := 0, "HRESULT")
        return IPortableDevicePropVariantCollection(ppObjectIDs)
    }

    /**
     * The Cancel method cancels a pending operation called on this interface.
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
     * @see https://docs.microsoft.com/windows/win32/api//portabledeviceapi/nf-portabledeviceapi-iportabledevicecontent-cancel
     */
    Cancel() {
        result := ComCall(10, this, "HRESULT")
        return result
    }

    /**
     * The Move method moves one or more objects from one location on the device to another.
     * @param {IPortableDevicePropVariantCollection} pObjectIDs Pointer to an <a href="https://docs.microsoft.com/windows/desktop/wpd_sdk/iportabledevicepropvariantcollection">IPortableDevicePropVariantCollection</a> interface that holds one or more null-terminated strings (type VT_LPWSTR) specifying the object IDs of the objects to be moved.
     * @param {PWSTR} pszDestinationFolderObjectID Pointer to a null-terminated string that specifies the ID of the destination.
     * @param {Pointer<IPortableDevicePropVariantCollection>} ppResults Optional. On return, this parameter contains a collection of VT_ERROR values indicating the success or failure of the operation. The first element returned in <i>ppResults</i> corresponds to the first object in the <i>pObjectIDs</i> collection, the second element returned in <i>ppResults</i> corresponds to the second object in the <i>pObjectIDs</i> collection, and so on. This parameter can be <b>NULL</b> if the application is not concerned with the results.
     * @returns {HRESULT} The method returns an <b>HRESULT</b>. Possible values include, but are not limited to, those in the following table. If any error value is returned, no objects were deleted on the device.
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
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_FALSE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * One or more objects were deleted, but at least one object could not be deleted. See <i>ppFailedObjectIDs</i> to learn which objects were not be deleted.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_ACCESSDENIED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The application does not have the rights to move the object.
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
     * At least one of the required arguments was a <b>NULL</b> pointer.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//portabledeviceapi/nf-portabledeviceapi-iportabledevicecontent-move
     */
    Move(pObjectIDs, pszDestinationFolderObjectID, ppResults) {
        pszDestinationFolderObjectID := pszDestinationFolderObjectID is String ? StrPtr(pszDestinationFolderObjectID) : pszDestinationFolderObjectID

        result := ComCall(11, this, "ptr", pObjectIDs, "ptr", pszDestinationFolderObjectID, "ptr*", ppResults, "HRESULT")
        return result
    }

    /**
     * The Copy method copies objects from one location on a device to another.
     * @param {IPortableDevicePropVariantCollection} pObjectIDs A collection of object identifiers for the objects that this method will copy.
     * @param {PWSTR} pszDestinationFolderObjectID An object identifier for the destination folder (or functional storage) into which this method will copy the specified objects.
     * @param {Pointer<IPortableDevicePropVariantCollection>} ppResults A collection of VT_ERROR values indicating the success or failure of copying a particular element. The first error value corresponds to the first object in the collection of object identifiers, the second to the second element, and so on. This argument can be <b>NULL</b>.
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
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_FALSE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The copy operation failed for at least one object.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_ACCESSDENIED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The application does not have the rights to copy one of the specified objects.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//portabledeviceapi/nf-portabledeviceapi-iportabledevicecontent-copy
     */
    Copy(pObjectIDs, pszDestinationFolderObjectID, ppResults) {
        pszDestinationFolderObjectID := pszDestinationFolderObjectID is String ? StrPtr(pszDestinationFolderObjectID) : pszDestinationFolderObjectID

        result := ComCall(12, this, "ptr", pObjectIDs, "ptr", pszDestinationFolderObjectID, "ptr*", ppResults, "HRESULT")
        return result
    }
}
