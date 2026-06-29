#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IShellFolderViewDual.ahk" { IShellFolderViewDual }

/**
 * Exposes methods that modify the view and select items in the current folder. (IShellFolderViewDual2)
 * @remarks
 * This interface also provides the methods of the <a href="https://docs.microsoft.com/windows/desktop/api/shldisp/nn-shldisp-ishellfolderviewdual">IShellFolderViewDual</a> interface, from which it inherits.
 * @see https://learn.microsoft.com/windows/win32/api/shldisp/nn-shldisp-ishellfolderviewdual2
 * @namespace Windows.Win32.UI.Shell
 */
export default struct IShellFolderViewDual2 extends IShellFolderViewDual {
    /**
     * The interface identifier for IShellFolderViewDual2
     * @type {Guid}
     */
    static IID := Guid("{31c147b6-0ade-4a3c-b514-ddf932ef6d17}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IShellFolderViewDual2 interfaces
    */
    struct Vtbl extends IShellFolderViewDual.Vtbl {
        get_CurrentViewMode : IntPtr
        put_CurrentViewMode : IntPtr
        SelectItemRelative  : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IShellFolderViewDual2.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {Integer} 
     */
    CurrentViewMode {
        get => this.get_CurrentViewMode()
        set => this.put_CurrentViewMode(value)
    }

    /**
     * Gets the current view mode of the current folder.
     * @returns {Integer} Type: <b>uint*</b>
     * 
     * When this method returns, contains a pointer to an unsigned integer that represents the current view mode. For a list of possible values see <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/ne-shobjidl_core-folderviewmode">FOLDERVIEWMODE</a>.
     * @see https://learn.microsoft.com/windows/win32/api/shldisp/nf-shldisp-ishellfolderviewdual2-get_currentviewmode
     */
    get_CurrentViewMode() {
        result := ComCall(16, this, "uint*", &pViewMode := 0, "HRESULT")
        return pViewMode
    }

    /**
     * Sets the current view mode of the current folder.
     * @param {Integer} ViewMode Type: <b>uint</b>
     * 
     * Sets the current view mode. For a list of possible values see <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/ne-shobjidl_core-folderviewmode">FOLDERVIEWMODE</a>.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/shldisp/nf-shldisp-ishellfolderviewdual2-put_currentviewmode
     */
    put_CurrentViewMode(ViewMode) {
        result := ComCall(17, this, "uint", ViewMode, "HRESULT")
        return result
    }

    /**
     * Selects an item relative to the current item.
     * @remarks
     * The current item is defined as the item in the view with the SVSI_SELECTIONMARK state. If there is no item with SVSI_SELECTIONMARK, the method returns S_FALSE and does nothing.
     * @param {Integer} iRelative Type: <b>int</b>
     * 
     * The offset of the item to be selected in relation to the current item.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/shldisp/nf-shldisp-ishellfolderviewdual2-selectitemrelative
     */
    SelectItemRelative(iRelative) {
        result := ComCall(18, this, "int", iRelative, "HRESULT")
        return result
    }

    Query(iid) {
        if (IShellFolderViewDual2.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.get_CurrentViewMode := CallbackCreate(GetMethod(implObj, "get_CurrentViewMode"), flags, 2)
        this.vtbl.put_CurrentViewMode := CallbackCreate(GetMethod(implObj, "put_CurrentViewMode"), flags, 2)
        this.vtbl.SelectItemRelative := CallbackCreate(GetMethod(implObj, "SelectItemRelative"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.get_CurrentViewMode)
        CallbackFree(this.vtbl.put_CurrentViewMode)
        CallbackFree(this.vtbl.SelectItemRelative)
    }
}
