#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\Guid.ahk" { Guid }
#Import ".\IHttpNegotiate2.ahk" { IHttpNegotiate2 }
#Import "..\..\..\Foundation\HRESULT.ahk" { HRESULT }

/**
 * @namespace Windows.Win32.System.Com.Urlmon
 */
export default struct IHttpNegotiate3 extends IHttpNegotiate2 {
    /**
     * The interface identifier for IHttpNegotiate3
     * @type {Guid}
     */
    static IID := Guid("{57b6c80a-34c2-4602-bc26-66a02fc57153}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IHttpNegotiate3 interfaces
    */
    struct Vtbl extends IHttpNegotiate2.Vtbl {
        GetSerializedClientCertContext : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IHttpNegotiate3.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {Pointer<Pointer<Integer>>} ppbCert 
     * @param {Pointer<Integer>} pcbCert 
     * @returns {HRESULT} 
     */
    GetSerializedClientCertContext(ppbCert, pcbCert) {
        ppbCertMarshal := ppbCert is VarRef ? "ptr*" : "ptr"
        pcbCertMarshal := pcbCert is VarRef ? "uint*" : "ptr"

        result := ComCall(6, this, ppbCertMarshal, ppbCert, pcbCertMarshal, pcbCert, "HRESULT")
        return result
    }

    Query(iid) {
        if (IHttpNegotiate3.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetSerializedClientCertContext := CallbackCreate(GetMethod(implObj, "GetSerializedClientCertContext"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetSerializedClientCertContext)
    }
}
