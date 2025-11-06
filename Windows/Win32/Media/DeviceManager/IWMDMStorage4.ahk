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
     * 
     * @param {Integer} dwRefs 
     * @param {Pointer<IWMDMStorage>} ppIWMDMStorage 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mswmdm/nf-mswmdm-iwmdmstorage4-setreferences
     */
    SetReferences(dwRefs, ppIWMDMStorage) {
        result := ComCall(19, this, "uint", dwRefs, "ptr*", ppIWMDMStorage, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pdwRefs 
     * @param {Pointer<Pointer<IWMDMStorage>>} pppIWMDMStorage 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mswmdm/nf-mswmdm-iwmdmstorage4-getreferences
     */
    GetReferences(pdwRefs, pppIWMDMStorage) {
        pdwRefsMarshal := pdwRefs is VarRef ? "uint*" : "ptr"
        pppIWMDMStorageMarshal := pppIWMDMStorage is VarRef ? "ptr*" : "ptr"

        result := ComCall(20, this, pdwRefsMarshal, pdwRefs, pppIWMDMStorageMarshal, pppIWMDMStorage, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IWMDMProgress3} pIProgressCallback 
     * @param {Pointer<Pointer<WMDMRIGHTS>>} ppRights 
     * @param {Pointer<Integer>} pnRightsCount 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mswmdm/nf-mswmdm-iwmdmstorage4-getrightswithprogress
     */
    GetRightsWithProgress(pIProgressCallback, ppRights, pnRightsCount) {
        ppRightsMarshal := ppRights is VarRef ? "ptr*" : "ptr"
        pnRightsCountMarshal := pnRightsCount is VarRef ? "uint*" : "ptr"

        result := ComCall(21, this, "ptr", pIProgressCallback, ppRightsMarshal, ppRights, pnRightsCountMarshal, pnRightsCount, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} cProperties 
     * @param {Pointer<PWSTR>} ppwszPropNames 
     * @returns {IWMDMMetaData} 
     * @see https://learn.microsoft.com/windows/win32/api/mswmdm/nf-mswmdm-iwmdmstorage4-getspecifiedmetadata
     */
    GetSpecifiedMetadata(cProperties, ppwszPropNames) {
        ppwszPropNamesMarshal := ppwszPropNames is VarRef ? "ptr*" : "ptr"

        result := ComCall(22, this, "uint", cProperties, ppwszPropNamesMarshal, ppwszPropNames, "ptr*", &ppMetadata := 0, "HRESULT")
        return IWMDMMetaData(ppMetadata)
    }

    /**
     * 
     * @param {Integer} findScope 
     * @param {PWSTR} pwszUniqueID 
     * @returns {IWMDMStorage} 
     * @see https://learn.microsoft.com/windows/win32/api/mswmdm/nf-mswmdm-iwmdmstorage4-findstorage
     */
    FindStorage(findScope, pwszUniqueID) {
        pwszUniqueID := pwszUniqueID is String ? StrPtr(pwszUniqueID) : pwszUniqueID

        result := ComCall(23, this, "int", findScope, "ptr", pwszUniqueID, "ptr*", &ppStorage := 0, "HRESULT")
        return IWMDMStorage(ppStorage)
    }

    /**
     * Retrieves a handle to the specified window's parent or owner.
     * @returns {IWMDMStorage} 
     * @see https://docs.microsoft.com/windows/win32/api//winuser/nf-winuser-getparent
     */
    GetParent() {
        result := ComCall(24, this, "ptr*", &ppStorage := 0, "HRESULT")
        return IWMDMStorage(ppStorage)
    }
}
