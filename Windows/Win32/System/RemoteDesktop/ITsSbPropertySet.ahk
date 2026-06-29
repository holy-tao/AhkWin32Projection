#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\Com\StructuredStorage\IPropertyBag.ahk" { IPropertyBag }

/**
 * Can be used to define custom properties as appropriate.
 * @see https://learn.microsoft.com/windows/win32/api/sbtsv/nn-sbtsv-itssbpropertyset
 * @namespace Windows.Win32.System.RemoteDesktop
 */
export default struct ITsSbPropertySet extends IPropertyBag {
    /**
     * The interface identifier for ITsSbPropertySet
     * @type {Guid}
     */
    static IID := Guid("{5c025171-bb1e-4baf-a212-6d5e9774b33b}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ITsSbPropertySet interfaces
    */
    struct Vtbl extends IPropertyBag.Vtbl {
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ITsSbPropertySet.Vtbl()
        }
        super.__New(implObj, flags)
    }

    Query(iid) {
        if (ITsSbPropertySet.IID.Equals(iid)) {
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
