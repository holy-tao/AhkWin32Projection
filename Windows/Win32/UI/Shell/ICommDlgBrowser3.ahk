#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import ".\ICommDlgBrowser2.ahk" { ICommDlgBrowser2 }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IShellView.ahk" { IShellView }

/**
 * Extends the capabilities of ICommDlgBrowser2, and used by the common file dialog boxes when they host a Shell browser.
 * @remarks
 * This interface also provides the methods of the <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-icommdlgbrowser">ICommDlgBrowser</a> and <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-icommdlgbrowser2">ICommDlgBrowser2</a> interfaces, from which it inherits.
 * 
 * A pointer to <b>ICommDlgBrowser3</b> can be obtained by calling <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-queryinterface(q)">QueryInterface</a> on the <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-icommdlgbrowser2">ICommDlgBrowser2</a> object.
 * @see https://learn.microsoft.com/windows/win32/api/shobjidl/nn-shobjidl-icommdlgbrowser3
 * @namespace Windows.Win32.UI.Shell
 */
export default struct ICommDlgBrowser3 extends ICommDlgBrowser2 {
    /**
     * The interface identifier for ICommDlgBrowser3
     * @type {Guid}
     */
    static IID := Guid("{c8ad25a1-3294-41ee-8165-71174bd01c57}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ICommDlgBrowser3 interfaces
    */
    struct Vtbl extends ICommDlgBrowser2.Vtbl {
        OnColumnClicked  : IntPtr
        GetCurrentFilter : IntPtr
        OnPreViewCreated : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ICommDlgBrowser3.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Called after a specified column is clicked in the IShellView interface.
     * @param {IShellView} ppshv Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-ishellview">IShellView</a>*</b>
     * 
     * A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-ishellview">IShellView</a> interface of the hosted view.
     * @param {Integer} iColumn Type: <b>int</b>
     * 
     * The index of the column clicked.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl/nf-shobjidl-icommdlgbrowser3-oncolumnclicked
     */
    OnColumnClicked(ppshv, iColumn) {
        result := ComCall(9, this, "ptr", ppshv, "int", iColumn, "HRESULT")
        return result
    }

    /**
     * Gets the current filter as a Unicode string.
     * @param {PWSTR} pszFileSpec Type: <b>LPWSTR</b>
     * 
     * Contains a pointer to the current filter path/file as a Unicode string.
     * @param {Integer} cchFileSpec Type: <b>int</b>
     * 
     * Specifies the path/file length, in characters.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl/nf-shobjidl-icommdlgbrowser3-getcurrentfilter
     */
    GetCurrentFilter(pszFileSpec, cchFileSpec) {
        pszFileSpec := pszFileSpec is String ? StrPtr(pszFileSpec) : pszFileSpec

        result := ComCall(10, this, "ptr", pszFileSpec, "int", cchFileSpec, "HRESULT")
        return result
    }

    /**
     * Called after a specified preview is created in the IShellView interface.
     * @param {IShellView} ppshv Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-ishellview">IShellView</a>*</b>
     * 
     * A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-ishellview">IShellView</a> interface of the hosted view.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl/nf-shobjidl-icommdlgbrowser3-onpreviewcreated
     */
    OnPreViewCreated(ppshv) {
        result := ComCall(11, this, "ptr", ppshv, "HRESULT")
        return result
    }

    Query(iid) {
        if (ICommDlgBrowser3.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.OnColumnClicked := CallbackCreate(GetMethod(implObj, "OnColumnClicked"), flags, 3)
        this.vtbl.GetCurrentFilter := CallbackCreate(GetMethod(implObj, "GetCurrentFilter"), flags, 3)
        this.vtbl.OnPreViewCreated := CallbackCreate(GetMethod(implObj, "OnPreViewCreated"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.OnColumnClicked)
        CallbackFree(this.vtbl.GetCurrentFilter)
        CallbackFree(this.vtbl.OnPreViewCreated)
    }
}
