#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\..\Guid.ahk" { Guid }
#Import ".\IDebugApplicationThread.ahk" { IDebugApplicationThread }
#Import "..\..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IDebugThreadCall64.ahk" { IDebugThreadCall64 }

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.ActiveScript
 */
export default struct IDebugApplicationThread64 extends IDebugApplicationThread {
    /**
     * The interface identifier for IDebugApplicationThread64
     * @type {Guid}
     */
    static IID := Guid("{9dac5886-dbad-456d-9dee-5dec39ab3dda}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IDebugApplicationThread64 interfaces
    */
    struct Vtbl extends IDebugApplicationThread.Vtbl {
        SynchronousCallIntoThread64 : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IDebugApplicationThread64.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {IDebugThreadCall64} pstcb 
     * @param {Integer} dwParam1 
     * @param {Integer} dwParam2 
     * @param {Integer} dwParam3 
     * @returns {HRESULT} 
     */
    SynchronousCallIntoThread64(pstcb, dwParam1, dwParam2, dwParam3) {
        result := ComCall(17, this, "ptr", pstcb, "uint", dwParam1, "uint", dwParam2, "uint", dwParam3, "HRESULT")
        return result
    }

    Query(iid) {
        if (IDebugApplicationThread64.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.SynchronousCallIntoThread64 := CallbackCreate(GetMethod(implObj, "SynchronousCallIntoThread64"), flags, 5)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.SynchronousCallIntoThread64)
    }
}
