#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IWMDMMetaData.ahk
#Include .\IWMDMStorage.ahk
#Include .\IWMDMStorage3.ahk

/**
 * The IWMDMStorage4 interface extends IWMDMStorage3 by providing methods for retrieving a subset of available metadata for a storage, and for setting and retrieving a list of references to other storages.
 * @see https://docs.microsoft.com/windows/win32/api//mswmdm/nn-mswmdm-iwmdmstorage4
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
     * @param {Integer} dwRefs Count of <a href="https://docs.microsoft.com/windows/desktop/api/mswmdm/nn-mswmdm-iwmdmstorage">IWMDMStorage</a> interface pointers in <i>ppIWMDMStorage</i>. Zero is an acceptable value and clears all references from the storage. The storage itself is not deleted in this case.
     * @param {Pointer<IWMDMStorage>} ppIWMDMStorage Pointer to an array of <b>IWMDMStorage</b> interface pointers to be referenced by the storage. This order is preserved by the storage. <b>NULL</b> is an acceptable value if <i>dwRefs</i> is also zero. The caller is responsible for allocating and releasing this array.
     * @returns {HRESULT} The method returns an <b>HRESULT</b>. All the interface methods in Windows Media Device Manager can return any of the following classes of error codes:
     * 
     * <ul>
     * <li>Standard COM error codes </li>
     * <li>Windows error codes converted to HRESULT values </li>
     * <li>Windows Media Device Manager error codes </li>
     * </ul>
     * For an extensive list of possible error codes, see <a href="/windows/desktop/WMDM/error-codes">Error Codes</a>.
     * @see https://docs.microsoft.com/windows/win32/api//mswmdm/nf-mswmdm-iwmdmstorage4-setreferences
     */
    SetReferences(dwRefs, ppIWMDMStorage) {
        result := ComCall(19, this, "uint", dwRefs, "ptr*", ppIWMDMStorage, "HRESULT")
        return result
    }

    /**
     * The GetReferences method retrieves an array of pointers to IWMDMStorage objects pointed to by this storage. An abstract album or playlist is typically stored as a collection of references on an MTP device.
     * @param {Pointer<Integer>} pdwRefs Pointer to the count of values retrieved by <i>pppIWMDMStorage</i>. If the object has no references, this will return zero, and the function will return S_OK.
     * @param {Pointer<Pointer<IWMDMStorage>>} pppIWMDMStorage Pointer to a pointer to the array of <a href="https://docs.microsoft.com/windows/desktop/api/mswmdm/nn-mswmdm-iwmdmstorage">IWMDMStorage</a> interface pointers that represent references in a storage. Such references can, for example, represent items in a playlist or album. The retrieved array is in the same order as they appear in the object itself. Memory for this array is allocated by Windows Media Device Manager. When the calling application has finished accessing this array, it must first call <b>Release</b> on all of the interface pointers, and then free the array memory using <b>CoTaskMemFree</b>.
     * @returns {HRESULT} The method returns an <b>HRESULT</b>. All the interface methods in Windows Media Device Manager can return any of the following classes of error codes:
     * 
     * <ul>
     * <li>Standard COM error codes </li>
     * <li>Windows error codes converted to HRESULT values </li>
     * <li>Windows Media Device Manager error codes </li>
     * </ul>
     * For an extensive list of possible error codes, see <a href="/windows/desktop/WMDM/error-codes">Error Codes</a>.
     * @see https://docs.microsoft.com/windows/win32/api//mswmdm/nf-mswmdm-iwmdmstorage4-getreferences
     */
    GetReferences(pdwRefs, pppIWMDMStorage) {
        pdwRefsMarshal := pdwRefs is VarRef ? "uint*" : "ptr"
        pppIWMDMStorageMarshal := pppIWMDMStorage is VarRef ? "ptr*" : "ptr"

        result := ComCall(20, this, pdwRefsMarshal, pdwRefs, pppIWMDMStorageMarshal, pppIWMDMStorage, "HRESULT")
        return result
    }

    /**
     * The GetRightsWithProgress method retrieves the rights information for the storage object, providing a callback mechanism for monitoring progress.
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
     * For an extensive list of possible error codes, see <a href="/windows/desktop/WMDM/error-codes">Error Codes</a>.
     * @see https://docs.microsoft.com/windows/win32/api//mswmdm/nf-mswmdm-iwmdmstorage4-getrightswithprogress
     */
    GetRightsWithProgress(pIProgressCallback, ppRights, pnRightsCount) {
        ppRightsMarshal := ppRights is VarRef ? "ptr*" : "ptr"
        pnRightsCountMarshal := pnRightsCount is VarRef ? "uint*" : "ptr"

        result := ComCall(21, this, "ptr", pIProgressCallback, ppRightsMarshal, ppRights, pnRightsCountMarshal, pnRightsCount, "HRESULT")
        return result
    }

    /**
     * The GetSpecifiedMetadata method retrieves one or more specific metadata properties from the storage.
     * @param {Integer} cProperties Count of properties to retrieve.
     * @param {Pointer<PWSTR>} ppwszPropNames Array of property names to retrieve. The length of this array should be equal to <i>cProperties</i>. The application should free this memory using <b>CoTaskMemFree</b>.
     * @returns {IWMDMMetaData} Pointer to the returned <a href="https://docs.microsoft.com/windows/desktop/api/mswmdm/nn-mswmdm-iwmdmmetadata">IWMDMMetaData</a> interface pointer, containing the retrieved values. The caller must release this interface when finished with it.
     * @see https://docs.microsoft.com/windows/win32/api//mswmdm/nf-mswmdm-iwmdmstorage4-getspecifiedmetadata
     */
    GetSpecifiedMetadata(cProperties, ppwszPropNames) {
        ppwszPropNamesMarshal := ppwszPropNames is VarRef ? "ptr*" : "ptr"

        result := ComCall(22, this, "uint", cProperties, ppwszPropNamesMarshal, ppwszPropNames, "ptr*", &ppMetadata := 0, "HRESULT")
        return IWMDMMetaData(ppMetadata)
    }

    /**
     * The FindStorage method retrieves a storage in the current root storage, based on its persistent unique identifier.
     * @param {Integer} findScope A <a href="https://docs.microsoft.com/windows/desktop/WMDM/wmdm-find-scope">WMDM_FIND_SCOPE</a> enumeration specifying the scope to search.
     * @param {PWSTR} pwszUniqueID Persistent unique identifier of the storage to be found. The persistent unique identifier of the storage is described by the <b>g_wszWMDMPersistentUniqueID</b> metadata property of the storage.
     * @returns {IWMDMStorage} Pointer to the retrieved storage, if found. The caller must release this interface when done with it.
     * @see https://docs.microsoft.com/windows/win32/api//mswmdm/nf-mswmdm-iwmdmstorage4-findstorage
     */
    FindStorage(findScope, pwszUniqueID) {
        pwszUniqueID := pwszUniqueID is String ? StrPtr(pwszUniqueID) : pwszUniqueID

        result := ComCall(23, this, "int", findScope, "ptr", pwszUniqueID, "ptr*", &ppStorage := 0, "HRESULT")
        return IWMDMStorage(ppStorage)
    }

    /**
     * The GetParent method retrieves the parent of the storage.
     * @returns {IWMDMStorage} Pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/mswmdm/nn-mswmdm-iwmdmstorage">IWMDMStorage</a> interface of the parent storage. The caller must release this interface when finished with it.
     * @see https://docs.microsoft.com/windows/win32/api//mswmdm/nf-mswmdm-iwmdmstorage4-getparent
     */
    GetParent() {
        result := ComCall(24, this, "ptr*", &ppStorage := 0, "HRESULT")
        return IWMDMStorage(ppStorage)
    }
}
