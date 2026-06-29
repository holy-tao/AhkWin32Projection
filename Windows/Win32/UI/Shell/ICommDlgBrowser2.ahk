#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\ICommDlgBrowser.ahk" { ICommDlgBrowser }
#Import ".\IShellView.ahk" { IShellView }

/**
 * Extends the capabilities of ICommDlgBrowser. This interface is exposed by the common file dialog boxes when they host a Shell browser. A pointer to ICommDlgBrowser2 can be obtained by calling QueryInterface on the IShellBrowser object.
 * @remarks
 * This interface also provides the methods of the <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-icommdlgbrowser">ICommDlgBrowser</a> interface, from which it inherits.
 * 
 * <div class="alert"><b>Note</b>  In Windows XP and earlier, this interface was defined in Shlobj.h.</div>
 * <div> </div>
 * This interface is implemented only by common file dialog boxes.
 * 
 * Use <b>ICommDlgBrowser2</b> when your Shell view is hosted inside a common dialog box.
 * 
 * <b>ICommDlgBrowser2</b> implements all the <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-icommdlgbrowser">ICommDlgBrowser</a> methods, as well as <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nn-unknwn-iunknown">IUnknown</a>. The listed methods are specific to <b>ICommDlgBrowser2</b>.
 * 
 * <div class="alert"><b>Note</b>  <b>Windows Vista and later.</b> Prior to Windows Vista this interface was declared in Shlobj.h.</div>
 * <div> </div>
 * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nn-shobjidl_core-icommdlgbrowser2
 * @namespace Windows.Win32.UI.Shell
 */
export default struct ICommDlgBrowser2 extends ICommDlgBrowser {
    /**
     * The interface identifier for ICommDlgBrowser2
     * @type {Guid}
     */
    static IID := Guid("{10339516-2894-11d2-9039-00c04f8eeb3e}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ICommDlgBrowser2 interfaces
    */
    struct Vtbl extends ICommDlgBrowser.Vtbl {
        Notify             : IntPtr
        GetDefaultMenuText : IntPtr
        GetViewFlags       : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ICommDlgBrowser2.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Called by a Shell view to notify the common dialog box hosting it that an event has occurred.
     * @param {IShellView} ppshv Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-ishellview">IShellView</a>*</b>
     * 
     * A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-ishellview">IShellView</a> interface of the hosted view.
     * @param {Integer} dwNotifyType Type: <b>DWORD</b>
     * 
     * A flag that can can take one of the following two values.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-icommdlgbrowser2-notify
     */
    Notify(ppshv, dwNotifyType) {
        result := ComCall(6, this, "ptr", ppshv, "uint", dwNotifyType, "HRESULT")
        return result
    }

    /**
     * Called by the Shell view to get the default shortcut menu text.
     * @param {IShellView} ppshv Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-ishellview">IShellView</a>*</b>
     * 
     * A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-ishellview">IShellView</a> interface of the hosted view.
     * @param {PWSTR} pszText Type: <b>WCHAR*</b>
     * 
     * A pointer to a buffer that is used by the Shell browser to return the default shortcut menu text.
     * @param {Integer} cchMax Type: <b>int</b>
     * 
     * The size of the <i>pszText</i> buffer, in characters. It should be at least the maximum allowable path length (MAX_PATH) in size.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * Returns S_OK if a new default shortcut menu text was returned in <i>pshv</i>. If S_FALSE is returned, use the normal default text. Otherwise, returns a standard COM error value.
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-icommdlgbrowser2-getdefaultmenutext
     */
    GetDefaultMenuText(ppshv, pszText, cchMax) {
        pszText := pszText is String ? StrPtr(pszText) : pszText

        result := ComCall(7, this, "ptr", ppshv, "ptr", pszText, "int", cchMax, "HRESULT")
        return result
    }

    /**
     * Called when the view must determine if special customization needs to be made for the common dialog browser.
     * @returns {Integer} Type: <b>DWORD*</b>
     * 
     * A pointer to a <b>DWORD</b> value that controls the behavior of the view when in common dialog mode.
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-icommdlgbrowser2-getviewflags
     */
    GetViewFlags() {
        result := ComCall(8, this, "uint*", &pdwFlags := 0, "HRESULT")
        return pdwFlags
    }

    Query(iid) {
        if (ICommDlgBrowser2.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.Notify := CallbackCreate(GetMethod(implObj, "Notify"), flags, 3)
        this.vtbl.GetDefaultMenuText := CallbackCreate(GetMethod(implObj, "GetDefaultMenuText"), flags, 4)
        this.vtbl.GetViewFlags := CallbackCreate(GetMethod(implObj, "GetViewFlags"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.Notify)
        CallbackFree(this.vtbl.GetDefaultMenuText)
        CallbackFree(this.vtbl.GetViewFlags)
    }
}
