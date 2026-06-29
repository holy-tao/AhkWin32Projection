#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\Guid.ahk" { Guid }
#Import ".\ICorProfilerCallback10.ahk" { ICorProfilerCallback10 }
#Import "..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\..\Foundation\BOOL.ahk" { BOOL }

/**
 * @namespace Windows.Win32.System.Diagnostics.ClrProfiling
 */
export default struct ICorProfilerCallback11 extends ICorProfilerCallback10 {
    /**
     * The interface identifier for ICorProfilerCallback11
     * @type {Guid}
     */
    static IID := Guid("{42350846-aaed-47f7-b128-fd0c98881cde}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ICorProfilerCallback11 interfaces
    */
    struct Vtbl extends ICorProfilerCallback10.Vtbl {
        LoadAsNotificationOnly : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ICorProfilerCallback11.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {Pointer<BOOL>} pbNotificationOnly 
     * @returns {HRESULT} 
     */
    LoadAsNotificationOnly(pbNotificationOnly) {
        pbNotificationOnlyMarshal := pbNotificationOnly is VarRef ? "int*" : "ptr"

        result := ComCall(97, this, pbNotificationOnlyMarshal, pbNotificationOnly, "HRESULT")
        return result
    }

    Query(iid) {
        if (ICorProfilerCallback11.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.LoadAsNotificationOnly := CallbackCreate(GetMethod(implObj, "LoadAsNotificationOnly"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.LoadAsNotificationOnly)
    }
}
