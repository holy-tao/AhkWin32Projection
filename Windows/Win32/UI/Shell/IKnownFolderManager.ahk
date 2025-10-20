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
     * 
     * @param {Integer} nCsidl 
     * @param {Pointer<Guid>} pfid 
     * @returns {HRESULT} 
     */
    FolderIdFromCsidl(nCsidl, pfid) {
        result := ComCall(3, this, "int", nCsidl, "ptr", pfid, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} rfid 
     * @param {Pointer<Int32>} pnCsidl 
     * @returns {HRESULT} 
     */
    FolderIdToCsidl(rfid, pnCsidl) {
        result := ComCall(4, this, "ptr", rfid, "int*", pnCsidl, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} ppKFId 
     * @param {Pointer<UInt32>} pCount 
     * @returns {HRESULT} 
     */
    GetFolderIds(ppKFId, pCount) {
        result := ComCall(5, this, "ptr", ppKFId, "uint*", pCount, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} rfid 
     * @param {Pointer<IKnownFolder>} ppkf 
     * @returns {HRESULT} 
     */
    GetFolder(rfid, ppkf) {
        result := ComCall(6, this, "ptr", rfid, "ptr", ppkf, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {PWSTR} pszCanonicalName 
     * @param {Pointer<IKnownFolder>} ppkf 
     * @returns {HRESULT} 
     */
    GetFolderByName(pszCanonicalName, ppkf) {
        pszCanonicalName := pszCanonicalName is String ? StrPtr(pszCanonicalName) : pszCanonicalName

        result := ComCall(7, this, "ptr", pszCanonicalName, "ptr", ppkf, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} rfid 
     * @param {Pointer<KNOWNFOLDER_DEFINITION>} pKFD 
     * @returns {HRESULT} 
     */
    RegisterFolder(rfid, pKFD) {
        result := ComCall(8, this, "ptr", rfid, "ptr", pKFD, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} rfid 
     * @returns {HRESULT} 
     */
    UnregisterFolder(rfid) {
        result := ComCall(9, this, "ptr", rfid, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {PWSTR} pszPath 
     * @param {Integer} mode 
     * @param {Pointer<IKnownFolder>} ppkf 
     * @returns {HRESULT} 
     */
    FindFolderFromPath(pszPath, mode, ppkf) {
        pszPath := pszPath is String ? StrPtr(pszPath) : pszPath

        result := ComCall(10, this, "ptr", pszPath, "int", mode, "ptr", ppkf, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<ITEMIDLIST>} pidl 
     * @param {Pointer<IKnownFolder>} ppkf 
     * @returns {HRESULT} 
     */
    FindFolderFromIDList(pidl, ppkf) {
        result := ComCall(11, this, "ptr", pidl, "ptr", ppkf, "int")
        if(result != 0)
            throw OSError(result)

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
     */
    Redirect(rfid, hwnd, flags, pszTargetPath, cFolders, pExclusion, ppszError) {
        hwnd := hwnd is Win32Handle ? NumGet(hwnd, "ptr") : hwnd
        pszTargetPath := pszTargetPath is String ? StrPtr(pszTargetPath) : pszTargetPath

        result := ComCall(12, this, "ptr", rfid, "ptr", hwnd, "uint", flags, "ptr", pszTargetPath, "uint", cFolders, "ptr", pExclusion, "ptr", ppszError, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
