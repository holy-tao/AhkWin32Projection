#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IMDSPStorage3.ahk

/**
 * The IMDSPStorage4 interface extends IMDSPStorage3 for supporting virtual storages (such as playlists and albums) and metadata.Note  Unless the service provider has added the device parameter UseExtendedWmdm with a value of 1, Windows Media Device Manager will not call this interface. See Device Parameters for more information about this. .
 * @see https://docs.microsoft.com/windows/win32/api//mswmdm/nn-mswmdm-imdspstorage4
 * @namespace Windows.Win32.Media.DeviceManager
 * @version v4.0.30319
 */
class IMDSPStorage4 extends IMDSPStorage3{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMDSPStorage4
     * @type {Guid}
     */
    static IID => Guid("{3133b2c4-515c-481b-b1ce-39327ecb4f74}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 19

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["SetReferences", "GetReferences", "CreateStorageWithMetadata", "GetSpecifiedMetadata", "FindStorage", "GetParent"]

    /**
     * 
     * @param {Integer} dwRefs 
     * @param {Pointer<IMDSPStorage>} ppISPStorage 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mswmdm/nf-mswmdm-imdspstorage4-setreferences
     */
    SetReferences(dwRefs, ppISPStorage) {
        result := ComCall(19, this, "uint", dwRefs, "ptr*", ppISPStorage, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pdwRefs 
     * @param {Pointer<Pointer<IMDSPStorage>>} pppISPStorage 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mswmdm/nf-mswmdm-imdspstorage4-getreferences
     */
    GetReferences(pdwRefs, pppISPStorage) {
        pdwRefsMarshal := pdwRefs is VarRef ? "uint*" : "ptr"

        result := ComCall(20, this, pdwRefsMarshal, pdwRefs, "ptr*", pppISPStorage, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} dwAttributes 
     * @param {PWSTR} pwszName 
     * @param {IWMDMMetaData} pMetadata 
     * @param {Integer} qwFileSize 
     * @param {Pointer<IMDSPStorage>} ppNewStorage 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mswmdm/nf-mswmdm-imdspstorage4-createstoragewithmetadata
     */
    CreateStorageWithMetadata(dwAttributes, pwszName, pMetadata, qwFileSize, ppNewStorage) {
        pwszName := pwszName is String ? StrPtr(pwszName) : pwszName

        result := ComCall(21, this, "uint", dwAttributes, "ptr", pwszName, "ptr", pMetadata, "uint", qwFileSize, "ptr*", ppNewStorage, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} cProperties 
     * @param {Pointer<PWSTR>} ppwszPropNames 
     * @param {IWMDMMetaData} pMetadata 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mswmdm/nf-mswmdm-imdspstorage4-getspecifiedmetadata
     */
    GetSpecifiedMetadata(cProperties, ppwszPropNames, pMetadata) {
        result := ComCall(22, this, "uint", cProperties, "ptr", ppwszPropNames, "ptr", pMetadata, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} findScope 
     * @param {PWSTR} pwszUniqueID 
     * @param {Pointer<IMDSPStorage>} ppStorage 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mswmdm/nf-mswmdm-imdspstorage4-findstorage
     */
    FindStorage(findScope, pwszUniqueID, ppStorage) {
        pwszUniqueID := pwszUniqueID is String ? StrPtr(pwszUniqueID) : pwszUniqueID

        result := ComCall(23, this, "int", findScope, "ptr", pwszUniqueID, "ptr*", ppStorage, "HRESULT")
        return result
    }

    /**
     * Retrieves a handle to the specified window's parent or owner.
     * @param {Pointer<IMDSPStorage>} ppStorage 
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
