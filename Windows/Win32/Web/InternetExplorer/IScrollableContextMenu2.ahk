#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\IScrollableContextMenu.ahk" { IScrollableContextMenu }
#Import ".\SCROLLABLECONTEXTMENU_PLACEMENT.ahk" { SCROLLABLECONTEXTMENU_PLACEMENT }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }

/**
 * @namespace Windows.Win32.Web.InternetExplorer
 */
export default struct IScrollableContextMenu2 extends IScrollableContextMenu {
    /**
     * The interface identifier for IScrollableContextMenu2
     * @type {Guid}
     */
    static IID := Guid("{f77e9056-8674-4936-924c-0e4a06fa634a}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IScrollableContextMenu2 interfaces
    */
    struct Vtbl extends IScrollableContextMenu.Vtbl {
        AddSeparator : IntPtr
        SetPlacement : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IScrollableContextMenu2.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    AddSeparator() {
        result := ComCall(5, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {SCROLLABLECONTEXTMENU_PLACEMENT} scmp 
     * @returns {HRESULT} 
     */
    SetPlacement(scmp) {
        result := ComCall(6, this, SCROLLABLECONTEXTMENU_PLACEMENT, scmp, "HRESULT")
        return result
    }

    Query(iid) {
        if (IScrollableContextMenu2.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.AddSeparator := CallbackCreate(GetMethod(implObj, "AddSeparator"), flags, 1)
        this.vtbl.SetPlacement := CallbackCreate(GetMethod(implObj, "SetPlacement"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.AddSeparator)
        CallbackFree(this.vtbl.SetPlacement)
    }
}
