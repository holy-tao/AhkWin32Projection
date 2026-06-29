#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "Common\ITEMIDLIST.ahk" { ITEMIDLIST }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }
#Import ".\IShellFolder.ahk" { IShellFolder }

/**
 * A callback interface exposing methods used with INamespaceWalk.
 * @remarks
 * The IID for this interface is IID_INamespaceWalkCB.
 * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nn-shobjidl_core-inamespacewalkcb
 * @namespace Windows.Win32.UI.Shell
 */
export default struct INamespaceWalkCB extends IUnknown {
    /**
     * The interface identifier for INamespaceWalkCB
     * @type {Guid}
     */
    static IID := Guid("{d92995f8-cf5e-4a76-bf59-ead39ea2b97e}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for INamespaceWalkCB interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        FoundItem                : IntPtr
        EnterFolder              : IntPtr
        LeaveFolder              : IntPtr
        InitializeProgressDialog : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := INamespaceWalkCB.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Called when an object is found in the namespace during a namespace walk. Use this method as the main action function for the class implementing it. Perform your actions as needed inside this method.
     * @param {IShellFolder} psf Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-ishellfolder">IShellFolder</a>*</b>
     * 
     * A pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-ishellfolder">IShellFolder</a> object representing the folder containing the item.
     * @param {Pointer<ITEMIDLIST>} pidl Type: <b>PCUITEMID_CHILD</b>
     * 
     * The item's PIDL, relative to <i>psf</i>.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-inamespacewalkcb-founditem
     */
    FoundItem(psf, pidl) {
        result := ComCall(3, this, "ptr", psf, ITEMIDLIST.Ptr, pidl, "HRESULT")
        return result
    }

    /**
     * Called when a folder is about to be entered during a namespace walk. Use this method for any initialization of the retrieved item.
     * @param {IShellFolder} psf Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-ishellfolder">IShellFolder</a>*</b>
     * 
     * A pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-ishellfolder">IShellFolder</a> object representing the parent of the folder designated by <i>pidl</i>.
     * @param {Pointer<ITEMIDLIST>} pidl Type: <b>PCUITEMID_CHILD</b>
     * 
     * The PIDL, relative to <i>psf</i>, of the folder being entered.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-inamespacewalkcb-enterfolder
     */
    EnterFolder(psf, pidl) {
        result := ComCall(4, this, "ptr", psf, ITEMIDLIST.Ptr, pidl, "HRESULT")
        return result
    }

    /**
     * Called after a namespace walk through a folder. Use this method to perform any necessary cleanup following the actions performed by INamespaceWalkCB::EnterFolder or INamespaceWalkCB::FoundItem.
     * @param {IShellFolder} psf Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-ishellfolder">IShellFolder</a>*</b>
     * 
     * A pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-ishellfolder">IShellFolder</a> object representing the parent of the folder designated by <i>pidl</i>.
     * @param {Pointer<ITEMIDLIST>} pidl Type: <b>PCUITEMID_CHILD</b>
     * 
     * A PIDL, relative to <i>psf</i>, of the folder being exited.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-inamespacewalkcb-leavefolder
     */
    LeaveFolder(psf, pidl) {
        result := ComCall(5, this, "ptr", psf, ITEMIDLIST.Ptr, pidl, "HRESULT")
        return result
    }

    /**
     * Initializes the window title and cancel button text of the progress dialog box displayed during the namespace walk.
     * @param {Pointer<PWSTR>} ppszTitle Type: <b>LPWSTR*</b>
     * 
     * When this method returns, contains a pointer to a null-terminated string that contains the title to be used for the dialog box.
     * @param {Pointer<PWSTR>} ppszCancel Type: <b>LPWSTR*</b>
     * 
     * When this method returns, contains a pointer to a null-terminated string that contains the text displayed on the button that cancels the namespace walk.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-inamespacewalkcb-initializeprogressdialog
     */
    InitializeProgressDialog(ppszTitle, ppszCancel) {
        ppszTitleMarshal := ppszTitle is VarRef ? "ptr*" : "ptr"
        ppszCancelMarshal := ppszCancel is VarRef ? "ptr*" : "ptr"

        result := ComCall(6, this, ppszTitleMarshal, ppszTitle, ppszCancelMarshal, ppszCancel, "HRESULT")
        return result
    }

    Query(iid) {
        if (INamespaceWalkCB.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.FoundItem := CallbackCreate(GetMethod(implObj, "FoundItem"), flags, 3)
        this.vtbl.EnterFolder := CallbackCreate(GetMethod(implObj, "EnterFolder"), flags, 3)
        this.vtbl.LeaveFolder := CallbackCreate(GetMethod(implObj, "LeaveFolder"), flags, 3)
        this.vtbl.InitializeProgressDialog := CallbackCreate(GetMethod(implObj, "InitializeProgressDialog"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.FoundItem)
        CallbackFree(this.vtbl.EnterFolder)
        CallbackFree(this.vtbl.LeaveFolder)
        CallbackFree(this.vtbl.InitializeProgressDialog)
    }
}
