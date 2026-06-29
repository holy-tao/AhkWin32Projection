#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import ".\RTC_PORT_TYPE.ahk" { RTC_PORT_TYPE }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\Com\IUnknown.ahk" { IUnknown }

/**
 * @namespace Windows.Win32.System.RealTimeCommunications
 */
export default struct IRTCPortManager extends IUnknown {
    /**
     * The interface identifier for IRTCPortManager
     * @type {Guid}
     */
    static IID := Guid("{da77c14b-6208-43ca-8ddf-5b60a0a69fac}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IRTCPortManager interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        GetMapping          : IntPtr
        UpdateRemoteAddress : IntPtr
        ReleaseMapping      : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IRTCPortManager.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {BSTR} bstrRemoteAddress 
     * @param {RTC_PORT_TYPE} enPortType 
     * @param {Pointer<BSTR>} pbstrInternalLocalAddress 
     * @param {Pointer<Integer>} plInternalLocalPort 
     * @param {Pointer<BSTR>} pbstrExternalLocalAddress 
     * @param {Pointer<Integer>} plExternalLocalPort 
     * @returns {HRESULT} 
     */
    GetMapping(bstrRemoteAddress, enPortType, pbstrInternalLocalAddress, plInternalLocalPort, pbstrExternalLocalAddress, plExternalLocalPort) {
        bstrRemoteAddress := bstrRemoteAddress is String ? BSTR.Alloc(bstrRemoteAddress).Value : bstrRemoteAddress

        plInternalLocalPortMarshal := plInternalLocalPort is VarRef ? "int*" : "ptr"
        plExternalLocalPortMarshal := plExternalLocalPort is VarRef ? "int*" : "ptr"

        result := ComCall(3, this, BSTR, bstrRemoteAddress, RTC_PORT_TYPE, enPortType, BSTR.Ptr, pbstrInternalLocalAddress, plInternalLocalPortMarshal, plInternalLocalPort, BSTR.Ptr, pbstrExternalLocalAddress, plExternalLocalPortMarshal, plExternalLocalPort, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} bstrRemoteAddress 
     * @param {BSTR} bstrInternalLocalAddress 
     * @param {Integer} lInternalLocalPort 
     * @param {BSTR} bstrExternalLocalAddress 
     * @param {Integer} lExternalLocalPort 
     * @returns {HRESULT} 
     */
    UpdateRemoteAddress(bstrRemoteAddress, bstrInternalLocalAddress, lInternalLocalPort, bstrExternalLocalAddress, lExternalLocalPort) {
        bstrRemoteAddress := bstrRemoteAddress is String ? BSTR.Alloc(bstrRemoteAddress).Value : bstrRemoteAddress
        bstrInternalLocalAddress := bstrInternalLocalAddress is String ? BSTR.Alloc(bstrInternalLocalAddress).Value : bstrInternalLocalAddress
        bstrExternalLocalAddress := bstrExternalLocalAddress is String ? BSTR.Alloc(bstrExternalLocalAddress).Value : bstrExternalLocalAddress

        result := ComCall(4, this, BSTR, bstrRemoteAddress, BSTR, bstrInternalLocalAddress, "int", lInternalLocalPort, BSTR, bstrExternalLocalAddress, "int", lExternalLocalPort, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} bstrInternalLocalAddress 
     * @param {Integer} lInternalLocalPort 
     * @param {BSTR} bstrExternalLocalAddress 
     * @param {Integer} lExternalLocalAddress 
     * @returns {HRESULT} 
     */
    ReleaseMapping(bstrInternalLocalAddress, lInternalLocalPort, bstrExternalLocalAddress, lExternalLocalAddress) {
        bstrInternalLocalAddress := bstrInternalLocalAddress is String ? BSTR.Alloc(bstrInternalLocalAddress).Value : bstrInternalLocalAddress
        bstrExternalLocalAddress := bstrExternalLocalAddress is String ? BSTR.Alloc(bstrExternalLocalAddress).Value : bstrExternalLocalAddress

        result := ComCall(5, this, BSTR, bstrInternalLocalAddress, "int", lInternalLocalPort, BSTR, bstrExternalLocalAddress, "int", lExternalLocalAddress, "HRESULT")
        return result
    }

    Query(iid) {
        if (IRTCPortManager.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetMapping := CallbackCreate(GetMethod(implObj, "GetMapping"), flags, 7)
        this.vtbl.UpdateRemoteAddress := CallbackCreate(GetMethod(implObj, "UpdateRemoteAddress"), flags, 6)
        this.vtbl.ReleaseMapping := CallbackCreate(GetMethod(implObj, "ReleaseMapping"), flags, 5)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetMapping)
        CallbackFree(this.vtbl.UpdateRemoteAddress)
        CallbackFree(this.vtbl.ReleaseMapping)
    }
}
