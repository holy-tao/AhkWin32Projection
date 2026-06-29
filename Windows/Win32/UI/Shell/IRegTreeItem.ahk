#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * Exposes methods that retrieve and set the state of items in a tree-view control that have the Tree-View Control Window Styles flag set.
 * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nn-shobjidl_core-iregtreeitem
 * @namespace Windows.Win32.UI.Shell
 */
export default struct IRegTreeItem extends IUnknown {
    /**
     * The interface identifier for IRegTreeItem
     * @type {Guid}
     */
    static IID := Guid("{a9521922-0812-4d44-9ec3-7fd38c726f3d}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IRegTreeItem interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        GetCheckState : IntPtr
        SetCheckState : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IRegTreeItem.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Gets the state of a check box item in a tree-view control.
     * @returns {BOOL} Type: <b>BOOL*</b>
     * 
     * A pointer to a <b>BOOL</b> that contains the state of the check box.
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-iregtreeitem-getcheckstate
     */
    GetCheckState() {
        result := ComCall(3, this, BOOL.Ptr, &pbCheck := 0, "HRESULT")
        return pbCheck
    }

    /**
     * Sets the state of a check box item in a tree-view control.
     * @param {BOOL} bCheck Type: <b>BOOL</b>
     * 
     * A <b>BOOL</b> that sets the state of the check box.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-iregtreeitem-setcheckstate
     */
    SetCheckState(bCheck) {
        result := ComCall(4, this, BOOL, bCheck, "HRESULT")
        return result
    }

    Query(iid) {
        if (IRegTreeItem.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetCheckState := CallbackCreate(GetMethod(implObj, "GetCheckState"), flags, 2)
        this.vtbl.SetCheckState := CallbackCreate(GetMethod(implObj, "SetCheckState"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetCheckState)
        CallbackFree(this.vtbl.SetCheckState)
    }
}
