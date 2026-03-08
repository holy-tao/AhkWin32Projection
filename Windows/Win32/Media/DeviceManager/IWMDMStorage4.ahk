#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IWMDMMetaData.ahk
#Include .\IWMDMStorage.ahk
#Include .\IWMDMStorage3.ahk

/**
 * The IWMDMStorage4 interface extends IWMDMStorage3 by providing methods for retrieving a subset of available metadata for a storage, and for setting and retrieving a list of references to other storages.
 * @see https://learn.microsoft.com/windows/win32/api/mswmdm/nn-mswmdm-iwmdmstorage4
 * @namespace Windows.Win32.Media.DeviceManager
 * @version v4.0.30319
 */
class IWMDMStorage4 extends IWMDMStorage3{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IWMDMStorage4
     * @type {Guid}
     */
    static IID => Guid("{c225bac5-a03a-40b8-9a23-91cf478c64a6}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 19

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["SetReferences", "GetReferences", "GetRightsWithProgress", "GetSpecifiedMetadata", "FindStorage", "GetParent"]

    /**
     * The SetReferences method sets the references contained in a storage that has references (such as a playlist or album), overwriting any previously existing references held by the storage.
     * @remarks
     * This method is used to set references in objects that are composed of references, such as playlists or albums. If a device does not support metadata, this method will probably not be supported.
     * 
     * Any valid <b>IWMDMStorage</b> object can be contained in the <i>ppIWMDMStorage</i> array. This includes folders and other storages specifying references themselves (creating, for example, a playlist of playlists). The device itself determines how any particular case of referent object is handled. Windows Media Device Manager does not enforce any rules beyond that of <b>IWMDMStorage</b> validity. Consider the case of a playlist containing nested playlist references. On one device, this is disallowed and <b>SetReferences</b> fails. On another device, this is allowed; playback simply traverses the entire set of contained references in depth-first order.
     * 
     * The situation may arise where an <b>IWMDMStorage4</b> interface pointer corresponds to a storage that no longer exists on the device. WMDM_E_INTERFACEDEAD is returned in this case.
     * @param {Integer} dwRefs Count of <a href="https://docs.microsoft.com/windows/desktop/api/mswmdm/nn-mswmdm-iwmdmstorage">IWMDMStorage</a> interface pointers in <i>ppIWMDMStorage</i>. Zero is an acceptable value and clears all references from the storage. The storage itself is not deleted in this case.
     * @param {Pointer<IWMDMStorage>} ppIWMDMStorage Pointer to an array of <b>IWMDMStorage</b> interface pointers to be referenced by the storage. This order is preserved by the storage. <b>NULL</b> is an acceptable value if <i>dwRefs</i> is also zero. The caller is responsible for allocating and releasing this array.
     * @returns {HRESULT} The method returns an <b>HRESULT</b>. All the interface methods in Windows Media Device Manager can return any of the following classes of error codes:
     * 
     * <ul>
     * <li>Standard COM error codes </li>
     * <li>Windows error codes converted to HRESULT values </li>
     * <li>Windows Media Device Manager error codes </li>
     * </ul>
     * For an extensive list of possible error codes, see <a href="https://docs.microsoft.com/windows/desktop/WMDM/error-codes">Error Codes</a>.
     * @see https://learn.microsoft.com/windows/win32/api/mswmdm/nf-mswmdm-iwmdmstorage4-setreferences
     */
    SetReferences(dwRefs, ppIWMDMStorage) {
        result := ComCall(19, this, "uint", dwRefs, "ptr*", ppIWMDMStorage, "HRESULT")
        return result
    }

    /**
     * The GetReferences method retrieves an array of pointers to IWMDMStorage objects pointed to by this storage. An abstract album or playlist is typically stored as a collection of references on an MTP device.
     * @remarks
     * Windows Media Device Manager delegates to the underlying service provider the task of adding and removing the references on a storage. Objects with references refers to abstract objects such as abstract playlists or albums; folders are not considered as having references.
     * 
     * There are two types of asynchronous deletions that can occur and cause errors in this method. If a <i>reference</i> to a storage has been deleted since the application retrieved it, and the application tries to use the reference, the method call will return WMDM_E_INTERFACEDEAD. If the file the reference refers to has been deleted, S_FALSE is returned.
     * @param {Pointer<Integer>} pdwRefs Pointer to the count of values retrieved by <i>pppIWMDMStorage</i>. If the object has no references, this will return zero, and the function will return S_OK.
     * @param {Pointer<Pointer<IWMDMStorage>>} pppIWMDMStorage Pointer to a pointer to the array of <a href="https://docs.microsoft.com/windows/desktop/api/mswmdm/nn-mswmdm-iwmdmstorage">IWMDMStorage</a> interface pointers that represent references in a storage. Such references can, for example, represent items in a playlist or album. The retrieved array is in the same order as they appear in the object itself. Memory for this array is allocated by Windows Media Device Manager. When the calling application has finished accessing this array, it must first call <b>Release</b> on all of the interface pointers, and then free the array memory using <b>CoTaskMemFree</b>.
     * @returns {HRESULT} The method returns an <b>HRESULT</b>. All the interface methods in Windows Media Device Manager can return any of the following classes of error codes:
     * 
     * <ul>
     * <li>Standard COM error codes </li>
     * <li>Windows error codes converted to HRESULT values </li>
     * <li>Windows Media Device Manager error codes </li>
     * </ul>
     * For an extensive list of possible error codes, see <a href="https://docs.microsoft.com/windows/desktop/WMDM/error-codes">Error Codes</a>.
     * @see https://learn.microsoft.com/windows/win32/api/mswmdm/nf-mswmdm-iwmdmstorage4-getreferences
     */
    GetReferences(pdwRefs, pppIWMDMStorage) {
        pdwRefsMarshal := pdwRefs is VarRef ? "uint*" : "ptr"
        pppIWMDMStorageMarshal := pppIWMDMStorage is VarRef ? "ptr*" : "ptr"

        result := ComCall(20, this, pdwRefsMarshal, pdwRefs, pppIWMDMStorageMarshal, pppIWMDMStorage, "HRESULT")
        return result
    }

    /**
     * The GetRightsWithProgress method retrieves the rights information for the storage object, providing a callback mechanism for monitoring progress.
     * @remarks
     * Object rights describe the usage permissions for digital media content. For example, the <b>WMDMRIGHTS</b> structure can contain information concerning how many times a file can be played and who can play it.
     * 
     * Retrieving rights from a licensed file can sometimes be a lengthy request; this function allows a rights request to be performed asynchronously.
     * 
     * The secure content provider can generate event notifications on the callback <i>pIProgressCallback</i> in addition to the progress notifications. Examples of such events include acquiring a secure clock, initializing DRM, and so on. These events are described in <a href="https://docs.microsoft.com/windows/desktop/api/mswmdm/nf-mswmdm-iwmdmprogress3-progress3">IWMDMProgress3::Progress3</a>.
     * 
     * This method is identical to <a href="https://docs.microsoft.com/windows/desktop/api/mswmdm/nf-mswmdm-iwmdmstorage-getrights">IWMDMStorage::GetRights</a>, except it returns progress, and does not provide a MAC for parameter verification.
     * @param {IWMDMProgress3} pIProgressCallback Optional pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/mswmdm/nn-mswmdm-iwmdmprogress3">IWMDMProgress3</a> interface to be used by Windows Media Device Manager to report progress back to the application.
     * @param {Pointer<Pointer<WMDMRIGHTS>>} ppRights Pointer to an array of <a href="https://docs.microsoft.com/windows/desktop/WMDM/wmdmrights">WMDMRIGHTS</a> structures that contain the storage object rights information. Memory for this array is allocated by Windows Media Device Manager. When the calling application has finished accessing this array, the memory must be freed by using <b>CoTaskMemFree</b>.
     * @param {Pointer<Integer>} pnRightsCount Pointer to the number of <b>WMDMRIGHTS</b> structures in the <i>ppRights</i> array.
     * @returns {HRESULT} The method returns an <b>HRESULT</b>. All the interface methods in Windows Media Device Manager can return any of the following classes of error codes:
     * 
     * <ul>
     * <li>Standard COM error codes </li>
     * <li>Windows error codes converted to HRESULT values </li>
     * <li>Windows Media Device Manager error codes </li>
     * </ul>
     * For an extensive list of possible error codes, see <a href="https://docs.microsoft.com/windows/desktop/WMDM/error-codes">Error Codes</a>.
     * @see https://learn.microsoft.com/windows/win32/api/mswmdm/nf-mswmdm-iwmdmstorage4-getrightswithprogress
     */
    GetRightsWithProgress(pIProgressCallback, ppRights, pnRightsCount) {
        ppRightsMarshal := ppRights is VarRef ? "ptr*" : "ptr"
        pnRightsCountMarshal := pnRightsCount is VarRef ? "uint*" : "ptr"

        result := ComCall(21, this, "ptr", pIProgressCallback, ppRightsMarshal, ppRights, pnRightsCountMarshal, pnRightsCount, "HRESULT")
        return result
    }

    /**
     * The GetSpecifiedMetadata method retrieves one or more specific metadata properties from the storage.
     * @remarks
     * This method gives the client control over which properties are retrieved. This can be more efficient than <a href="https://docs.microsoft.com/windows/desktop/api/mswmdm/nf-mswmdm-iwmdmstorage3-getmetadata">IWMDMStorage3::GetMetadata</a>, and is recommended when the client needs only a subset of properties supported by the storage.
     * 
     * If this method is used to retrieve data from a Windows Portable Devices (WPD) device, the data is returned in binary form in an <b>IPortableDeviceValues</b> object. The application should de-serialize this data in order to obtain the actual property values.
     * 
     * The method succeeds and returns WMDM_S_NOT_ALL_PROPERTIES_RETRIEVED even if some of the specified properties could not be retrieved (but at least one property was retrieved). The method fails and returns WMDM_E_NOTSUPPORTED if none of the specified properties could be retrieved.
     * 
     * Requesting a single property is a special case of this method. If the client requests a single property, the possible return codes are S_OK, E_INVALIDARG, and WMDM_E_NOTSUPPORTED. Thus, in the case of a single property, the method succeeds only if the property is successfully retrieved.
     * @param {Integer} cProperties Count of properties to retrieve.
     * @param {Pointer<PWSTR>} ppwszPropNames Array of property names to retrieve. The length of this array should be equal to <i>cProperties</i>. The application should free this memory using <b>CoTaskMemFree</b>.
     * @returns {IWMDMMetaData} Pointer to the returned <a href="https://docs.microsoft.com/windows/desktop/api/mswmdm/nn-mswmdm-iwmdmmetadata">IWMDMMetaData</a> interface pointer, containing the retrieved values. The caller must release this interface when finished with it.
     * @see https://learn.microsoft.com/windows/win32/api/mswmdm/nf-mswmdm-iwmdmstorage4-getspecifiedmetadata
     */
    GetSpecifiedMetadata(cProperties, ppwszPropNames) {
        ppwszPropNamesMarshal := ppwszPropNames is VarRef ? "ptr*" : "ptr"

        result := ComCall(22, this, "uint", cProperties, ppwszPropNamesMarshal, ppwszPropNames, "ptr*", &ppMetadata := 0, "HRESULT")
        return IWMDMMetaData(ppMetadata)
    }

    /**
     * The FindStorage method retrieves a storage in the current root storage, based on its persistent unique identifier.
     * @remarks
     * This method only searches a single memory object (flash card or hard disc) on the device.
     * 
     * A persistent unique identifier identifies content stored on a particular device. It does not represent a content-specific globally unique identifier that remains identical across all devices. Thus, the same content stored in different storages will have different persistent unique identifiers. Similarly, different content may have the same persistent unique identifier when stored on different devices.
     * 
     * The format of the persistent unique identifier depends on the device. The application must have obtained the persistent unique identifier previously by obtaining a storage and querying it for its <b>WMDM/PersistentUniqueID</b> property. Use the <a href="https://docs.microsoft.com/windows/desktop/api/mswmdm/nf-mswmdm-iwmdmstorage4-getspecifiedmetadata">GetSpecifiedMetadata</a> or <a href="https://docs.microsoft.com/windows/desktop/api/mswmdm/nf-mswmdm-iwmdmstorage3-getmetadata">GetMetadata</a> methods to request this property.
     * @param {Integer} findScope A <a href="https://docs.microsoft.com/windows/desktop/WMDM/wmdm-find-scope">WMDM_FIND_SCOPE</a> enumeration specifying the scope to search.
     * @param {PWSTR} pwszUniqueID Persistent unique identifier of the storage to be found. The persistent unique identifier of the storage is described by the <b>g_wszWMDMPersistentUniqueID</b> metadata property of the storage.
     * @returns {IWMDMStorage} Pointer to the retrieved storage, if found. The caller must release this interface when done with it.
     * @see https://learn.microsoft.com/windows/win32/api/mswmdm/nf-mswmdm-iwmdmstorage4-findstorage
     */
    FindStorage(findScope, pwszUniqueID) {
        pwszUniqueID := pwszUniqueID is String ? StrPtr(pwszUniqueID) : pwszUniqueID

        result := ComCall(23, this, "int", findScope, "ptr", pwszUniqueID, "ptr*", &ppStorage := 0, "HRESULT")
        return IWMDMStorage(ppStorage)
    }

    /**
     * The GetParent method retrieves the parent of the storage.
     * @remarks
     * The application can navigate up the storage hierarchy by calling <b>GetParent</b> recursively. After the root storage is reached, <b>GetParent</b> returns S_FALSE and sets <i>ppStorage</i> to <b>NULL</b>.
     * @returns {IWMDMStorage} Pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/mswmdm/nn-mswmdm-iwmdmstorage">IWMDMStorage</a> interface of the parent storage. The caller must release this interface when finished with it.
     * @see https://learn.microsoft.com/windows/win32/api/mswmdm/nf-mswmdm-iwmdmstorage4-getparent
     */
    GetParent() {
        result := ComCall(24, this, "ptr*", &ppStorage := 0, "HRESULT")
        return IWMDMStorage(ppStorage)
    }
}
