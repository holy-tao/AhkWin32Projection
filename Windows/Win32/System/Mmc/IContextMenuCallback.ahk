#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\CONTEXTMENUITEM.ahk" { CONTEXTMENUITEM }
#Import "..\Com\IUnknown.ahk" { IUnknown }

/**
 * The IContextMenuCallback interface is used to add menu items to a context menu.
 * @see https://learn.microsoft.com/windows/win32/api/mmc/nn-mmc-icontextmenucallback
 * @namespace Windows.Win32.System.Mmc
 */
export default struct IContextMenuCallback extends IUnknown {
    /**
     * The interface identifier for IContextMenuCallback
     * @type {Guid}
     */
    static IID := Guid("{43136eb7-d36c-11cf-adbc-00aa00a80033}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IContextMenuCallback interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        AddItem : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IContextMenuCallback.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * The IContextMenuCallback::AddItem method adds a single item to a context menu.
     * @param {Pointer<CONTEXTMENUITEM>} pItem A pointer to a 
     * <a href="https://docs.microsoft.com/windows/desktop/api/mmc/ns-mmc-contextmenuitem">CONTEXTMENUITEM</a> structure with the item to be added. This parameter cannot be <b>NULL</b>.
     * @returns {HRESULT} This method can return one of these values.
     * @see https://learn.microsoft.com/windows/win32/api/mmc/nf-mmc-icontextmenucallback-additem
     */
    AddItem(pItem) {
        result := ComCall(3, this, CONTEXTMENUITEM.Ptr, pItem, "HRESULT")
        return result
    }

    Query(iid) {
        if (IContextMenuCallback.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.AddItem := CallbackCreate(GetMethod(implObj, "AddItem"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.AddItem)
    }
}
