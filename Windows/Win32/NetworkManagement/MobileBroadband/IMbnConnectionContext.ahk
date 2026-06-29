#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\MBN_CONTEXT.ahk" { MBN_CONTEXT }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }
#Import "..\..\System\Com\SAFEARRAY.ahk" { SAFEARRAY }

/**
 * Manages connection contexts.
 * @remarks
 * An application can acquire this interface by calling the <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-queryinterface(q)">QueryInterface</a> method of <a href="https://docs.microsoft.com/windows/desktop/api/mbnapi/nn-mbnapi-imbninterface">IMbnInterface</a>.
 * @see https://learn.microsoft.com/windows/win32/api/mbnapi/nn-mbnapi-imbnconnectioncontext
 * @namespace Windows.Win32.NetworkManagement.MobileBroadband
 */
export default struct IMbnConnectionContext extends IUnknown {
    /**
     * The interface identifier for IMbnConnectionContext
     * @type {Guid}
     */
    static IID := Guid("{dcbbbab6-200b-4bbb-aaee-338e368af6fa}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IMbnConnectionContext interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        GetProvisionedContexts : IntPtr
        SetProvisionedContext  : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IMbnConnectionContext.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Gets a list of connection contexts.
     * @remarks
     * A connection context is an abstraction of a specific set of network configuration parameters for setting up a virtual circuit or flow on top of the physical Mobile Broadband connection at layer 2. In GSM, it corresponds to the concept of a PDP context; in CDMA, it corresponds to a network profile.
     * 
     * 
     * In some cases, connection parameters are already available in device/SIM memory. This method can be used to get a list of stored connection contexts stored in device for the current home provider network.
     * 
     * Only contexts of type <b>MBN_CONTEXT_TYPE_INTERNET</b>  should be used for making data connections.
     * 
     * A device will return all of the stored contexts for the current home provider. Some of the contexts can be empty and they will be reported as <b>MBN_CONTEXT_TYPE_NONE</b>.
     * 
     * Sometimes, stored provisioned contexts can be updated by the network through SMS or OTA. Whenever there is a change in the device-provisioned contexts, the Mobile Broadband service will call the <a href="https://docs.microsoft.com/windows/desktop/api/mbnapi/nf-mbnapi-imbnconnectioncontextevents-onprovisionedcontextlistchange">OnProvisionedContextListChange</a> method of <a href="https://docs.microsoft.com/windows/desktop/api/mbnapi/nn-mbnapi-imbnconnectioncontextevents">IMbnConnectionContextEvents</a>. An application can then use this method to get the updated list of provisioned contexts.
     * 
     * 
     * For the recoverable errors <b>E_MBN_PIN_REQUIRED</b>, <b>E_MBN_SIM_NOT_INSERTED</b>, and <b>E_MBN_BAD_SIM</b>, the Mobile Broadband service will query the device again for this information when the error condition is over. For example, if the device required a PIN to be entered to retrieve the connection contexts, then it will return <b>E_MBN_PIN_REQUIRED</b>. When the application enters a PIN to unlock the device, then the service will again try to get this information from the device. The service will update the application about the status of the new query by calling the <a href="https://docs.microsoft.com/windows/desktop/api/mbnapi/nf-mbnapi-imbnconnectioncontextevents-onprovisionedcontextlistchange">OnProvisionedContextListChange</a> method of <a href="https://docs.microsoft.com/windows/desktop/api/mbnapi/nn-mbnapi-imbnconnectioncontextevents">IMbnConnectionContextEvents</a>.
     * @returns {Pointer<SAFEARRAY>} A list of <a href="https://docs.microsoft.com/windows/desktop/api/mbnapi/ns-mbnapi-mbn_context">MBN_CONTEXT</a> values that represent connection contexts stored in the device. On error, this array is <b>NULL</b>. When successful, the calling application must free the allocated memory by calling <a href="https://docs.microsoft.com/windows/win32/api/oleauto/nf-oleauto-safearraydestroy">SafeArrayDestroy</a>.
     * @see https://learn.microsoft.com/windows/win32/api/mbnapi/nf-mbnapi-imbnconnectioncontext-getprovisionedcontexts
     */
    GetProvisionedContexts() {
        result := ComCall(3, this, "ptr*", &provisionedContexts := 0, "HRESULT")
        return provisionedContexts
    }

    /**
     * Adds or updates a provisioned context.
     * @remarks
     * The <b>contextID</b> of <i>provisionedContexts</i> specifies the index in the device or SIM memory where the context is to be stored.  If it is set to <a href="https://docs.microsoft.com/windows/desktop/api/mbnapi/ne-mbnapi-mbn_context_constants">MBN_CONTEXT_ID_APPEND</a>, then the device shall find the appropriate index to store the context.
     * 
     * This is an asynchronous operation and <b>SetProvisionedContext</b> will return immediately. When the operation is complete, the Mobile Broadband service will notify the application by calling the <a href="https://docs.microsoft.com/windows/desktop/api/mbnapi/nf-mbnapi-imbnconnectioncontextevents-onsetprovisionedcontextcomplete">OnSetProvisionedContextComplete</a> method of <a href="https://docs.microsoft.com/windows/desktop/api/mbnapi/nn-mbnapi-imbnconnectioncontextevents">IMbnConnectionContextEvents</a>.
     * 
     * Additions to the provisioned context list for the current home provider ID will not be available for querying until the <a href="https://docs.microsoft.com/windows/desktop/api/mbnapi/nf-mbnapi-imbnconnectioncontextevents-onprovisionedcontextlistchange">OnProvisionedContextListChange</a> method of <a href="https://docs.microsoft.com/windows/desktop/api/mbnapi/nn-mbnapi-imbnconnectioncontextevents">IMbnConnectionContextEvents</a> has been called.
     * @param {MBN_CONTEXT} provisionedContexts An <a href="https://docs.microsoft.com/windows/desktop/api/mbnapi/ns-mbnapi-mbn_context">MBN_CONTEXT</a> structure that specifies the provisioned context to be stored in the device or SIM.
     * @param {PWSTR} providerID A string that represents the network provider ID for which the provisioned context should be stored.  The device should return the added provisioned context in response to any subsequent query when a SIM with this home provider ID is in the device.
     * @returns {Integer} A request ID set by the Mobile Broadband service to identify this asynchronous request.
     * @see https://learn.microsoft.com/windows/win32/api/mbnapi/nf-mbnapi-imbnconnectioncontext-setprovisionedcontext
     */
    SetProvisionedContext(provisionedContexts, providerID) {
        providerID := providerID is String ? StrPtr(providerID) : providerID

        result := ComCall(4, this, MBN_CONTEXT, provisionedContexts, "ptr", providerID, "uint*", &requestID := 0, "HRESULT")
        return requestID
    }

    Query(iid) {
        if (IMbnConnectionContext.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetProvisionedContexts := CallbackCreate(GetMethod(implObj, "GetProvisionedContexts"), flags, 2)
        this.vtbl.SetProvisionedContext := CallbackCreate(GetMethod(implObj, "SetProvisionedContext"), flags, 4)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetProvisionedContexts)
        CallbackFree(this.vtbl.SetProvisionedContext)
    }
}
