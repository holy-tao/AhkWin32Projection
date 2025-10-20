#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
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
        result := ComCall(20, this, "uint*", pdwRefs, "ptr*", pppIWMDMStorage, "HRESULT")
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
        result := ComCall(21, this, "ptr", pIProgressCallback, "ptr*", ppRights, "uint*", pnRightsCount, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} cProperties 
     * @param {Pointer<PWSTR>} ppwszPropNames 
     * @param {Pointer<IWMDMMetaData>} ppMetadata 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mswmdm/nf-mswmdm-iwmdmstorage4-getspecifiedmetadata
     */
    GetSpecifiedMetadata(cProperties, ppwszPropNames, ppMetadata) {
        result := ComCall(22, this, "uint", cProperties, "ptr", ppwszPropNames, "ptr*", ppMetadata, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} findScope 
     * @param {PWSTR} pwszUniqueID 
     * @param {Pointer<IWMDMStorage>} ppStorage 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mswmdm/nf-mswmdm-iwmdmstorage4-findstorage
     */
    FindStorage(findScope, pwszUniqueID, ppStorage) {
        pwszUniqueID := pwszUniqueID is String ? StrPtr(pwszUniqueID) : pwszUniqueID

        result := ComCall(23, this, "int", findScope, "ptr", pwszUniqueID, "ptr*", ppStorage, "HRESULT")
        return result
    }

    /**
     * Retrieves a handle to the specified window's parent or owner.
     * @param {Pointer<IWMDMStorage>} ppStorage 
     * @returns {HRESULT} Type: <b>HWND</b>
     * 
     * If the window is a child window, the return value is a handle to the parent window. If the window is a top-level window with the <b>WS_POPUP</b> style, the return value is a handle to the owner window. 
     * 
     * If the function fails, the return value is <b>NULL</b>. To get extended error information, call <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * 
     * This function typically fails for one of the following reasons:
     * 
     * 
     * <ul>
     * <li>The window is a top-level window that is unowned or does not have the <b>WS_POPUP</b> style. </li>
     * <li>The owner window has <b>WS_POPUP</b> style.</li>
     * </ul>
     * @see https://docs.microsoft.com/windows/win32/api//winuser/nf-winuser-getparent
     */
    GetParent(ppStorage) {
        result := ComCall(24, this, "ptr*", ppStorage, "HRESULT")
        return result
    }
}
