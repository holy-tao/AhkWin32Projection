#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\IUnknown.ahk" { IUnknown }

/**
 * @namespace Windows.Win32.System.Com
 */
export default struct ISupportServerMustBeEqualOrGreaterPrivilegeActivation extends IUnknown {
    /**
     * The interface identifier for ISupportServerMustBeEqualOrGreaterPrivilegeActivation
     * @type {Guid}
     */
    static IID := Guid("{5bdb3ee2-46bc-4313-b5fb-801c360ba5f9}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ISupportServerMustBeEqualOrGreaterPrivilegeActivation interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ISupportServerMustBeEqualOrGreaterPrivilegeActivation.Vtbl()
        }
        super.__New(implObj, flags)
    }

    Query(iid) {
        if (ISupportServerMustBeEqualOrGreaterPrivilegeActivation.IID.Equals(iid)) {
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
