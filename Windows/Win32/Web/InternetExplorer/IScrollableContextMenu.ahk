#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * @namespace Windows.Win32.Web.InternetExplorer
 */
export default struct IScrollableContextMenu extends IUnknown {
    /**
     * The interface identifier for IScrollableContextMenu
     * @type {Guid}
     */
    static IID := Guid("{30510854-98b5-11cf-bb82-00aa00bdce0b}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IScrollableContextMenu interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        AddItem   : IntPtr
        ShowModal : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IScrollableContextMenu.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {PWSTR} itemText 
     * @param {Integer} cmdID 
     * @returns {HRESULT} 
     */
    AddItem(itemText, cmdID) {
        itemText := itemText is String ? StrPtr(itemText) : itemText

        result := ComCall(3, this, "ptr", itemText, "uint", cmdID, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} x 
     * @param {Integer} y 
     * @returns {Integer} 
     */
    ShowModal(x, y) {
        result := ComCall(4, this, "int", x, "int", y, "uint*", &cmdID := 0, "HRESULT")
        return cmdID
    }

    Query(iid) {
        if (IScrollableContextMenu.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.AddItem := CallbackCreate(GetMethod(implObj, "AddItem"), flags, 3)
        this.vtbl.ShowModal := CallbackCreate(GetMethod(implObj, "ShowModal"), flags, 4)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.AddItem)
        CallbackFree(this.vtbl.ShowModal)
    }
}
