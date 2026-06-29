#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IMbnServiceActivation.ahk" { IMbnServiceActivation }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }
#Import "..\..\System\Com\SAFEARRAY.ahk" { SAFEARRAY }

/**
 * This notification interface signals an application about the completion of a service activation request.
 * @remarks
 * The following procedure describes how to register for notifications.
 * 
 * <ol>
 * <li>Get an <a href="https://docs.microsoft.com/windows/win32/api/ocidl/nn-ocidl-iconnectionpointcontainer">IConnectionPointContainer</a>  interface by calling <b>QueryInterface</b> on an <a href="https://docs.microsoft.com/windows/desktop/api/mbnapi/nn-mbnapi-imbninterfacemanager">IMbnInterfaceManager</a> object.</li>
 * <li>Call <a href="https://docs.microsoft.com/windows/win32/api/ocidl/nf-ocidl-iconnectionpointcontainer-findconnectionpoint">FindConnectionPoint</a> on the returned interface and pass <b>IID_IMbnServiceActivationEvents</b> to <i>riid</i>.</li>
 * <li>Call <a href="https://docs.microsoft.com/windows/win32/api/ocidl/nf-ocidl-iconnectionpoint-advise">Advise</a> on the returned connection point and pass a pointer to an <b>IUnknown</b> interface on an object that implements <b>IMbnServiceActivationEvents</b> to <i>pUnk</i>.</li>
 * </ol>
 * Notifications can be terminated by calling <a href="https://docs.microsoft.com/windows/win32/api/ocidl/nf-ocidl-iconnectionpoint-unadvise">Unadvise</a> on the connection point returned in step 2.
 * 
 * To view some code that registers for COM notifications, see the Client section of the <a href="https://docs.microsoft.com/archive/msdn-magazine/2007/september/clr-inside-out-com-connection-points">COM Connection Points</a> article.
 * @see https://learn.microsoft.com/windows/win32/api/mbnapi/nn-mbnapi-imbnserviceactivationevents
 * @namespace Windows.Win32.NetworkManagement.MobileBroadband
 */
export default struct IMbnServiceActivationEvents extends IUnknown {
    /**
     * The interface identifier for IMbnServiceActivationEvents
     * @type {Guid}
     */
    static IID := Guid("{dcbbbab6-2018-4bbb-aaee-338e368af6fa}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IMbnServiceActivationEvents interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        OnActivationComplete : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IMbnServiceActivationEvents.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Notification method called by the Mobile Broadband service to indicate that a service activation request ahs completed.
     * @remarks
     * Successful service activation will also result in a change to the  ready state of the device. the Mobile Broadband service will call the <a href="https://docs.microsoft.com/windows/desktop/api/mbnapi/nf-mbnapi-imbninterfaceevents-onreadystatechange">OnReadyStateChange</a> method of <a href="https://docs.microsoft.com/windows/desktop/api/mbnapi/nn-mbnapi-imbninterfaceevents">IMbnInterfaceEvents</a> as notification.
     * @param {IMbnServiceActivation} serviceActivation Pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/mbnapi/nn-mbnapi-imbnserviceactivation">IMbnServiceActivation</a> interface representing the device on which the request was performed.
     * @param {Pointer<SAFEARRAY>} vendorSpecificData A byte array containing the data returned by the underlying Mobile Broadband miniport driver in <a href="https://docs.microsoft.com/windows-hardware/drivers/network/ndis-status-wwan-service-activation">NDIS_STATUS_WWAN_SERVICE_ACTIVATION</a>.
     * @param {Integer} requestID The request ID assigned by the Mobile Broadband service when the request was initialized.
     * @param {HRESULT} _status The completion status.
     * @param {Integer} networkError The error code returned by the network during the activation operation. This value is meaningful only when <i>status</i> is not S_OK. 
     * 
     * The exact value of <i>networkError</i> is driver/network dependent.
     * @returns {HRESULT} This method must return <b>S_OK</b>.
     * @see https://learn.microsoft.com/windows/win32/api/mbnapi/nf-mbnapi-imbnserviceactivationevents-onactivationcomplete
     */
    OnActivationComplete(serviceActivation, vendorSpecificData, requestID, _status, networkError) {
        result := ComCall(3, this, "ptr", serviceActivation, SAFEARRAY.Ptr, vendorSpecificData, "uint", requestID, "int", _status, "uint", networkError, "HRESULT")
        return result
    }

    Query(iid) {
        if (IMbnServiceActivationEvents.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.OnActivationComplete := CallbackCreate(GetMethod(implObj, "OnActivationComplete"), flags, 6)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.OnActivationComplete)
    }
}
