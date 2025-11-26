#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IKnownFolder.ahk
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
     * Gets the KNOWNFOLDERID that is the equivalent of a legacy CSIDL value.
     * @param {Integer} nCsidl Type: <b>int</b>
     * 
     * The <a href="https://docs.microsoft.com/windows/desktop/shell/csidl">CSIDL</a> value.
     * @returns {Guid} Type: <b><a href="https://docs.microsoft.com/windows/desktop/shell/knownfolderid">KNOWNFOLDERID</a>*</b>
     * 
     * When this method returns, contains a pointer to the <a href="https://docs.microsoft.com/windows/desktop/shell/knownfolderid">KNOWNFOLDERID</a>. This pointer is passed uninitialized.
     * @see https://docs.microsoft.com/windows/win32/api//shobjidl_core/nf-shobjidl_core-iknownfoldermanager-folderidfromcsidl
     */
    FolderIdFromCsidl(nCsidl) {
        pfid := Guid()
        result := ComCall(3, this, "int", nCsidl, "ptr", pfid, "HRESULT")
        return pfid
    }

    /**
     * Gets the legacy CSIDL value that is the equivalent of a given KNOWNFOLDERID.
     * @param {Pointer<Guid>} rfid Type: <b>REFKNOWNFOLDERID</b>
     * 
     * Reference to the <a href="https://docs.microsoft.com/windows/desktop/shell/knownfolderid">KNOWNFOLDERID</a>.
     * @returns {Integer} Type: <b>int*</b>
     * 
     * When this method returns, contains a pointer to the <a href="https://docs.microsoft.com/windows/desktop/shell/csidl">CSIDL</a> value. This pointer is passed uninitialized.
     * @see https://docs.microsoft.com/windows/win32/api//shobjidl_core/nf-shobjidl_core-iknownfoldermanager-folderidtocsidl
     */
    FolderIdToCsidl(rfid) {
        result := ComCall(4, this, "ptr", rfid, "int*", &pnCsidl := 0, "HRESULT")
        return pnCsidl
    }

    /**
     * Gets an array of all registered known folder IDs. This can be used in enumerating all known folders.
     * @param {Pointer<Integer>} pCount Type: <b>UINT*</b>
     * 
     * When this method returns, contains a pointer to the number of <a href="https://docs.microsoft.com/windows/desktop/shell/knownfolderid">KNOWNFOLDERID</a> values in the array at <i>ppKFId</i>. The [in] functionality of this parameter is not used.
     * @returns {Pointer<Guid>} Type: <b><a href="https://docs.microsoft.com/windows/desktop/shell/knownfolderid">KNOWNFOLDERID</a>**</b>
     * 
     * When this method returns, contains a pointer to an array of all <a href="https://docs.microsoft.com/windows/desktop/shell/knownfolderid">KNOWNFOLDERID</a> values registered with the system. Use <a href="https://docs.microsoft.com/windows/desktop/api/combaseapi/nf-combaseapi-cotaskmemfree">CoTaskMemFree</a> to free these resources when they are no longer needed.
     * @see https://docs.microsoft.com/windows/win32/api//shobjidl_core/nf-shobjidl_core-iknownfoldermanager-getfolderids
     */
    GetFolderIds(pCount) {
        pCountMarshal := pCount is VarRef ? "uint*" : "ptr"

        result := ComCall(5, this, "ptr*", &ppKFId := 0, pCountMarshal, pCount, "HRESULT")
        return ppKFId
    }

    /**
     * Gets an object that represents a known folder identified by its KNOWNFOLDERID.
     * @param {Pointer<Guid>} rfid Type: <b>REFKNOWNFOLDERID</b>
     * 
     * Reference to the <a href="https://docs.microsoft.com/windows/desktop/shell/knownfolderid">KNOWNFOLDERID</a>.
     * @returns {IKnownFolder} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-iknownfolder">IKnownFolder</a>**</b>
     * 
     * When this method returns, contains an interface pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-iknownfolder">IKnownFolder</a> object that represents the folder.
     * @see https://docs.microsoft.com/windows/win32/api//shobjidl_core/nf-shobjidl_core-iknownfoldermanager-getfolder
     */
    GetFolder(rfid) {
        result := ComCall(6, this, "ptr", rfid, "ptr*", &ppkf := 0, "HRESULT")
        return IKnownFolder(ppkf)
    }

    /**
     * Gets an object that represents a known folder identified by its canonical name.
     * @param {PWSTR} pszCanonicalName Type: <b>LPCWSTR</b>
     * 
     * A pointer to the non-localized, canonical name for the known folder, stored as a null-terminated Unicode string. If this folder is a <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/ne-shobjidl_core-kf_category">common</a> or <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/ne-shobjidl_core-kf_category">per-user</a> folder, this value is also used as the value name of the "User Shell Folders" registry settings. This value is retrieved through the <b>pszName</b> member of the folder's <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/ns-shobjidl_core-knownfolder_definition">KNOWNFOLDER_DEFINITION</a> structure.
     * @returns {IKnownFolder} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-iknownfolder">IKnownFolder</a>**</b>
     * 
     * When this method returns, contains the address of a pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-iknownfolder">IKnownFolder</a> object that represents the known folder.
     * @see https://docs.microsoft.com/windows/win32/api//shobjidl_core/nf-shobjidl_core-iknownfoldermanager-getfolderbyname
     */
    GetFolderByName(pszCanonicalName) {
        pszCanonicalName := pszCanonicalName is String ? StrPtr(pszCanonicalName) : pszCanonicalName

        result := ComCall(7, this, "ptr", pszCanonicalName, "ptr*", &ppkf := 0, "HRESULT")
        return IKnownFolder(ppkf)
    }

    /**
     * Adds a new known folder to the registry. Used particularly by independent software vendors (ISVs) that are adding one of their own folders to the known folder system.
     * @param {Pointer<Guid>} rfid Type: <b>REFKNOWNFOLDERID</b>
     * 
     * A <b>GUID</b> that represents the known folder.
     * @param {Pointer<KNOWNFOLDER_DEFINITION>} pKFD Type: <b>const KNOWNFOLDER_DEFINITION*</b>
     * 
     * A pointer to a valid <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/ns-shobjidl_core-knownfolder_definition">KNOWNFOLDER_DEFINITION</a> structure that provides the details of the new folder.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//shobjidl_core/nf-shobjidl_core-iknownfoldermanager-registerfolder
     */
    RegisterFolder(rfid, pKFD) {
        result := ComCall(8, this, "ptr", rfid, "ptr", pKFD, "HRESULT")
        return result
    }

    /**
     * Remove a known folder from the registry, which makes it unknown to the known folder system. This method does not remove the folder itself.
     * @param {Pointer<Guid>} rfid Type: <b>REFKNOWNFOLDERID</b>
     * 
     * <b>GUID</b> or <a href="https://docs.microsoft.com/windows/desktop/shell/knownfolderid">KNOWNFOLDERID</a> that represents the known folder.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * Returns S_OK if successful, or an error value otherwise, including the following:
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Among other things, this value can indicate that the <i>rfid</i> parameter references a <a href="/windows/desktop/shell/knownfolderid">KNOWNFOLDERID</a> that is not present on the system. Not all <b>KNOWNFOLDERID</b> values are present on all systems. Use <a href="/windows/desktop/api/shobjidl_core/nf-shobjidl_core-iknownfoldermanager-getfolderids">IKnownFolderManager::GetFolderIds</a> to retrieve the set of <b>KNOWNFOLDERID</b> values known to the current system.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//shobjidl_core/nf-shobjidl_core-iknownfoldermanager-unregisterfolder
     */
    UnregisterFolder(rfid) {
        result := ComCall(9, this, "ptr", rfid, "HRESULT")
        return result
    }

    /**
     * Gets an object that represents a known folder based on a file system path.
     * @param {PWSTR} pszPath Type: <b>LPCWSTR</b>
     * 
     * Pointer to a null-terminated Unicode string of length MAX_PATH that contains a path to a known folder.
     * @param {Integer} mode Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/ne-shobjidl_core-fffp_mode">FFFP_MODE</a></b>
     * @returns {IKnownFolder} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-iknownfolder">IKnownFolder</a>**</b>
     * 
     * When this method returns, contains the address of a pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-iknownfolder">IKnownFolder</a> object that represents the known folder.
     * @see https://docs.microsoft.com/windows/win32/api//shobjidl_core/nf-shobjidl_core-iknownfoldermanager-findfolderfrompath
     */
    FindFolderFromPath(pszPath, mode) {
        pszPath := pszPath is String ? StrPtr(pszPath) : pszPath

        result := ComCall(10, this, "ptr", pszPath, "int", mode, "ptr*", &ppkf := 0, "HRESULT")
        return IKnownFolder(ppkf)
    }

    /**
     * Gets an object that represents a known folder based on an IDList. The object allows you to query certain folder properties, get the current path of the folder, redirect the folder to another location, and get the path of the folder as an ITEMIDLIST.
     * @param {Pointer<ITEMIDLIST>} pidl Type: <b>PCIDLIST_ABSOLUTE</b>
     * 
     * A pointer to the IDList.
     * @returns {IKnownFolder} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-iknownfolder">IKnownFolder</a>**</b>
     * 
     * When this method returns, contains the address of a pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-iknownfolder">IKnownFolder</a> object that represents the known folder.
     * @see https://docs.microsoft.com/windows/win32/api//shobjidl_core/nf-shobjidl_core-iknownfoldermanager-findfolderfromidlist
     */
    FindFolderFromIDList(pidl) {
        result := ComCall(11, this, "ptr", pidl, "ptr*", &ppkf := 0, "HRESULT")
        return IKnownFolder(ppkf)
    }

    /**
     * Redirects folder requests for common and per-user folders.
     * @param {Pointer<Guid>} rfid Type: <b>REFKNOWNFOLDERID</b>
     * 
     * A reference to the <a href="https://docs.microsoft.com/windows/desktop/shell/knownfolderid">KNOWNFOLDERID</a> of the folder to be redirected.
     * @param {HWND} hwnd Type: <b>HWND</b>
     * 
     * The handle of the parent window used to display copy engine progress UI dialogs when <a href="https://docs.microsoft.com/windows/win32/api/shobjidl_core/ne-shobjidl_core-_kf_redirect_flags">KF_REDIRECT_WITH_UI</a> i passed in the <i>flags</i> parameter. If no progress dialog is needed, this value can be <b>NULL</b>.
     * @param {Integer} flags Type: <b><a href="https://docs.microsoft.com/windows/win32/api/shobjidl_core/ne-shobjidl_core-_kf_redirect_flags">KF_REDIRECT_FLAGS</a></b>
     * 
     * The <a href="https://docs.microsoft.com/windows/win32/api/shobjidl_core/ne-shobjidl_core-_kf_redirect_flags">KF_REDIRECT_FLAGS</a> options for redirection.
     * @param {PWSTR} pszTargetPath Type: <b>LPCWSTR</b>
     * 
     * A pointer to the new path for the folder. This is a null-terminated Unicode string. This value can be <b>NULL</b>.
     * @param {Integer} cFolders Type: <b>UINT</b>
     * 
     * The number of <a href="https://docs.microsoft.com/windows/desktop/shell/knownfolderid">KNOWNFOLDERID</a> values in the array at <i>pExclusion</i>.
     * @param {Pointer<Guid>} pExclusion Type: <b>KNOWNFOLDERID const*</b>
     * 
     * Pointer to an array of <a href="https://docs.microsoft.com/windows/desktop/shell/knownfolderid">KNOWNFOLDERID</a> values that refer to subfolders of <i>rfid</i> that should be excluded from the redirection. If no subfolders are excluded, this value can be <b>NULL</b>.
     * @returns {PWSTR} Type: <b>LPWSTR*</b>
     * 
     * When this method returns, contains the address of a pointer to a null-terminated Unicode string that contains an error message if one was generated. This value can be <b>NULL</b>.
     * @see https://docs.microsoft.com/windows/win32/api//shobjidl_core/nf-shobjidl_core-iknownfoldermanager-redirect
     */
    Redirect(rfid, hwnd, flags, pszTargetPath, cFolders, pExclusion) {
        hwnd := hwnd is Win32Handle ? NumGet(hwnd, "ptr") : hwnd
        pszTargetPath := pszTargetPath is String ? StrPtr(pszTargetPath) : pszTargetPath

        result := ComCall(12, this, "ptr", rfid, "ptr", hwnd, "uint", flags, "ptr", pszTargetPath, "uint", cFolders, "ptr", pExclusion, "ptr*", &ppszError := 0, "HRESULT")
        return ppszError
    }
}
