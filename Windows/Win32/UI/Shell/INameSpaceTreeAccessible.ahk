#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IShellItem.ahk" { IShellItem }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }
#Import "..\..\System\Variant\VARIANT.ahk" { VARIANT }

/**
 * Exposes methods that perform accessibility actions on a Shell item from a namespace tree control.
 * @remarks
 * This interface is used only by <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-inamespacetreecontrol">INameSpaceTreeControl</a> (CLSID_NameSpaceTreeControl).
 * @see https://learn.microsoft.com/windows/win32/api/shobjidl/nn-shobjidl-inamespacetreeaccessible
 * @namespace Windows.Win32.UI.Shell
 */
export default struct INameSpaceTreeAccessible extends IUnknown {
    /**
     * The interface identifier for INameSpaceTreeAccessible
     * @type {Guid}
     */
    static IID := Guid("{71f312de-43ed-4190-8477-e9536b82350b}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for INameSpaceTreeAccessible interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        OnGetDefaultAccessibilityAction : IntPtr
        OnDoDefaultAccessibilityAction  : IntPtr
        OnGetAccessibilityRole          : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := INameSpaceTreeAccessible.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Gets the default accessibility action for a Shell item.
     * @remarks
     * This method is called when the default accessibility action for a Shell item is retrieved.
     * @param {IShellItem} psi Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-ishellitem">IShellItem</a>*</b>
     * 
     * Pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-ishellitem">IShellItem</a>.
     * @returns {BSTR} Type: <b><a href="https://docs.microsoft.com/previous-versions/windows/desktop/automat/bstr">BSTR</a>*</b>
     * 
     * When this method returns, contains a <a href="https://docs.microsoft.com/previous-versions/windows/desktop/automat/bstr">BSTR</a> that specifies the default, accessibility action.
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl/nf-shobjidl-inamespacetreeaccessible-ongetdefaultaccessibilityaction
     */
    OnGetDefaultAccessibilityAction(psi) {
        pbstrDefaultAction := BSTR.Owned()
        result := ComCall(3, this, "ptr", psi, BSTR.Ptr, pbstrDefaultAction, "HRESULT")
        return pbstrDefaultAction
    }

    /**
     * Invokes the default accessibility action on a Shell item.
     * @param {IShellItem} psi Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-ishellitem">IShellItem</a>*</b>
     * 
     * Pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-ishellitem">IShellItem</a>.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl/nf-shobjidl-inamespacetreeaccessible-ondodefaultaccessibilityaction
     */
    OnDoDefaultAccessibilityAction(psi) {
        result := ComCall(4, this, "ptr", psi, "HRESULT")
        return result
    }

    /**
     * Gets the accessibility role for a Shell item.
     * @remarks
     * This method is called when the accessibility role for a Shell item is retrieved.
     * @param {IShellItem} psi Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-ishellitem">IShellItem</a>*</b>
     * 
     * Pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-ishellitem">IShellItem</a>.
     * @returns {VARIANT} Type: <b>VARIANT*</b>
     * 
     * When this method returns, contains a <a href="https://docs.microsoft.com/windows/desktop/api/oaidl/ns-oaidl-variant">VARIANT</a> that specifies the role.
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl/nf-shobjidl-inamespacetreeaccessible-ongetaccessibilityrole
     */
    OnGetAccessibilityRole(psi) {
        pvarRole := VARIANT()
        result := ComCall(5, this, "ptr", psi, VARIANT.Ptr, pvarRole, "HRESULT")
        return pvarRole
    }

    Query(iid) {
        if (INameSpaceTreeAccessible.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.OnGetDefaultAccessibilityAction := CallbackCreate(GetMethod(implObj, "OnGetDefaultAccessibilityAction"), flags, 3)
        this.vtbl.OnDoDefaultAccessibilityAction := CallbackCreate(GetMethod(implObj, "OnDoDefaultAccessibilityAction"), flags, 2)
        this.vtbl.OnGetAccessibilityRole := CallbackCreate(GetMethod(implObj, "OnGetAccessibilityRole"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.OnGetDefaultAccessibilityAction)
        CallbackFree(this.vtbl.OnDoDefaultAccessibilityAction)
        CallbackFree(this.vtbl.OnGetAccessibilityRole)
    }
}
