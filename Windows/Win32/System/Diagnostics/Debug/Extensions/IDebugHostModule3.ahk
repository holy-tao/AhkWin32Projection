#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\..\Guid.ahk" { Guid }
#Import ".\IDebugHostModule2.ahk" { IDebugHostModule2 }
#Import ".\Location.ahk" { Location }
#Import "..\..\..\..\Foundation\HRESULT.ahk" { HRESULT }

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.Extensions
 */
export default struct IDebugHostModule3 extends IDebugHostModule2 {
    /**
     * The interface identifier for IDebugHostModule3
     * @type {Guid}
     */
    static IID := Guid("{68576417-9fab-4c69-8977-3a4d87cf08fd}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IDebugHostModule3 interfaces
    */
    struct Vtbl extends IDebugHostModule2.Vtbl {
        GetRange : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IDebugHostModule3.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {Pointer<Location>} moduleStart 
     * @param {Pointer<Location>} moduleEnd 
     * @returns {HRESULT} 
     */
    GetRange(moduleStart, moduleEnd) {
        result := ComCall(17, this, Location.Ptr, moduleStart, Location.Ptr, moduleEnd, "HRESULT")
        return result
    }

    Query(iid) {
        if (IDebugHostModule3.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetRange := CallbackCreate(GetMethod(implObj, "GetRange"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetRange)
    }
}
