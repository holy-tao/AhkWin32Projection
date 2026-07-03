#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\..\Com\IUnknown.ahk" { IUnknown }

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.Extensions
 */
export default struct IDebugHostStatus extends IUnknown {
    /**
     * The interface identifier for IDebugHostStatus
     * @type {Guid}
     */
    static IID := Guid("{4f3e1ce2-86b2-4c7a-9c65-d0a9d0eecf44}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IDebugHostStatus interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        PollUserInterrupt : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IDebugHostStatus.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    PollUserInterrupt() {
        result := ComCall(3, this, "int*", &interruptRequested := 0, "HRESULT")
        return interruptRequested
    }

    Query(iid) {
        if (IDebugHostStatus.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.PollUserInterrupt := CallbackCreate(GetMethod(implObj, "PollUserInterrupt"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.PollUserInterrupt)
    }
}
