#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\RTC_PORT_TYPE.ahk" { RTC_PORT_TYPE }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\Com\IUnknown.ahk" { IUnknown }

/**
 * @namespace Windows.Win32.System.RealTimeCommunications
 */
export default struct IRTCClientPortManagement extends IUnknown {
    /**
     * The interface identifier for IRTCClientPortManagement
     * @type {Guid}
     */
    static IID := Guid("{d5df3f03-4bde-4417-aefe-71177bdaea66}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IRTCClientPortManagement interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        StartListenAddressAndPort : IntPtr
        StopListenAddressAndPort  : IntPtr
        GetPortRange              : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IRTCClientPortManagement.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {BSTR} bstrInternalLocalAddress 
     * @param {Integer} lInternalLocalPort 
     * @returns {HRESULT} 
     */
    StartListenAddressAndPort(bstrInternalLocalAddress, lInternalLocalPort) {
        bstrInternalLocalAddress := bstrInternalLocalAddress is String ? BSTR.Alloc(bstrInternalLocalAddress).Value : bstrInternalLocalAddress

        result := ComCall(3, this, BSTR, bstrInternalLocalAddress, "int", lInternalLocalPort, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} bstrInternalLocalAddress 
     * @param {Integer} lInternalLocalPort 
     * @returns {HRESULT} 
     */
    StopListenAddressAndPort(bstrInternalLocalAddress, lInternalLocalPort) {
        bstrInternalLocalAddress := bstrInternalLocalAddress is String ? BSTR.Alloc(bstrInternalLocalAddress).Value : bstrInternalLocalAddress

        result := ComCall(4, this, BSTR, bstrInternalLocalAddress, "int", lInternalLocalPort, "HRESULT")
        return result
    }

    /**
     * 
     * @param {RTC_PORT_TYPE} enPortType 
     * @param {Pointer<Integer>} plMinValue 
     * @param {Pointer<Integer>} plMaxValue 
     * @returns {HRESULT} 
     */
    GetPortRange(enPortType, plMinValue, plMaxValue) {
        plMinValueMarshal := plMinValue is VarRef ? "int*" : "ptr"
        plMaxValueMarshal := plMaxValue is VarRef ? "int*" : "ptr"

        result := ComCall(5, this, RTC_PORT_TYPE, enPortType, plMinValueMarshal, plMinValue, plMaxValueMarshal, plMaxValue, "HRESULT")
        return result
    }

    Query(iid) {
        if (IRTCClientPortManagement.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.StartListenAddressAndPort := CallbackCreate(GetMethod(implObj, "StartListenAddressAndPort"), flags, 3)
        this.vtbl.StopListenAddressAndPort := CallbackCreate(GetMethod(implObj, "StopListenAddressAndPort"), flags, 3)
        this.vtbl.GetPortRange := CallbackCreate(GetMethod(implObj, "GetPortRange"), flags, 4)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.StartListenAddressAndPort)
        CallbackFree(this.vtbl.StopListenAddressAndPort)
        CallbackFree(this.vtbl.GetPortRange)
    }
}
