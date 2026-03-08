#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IPortableDeviceKeyCollection.ahk
#Include .\IPortableDeviceValues.ahk
#Include ..\..\System\Com\IStream.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The IPortableDeviceResources interface provides access to an object's raw data. Use this interface to read or write resources in an object. To get this interface, call IPortableDeviceContent::Transfer.
 * @see https://learn.microsoft.com/windows/win32/api/portabledeviceapi/nn-portabledeviceapi-iportabledeviceresources
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
     * @remarks
     * The list of resources returned by this method includes all resources that the object <i>can</i> support. This does not mean that all the listed resources actually have data, but that the object is capable of supporting each listed resource.
     * @param {PWSTR} pszObjectID Pointer to a null-terminated string that contains the ID of the object.
     * @returns {IPortableDeviceKeyCollection} Address of a variable that receives a pointer to an <a href="https://docs.microsoft.com/windows/desktop/wpd_sdk/iportabledevicekeycollection">IPortableDeviceKeyCollection</a> interface that holds a collection of <b>PROPERTYKEY</b> values specifying resource types supported by this object type. If the object cannot hold resources, this will be an empty collection. The caller must release this interface when it is done with it.
     * @see https://learn.microsoft.com/windows/win32/api/portabledeviceapi/nf-portabledeviceapi-iportabledeviceresources-getsupportedresources
     */
    GetSupportedResources(pszObjectID) {
        pszObjectID := pszObjectID is String ? StrPtr(pszObjectID) : pszObjectID

        result := ComCall(3, this, "ptr", pszObjectID, "ptr*", &ppKeys := 0, "HRESULT")
        return IPortableDeviceKeyCollection(ppKeys)
    }

    /**
     * The GetResourceAttributes method retrieves all attributes from a specified resource in an object.
     * @remarks
     * Resource attributes describe the access rights, size, format, and other information related to a resource. For example, the attributes for an audio annotation resource on an image object may specify the bit rate, channel count, and data format of the audio.
     * @param {PWSTR} pszObjectID Pointer to a null-terminated string that contains the object ID of the object hosting the resource.
     * @param {Pointer<PROPERTYKEY>} Key A <b>REFPROPERTYKEY</b> that specifies which resource to query.
     * @returns {IPortableDeviceValues} Pointer to an <a href="https://docs.microsoft.com/windows/desktop/wpd_sdk/iportabledevicevalues">IPortableDeviceValues</a> interface pointer that holds <b>PROPERTYKEY</b>/<b>PROPVARIANT</b> pairs that describe each attribute and its value, respectively. The value types of the attribute values vary. If a property could not be returned, the value for the returned property will be <b>VT_ERROR</b>, and the <b>PROPVARIANT</b> <i>scode</i> member will contain the <b>HRESULT</b> of that particular failure.
     * @see https://learn.microsoft.com/windows/win32/api/portabledeviceapi/nf-portabledeviceapi-iportabledeviceresources-getresourceattributes
     */
    GetResourceAttributes(pszObjectID, Key) {
        pszObjectID := pszObjectID is String ? StrPtr(pszObjectID) : pszObjectID

        result := ComCall(4, this, "ptr", pszObjectID, "ptr", Key, "ptr*", &ppResourceAttributes := 0, "HRESULT")
        return IPortableDeviceValues(ppResourceAttributes)
    }

    /**
     * The GetStream method gets an IStream interface with which to read or write the content data in an object on a device. The retrieved interface enables you to read from or write to the object data.
     * @remarks
     * The retrieved stream cannot read the contents of a folder recursively. To copy all the resources in an object, specify <b>WPD_RESOURCE_DEFAULT</b> for <i>Key</i>.
     * 
     * If the object does not support resources, this method will return an error, and <i>ppStream</i> will be <b>NULL</b>.
     * 
     * Applications should use the buffer size returned by <i>pdwOptimalBufferSize</i> when allocating the buffer for read or write operations.
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
     * @see https://learn.microsoft.com/windows/win32/api/portabledeviceapi/nf-portabledeviceapi-iportabledeviceresources-getstream
     */
    GetStream(pszObjectID, Key, dwMode, pdwOptimalBufferSize) {
        pszObjectID := pszObjectID is String ? StrPtr(pszObjectID) : pszObjectID

        pdwOptimalBufferSizeMarshal := pdwOptimalBufferSize is VarRef ? "uint*" : "ptr"

        result := ComCall(5, this, "ptr", pszObjectID, "ptr", Key, "uint", dwMode, pdwOptimalBufferSizeMarshal, pdwOptimalBufferSize, "ptr*", &ppStream := 0, "HRESULT")
        return IStream(ppStream)
    }

    /**
     * The Delete method deletes one or more resources from the object identified by the pszObjectID parameter.
     * @remarks
     * An object can have several resources. For instance, an object may contain image data, thumbnail image data, and audio data.
     * 
     * An application can retrieve a list of supported resources by calling the <a href="https://docs.microsoft.com/windows/desktop/api/portabledeviceapi/nf-portabledeviceapi-iportabledeviceresources-getsupportedresources">GetSupportedResources</a> method.
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
     * @see https://learn.microsoft.com/windows/win32/api/portabledeviceapi/nf-portabledeviceapi-iportabledeviceresources-delete
     */
    Delete(pszObjectID, pKeys) {
        pszObjectID := pszObjectID is String ? StrPtr(pszObjectID) : pszObjectID

        result := ComCall(6, this, "ptr", pszObjectID, "ptr", pKeys, "HRESULT")
        return result
    }

    /**
     * The Cancel method cancels a pending operation. (IPortableDeviceResources.Cancel)
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
     * The method succeeded
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/portabledeviceapi/nf-portabledeviceapi-iportabledeviceresources-cancel
     */
    Cancel() {
        result := ComCall(7, this, "HRESULT")
        return result
    }

    /**
     * The CreateResource method creates a resource.
     * @remarks
     * When an application calls this method, it must specify the resource attributes and it must write the required data to the stream that this method returns.
     * 
     * A resource is not created when the method returns; it is created when the application commits the data by calling the <b>Commit</b> method on the stream at which <i>ppData</i> points.
     * 
     * To cancel the data transfer to a resource, the application must call the <b>Revert</b> method on the stream at which <i>ppData</i> points. Once the transfer is canceled, the application must invoke <b>IUnknown::Release</b> to close the stream.
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
     * @see https://learn.microsoft.com/windows/win32/api/portabledeviceapi/nf-portabledeviceapi-iportabledeviceresources-createresource
     */
    CreateResource(pResourceAttributes, pdwOptimalWriteBufferSize, ppszCookie) {
        pdwOptimalWriteBufferSizeMarshal := pdwOptimalWriteBufferSize is VarRef ? "uint*" : "ptr"
        ppszCookieMarshal := ppszCookie is VarRef ? "ptr*" : "ptr"

        result := ComCall(8, this, "ptr", pResourceAttributes, "ptr*", &ppData := 0, pdwOptimalWriteBufferSizeMarshal, pdwOptimalWriteBufferSize, ppszCookieMarshal, ppszCookie, "HRESULT")
        return IStream(ppData)
    }
}
