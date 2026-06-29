#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IMbnConnection.ahk" { IMbnConnection }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * This notification interface signals an application about change and completion status of asynchronous connection requests.
 * @remarks
 * The following procedure describes how to register for notifications.
 * 
 * <ol>
 * <li>Get an <a href="https://docs.microsoft.com/windows/win32/api/ocidl/nn-ocidl-iconnectionpointcontainer">IConnectionPointContainer</a>  interface by calling <b>QueryInterface</b> on an <a href="https://docs.microsoft.com/windows/desktop/api/mbnapi/nn-mbnapi-imbnconnectionmanager">IMbnConnectionManager</a> object.</li>
 * <li>Call <a href="https://docs.microsoft.com/windows/win32/api/ocidl/nf-ocidl-iconnectionpointcontainer-findconnectionpoint">FindConnectionPoint</a> on the returned interface and pass <b>IID_IMbnConnectionEvents</b> to <i>riid</i>.</li>
 * <li>Call <a href="https://docs.microsoft.com/windows/win32/api/ocidl/nf-ocidl-iconnectionpoint-advise">Advise</a> on the returned connection point and pass a pointer to an <b>IUnknown</b> interface on an object that implements <b>IMbnConnectionEvents</b> to <i>pUnk</i>.</li>
 * </ol>
 * Notifications can be terminated by calling <a href="https://docs.microsoft.com/windows/win32/api/ocidl/nf-ocidl-iconnectionpoint-unadvise">Unadvise</a> on the connection point returned in step 2.
 * 
 * To view some code that registers for COM notifications, see the Client section of the <a href="https://docs.microsoft.com/archive/msdn-magazine/2007/september/clr-inside-out-com-connection-points">COM Connection Points</a> article.
 * @see https://learn.microsoft.com/windows/win32/api/mbnapi/nn-mbnapi-imbnconnectionevents
 * @namespace Windows.Win32.NetworkManagement.MobileBroadband
 */
export default struct IMbnConnectionEvents extends IUnknown {
    /**
     * The interface identifier for IMbnConnectionEvents
     * @type {Guid}
     */
    static IID := Guid("{dcbbbab6-200e-4bbb-aaee-338e368af6fa}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IMbnConnectionEvents interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        OnConnectComplete      : IntPtr
        OnDisconnectComplete   : IntPtr
        OnConnectStateChange   : IntPtr
        OnVoiceCallStateChange : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IMbnConnectionEvents.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Notification method that signals the completion of a connection operation.
     * @remarks
     * Once an activation context is established, an application can use <a href="https://docs.microsoft.com/windows/desktop/api/mbnapi/nn-mbnapi-imbnconnection">IMbnConnection</a> to get the current connection state.  
     * 
     * When the connection operation results in an error, an application can call the <a href="https://docs.microsoft.com/windows/desktop/api/mbnapi/nf-mbnapi-imbnconnection-getactivationnetworkerror">GetActivationNetworkError</a> method of the <a href="https://docs.microsoft.com/windows/desktop/api/mbnapi/nn-mbnapi-imbnconnection">IMbnConnection</a> interface to obtain network error information.
     * @param {IMbnConnection} newConnection An <a href="https://docs.microsoft.com/windows/desktop/api/mbnapi/nn-mbnapi-imbnconnection">IMbnConnection</a> interface that represents the device on which the connection operation has completed.
     * @param {Integer} requestID The request ID assigned by the Mobile Broadband service to identify the connection operation.
     * @param {HRESULT} _status The completion status.
     * @returns {HRESULT} This method must return <b>S_OK</b>.
     * @see https://learn.microsoft.com/windows/win32/api/mbnapi/nf-mbnapi-imbnconnectionevents-onconnectcomplete
     */
    OnConnectComplete(newConnection, requestID, _status) {
        result := ComCall(3, this, "ptr", newConnection, "uint", requestID, "int", _status, "HRESULT")
        return result
    }

    /**
     * Notification method that indicates that a disconnection operation has been performed.
     * @remarks
     * An application can use <a href="https://docs.microsoft.com/windows/desktop/api/mbnapi/nn-mbnapi-imbnconnection">IMbnConnection</a> to get the current connection state.
     * @param {IMbnConnection} newConnection An <a href="https://docs.microsoft.com/windows/desktop/api/mbnapi/nn-mbnapi-imbnconnection">IMbnConnection</a> interface that represents the connection that has been disconnected.
     * @param {Integer} requestID The request ID assigned by the Mobile Broadband service to identify the disconnection operation.
     * @param {HRESULT} _status The operation completion status.  This can only be <b>S_OK</b>.
     * @returns {HRESULT} This method must return <b>S_OK</b>.
     * @see https://learn.microsoft.com/windows/win32/api/mbnapi/nf-mbnapi-imbnconnectionevents-ondisconnectcomplete
     */
    OnDisconnectComplete(newConnection, requestID, _status) {
        result := ComCall(4, this, "ptr", newConnection, "uint", requestID, "int", _status, "HRESULT")
        return result
    }

    /**
     * Notification method that indicates whether the connection state of the device has changed.
     * @remarks
     * An application can use <a href="https://docs.microsoft.com/windows/desktop/api/mbnapi/nn-mbnapi-imbnconnection">IMbnConnection</a> to get the updated connection state.
     * @param {IMbnConnection} newConnection An <a href="https://docs.microsoft.com/windows/desktop/api/mbnapi/nn-mbnapi-imbnconnection">IMbnConnection</a> interface that represents the connection on which the state has changed due to a system or network initiated change.
     * @returns {HRESULT} This method must return <b>S_OK</b>.
     * @see https://learn.microsoft.com/windows/win32/api/mbnapi/nf-mbnapi-imbnconnectionevents-onconnectstatechange
     */
    OnConnectStateChange(newConnection) {
        result := ComCall(5, this, "ptr", newConnection, "HRESULT")
        return result
    }

    /**
     * Notification method that indicates a change in the voice call state of a device.
     * @remarks
     * <b>OnVoiceCallStateChange</b> is called when voice call state is available or when there is a change in the voice call state.   An application can use <a href="https://docs.microsoft.com/windows/desktop/api/mbnapi/nn-mbnapi-imbnconnection">IMbnConnection</a> to get the updated voice call state.
     * @param {IMbnConnection} newConnection An <a href="https://docs.microsoft.com/windows/desktop/api/mbnapi/nn-mbnapi-imbnconnection">IMbnConnection</a> interface that represents the connection for which the voice call state has changed.
     * @returns {HRESULT} This method must return <b>S_OK</b>.
     * @see https://learn.microsoft.com/windows/win32/api/mbnapi/nf-mbnapi-imbnconnectionevents-onvoicecallstatechange
     */
    OnVoiceCallStateChange(newConnection) {
        result := ComCall(6, this, "ptr", newConnection, "HRESULT")
        return result
    }

    Query(iid) {
        if (IMbnConnectionEvents.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.OnConnectComplete := CallbackCreate(GetMethod(implObj, "OnConnectComplete"), flags, 4)
        this.vtbl.OnDisconnectComplete := CallbackCreate(GetMethod(implObj, "OnDisconnectComplete"), flags, 4)
        this.vtbl.OnConnectStateChange := CallbackCreate(GetMethod(implObj, "OnConnectStateChange"), flags, 2)
        this.vtbl.OnVoiceCallStateChange := CallbackCreate(GetMethod(implObj, "OnVoiceCallStateChange"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.OnConnectComplete)
        CallbackFree(this.vtbl.OnDisconnectComplete)
        CallbackFree(this.vtbl.OnConnectStateChange)
        CallbackFree(this.vtbl.OnVoiceCallStateChange)
    }
}
