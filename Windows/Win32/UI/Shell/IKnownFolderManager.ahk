#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IKnownFolder.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Exposes methods that create, enumerate or manage existing known folders.
 * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nn-shobjidl_core-iknownfoldermanager
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
     * @remarks
     * To call this method, the caller must have at least User privileges.
     * @param {Integer} nCsidl Type: <b>int</b>
     * 
     * The <a href="https://docs.microsoft.com/windows/desktop/shell/csidl">CSIDL</a> value.
     * @returns {Guid} Type: <b><a href="https://docs.microsoft.com/windows/desktop/shell/knownfolderid">KNOWNFOLDERID</a>*</b>
     * 
     * When this method returns, contains a pointer to the <a href="https://docs.microsoft.com/windows/desktop/shell/knownfolderid">KNOWNFOLDERID</a>. This pointer is passed uninitialized.
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-iknownfoldermanager-folderidfromcsidl
     */
    FolderIdFromCsidl(nCsidl) {
        pfid := Guid()
        result := ComCall(3, this, "int", nCsidl, "ptr", pfid, "HRESULT")
        return pfid
    }

    /**
     * Gets the legacy CSIDL value that is the equivalent of a given KNOWNFOLDERID.
     * @remarks
     * To call this method, the caller must have at least User privileges.
     * @param {Pointer<Guid>} rfid Type: <b>REFKNOWNFOLDERID</b>
     * 
     * Reference to the <a href="https://docs.microsoft.com/windows/desktop/shell/knownfolderid">KNOWNFOLDERID</a>.
     * @returns {Integer} Type: <b>int*</b>
     * 
     * When this method returns, contains a pointer to the <a href="https://docs.microsoft.com/windows/desktop/shell/csidl">CSIDL</a> value. This pointer is passed uninitialized.
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-iknownfoldermanager-folderidtocsidl
     */
    FolderIdToCsidl(rfid) {
        result := ComCall(4, this, "ptr", rfid, "int*", &pnCsidl := 0, "HRESULT")
        return pnCsidl
    }

    /**
     * Gets an array of all registered known folder IDs. This can be used in enumerating all known folders.
     * @remarks
     * The caller of this method must have User privileges.
     * 
     * You can use <a href="https://docs.microsoft.com/windows/desktop/api/combaseapi/nf-combaseapi-stringfromclsid">StringFromCLSID</a> or <a href="https://docs.microsoft.com/windows/desktop/api/combaseapi/nf-combaseapi-stringfromguid2">StringFromGUID2</a> to convert the retrieved <a href="https://docs.microsoft.com/windows/desktop/shell/knownfolderid">KNOWNFOLDERID</a> values to strings.
     * @param {Pointer<Integer>} pCount Type: <b>UINT*</b>
     * 
     * When this method returns, contains a pointer to the number of <a href="https://docs.microsoft.com/windows/desktop/shell/knownfolderid">KNOWNFOLDERID</a> values in the array at <i>ppKFId</i>. The [in] functionality of this parameter is not used.
     * @returns {Pointer<Guid>} Type: <b><a href="https://docs.microsoft.com/windows/desktop/shell/knownfolderid">KNOWNFOLDERID</a>**</b>
     * 
     * When this method returns, contains a pointer to an array of all <a href="https://docs.microsoft.com/windows/desktop/shell/knownfolderid">KNOWNFOLDERID</a> values registered with the system. Use <a href="https://docs.microsoft.com/windows/desktop/api/combaseapi/nf-combaseapi-cotaskmemfree">CoTaskMemFree</a> to free these resources when they are no longer needed.
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-iknownfoldermanager-getfolderids
     */
    GetFolderIds(pCount) {
        pCountMarshal := pCount is VarRef ? "uint*" : "ptr"

        result := ComCall(5, this, "ptr*", &ppKFId := 0, pCountMarshal, pCount, "HRESULT")
        return ppKFId
    }

    /**
     * Gets an object that represents a known folder identified by its KNOWNFOLDERID.
     * @remarks
     * To call this method, the caller must have at least User privileges.
     * 
     * <h3><a id="When_to_Use"></a><a id="when_to_use"></a><a id="WHEN_TO_USE"></a>When to Use</h3>
     * Use this method when you know exactly which known folder you are looking for and want to access it directly.
     * @param {Pointer<Guid>} rfid Type: <b>REFKNOWNFOLDERID</b>
     * 
     * Reference to the <a href="https://docs.microsoft.com/windows/desktop/shell/knownfolderid">KNOWNFOLDERID</a>.
     * @returns {IKnownFolder} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-iknownfolder">IKnownFolder</a>**</b>
     * 
     * When this method returns, contains an interface pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-iknownfolder">IKnownFolder</a> object that represents the folder.
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-iknownfoldermanager-getfolder
     */
    GetFolder(rfid) {
        result := ComCall(6, this, "ptr", rfid, "ptr*", &ppkf := 0, "HRESULT")
        return IKnownFolder(ppkf)
    }

    /**
     * Gets an object that represents a known folder identified by its canonical name.
     * @remarks
     * <h3><a id="When_to_Use"></a><a id="when_to_use"></a><a id="WHEN_TO_USE"></a>When to Use</h3>
     * Use this method when you know exactly which known folder you are looking for and want to access it directly.
     * @param {PWSTR} pszCanonicalName Type: <b>LPCWSTR</b>
     * 
     * A pointer to the non-localized, canonical name for the known folder, stored as a null-terminated Unicode string. If this folder is a <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/ne-shobjidl_core-kf_category">common</a> or <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/ne-shobjidl_core-kf_category">per-user</a> folder, this value is also used as the value name of the "User Shell Folders" registry settings. This value is retrieved through the <b>pszName</b> member of the folder's <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/ns-shobjidl_core-knownfolder_definition">KNOWNFOLDER_DEFINITION</a> structure.
     * @returns {IKnownFolder} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-iknownfolder">IKnownFolder</a>**</b>
     * 
     * When this method returns, contains the address of a pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-iknownfolder">IKnownFolder</a> object that represents the known folder.
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-iknownfoldermanager-getfolderbyname
     */
    GetFolderByName(pszCanonicalName) {
        pszCanonicalName := pszCanonicalName is String ? StrPtr(pszCanonicalName) : pszCanonicalName

        result := ComCall(7, this, "ptr", pszCanonicalName, "ptr*", &ppkf := 0, "HRESULT")
        return IKnownFolder(ppkf)
    }

    /**
     * Adds a new known folder to the registry. Used particularly by independent software vendors (ISVs) that are adding one of their own folders to the known folder system.
     * @remarks
     * <div class="alert"><b>Note</b>  This method updates <b>HKEY_LOCAL_MACHINE</b> and therefore needs to be run in the context of an administrator. Setup programs need administrator privileges to register or unregister a known folder.</div>
     * <div> </div>
     * <b>IKnownFolderManager::RegisterFolder</b> attempts to verify that the new <a href="https://docs.microsoft.com/windows/desktop/shell/knownfolderid">KNOWNFOLDERID</a> does not refer to a file system path already pointed to by an existing <b>KNOWNFOLDERID</b>. If the new <b>KNOWNFOLDERID</b> is found to do so, this method fails.
     * 
     * Multiple <a href="https://docs.microsoft.com/windows/desktop/shell/knownfolderid">KNOWNFOLDERID</a> values for the same file system path can cause several issues, such as conflicts in the Desktop.ini file that lead to confusion as to what language or properties to show for the folder. Multiple <b>KNOWNFOLDERID</b> values can also cause confusion as to the address bar path or what tasks to show for the folder in Windows Explorer.
     * 
     * You can suppress the display of the <b>Customize</b> page of your known folder's Properties window. To do so, set the following registry REG_DWORD value:
     * 
     * <pre><b>HKEY_LOCAL_MACHINE</b>
     *    <b>Software</b>
     *       <b>Microsoft</b>
     *          <b>Windows</b>
     *             <b>CurrentVersion</b>
     *                <b>Explorer</b>
     *                   <b>FolderDescriptions</b>
     *                      <i>Folder GUID</i>
     *                         <b>PropertyBag</b>
     *                            <b>NoCustomize</b> = 0x00000001 (1)</pre>
     * @param {Pointer<Guid>} rfid Type: <b>REFKNOWNFOLDERID</b>
     * 
     * A <b>GUID</b> that represents the known folder.
     * @param {Pointer<KNOWNFOLDER_DEFINITION>} pKFD Type: <b>const KNOWNFOLDER_DEFINITION*</b>
     * 
     * A pointer to a valid <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/ns-shobjidl_core-knownfolder_definition">KNOWNFOLDER_DEFINITION</a> structure that provides the details of the new folder.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-iknownfoldermanager-registerfolder
     */
    RegisterFolder(rfid, pKFD) {
        result := ComCall(8, this, "ptr", rfid, "ptr", pKFD, "HRESULT")
        return result
    }

    /**
     * Remove a known folder from the registry, which makes it unknown to the known folder system. This method does not remove the folder itself.
     * @remarks
     * <div class="alert"><b>Note</b>  This method updates <b>HKEY_LOCAL_MACHINE</b> and needs to be run in the context of an administrator. Setup programs need administrator privileges to register or unregister a known folder.</div>
     * <div> </div>
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
     * Among other things, this value can indicate that the <i>rfid</i> parameter references a <a href="https://docs.microsoft.com/windows/desktop/shell/knownfolderid">KNOWNFOLDERID</a> that is not present on the system. Not all <b>KNOWNFOLDERID</b> values are present on all systems. Use <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nf-shobjidl_core-iknownfoldermanager-getfolderids">IKnownFolderManager::GetFolderIds</a> to retrieve the set of <b>KNOWNFOLDERID</b> values known to the current system.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-iknownfoldermanager-unregisterfolder
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
     * @param {Integer} _mode 
     * @returns {IKnownFolder} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-iknownfolder">IKnownFolder</a>**</b>
     * 
     * When this method returns, contains the address of a pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-iknownfolder">IKnownFolder</a> object that represents the known folder.
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-iknownfoldermanager-findfolderfrompath
     */
    FindFolderFromPath(pszPath, _mode) {
        pszPath := pszPath is String ? StrPtr(pszPath) : pszPath

        result := ComCall(10, this, "ptr", pszPath, "int", _mode, "ptr*", &ppkf := 0, "HRESULT")
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
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-iknownfoldermanager-findfolderfromidlist
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
     * @param {HWND} _hwnd 
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
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-iknownfoldermanager-redirect
     */
    Redirect(rfid, _hwnd, flags, pszTargetPath, cFolders, pExclusion) {
        _hwnd := _hwnd is Win32Handle ? NumGet(_hwnd, "ptr") : _hwnd
        pszTargetPath := pszTargetPath is String ? StrPtr(pszTargetPath) : pszTargetPath

        result := ComCall(12, this, "ptr", rfid, "ptr", _hwnd, "uint", flags, "ptr", pszTargetPath, "uint", cFolders, "ptr", pExclusion, "ptr*", &ppszError := 0, "HRESULT")
        return ppszError
    }
}
