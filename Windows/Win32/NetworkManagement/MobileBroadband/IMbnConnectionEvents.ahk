#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * This notification interface signals an application about change and completion status of asynchronous connection requests.
 * @remarks
 * 
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
 * 
 * @see https://docs.microsoft.com/windows/win32/api//mbnapi/nn-mbnapi-imbnconnectionevents
 * @namespace Windows.Win32.NetworkManagement.MobileBroadband
 * @version v4.0.30319
 */
class IMbnConnectionEvents extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMbnConnectionEvents
     * @type {Guid}
     */
    static IID => Guid("{dcbbbab6-200e-4bbb-aaee-338e368af6fa}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["OnConnectComplete", "OnDisconnectComplete", "OnConnectStateChange", "OnVoiceCallStateChange"]

    /**
     * Notification method that signals the completion of a connection operation.
     * @param {IMbnConnection} newConnection An <a href="https://docs.microsoft.com/windows/desktop/api/mbnapi/nn-mbnapi-imbnconnection">IMbnConnection</a> interface that represents the device on which the connection operation has completed.
     * @param {Integer} requestID The request ID assigned by the Mobile Broadband service to identify the connection operation.
     * @param {HRESULT} status The completion status.
     * @returns {HRESULT} This method must return <b>S_OK</b>.
     * @see https://docs.microsoft.com/windows/win32/api//mbnapi/nf-mbnapi-imbnconnectionevents-onconnectcomplete
     */
    OnConnectComplete(newConnection, requestID, status) {
        result := ComCall(3, this, "ptr", newConnection, "uint", requestID, "int", status, "HRESULT")
        return result
    }

    /**
     * Notification method that indicates that a disconnection operation has been performed.
     * @param {IMbnConnection} newConnection An <a href="https://docs.microsoft.com/windows/desktop/api/mbnapi/nn-mbnapi-imbnconnection">IMbnConnection</a> interface that represents the connection that has been disconnected.
     * @param {Integer} requestID The request ID assigned by the Mobile Broadband service to identify the disconnection operation.
     * @param {HRESULT} status The operation completion status.  This can only be <b>S_OK</b>.
     * @returns {HRESULT} This method must return <b>S_OK</b>.
     * @see https://docs.microsoft.com/windows/win32/api//mbnapi/nf-mbnapi-imbnconnectionevents-ondisconnectcomplete
     */
    OnDisconnectComplete(newConnection, requestID, status) {
        result := ComCall(4, this, "ptr", newConnection, "uint", requestID, "int", status, "HRESULT")
        return result
    }

    /**
     * Notification method that indicates whether the connection state of the device has changed.
     * @param {IMbnConnection} newConnection An <a href="https://docs.microsoft.com/windows/desktop/api/mbnapi/nn-mbnapi-imbnconnection">IMbnConnection</a> interface that represents the connection on which the state has changed due to a system or network initiated change.
     * @returns {HRESULT} This method must return <b>S_OK</b>.
     * @see https://docs.microsoft.com/windows/win32/api//mbnapi/nf-mbnapi-imbnconnectionevents-onconnectstatechange
     */
    OnConnectStateChange(newConnection) {
        result := ComCall(5, this, "ptr", newConnection, "HRESULT")
        return result
    }

    /**
     * Notification method that indicates a change in the voice call state of a device.
     * @param {IMbnConnection} newConnection An <a href="https://docs.microsoft.com/windows/desktop/api/mbnapi/nn-mbnapi-imbnconnection">IMbnConnection</a> interface that represents the connection for which the voice call state has changed.
     * @returns {HRESULT} This method must return <b>S_OK</b>.
     * @see https://docs.microsoft.com/windows/win32/api//mbnapi/nf-mbnapi-imbnconnectionevents-onvoicecallstatechange
     */
    OnVoiceCallStateChange(newConnection) {
        result := ComCall(6, this, "ptr", newConnection, "HRESULT")
        return result
    }
}
