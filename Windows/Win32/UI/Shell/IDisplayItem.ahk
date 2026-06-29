#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\IRelatedItem.ahk" { IRelatedItem }

/**
 * Exposes methods that find a version of the current item to be used to get display properties, such as the item name, that will be displayed in the UI.
 * @remarks
 * This interface provides only the methods of the <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-irelateditem">IRelatedItem</a> interface, from which it inherits.
 * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nn-shobjidl_core-idisplayitem
 * @namespace Windows.Win32.UI.Shell
 */
export default struct IDisplayItem extends IRelatedItem {
    /**
     * The interface identifier for IDisplayItem
     * @type {Guid}
     */
    static IID := Guid("{c6fd5997-9f6b-4888-8703-94e80e8cde3f}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IDisplayItem interfaces
    */
    struct Vtbl extends IRelatedItem.Vtbl {
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IDisplayItem.Vtbl()
        }
        super.__New(implObj, flags)
    }

    Query(iid) {
        if (IDisplayItem.IID.Equals(iid)) {
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
