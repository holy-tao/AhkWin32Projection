#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Exposes methods that create, enumerate or manage existing known folders.
 * @see https://docs.microsoft.com/windows/win32/api//shobjidl_core/nn-shobjidl_core-iknownfoldermanager
 * @namespace Windows.Win32.UI.Shell
 * @version v4.0.30319
 */
class IKnownFolderManager extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IKnownFolderManager
     * @type {Guid}
     */
    static IID => Guid("{8be2d872-86aa-4d47-b776-32cca40c7018}")

    /**
     * The class identifier for KnownFolderManager
     * @type {Guid}
     */
    static CLSID => Guid("{4df0c730-df9d-4ae3-9153-aa6b82e9795a}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["FolderIdFromCsidl", "FolderIdToCsidl", "GetFolderIds", "GetFolder", "GetFolderByName", "RegisterFolder", "UnregisterFolder", "FindFolderFromPath", "FindFolderFromIDList", "Redirect"]

    /**
     * 
     * @param {Integer} nCsidl 
     * @param {Pointer<Guid>} pfid 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-iknownfoldermanager-folderidfromcsidl
     */
    FolderIdFromCsidl(nCsidl, pfid) {
        result := ComCall(3, this, "int", nCsidl, "ptr", pfid, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} rfid 
     * @param {Pointer<Integer>} pnCsidl 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-iknownfoldermanager-folderidtocsidl
     */
    FolderIdToCsidl(rfid, pnCsidl) {
        pnCsidlMarshal := pnCsidl is VarRef ? "int*" : "ptr"

        result := ComCall(4, this, "ptr", rfid, pnCsidlMarshal, pnCsidl, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Pointer<Guid>>} ppKFId 
     * @param {Pointer<Integer>} pCount 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-iknownfoldermanager-getfolderids
     */
    GetFolderIds(ppKFId, pCount) {
        pCountMarshal := pCount is VarRef ? "uint*" : "ptr"

        result := ComCall(5, this, "ptr*", ppKFId, pCountMarshal, pCount, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} rfid 
     * @param {Pointer<IKnownFolder>} ppkf 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-iknownfoldermanager-getfolder
     */
    GetFolder(rfid, ppkf) {
        result := ComCall(6, this, "ptr", rfid, "ptr*", ppkf, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} pszCanonicalName 
     * @param {Pointer<IKnownFolder>} ppkf 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-iknownfoldermanager-getfolderbyname
     */
    GetFolderByName(pszCanonicalName, ppkf) {
        pszCanonicalName := pszCanonicalName is String ? StrPtr(pszCanonicalName) : pszCanonicalName

        result := ComCall(7, this, "ptr", pszCanonicalName, "ptr*", ppkf, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} rfid 
     * @param {Pointer<KNOWNFOLDER_DEFINITION>} pKFD 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-iknownfoldermanager-registerfolder
     */
    RegisterFolder(rfid, pKFD) {
        result := ComCall(8, this, "ptr", rfid, "ptr", pKFD, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} rfid 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-iknownfoldermanager-unregisterfolder
     */
    UnregisterFolder(rfid) {
        result := ComCall(9, this, "ptr", rfid, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} pszPath 
     * @param {Integer} mode 
     * @param {Pointer<IKnownFolder>} ppkf 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-iknownfoldermanager-findfolderfrompath
     */
    FindFolderFromPath(pszPath, mode, ppkf) {
        pszPath := pszPath is String ? StrPtr(pszPath) : pszPath

        result := ComCall(10, this, "ptr", pszPath, "int", mode, "ptr*", ppkf, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<ITEMIDLIST>} pidl 
     * @param {Pointer<IKnownFolder>} ppkf 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-iknownfoldermanager-findfolderfromidlist
     */
    FindFolderFromIDList(pidl, ppkf) {
        result := ComCall(11, this, "ptr", pidl, "ptr*", ppkf, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} rfid 
     * @param {HWND} hwnd 
     * @param {Integer} flags 
     * @param {PWSTR} pszTargetPath 
     * @param {Integer} cFolders 
     * @param {Pointer<Guid>} pExclusion 
     * @param {Pointer<PWSTR>} ppszError 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-iknownfoldermanager-redirect
     */
    Redirect(rfid, hwnd, flags, pszTargetPath, cFolders, pExclusion, ppszError) {
        hwnd := hwnd is Win32Handle ? NumGet(hwnd, "ptr") : hwnd
        pszTargetPath := pszTargetPath is String ? StrPtr(pszTargetPath) : pszTargetPath

        result := ComCall(12, this, "ptr", rfid, "ptr", hwnd, "uint", flags, "ptr", pszTargetPath, "uint", cFolders, "ptr", pExclusion, "ptr", ppszError, "HRESULT")
        return result
    }
}
