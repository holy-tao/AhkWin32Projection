#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\IRelatedItem.ahk" { IRelatedItem }

/**
 * Used by a copy engine to get the item on which to call QueryInterface to return a pointer to interface ITransferDestination or interface ITransferSource. These interfaces can be queried and enumerated for copy, move, or delete operations.
 * @remarks
 * This interface provides only the methods of the <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-irelateditem">IRelatedItem</a> interface, from which it inherits.
 * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nn-shobjidl_core-itransfermediumitem
 * @namespace Windows.Win32.UI.Shell
 */
export default struct ITransferMediumItem extends IRelatedItem {
    /**
     * The interface identifier for ITransferMediumItem
     * @type {Guid}
     */
    static IID := Guid("{77f295d5-2d6f-4e19-b8ae-322f3e721ab5}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ITransferMediumItem interfaces
    */
    struct Vtbl extends IRelatedItem.Vtbl {
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ITransferMediumItem.Vtbl()
        }
        super.__New(implObj, flags)
    }

    Query(iid) {
        if (ITransferMediumItem.IID.Equals(iid)) {
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
