#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * Exposes methods that allow an application to remove one or all destinations from the Recent or Frequent categories in a Jump List.
 * @remarks
 * <h3><a id="When_to_Implement"></a><a id="when_to_implement"></a><a id="WHEN_TO_IMPLEMENT"></a>When to Implement</h3>
 * An implementation of this interface is provided in Windows as CLSID_ApplicationDestinations. This interface is not implemented by third parties.
 * 
 * <h3><a id="When_to_Use"></a><a id="when_to_use"></a><a id="WHEN_TO_USE"></a>When to Use</h3>
 * An application calls the methods of this interface when it wants to remove items from a Jump List's automatically generated destinations. These destinations, found in the <b>Recent</b> or <b>Frequent</b> categories, are generated through calls to <a href="https://docs.microsoft.com/windows/desktop/api/shlobj_core/nf-shlobj_core-shaddtorecentdocs">SHAddToRecentDocs</a>, either explicitly or by the system when a file is opened through Windows Explorer or the common file dialog is used to open, save, or create a file.
 * 
 * 
 * 
 * An application should call <b>IApplicationDestinations</b> methods in the following situations:
 *                 
 * <ul>
 * <li>When the application is uninstalled.</li>
 * <li>When the user clears history.</li>
 * <li>When the user disables destination tracking in the application's Settings or Options pages.</li>
 * <li>When the user deletes the destination from within the application. This is particularly important in the case of a destination that is not a file. In the case of non-file destinations—generally, though not always, <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-ishelllinka">IShellLink</a> items—it is the application's responsibility to remove the destination from the list when it detects that it no longer exists.</li>
 * </ul>
 * 
 * 
 * If the user turns off usage tracking in the application's privacy setting, the application is responsible for clearing the existing data and also stopping the system from collecting usage data on that item in the future. This is done by setting the NoRecentDocs value in all of the application's file type registrations. See <a href="https://docs.microsoft.com/windows/desktop/api/shlwapi/ne-shlwapi-filetypeattributeflags">FTA_NoRecentDocs</a> for more information.
 * 
 * <b>IApplicationDestinations</b> methods are used only with the automatically generated <b>Recent</b> or <b>Frequent</b> categories. They do not remove items that the user has pinned to the Jump List. Those items cannot be removed programmatically; only the user can remove them. These methods also have no effect on <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-icustomdestinationlist">custom categories</a> or the task list.
 * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nn-shobjidl_core-iapplicationdestinations
 * @namespace Windows.Win32.UI.Shell
 */
export default struct IApplicationDestinations extends IUnknown {
    /**
     * The interface identifier for IApplicationDestinations
     * @type {Guid}
     */
    static IID := Guid("{12337d35-94c6-48a0-bce7-6a9c69d4d600}")

    /**
     * The class identifier for ApplicationDestinations
     * @type {Guid}
     */
    static CLSID := Guid("{86c14003-4d6b-4ef3-a7b4-0506663b2e68}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IApplicationDestinations interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        SetAppID              : IntPtr
        RemoveDestination     : IntPtr
        RemoveAllDestinations : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IApplicationDestinations.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Specifies a unique Application User Model ID (AppUserModelID) for the application from whose taskbar button's Jump List the methods of this interface will remove destinations. This method is optional.
     * @remarks
     * If the application has an explicit AppUserModelID, this method must be called before you call <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nf-shobjidl_core-iapplicationdestinations-removealldestinations">RemoveAllDestinations</a> or <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nf-shobjidl_core-iapplicationdestinations-removedestination">RemoveDestination</a>.
     * 
     * After an AppUserModelID is specified through an object's <b>SetAppID</b> method, the AppUserModelID is saved in the object for that object's lifetime, providing that it is not overwritten by another call to <b>SetAppID</b>.
     * 
     * Some applications will not declare an explicit AppUserModelID and should not call this method. In that case, the application's identity is deduced when <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nf-shobjidl_core-iapplicationdestinations-removedestination">IApplicationDestinations::RemoveDestination</a> or <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nf-shobjidl_core-iapplicationdestinations-removealldestinations">IApplicationDestinations::RemoveAllDestinations</a> are called. However, there is a performance benefit in avoiding those calculations, so applications that provide custom Jump Lists are encouraged to use <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nf-shobjidl_core-setcurrentprocessexplicitappusermodelid">explicit AppUserModelIDs</a>.
     * @param {PWSTR} pszAppID Type: <b>LPCWSTR</b>
     * 
     * Pointer to the AppUserModelID of the process whose taskbar button representation receives the Jump List.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-iapplicationdestinations-setappid
     */
    SetAppID(pszAppID) {
        pszAppID := pszAppID is String ? StrPtr(pszAppID) : pszAppID

        result := ComCall(3, this, "ptr", pszAppID, "HRESULT")
        return result
    }

    /**
     * Removes a single destination from the Recent and Frequent categories in a Jump List.
     * @remarks
     * A destination can appear in both the <b>Recent</b> and <b>Frequent</b> categories. If that is the case, this method removes the destination from both categories.
     * 
     * If the item is pinned to the list by the user, it is not removed but its usage data is cleared.
     * 
     * An application can call <b>RemoveDestination</b> without knowing if the item pointed to by <i>punk</i> is currently in the list. If there is no existing data on the item (in which case it is not in the <b>Recent</b> or <b>Frequent</b> list), this method does nothing and returns S_OK.
     * 
     * If the application has an explicit Application User Model ID (AppUserModelID), you must call <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nf-shobjidl_core-iapplicationdestinations-setappid">IApplicationDestinations::SetAppID</a> before you call this method.
     * @param {IUnknown} punk Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nn-unknwn-iunknown">IUnknown</a>*</b>
     * 
     * A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-ishellitem">IShellItem</a> or <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-ishelllinka">IShellLink</a> that represents the destination to remove.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * Returns S_OK if successful, or a standard COM error value otherwise. If the object pointed to by <i>punk</i> is not an <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-ishellitem">IShellItem</a> or <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-ishelllinka">IShellLink</a>, the method returns E_INVALIDARG.
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-iapplicationdestinations-removedestination
     */
    RemoveDestination(punk) {
        result := ComCall(4, this, "ptr", punk, "HRESULT")
        return result
    }

    /**
     * Clears all destination entries from the Recent and Frequent categories in an application's Jump List.
     * @remarks
     * This method does not remove items that the user has pinned to the Jump List. Those items cannot be removed programmatically; only the user can remove them. However, it does remove usage data for those pinned items. It also cannot remove items from custom categories or the task list.
     * 
     * If the application has an explicit Application User Model ID (AppUserModelID), you must call <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nf-shobjidl_core-iapplicationdestinations-setappid">IApplicationDestinations::SetAppID</a> before you call this method.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-iapplicationdestinations-removealldestinations
     */
    RemoveAllDestinations() {
        result := ComCall(5, this, "HRESULT")
        return result
    }

    Query(iid) {
        if (IApplicationDestinations.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.SetAppID := CallbackCreate(GetMethod(implObj, "SetAppID"), flags, 2)
        this.vtbl.RemoveDestination := CallbackCreate(GetMethod(implObj, "RemoveDestination"), flags, 2)
        this.vtbl.RemoveAllDestinations := CallbackCreate(GetMethod(implObj, "RemoveAllDestinations"), flags, 1)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.SetAppID)
        CallbackFree(this.vtbl.RemoveDestination)
        CallbackFree(this.vtbl.RemoveAllDestinations)
    }
}
