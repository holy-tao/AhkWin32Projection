#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\IMbnConnectionContext.ahk" { IMbnConnectionContext }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * This notification interface is used to handle asynchronous provisioned context events.
 * @remarks
 * The following procedure describes how to register for notifications.
 * 
 * <ol>
 * <li>Get an <a href="https://docs.microsoft.com/windows/win32/api/ocidl/nn-ocidl-iconnectionpointcontainer">IConnectionPointContainer</a>  interface by calling <b>QueryInterface</b> on an <a href="https://docs.microsoft.com/windows/desktop/api/mbnapi/nn-mbnapi-imbninterfacemanager">IMbnInterfaceManager</a>  object.</li>
 * <li>Call <a href="https://docs.microsoft.com/windows/win32/api/ocidl/nf-ocidl-iconnectionpointcontainer-findconnectionpoint">FindConnectionPoint</a> on the returned interface and pass <b>IID_IMbnConnectionContextEvents</b> to <i>riid</i>.</li>
 * <li>Call <a href="https://docs.microsoft.com/windows/win32/api/ocidl/nf-ocidl-iconnectionpoint-advise">Advise</a> on the returned connection point and pass a pointer to an <b>IUnknown</b> interface on an object that implements <b>IMbnConnectionContextEvents</b> to <i>pUnk</i>.</li>
 * </ol>
 * Notifications can be terminated by calling <a href="https://docs.microsoft.com/windows/win32/api/ocidl/nf-ocidl-iconnectionpoint-unadvise">Unadvise</a> on the connection point returned in step 2.
 * 
 * To view some code that registers for COM notifications, see the Client section of the <a href="https://docs.microsoft.com/archive/msdn-magazine/2007/september/clr-inside-out-com-connection-points">COM Connection Points</a> article.
 * @see https://learn.microsoft.com/windows/win32/api/mbnapi/nn-mbnapi-imbnconnectioncontextevents
 * @namespace Windows.Win32.NetworkManagement.MobileBroadband
 */
export default struct IMbnConnectionContextEvents extends IUnknown {
    /**
     * The interface identifier for IMbnConnectionContextEvents
     * @type {Guid}
     */
    static IID := Guid("{dcbbbab6-200c-4bbb-aaee-338e368af6fa}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IMbnConnectionContextEvents interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        OnProvisionedContextListChange  : IntPtr
        OnSetProvisionedContextComplete : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IMbnConnectionContextEvents.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Notification method called by the Mobile Broadband service to indicate that a provisioned context stored in the device is available or updated.
     * @remarks
     * An application can use the passed <a href="https://docs.microsoft.com/windows/desktop/api/mbnapi/nn-mbnapi-imbnconnectioncontext">IMbnConnectionContext</a> interface to get the list of provisioned contexts for the device.  
     * 
     * <b>OnProvisionedContextListChange</b> is not called as the result of an update to an existing provisioned context from an application call of the <a href="https://docs.microsoft.com/windows/desktop/api/mbnapi/nf-mbnapi-imbnconnectioncontext-setprovisionedcontext">SetProvisionedContext</a> method of <a href="https://docs.microsoft.com/windows/desktop/api/mbnapi/nn-mbnapi-imbnconnectioncontext">IMbnConnectionContext</a>.
     * @param {IMbnConnectionContext} newInterface An <a href="https://docs.microsoft.com/windows/desktop/api/mbnapi/nn-mbnapi-imbnconnectioncontext">IMbnConnectionContext</a> interface that represents the device for which the context is available or updated.
     * @returns {HRESULT} This method must return <b>S_OK</b>.
     * @see https://learn.microsoft.com/windows/win32/api/mbnapi/nf-mbnapi-imbnconnectioncontextevents-onprovisionedcontextlistchange
     */
    OnProvisionedContextListChange(newInterface) {
        result := ComCall(3, this, "ptr", newInterface, "HRESULT")
        return result
    }

    /**
     * Notification method called by the Mobile Broadband service to indicate that the provisioned context in the device has been set.
     * @remarks
     * A calling application can pass an <a href="https://docs.microsoft.com/windows/desktop/api/mbnapi/nn-mbnapi-imbnconnectioncontext">IMbnConnectionContext</a> interface to <i>newInterface</i> to get the updated list of provisioned contexts in the device.
     *  However, since this operation is asynchronous, the application must wait for the <a href="https://docs.microsoft.com/windows/desktop/api/mbnapi/nf-mbnapi-imbnconnectioncontextevents-onprovisionedcontextlistchange">OnProvisionedContextListChange</a> notification before using this interface to get the contexts.
     * 
     * If there are multiple applications registered to receive notifications then all of them will receive this notification even though only one of them could have initiated this operation.
     * @param {IMbnConnectionContext} newInterface An <a href="https://docs.microsoft.com/windows/desktop/api/mbnapi/nn-mbnapi-imbnconnectioncontext">IMbnConnectionContext</a> interface that represents the device for which the context has been set.
     * @param {Integer} requestID A request ID set by the Mobile Broadband service to identify the operation that set the context.
     * @param {HRESULT} _status A status code that indicates the outcome of the operation.
     * @returns {HRESULT} This method must return <b>S_OK</b>.
     * @see https://learn.microsoft.com/windows/win32/api/mbnapi/nf-mbnapi-imbnconnectioncontextevents-onsetprovisionedcontextcomplete
     */
    OnSetProvisionedContextComplete(newInterface, requestID, _status) {
        result := ComCall(4, this, "ptr", newInterface, "uint", requestID, "int", _status, "HRESULT")
        return result
    }

    Query(iid) {
        if (IMbnConnectionContextEvents.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.OnProvisionedContextListChange := CallbackCreate(GetMethod(implObj, "OnProvisionedContextListChange"), flags, 2)
        this.vtbl.OnSetProvisionedContextComplete := CallbackCreate(GetMethod(implObj, "OnSetProvisionedContextComplete"), flags, 4)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.OnProvisionedContextListChange)
        CallbackFree(this.vtbl.OnSetProvisionedContextComplete)
    }
}
