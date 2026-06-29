#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\IConstraintConflict.ahk" { IConstraintConflict }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\Com\IUnknown.ahk" { IUnknown }

/**
 * @namespace Windows.Win32.System.WindowsSync
 */
export default struct ISyncConstraintCallback extends IUnknown {
    /**
     * The interface identifier for ISyncConstraintCallback
     * @type {Guid}
     */
    static IID := Guid("{8af3843e-75b3-438c-bb51-6f020d70d3cb}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ISyncConstraintCallback interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        OnConstraintConflict : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ISyncConstraintCallback.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {IConstraintConflict} pConflict 
     * @returns {HRESULT} 
     */
    OnConstraintConflict(pConflict) {
        result := ComCall(3, this, "ptr", pConflict, "HRESULT")
        return result
    }

    Query(iid) {
        if (ISyncConstraintCallback.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.OnConstraintConflict := CallbackCreate(GetMethod(implObj, "OnConstraintConflict"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.OnConstraintConflict)
    }
}
