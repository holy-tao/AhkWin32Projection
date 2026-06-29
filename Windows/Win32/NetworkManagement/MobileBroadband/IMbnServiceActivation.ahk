#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }
#Import "..\..\System\Com\SAFEARRAY.ahk" { SAFEARRAY }

/**
 * Pass-through mechanism for cellular service activation.
 * @remarks
 * An <b>IMbnServiceActivation</b> interface can be obtained by calling <b>QueryInterface</b>  from <a href="https://docs.microsoft.com/windows/desktop/api/mbnapi/nn-mbnapi-imbninterface">IMbnInterface</a>.
 * @see https://learn.microsoft.com/windows/win32/api/mbnapi/nn-mbnapi-imbnserviceactivation
 * @namespace Windows.Win32.NetworkManagement.MobileBroadband
 */
export default struct IMbnServiceActivation extends IUnknown {
    /**
     * The interface identifier for IMbnServiceActivation
     * @type {Guid}
     */
    static IID := Guid("{dcbbbab6-2017-4bbb-aaee-338e368af6fa}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IMbnServiceActivation interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        Activate : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IMbnServiceActivation.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Send the service activation request to the network.
     * @remarks
     * The <b>Activate</b> method can be used by an application to activate cellular service. The format of data passed in this request is vendor-specific.
     * 
     * The <b>VendorSpecificBufferSize</b> field of the OID request would be set to the size of data in the SAFEARRAY,  <i>vendorSpecificData</i>. The contents of <i>vendorSpecificData</i> will be copied byte-by-byte in the OID request to the driver.
     * 
     * Refer to the Mobile Broadband Driver Model for more information about service activation operations.
     * 
     * 
     * This is an asynchronous operation that will return immediately. If the method returns without error,  then the Mobile Broadband service will call the <a href="https://docs.microsoft.com/windows/desktop/api/mbnapi/nf-mbnapi-imbnserviceactivationevents-onactivationcomplete">OnActivationComplete</a> method of the  <a href="https://docs.microsoft.com/windows/desktop/api/mbnapi/nn-mbnapi-imbnserviceactivationevents">IMbnServiceActivationEvents</a> interface.
     * @param {Pointer<SAFEARRAY>} vendorSpecificData A vendor-specific array of bytes passed in a service activation operation. This data will be passed by the Mobile Broadband service in a SET OID_WWAN_SERVICE_ACTIVATION  OID request to the miniport driver.
     * @returns {Integer} The request ID for this operation.
     * @see https://learn.microsoft.com/windows/win32/api/mbnapi/nf-mbnapi-imbnserviceactivation-activate
     */
    Activate(vendorSpecificData) {
        result := ComCall(3, this, SAFEARRAY.Ptr, vendorSpecificData, "uint*", &requestID := 0, "HRESULT")
        return requestID
    }

    Query(iid) {
        if (IMbnServiceActivation.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.Activate := CallbackCreate(GetMethod(implObj, "Activate"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.Activate)
    }
}
