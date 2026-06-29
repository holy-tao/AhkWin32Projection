#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IShellItem.ahk" { IShellItem }
#Import ".\IFileDialog.ahk" { IFileDialog }

/**
 * Extends the IFileDialog interface by providing methods that allow the caller to name a specific, restricted location that can be browsed in the common file dialog as well as to specify alternate text to display as a label on the Cancel button.
 * @remarks
 * This interface also provides the methods of the <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-ifiledialog">IFileDialog</a> interface, from which it inherits.
 * 
 * <h3><a id="When_to_Implement"></a><a id="when_to_implement"></a><a id="WHEN_TO_IMPLEMENT"></a>When to Implement</h3>
 * An implementation of this interface is provided with Windows. Third parties do not provide custom implementations.
 * 
 * <h3><a id="When_to_Use"></a><a id="when_to_use"></a><a id="WHEN_TO_USE"></a>When to Use</h3>
 * Use the methods of this interface in two instances:
 *             
 *                 
 * 
 * <ul>
 * <li>When you want to restrict the dialog's navigation to a specific namespace.</li>
 * <li>When you need the dialog's <b>Cancel</b> button to be labeled differently in keeping with your functionality.</li>
 * </ul>
 * @see https://learn.microsoft.com/windows/win32/api/shobjidl/nn-shobjidl-ifiledialog2
 * @namespace Windows.Win32.UI.Shell
 */
export default struct IFileDialog2 extends IFileDialog {
    /**
     * The interface identifier for IFileDialog2
     * @type {Guid}
     */
    static IID := Guid("{61744fc7-85b5-4791-a9b0-272276309b13}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IFileDialog2 interfaces
    */
    struct Vtbl extends IFileDialog.Vtbl {
        SetCancelButtonLabel : IntPtr
        SetNavigationRoot    : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IFileDialog2.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Replaces the default text &quot;Cancel&quot; on the common file dialog's Cancel button.
     * @remarks
     * Changing the text on the Cancel button can be useful for situations where the IFileDialogEvents::OnFileOk method is used to accumulate items, and the button text should be Done instead of Cancel, for example.
     * @param {PWSTR} pszLabel Type: <b>LPCWSTR</b>
     * 
     * Pointer to a string that contains the new text to display on the button.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl/nf-shobjidl-ifiledialog2-setcancelbuttonlabel
     */
    SetCancelButtonLabel(pszLabel) {
        pszLabel := pszLabel is String ? StrPtr(pszLabel) : pszLabel

        result := ComCall(27, this, "ptr", pszLabel, "HRESULT")
        return result
    }

    /**
     * Specifies a top-level location from which to begin browsing a namespace, for instance in the Save dialog's Browse folder option. Users cannot navigate above this location.
     * @remarks
     * <b>SetNavigationRoot</b> can be used by applications that want to restrict navigation to a certain area of the Shell namespace. Items in the navigation pane are replaced with the supplied item, to guide the user from navigating outside of this part of the namespace.
     * 
     * This method cannot be called while the dialog is being displayed.
     * @param {IShellItem} psi Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-ishellitem">IShellItem</a></b>
     * 
     * Pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-ishellitem">IShellItem</a> object that represents the navigation root.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl/nf-shobjidl-ifiledialog2-setnavigationroot
     */
    SetNavigationRoot(psi) {
        result := ComCall(28, this, "ptr", psi, "HRESULT")
        return result
    }

    Query(iid) {
        if (IFileDialog2.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.SetCancelButtonLabel := CallbackCreate(GetMethod(implObj, "SetCancelButtonLabel"), flags, 2)
        this.vtbl.SetNavigationRoot := CallbackCreate(GetMethod(implObj, "SetNavigationRoot"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.SetCancelButtonLabel)
        CallbackFree(this.vtbl.SetNavigationRoot)
    }
}
