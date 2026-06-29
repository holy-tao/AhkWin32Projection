#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\..\Guid.ahk" { Guid }
#Import ".\IActiveScriptParseProcedure64.ahk" { IActiveScriptParseProcedure64 }

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.ActiveScript
 */
export default struct IActiveScriptParseProcedure2_64 extends IActiveScriptParseProcedure64 {
    /**
     * The interface identifier for IActiveScriptParseProcedure2_64
     * @type {Guid}
     */
    static IID := Guid("{fe7c4271-210c-448d-9f54-76dab7047b28}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IActiveScriptParseProcedure2_64 interfaces
    */
    struct Vtbl extends IActiveScriptParseProcedure64.Vtbl {
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IActiveScriptParseProcedure2_64.Vtbl()
        }
        super.__New(implObj, flags)
    }

    Query(iid) {
        if (IActiveScriptParseProcedure2_64.IID.Equals(iid)) {
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
