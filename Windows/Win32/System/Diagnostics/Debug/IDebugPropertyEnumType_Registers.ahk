#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\Guid.ahk" { Guid }
#Import ".\IDebugPropertyEnumType_All.ahk" { IDebugPropertyEnumType_All }

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug
 */
export default struct IDebugPropertyEnumType_Registers extends IDebugPropertyEnumType_All {
    /**
     * The interface identifier for IDebugPropertyEnumType_Registers
     * @type {Guid}
     */
    static IID := Guid("{51973c59-cb0c-11d0-b5c9-00a0244a0e7a}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IDebugPropertyEnumType_Registers interfaces
    */
    struct Vtbl extends IDebugPropertyEnumType_All.Vtbl {
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IDebugPropertyEnumType_Registers.Vtbl()
        }
        super.__New(implObj, flags)
    }

    Query(iid) {
        if (IDebugPropertyEnumType_Registers.IID.Equals(iid)) {
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
