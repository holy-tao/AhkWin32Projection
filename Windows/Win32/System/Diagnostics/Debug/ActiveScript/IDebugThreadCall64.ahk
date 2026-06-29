#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\..\Com\IUnknown.ahk" { IUnknown }

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.ActiveScript
 */
export default struct IDebugThreadCall64 extends IUnknown {
    /**
     * The interface identifier for IDebugThreadCall64
     * @type {Guid}
     */
    static IID := Guid("{cb3fa335-e979-42fd-9fcf-a7546a0f3905}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IDebugThreadCall64 interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        ThreadCallHandler : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IDebugThreadCall64.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {Integer} dwParam1 
     * @param {Integer} dwParam2 
     * @param {Integer} dwParam3 
     * @returns {HRESULT} 
     */
    ThreadCallHandler(dwParam1, dwParam2, dwParam3) {
        result := ComCall(3, this, "uint", dwParam1, "uint", dwParam2, "uint", dwParam3, "HRESULT")
        return result
    }

    Query(iid) {
        if (IDebugThreadCall64.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.ThreadCallHandler := CallbackCreate(GetMethod(implObj, "ThreadCallHandler"), flags, 4)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.ThreadCallHandler)
    }
}
