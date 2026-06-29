#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\Guid.ahk" { Guid }
#Import ".\IHttpNegotiate.ahk" { IHttpNegotiate }
#Import "..\..\..\Foundation\HRESULT.ahk" { HRESULT }

/**
 * @namespace Windows.Win32.System.Com.Urlmon
 */
export default struct IHttpNegotiate2 extends IHttpNegotiate {
    /**
     * The interface identifier for IHttpNegotiate2
     * @type {Guid}
     */
    static IID := Guid("{4f9f9fcb-e0f4-48eb-b7ab-fa2ea9365cb4}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IHttpNegotiate2 interfaces
    */
    struct Vtbl extends IHttpNegotiate.Vtbl {
        GetRootSecurityId : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IHttpNegotiate2.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {Pointer<Integer>} pcbSecurityId 
     * @param {Pointer} dwReserved 
     * @returns {Integer} 
     */
    GetRootSecurityId(pcbSecurityId, dwReserved) {
        pcbSecurityIdMarshal := pcbSecurityId is VarRef ? "uint*" : "ptr"

        result := ComCall(5, this, "char*", &pbSecurityId := 0, pcbSecurityIdMarshal, pcbSecurityId, "ptr", dwReserved, "HRESULT")
        return pbSecurityId
    }

    Query(iid) {
        if (IHttpNegotiate2.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetRootSecurityId := CallbackCreate(GetMethod(implObj, "GetRootSecurityId"), flags, 4)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetRootSecurityId)
    }
}
