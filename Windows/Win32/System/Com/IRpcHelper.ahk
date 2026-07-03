#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IUnknown.ahk" { IUnknown }

/**
 * @namespace Windows.Win32.System.Com
 */
export default struct IRpcHelper extends IUnknown {
    /**
     * The interface identifier for IRpcHelper
     * @type {Guid}
     */
    static IID := Guid("{00000149-0000-0000-c000-000000000046}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IRpcHelper interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        GetDCOMProtocolVersion : IntPtr
        GetIIDFromOBJREF       : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IRpcHelper.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @returns {Integer} 
     */
    GetDCOMProtocolVersion() {
        result := ComCall(3, this, "uint*", &pComVersion := 0, "HRESULT")
        return pComVersion
    }

    /**
     * 
     * @param {Pointer<Void>} pObjRef 
     * @returns {Pointer<Guid>} 
     */
    GetIIDFromOBJREF(pObjRef) {
        pObjRefMarshal := pObjRef is VarRef ? "ptr" : "ptr"

        result := ComCall(4, this, pObjRefMarshal, pObjRef, "ptr*", &piid := 0, "HRESULT")
        return piid
    }

    Query(iid) {
        if (IRpcHelper.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetDCOMProtocolVersion := CallbackCreate(GetMethod(implObj, "GetDCOMProtocolVersion"), flags, 2)
        this.vtbl.GetIIDFromOBJREF := CallbackCreate(GetMethod(implObj, "GetIIDFromOBJREF"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetDCOMProtocolVersion)
        CallbackFree(this.vtbl.GetIIDFromOBJREF)
    }
}
