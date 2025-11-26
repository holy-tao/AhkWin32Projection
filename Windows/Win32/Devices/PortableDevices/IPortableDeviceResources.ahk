#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IPortableDeviceKeyCollection.ahk
#Include .\IPortableDeviceValues.ahk
#Include ..\..\System\Com\IStream.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The IPortableDeviceResources interface provides access to an object's raw data. Use this interface to read or write resources in an object. To get this interface, call IPortableDeviceContent::Transfer.
 * @see https://docs.microsoft.com/windows/win32/api//portabledeviceapi/nn-portabledeviceapi-iportabledeviceresources
 * @namespace Windows.Win32.Devices.PortableDevices
 * @version v4.0.30319
 */
class IPortableDeviceResources extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IPortableDeviceResources
     * @type {Guid}
     */
    static IID => Guid("{fd8878ac-d841-4d17-891c-e6829cdb6934}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetSupportedResources", "GetResourceAttributes", "GetStream", "Delete", "Cancel", "CreateResource"]

    /**
     * The GetSupportedResources method retrieves a list of resources that are supported by a specific object.
     * @param {PWSTR} pszObjectID Pointer to a null-terminated string that contains the ID of the object.
     * @returns {IPortableDeviceKeyCollection} Address of a variable that receives a pointer to an <a href="https://docs.microsoft.com/windows/desktop/wpd_sdk/iportabledevicekeycollection">IPortableDeviceKeyCollection</a> interface that holds a collection of <b>PROPERTYKEY</b> values specifying resource types supported by this object type. If the object cannot hold resources, this will be an empty collection. The caller must release this interface when it is done with it.
     * @see https://docs.microsoft.com/windows/win32/api//portabledeviceapi/nf-portabledeviceapi-iportabledeviceresources-getsupportedresources
     */
    GetSupportedResources(pszObjectID) {
        pszObjectID := pszObjectID is String ? StrPtr(pszObjectID) : pszObjectID

        result := ComCall(3, this, "ptr", pszObjectID, "ptr*", &ppKeys := 0, "HRESULT")
        return IPortableDeviceKeyCollection(ppKeys)
    }

    /**
     * The GetResourceAttributes method retrieves all attributes from a specified resource in an object.
     * @param {PWSTR} pszObjectID Pointer to a null-terminated string that contains the object ID of the object hosting the resource.
     * @param {Pointer<PROPERTYKEY>} Key A <b>REFPROPERTYKEY</b> that specifies which resource to query.
     * @returns {IPortableDeviceValues} Pointer to an <a href="https://docs.microsoft.com/windows/desktop/wpd_sdk/iportabledevicevalues">IPortableDeviceValues</a> interface pointer that holds <b>PROPERTYKEY</b>/<b>PROPVARIANT</b> pairs that describe each attribute and its value, respectively. The value types of the attribute values vary. If a property could not be returned, the value for the returned property will be <b>VT_ERROR</b>, and the <b>PROPVARIANT</b> <i>scode</i> member will contain the <b>HRESULT</b> of that particular failure.
     * @see https://docs.microsoft.com/windows/win32/api//portabledeviceapi/nf-portabledeviceapi-iportabledeviceresources-getresourceattributes
     */
    GetResourceAttributes(pszObjectID, Key) {
        pszObjectID := pszObjectID is String ? StrPtr(pszObjectID) : pszObjectID

        result := ComCall(4, this, "ptr", pszObjectID, "ptr", Key, "ptr*", &ppResourceAttributes := 0, "HRESULT")
        return IPortableDeviceValues(ppResourceAttributes)
    }

    /**
     * The GetStream method gets an IStream interface with which to read or write the content data in an object on a device. The retrieved interface enables you to read from or write to the object data.
     * @param {PWSTR} pszObjectID Pointer to a null-terminated string that contains the object ID of the object.
     * @param {Pointer<PROPERTYKEY>} Key A <b>REFPROPERTYKEY</b> that specifies which resource to read. You can retrieve the keys of all the object's resources by calling <a href="https://docs.microsoft.com/windows/desktop/api/portabledeviceapi/nf-portabledeviceapi-iportabledeviceresources-getsupportedresources">GetSupportedResources</a>.
     * @param {Integer} dwMode One of the following access modes:
     * 
     * <ul>
     * <li>STGM_READ (Read-only access.)</li>
     * <li>STGM_WRITE (Write-only access.)</li>
     * <li>STGM_READWRITE (Read/write access.)</li>
     * </ul>
     * @param {Pointer<Integer>} pdwOptimalBufferSize An optional pointer to a <b>DWORD</b> that specifies an estimate of the best buffer size to use when reading or writing data by using <i>ppStream</i>. A driver is required to support this value.
     * @returns {IStream} Pointer to an <b>IStream</b> interface pointer. This interface is used to read and write data to the object. The caller must release this interface when it is done with it.
     * @see https://docs.microsoft.com/windows/win32/api//portabledeviceapi/nf-portabledeviceapi-iportabledeviceresources-getstream
     */
    GetStream(pszObjectID, Key, dwMode, pdwOptimalBufferSize) {
        pszObjectID := pszObjectID is String ? StrPtr(pszObjectID) : pszObjectID

        pdwOptimalBufferSizeMarshal := pdwOptimalBufferSize is VarRef ? "uint*" : "ptr"

        result := ComCall(5, this, "ptr", pszObjectID, "ptr", Key, "uint", dwMode, pdwOptimalBufferSizeMarshal, pdwOptimalBufferSize, "ptr*", &ppStream := 0, "HRESULT")
        return IStream(ppStream)
    }

    /**
     * The Delete method deletes one or more resources from the object identified by the pszObjectID parameter.
     * @param {PWSTR} pszObjectID Pointer to a null-terminated string that contains the object ID of the object.
     * @param {IPortableDeviceKeyCollection} pKeys Pointer to an <a href="https://docs.microsoft.com/windows/desktop/wpd_sdk/iportabledevicekeycollection">IPortableDeviceKeyCollection</a> interface that lists which resources to delete. You can find out what resources the object has by calling <a href="https://docs.microsoft.com/windows/desktop/api/portabledeviceapi/nf-portabledeviceapi-iportabledeviceresources-getsupportedresources">GetSupportedResources</a>.
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
     * <dt><b>E_POINTER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * At least one of the arguments was a <b>NULL</b> pointer.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//portabledeviceapi/nf-portabledeviceapi-iportabledeviceresources-delete
     */
    Delete(pszObjectID, pKeys) {
        pszObjectID := pszObjectID is String ? StrPtr(pszObjectID) : pszObjectID

        result := ComCall(6, this, "ptr", pszObjectID, "ptr", pKeys, "HRESULT")
        return result
    }

    /**
     * The Cancel method cancels a pending operation.
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
     * The method succeeded
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//portabledeviceapi/nf-portabledeviceapi-iportabledeviceresources-cancel
     */
    Cancel() {
        result := ComCall(7, this, "HRESULT")
        return result
    }

    /**
     * The CreateResource method creates a resource.
     * @param {IPortableDeviceValues} pResourceAttributes Pointer to the following object parameter attributes.
     * 
     * <table>
     * <tr>
     * <th>Attribute</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td>WPD_OBJECT_NAME</td>
     * <td>The object name.</td>
     * </tr>
     * <tr>
     * <td>WPD_RESOURCE_ATTRIBUTE_TOTAL_SIZE</td>
     * <td>The total size of the resource data stream.</td>
     * </tr>
     * <tr>
     * <td>WPD_RESOURCE_ATTRIBUTE_FORMAT</td>
     * <td>The format of the resource data stream.</td>
     * </tr>
     * <tr>
     * <td>WPD_RESOURCE_ATTRIBUTE_RESOURCE_KEY</td>
     * <td>The resource key.</td>
     * </tr>
     * </table>
     * @param {Pointer<Integer>} pdwOptimalWriteBufferSize Pointer to a value that specifies the optimal buffer size when writing to the stream. This parameter is optional.
     * @param {Pointer<PWSTR>} ppszCookie Pointer to a cookie that identifies the resource creation request. This parameter is optional.
     * @returns {IStream} Pointer to a stream into which the caller can write resource data.
     * @see https://docs.microsoft.com/windows/win32/api//portabledeviceapi/nf-portabledeviceapi-iportabledeviceresources-createresource
     */
    CreateResource(pResourceAttributes, pdwOptimalWriteBufferSize, ppszCookie) {
        pdwOptimalWriteBufferSizeMarshal := pdwOptimalWriteBufferSize is VarRef ? "uint*" : "ptr"
        ppszCookieMarshal := ppszCookie is VarRef ? "ptr*" : "ptr"

        result := ComCall(8, this, "ptr", pResourceAttributes, "ptr*", &ppData := 0, pdwOptimalWriteBufferSizeMarshal, pdwOptimalWriteBufferSize, ppszCookieMarshal, ppszCookie, "HRESULT")
        return IStream(ppData)
    }
}
