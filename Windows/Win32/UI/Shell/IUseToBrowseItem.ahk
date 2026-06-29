#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\IRelatedItem.ahk" { IRelatedItem }

/**
 * This interface is not supported. Do not use.
 * @see https://learn.microsoft.com/windows/win32/api/shobjidl/nn-shobjidl-iusetobrowseitem
 * @namespace Windows.Win32.UI.Shell
 */
export default struct IUseToBrowseItem extends IRelatedItem {
    /**
     * The interface identifier for IUseToBrowseItem
     * @type {Guid}
     */
    static IID := Guid("{05edda5c-98a3-4717-8adb-c5e7da991eb1}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IUseToBrowseItem interfaces
    */
    struct Vtbl extends IRelatedItem.Vtbl {
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IUseToBrowseItem.Vtbl()
        }
        super.__New(implObj, flags)
    }

    Query(iid) {
        if (IUseToBrowseItem.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
    }
}
