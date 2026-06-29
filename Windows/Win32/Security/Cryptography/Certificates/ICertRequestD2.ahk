#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\Guid.ahk" { Guid }
#Import ".\CERTTRANSBLOB.ahk" { CERTTRANSBLOB }
#Import ".\ICertRequestD.ahk" { ICertRequestD }
#Import "..\..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\..\Foundation\HRESULT.ahk" { HRESULT }

/**
 * @namespace Windows.Win32.Security.Cryptography.Certificates
 */
export default struct ICertRequestD2 extends ICertRequestD {
    /**
     * The interface identifier for ICertRequestD2
     * @type {Guid}
     */
    static IID := Guid("{5422fd3a-d4b8-4cef-a12e-e87d4ca22e90}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ICertRequestD2 interfaces
    */
    struct Vtbl extends ICertRequestD.Vtbl {
        Request2          : IntPtr
        GetCAProperty     : IntPtr
        GetCAPropertyInfo : IntPtr
        Ping2             : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ICertRequestD2.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {PWSTR} pwszAuthority 
     * @param {Integer} dwFlags 
     * @param {PWSTR} pwszSerialNumber 
     * @param {Pointer<Integer>} pdwRequestId 
     * @param {Pointer<Integer>} pdwDisposition 
     * @param {PWSTR} pwszAttributes 
     * @param {Pointer<CERTTRANSBLOB>} pctbRequest 
     * @param {Pointer<CERTTRANSBLOB>} pctbFullResponse 
     * @param {Pointer<CERTTRANSBLOB>} pctbEncodedCert 
     * @param {Pointer<CERTTRANSBLOB>} pctbDispositionMessage 
     * @returns {HRESULT} 
     */
    Request2(pwszAuthority, dwFlags, pwszSerialNumber, pdwRequestId, pdwDisposition, pwszAttributes, pctbRequest, pctbFullResponse, pctbEncodedCert, pctbDispositionMessage) {
        pwszAuthority := pwszAuthority is String ? StrPtr(pwszAuthority) : pwszAuthority
        pwszSerialNumber := pwszSerialNumber is String ? StrPtr(pwszSerialNumber) : pwszSerialNumber
        pwszAttributes := pwszAttributes is String ? StrPtr(pwszAttributes) : pwszAttributes

        pdwRequestIdMarshal := pdwRequestId is VarRef ? "uint*" : "ptr"
        pdwDispositionMarshal := pdwDisposition is VarRef ? "uint*" : "ptr"

        result := ComCall(6, this, "ptr", pwszAuthority, "uint", dwFlags, "ptr", pwszSerialNumber, pdwRequestIdMarshal, pdwRequestId, pdwDispositionMarshal, pdwDisposition, "ptr", pwszAttributes, CERTTRANSBLOB.Ptr, pctbRequest, CERTTRANSBLOB.Ptr, pctbFullResponse, CERTTRANSBLOB.Ptr, pctbEncodedCert, CERTTRANSBLOB.Ptr, pctbDispositionMessage, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} pwszAuthority 
     * @param {Integer} PropId 
     * @param {Integer} PropIndex 
     * @param {Integer} PropType 
     * @returns {CERTTRANSBLOB} 
     */
    GetCAProperty(pwszAuthority, PropId, PropIndex, PropType) {
        pwszAuthority := pwszAuthority is String ? StrPtr(pwszAuthority) : pwszAuthority

        pctbPropertyValue := CERTTRANSBLOB()
        result := ComCall(7, this, "ptr", pwszAuthority, "int", PropId, "int", PropIndex, "int", PropType, CERTTRANSBLOB.Ptr, pctbPropertyValue, "HRESULT")
        return pctbPropertyValue
    }

    /**
     * 
     * @param {PWSTR} pwszAuthority 
     * @param {Pointer<Integer>} pcProperty 
     * @param {Pointer<CERTTRANSBLOB>} pctbPropInfo 
     * @returns {HRESULT} 
     */
    GetCAPropertyInfo(pwszAuthority, pcProperty, pctbPropInfo) {
        pwszAuthority := pwszAuthority is String ? StrPtr(pwszAuthority) : pwszAuthority

        pcPropertyMarshal := pcProperty is VarRef ? "int*" : "ptr"

        result := ComCall(8, this, "ptr", pwszAuthority, pcPropertyMarshal, pcProperty, CERTTRANSBLOB.Ptr, pctbPropInfo, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} pwszAuthority 
     * @returns {HRESULT} 
     */
    Ping2(pwszAuthority) {
        pwszAuthority := pwszAuthority is String ? StrPtr(pwszAuthority) : pwszAuthority

        result := ComCall(9, this, "ptr", pwszAuthority, "HRESULT")
        return result
    }

    Query(iid) {
        if (ICertRequestD2.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.Request2 := CallbackCreate(GetMethod(implObj, "Request2"), flags, 11)
        this.vtbl.GetCAProperty := CallbackCreate(GetMethod(implObj, "GetCAProperty"), flags, 6)
        this.vtbl.GetCAPropertyInfo := CallbackCreate(GetMethod(implObj, "GetCAPropertyInfo"), flags, 4)
        this.vtbl.Ping2 := CallbackCreate(GetMethod(implObj, "Ping2"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.Request2)
        CallbackFree(this.vtbl.GetCAProperty)
        CallbackFree(this.vtbl.GetCAPropertyInfo)
        CallbackFree(this.vtbl.Ping2)
    }
}
