#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\Com\IUnknown.ahk" { IUnknown }

/**
 * The IWbemEventProviderSecurity interface is optionally implemented by event providers who want to restrict consumer access to their event. For more information about when to use this interface, see Securing WMI Events.
 * @remarks
 * This method is automatically called by Windows Management whenever a new consumer attempts to subscribe to an event where the event provider has implemented 
 * <b>IWbemEventProviderSecurity</b>. If the consumer has access permission for the event the consumer is subscribed to the event; otherwise, the subscription is denied.
 * @see https://learn.microsoft.com/windows/win32/api/wbemprov/nn-wbemprov-iwbemeventprovidersecurity
 * @namespace Windows.Win32.System.Wmi
 */
export default struct IWbemEventProviderSecurity extends IUnknown {
    /**
     * The interface identifier for IWbemEventProviderSecurity
     * @type {Guid}
     */
    static IID := Guid("{631f7d96-d993-11d2-b339-00105a1f4aaf}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IWbemEventProviderSecurity interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        AccessCheck : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IWbemEventProviderSecurity.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * The AccessCheck method is implemented by an event provider and called by Windows Management Instrumentation (WMI) when a consumer subscribes to an event specified in wszQuery.
     * @param {Pointer<Integer>} wszQueryLanguage Language of the following query filter, which is "WQL".
     * @param {Pointer<Integer>} wszQuery Text of the event query filter, which is registered by a logical consumer.
     * @param {Integer} lSidLength Integer that contains the security identifier (SID) length, or 0 (zero) if the subscription builder token is available.
     * @param {Pointer<Integer>} _pSid Pointer to the constant byte integer type that contains the SID, or <b>NULL</b> if the subscription builder's token is available.
     * @returns {HRESULT} This method returns an <b>HRESULT</b> that indicates the status of the method call. The following list lists the value contained in an <b>HRESULT</b>.
     * @see https://learn.microsoft.com/windows/win32/api/wbemprov/nf-wbemprov-iwbemeventprovidersecurity-accesscheck
     */
    AccessCheck(wszQueryLanguage, wszQuery, lSidLength, _pSid) {
        wszQueryLanguageMarshal := wszQueryLanguage is VarRef ? "ushort*" : "ptr"
        wszQueryMarshal := wszQuery is VarRef ? "ushort*" : "ptr"
        _pSidMarshal := _pSid is VarRef ? "char*" : "ptr"

        result := ComCall(3, this, wszQueryLanguageMarshal, wszQueryLanguage, wszQueryMarshal, wszQuery, "int", lSidLength, _pSidMarshal, _pSid, "HRESULT")
        return result
    }

    Query(iid) {
        if (IWbemEventProviderSecurity.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.AccessCheck := CallbackCreate(GetMethod(implObj, "AccessCheck"), flags, 5)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.AccessCheck)
    }
}
