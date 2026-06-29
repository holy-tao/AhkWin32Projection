#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\IRelatedItem.ahk" { IRelatedItem }

/**
 * Used to obtain the immediately underlying representation of an item's path.
 * @remarks
 * This interface provides only the methods of the <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-irelateditem">IRelatedItem</a> interface, from which it inherits.
 * 
 * <h3><a id="When_to_Implement"></a><a id="when_to_implement"></a><a id="WHEN_TO_IMPLEMENT"></a>When to Implement</h3>
 * An implementation of this interface for system-provided data objects is provided with Windows. Custom data sources that want to expose this information must implement the interface as part of their data object.
 * 
 * <h3><a id="When_to_Use"></a><a id="when_to_use"></a><a id="WHEN_TO_USE"></a>When to Use</h3>
 * Use this interface to uncovers a single level of aliasing. For instance, if you have the path of an item in the Documents library, this interface reveals the path of the item in the location that was added to the library. Whether this is the file system path depends on the nature of that original location. For a full recursion to the source item, use <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-iidentityname">IIdentityName</a>.
 * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nn-shobjidl_core-idelegateitem
 * @namespace Windows.Win32.UI.Shell
 */
export default struct IDelegateItem extends IRelatedItem {
    /**
     * The interface identifier for IDelegateItem
     * @type {Guid}
     */
    static IID := Guid("{3c5a1c94-c951-4cb7-bb6d-3b93f30cce93}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IDelegateItem interfaces
    */
    struct Vtbl extends IRelatedItem.Vtbl {
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IDelegateItem.Vtbl()
        }
        super.__New(implObj, flags)
    }

    Query(iid) {
        if (IDelegateItem.IID.Equals(iid)) {
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
