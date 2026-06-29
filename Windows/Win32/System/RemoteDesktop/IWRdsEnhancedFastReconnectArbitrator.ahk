#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\Com\IUnknown.ahk" { IUnknown }

/**
 * Exposes a method called by the Remote Desktop Services service to obtain the session ID that is to be reconnected to in the enhanced fast reconnect sequence.
 * @see https://learn.microsoft.com/windows/win32/api/wtsprotocol/nn-wtsprotocol-iwrdsenhancedfastreconnectarbitrator
 * @namespace Windows.Win32.System.RemoteDesktop
 */
export default struct IWRdsEnhancedFastReconnectArbitrator extends IUnknown {
    /**
     * The interface identifier for IWRdsEnhancedFastReconnectArbitrator
     * @type {Guid}
     */
    static IID := Guid("{5718ae9b-47f2-499f-b634-d8175bd51131}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IWRdsEnhancedFastReconnectArbitrator interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        GetSessionForEnhancedFastReconnect : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IWRdsEnhancedFastReconnectArbitrator.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * The protocol stack uses this method to return the session ID to be used for enhanced fast reconnect.
     * @param {Pointer<Integer>} pSessionIdArray An array of session IDs that match the enhanced fast reconnect criteria.
     * @param {Integer} dwSessionCount The size of the *pSessionIdArray* array (in elements).
     * @returns {Integer} Pointer to LONG variable to receive the resultant session ID.
     * @see https://learn.microsoft.com/windows/win32/api/wtsprotocol/nf-wtsprotocol-iwrdsenhancedfastreconnectarbitrator-getsessionforenhancedfastreconnect
     */
    GetSessionForEnhancedFastReconnect(pSessionIdArray, dwSessionCount) {
        pSessionIdArrayMarshal := pSessionIdArray is VarRef ? "int*" : "ptr"

        result := ComCall(3, this, pSessionIdArrayMarshal, pSessionIdArray, "uint", dwSessionCount, "int*", &pResultSessionId := 0, "HRESULT")
        return pResultSessionId
    }

    Query(iid) {
        if (IWRdsEnhancedFastReconnectArbitrator.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetSessionForEnhancedFastReconnect := CallbackCreate(GetMethod(implObj, "GetSessionForEnhancedFastReconnect"), flags, 4)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetSessionForEnhancedFastReconnect)
    }
}
