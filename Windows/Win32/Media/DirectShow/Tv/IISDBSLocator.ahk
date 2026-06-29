#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\Guid.ahk" { Guid }
#Import ".\IDVBSLocator.ahk" { IDVBSLocator }

/**
 * @namespace Windows.Win32.Media.DirectShow.Tv
 */
export default struct IISDBSLocator extends IDVBSLocator {
    /**
     * The interface identifier for IISDBSLocator
     * @type {Guid}
     */
    static IID := Guid("{c9897087-e29c-473f-9e4b-7072123dea14}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IISDBSLocator interfaces
    */
    struct Vtbl extends IDVBSLocator.Vtbl {
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IISDBSLocator.Vtbl()
        }
        super.__New(implObj, flags)
    }

    Query(iid) {
        if (IISDBSLocator.IID.Equals(iid)) {
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
