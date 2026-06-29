#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\KNOWNFOLDER_DEFINITION.ahk" { KNOWNFOLDER_DEFINITION }
#Import ".\KF_CATEGORY.ahk" { KF_CATEGORY }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "Common\ITEMIDLIST.ahk" { ITEMIDLIST }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * Exposes methods that allow an application to retrieve information about a known folder's category, type, GUID, pointer to an item identifier list (PIDL) value, redirection capabilities, and definition.
 * @remarks
 * <b>IKnownFolder</b> objects can be obtained through several methods of the <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-iknownfoldermanager">IKnownFolderManager</a> interface, such as <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nf-shobjidl_core-iknownfoldermanager-getfolder">IKnownFolderManager::GetFolder</a> and <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nf-shobjidl_core-iknownfoldermanager-findfolderfromidlist">IKnownFolderManager::FindFolderFromIDList</a>.
 * 
 * Third parties do not implement <b>IKnownFolder</b>. Use the provided implementation.
 * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nn-shobjidl_core-iknownfolder
 * @namespace Windows.Win32.UI.Shell
 */
export default struct IKnownFolder extends IUnknown {
    /**
     * The interface identifier for IKnownFolder
     * @type {Guid}
     */
    static IID := Guid("{3aa7af7e-9b36-420c-a8e3-f77d4674a488}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IKnownFolder interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        GetId                      : IntPtr
        GetCategory                : IntPtr
        GetShellItem               : IntPtr
        GetPath                    : IntPtr
        SetPath                    : IntPtr
        GetIDList                  : IntPtr
        GetFolderType              : IntPtr
        GetRedirectionCapabilities : IntPtr
        GetFolderDefinition        : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IKnownFolder.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Gets the ID of the selected folder.
     * @returns {Guid} Type: <b><a href="https://docs.microsoft.com/windows/desktop/shell/knownfolderid">KNOWNFOLDERID</a>*</b>
     * 
     * When this method returns, returns the <a href="https://docs.microsoft.com/windows/desktop/shell/knownfolderid">KNOWNFOLDERID</a> value of the known folder. Note, <b>KNOWNFOLDERID</b> values are GUIDs.
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-iknownfolder-getid
     */
    GetId() {
        pkfid := Guid()
        result := ComCall(3, this, Guid.Ptr, pkfid, "HRESULT")
        return pkfid
    }

    /**
     * Retrieves the category�virtual, fixed, common, or per-user�of the selected folder.
     * @returns {KF_CATEGORY} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/ne-shobjidl_core-kf_category">KF_CATEGORY</a>*</b>
     * 
     * When this method returns, contains a pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/ne-shobjidl_core-kf_category">KF_CATEGORY</a> of the selected folder.
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-iknownfolder-getcategory
     */
    GetCategory() {
        result := ComCall(4, this, "int*", &pCategory := 0, "HRESULT")
        return pCategory
    }

    /**
     * Retrieves the location of a known folder in the Shell namespace in the form of a Shell item (IShellItem or derived interface).
     * @param {Integer} dwFlags Type: <b>DWORD</b>
     * 
     * Flags that specify special retrieval options. This value can be 0; otherwise, one or more of the <a href="https://docs.microsoft.com/windows/desktop/api/shlobj_core/ne-shlobj_core-known_folder_flag">KNOWN_FOLDER_FLAG</a> values.
     * @param {Pointer<Guid>} riid Type: <b>REFIID</b>
     * 
     * A reference to the IID of the requested interface.
     * @returns {Pointer<Void>} Type: <b>void**</b>
     * 
     * When this method returns, contains the interface pointer requested in <i>riid</i>. This is typically <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-ishellitem">IShellItem</a> or <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-ishellitem2">IShellItem2</a>.
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-iknownfolder-getshellitem
     */
    GetShellItem(dwFlags, riid) {
        result := ComCall(5, this, "uint", dwFlags, Guid.Ptr, riid, "ptr*", &ppv := 0, "HRESULT")
        return ppv
    }

    /**
     * Retrieves the path of a known folder as a string.
     * @remarks
     * Equivalent to <a href="https://docs.microsoft.com/windows/desktop/api/shlobj_core/nf-shlobj_core-shgetknownfolderpath">SHGetKnownFolderPath</a>
     * @param {Integer} dwFlags Type: <b>DWORD</b>
     * 
     * Flags that specify special retrieval options. This value can be 0; otherwise, one or more of the <a href="https://docs.microsoft.com/windows/desktop/api/shlobj_core/ne-shlobj_core-known_folder_flag">KNOWN_FOLDER_FLAG</a> values.
     * @returns {PWSTR} Type: <b>LPWSTR*</b>
     * 
     * When this method returns, contains the address of a pointer to a null-terminated buffer that contains the path. The calling application is responsible for calling <a href="https://docs.microsoft.com/windows/desktop/api/combaseapi/nf-combaseapi-cotaskmemfree">CoTaskMemFree</a> to free this resource when it is no longer needed.
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-iknownfolder-getpath
     */
    GetPath(dwFlags) {
        result := ComCall(6, this, "uint", dwFlags, PWSTR.Ptr, &ppszPath := 0, "HRESULT")
        return ppszPath
    }

    /**
     * Assigns a new path to a known folder.
     * @remarks
     * This method cannot be called on folders of type <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/ne-shobjidl_core-kf_category">KF_CATEGORY_FIXED</a> or <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/ne-shobjidl_core-kf_category">KF_CATEGORY_VIRTUAL</a>.
     * 
     * To call this method on a folder of type <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/ne-shobjidl_core-kf_category">KF_CATEGORY_COMMON</a>, the calling application must be running with elevated privileges.
     * 
     * This method is equivalent to <a href="https://docs.microsoft.com/windows/desktop/api/shlobj_core/nf-shlobj_core-shsetknownfolderpath">SHSetKnownFolderPath</a>.
     * @param {Integer} dwFlags Type: <b>DWORD</b>
     * 
     * Either zero or the following value:
     * @param {PWSTR} pszPath Type: <b>LPCWSTR</b>
     * 
     * Pointer to the folder's new path. This is a null-terminated Unicode string of length MAX_PATH. This path cannot be of zero length. If this value is <b>NULL</b>, the <b>IKnownFolder::SetPath</b> sets the path to the default value.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-iknownfolder-setpath
     */
    SetPath(dwFlags, pszPath) {
        pszPath := pszPath is String ? StrPtr(pszPath) : pszPath

        result := ComCall(7, this, "uint", dwFlags, "ptr", pszPath, "HRESULT")
        return result
    }

    /**
     * Gets the location of the Shell namespace folder in the IDList (ITEMIDLIST) form.
     * @remarks
     * Equivalent to <a href="https://docs.microsoft.com/windows/desktop/api/shlobj_core/nf-shlobj_core-shgetknownfolderidlist">SHGetKnownFolderIDList</a>.
     * @param {Integer} dwFlags Type: <b>DWORD</b>
     * 
     * Flags that specify special retrieval options. This value can be 0; otherwise, one or more of the <a href="https://docs.microsoft.com/windows/desktop/api/shlobj_core/ne-shlobj_core-known_folder_flag">KNOWN_FOLDER_FLAG</a> values.
     * @returns {Pointer<ITEMIDLIST>} Type: <b>PIDLIST_ABSOLUTE*</b>
     * 
     * When this method returns, contains the address of an absolute PIDL. This parameter is passed uninitialized. The calling application is responsible for freeing this resource when it is no longer needed.
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-iknownfolder-getidlist
     */
    GetIDList(dwFlags) {
        result := ComCall(8, this, "uint", dwFlags, "ptr*", &ppidl := 0, "HRESULT")
        return ppidl
    }

    /**
     * Retrieves the folder type.
     * @returns {Guid} Type: <b><a href="https://docs.microsoft.com/windows/desktop/shell/foldertypeid">FOLDERTYPEID</a>*</b>
     * 
     * When this returns, contains a pointer to a <a href="https://docs.microsoft.com/windows/desktop/shell/foldertypeid">FOLDERTYPEID</a> (a GUID) that identifies the known folder type.
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-iknownfolder-getfoldertype
     */
    GetFolderType() {
        pftid := Guid()
        result := ComCall(9, this, Guid.Ptr, pftid, "HRESULT")
        return pftid
    }

    /**
     * Gets a value that states whether the known folder can have its path set to a new value or what specific restrictions or prohibitions are placed on that redirection.
     * @returns {Integer} Type: <b><a href="https://docs.microsoft.com/windows/win32/api/shobjidl_core/ne-shobjidl_core-_kf_redirection_capabilities">KF_REDIRECTION_CAPABILITIES</a>*</b>
     * 
     * When this method returns, contains a pointer to a <a href="https://docs.microsoft.com/windows/win32/api/shobjidl_core/ne-shobjidl_core-_kf_redirection_capabilities">KF_REDIRECTION_CAPABILITIES</a> value that indicates the redirection capabilities for this folder.
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-iknownfolder-getredirectioncapabilities
     */
    GetRedirectionCapabilities() {
        result := ComCall(10, this, "uint*", &pCapabilities := 0, "HRESULT")
        return pCapabilities
    }

    /**
     * Retrieves a structure that contains the defining elements of a known folder, which includes the folder's category, name, path, description, tooltip, icon, and other properties.
     * @remarks
     * When a third-party application creates their own known folder, they do so by defining it with a <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/ns-shobjidl_core-knownfolder_definition">KNOWNFOLDER_DEFINITION</a> structure, then registering it with the system. Any registered known folder definition information—system-provided or application-created—can be retrieved through this method.
     * 
     * To call this method, the caller must have at least User privileges.
     * @returns {KNOWNFOLDER_DEFINITION} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/ns-shobjidl_core-knownfolder_definition">KNOWNFOLDER_DEFINITION</a>*</b>
     * 
     * When this method returns, contains a pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/ns-shobjidl_core-knownfolder_definition">KNOWNFOLDER_DEFINITION</a> structure. When no longer needed, the calling application is responsible for calling <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nf-shobjidl_core-freeknownfolderdefinitionfields">FreeKnownFolderDefinitionFields</a> to free this resource.
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-iknownfolder-getfolderdefinition
     */
    GetFolderDefinition() {
        pKFD := KNOWNFOLDER_DEFINITION()
        result := ComCall(11, this, KNOWNFOLDER_DEFINITION.Ptr, pKFD, "HRESULT")
        return pKFD
    }

    Query(iid) {
        if (IKnownFolder.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetId := CallbackCreate(GetMethod(implObj, "GetId"), flags, 2)
        this.vtbl.GetCategory := CallbackCreate(GetMethod(implObj, "GetCategory"), flags, 2)
        this.vtbl.GetShellItem := CallbackCreate(GetMethod(implObj, "GetShellItem"), flags, 4)
        this.vtbl.GetPath := CallbackCreate(GetMethod(implObj, "GetPath"), flags, 3)
        this.vtbl.SetPath := CallbackCreate(GetMethod(implObj, "SetPath"), flags, 3)
        this.vtbl.GetIDList := CallbackCreate(GetMethod(implObj, "GetIDList"), flags, 3)
        this.vtbl.GetFolderType := CallbackCreate(GetMethod(implObj, "GetFolderType"), flags, 2)
        this.vtbl.GetRedirectionCapabilities := CallbackCreate(GetMethod(implObj, "GetRedirectionCapabilities"), flags, 2)
        this.vtbl.GetFolderDefinition := CallbackCreate(GetMethod(implObj, "GetFolderDefinition"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetId)
        CallbackFree(this.vtbl.GetCategory)
        CallbackFree(this.vtbl.GetShellItem)
        CallbackFree(this.vtbl.GetPath)
        CallbackFree(this.vtbl.SetPath)
        CallbackFree(this.vtbl.GetIDList)
        CallbackFree(this.vtbl.GetFolderType)
        CallbackFree(this.vtbl.GetRedirectionCapabilities)
        CallbackFree(this.vtbl.GetFolderDefinition)
    }
}
