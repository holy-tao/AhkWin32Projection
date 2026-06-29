#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IDebugHostStatus.ahk" { IDebugHostStatus }

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.Extensions
 */
export default struct IDebugHostStatus2 extends IDebugHostStatus {
    /**
     * The interface identifier for IDebugHostStatus2
     * @type {Guid}
     */
    static IID := Guid("{4a168d3f-04d0-49c4-8f9a-7b5b3108c6c6}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IDebugHostStatus2 interfaces
    */
    struct Vtbl extends IDebugHostStatus.Vtbl {
        SetUserInterrupt   : IntPtr
        ClearUserInterrupt : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IDebugHostStatus2.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    SetUserInterrupt() {
        result := ComCall(4, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    ClearUserInterrupt() {
        result := ComCall(5, this, "HRESULT")
        return result
    }

    Query(iid) {
        if (IDebugHostStatus2.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.SetUserInterrupt := CallbackCreate(GetMethod(implObj, "SetUserInterrupt"), flags, 1)
        this.vtbl.ClearUserInterrupt := CallbackCreate(GetMethod(implObj, "ClearUserInterrupt"), flags, 1)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.SetUserInterrupt)
        CallbackFree(this.vtbl.ClearUserInterrupt)
    }
}
