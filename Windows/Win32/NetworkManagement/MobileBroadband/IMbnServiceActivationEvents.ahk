#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * This notification interface signals an application about the completion of a service activation request.
 * @remarks
 * 
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
 * 
 * @see https://docs.microsoft.com/windows/win32/api//mbnapi/nn-mbnapi-imbnserviceactivationevents
 * @namespace Windows.Win32.NetworkManagement.MobileBroadband
 * @version v4.0.30319
 */
class IMbnServiceActivationEvents extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMbnServiceActivationEvents
     * @type {Guid}
     */
    static IID => Guid("{dcbbbab6-2018-4bbb-aaee-338e368af6fa}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["OnActivationComplete"]

    /**
     * Notification method called by the Mobile Broadband service to indicate that a service activation request ahs completed.
     * @param {IMbnServiceActivation} serviceActivation Pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/mbnapi/nn-mbnapi-imbnserviceactivation">IMbnServiceActivation</a> interface representing the device on which the request was performed.
     * @param {Pointer<SAFEARRAY>} vendorSpecificData A byte array containing the data returned by the underlying Mobile Broadband miniport driver in <a href="https://docs.microsoft.com/windows-hardware/drivers/network/ndis-status-wwan-service-activation">NDIS_STATUS_WWAN_SERVICE_ACTIVATION</a>.
     * @param {Integer} requestID The request ID assigned by the Mobile Broadband service when the request was initialized.
     * @param {HRESULT} status The completion status.
     * @param {Integer} networkError The error code returned by the network during the activation operation. This value is meaningful only when <i>status</i> is not S_OK. 
     * 
     * The exact value of <i>networkError</i> is driver/network dependent.
     * @returns {HRESULT} This method must return <b>S_OK</b>.
     * @see https://docs.microsoft.com/windows/win32/api//mbnapi/nf-mbnapi-imbnserviceactivationevents-onactivationcomplete
     */
    OnActivationComplete(serviceActivation, vendorSpecificData, requestID, status, networkError) {
        result := ComCall(3, this, "ptr", serviceActivation, "ptr", vendorSpecificData, "uint", requestID, "int", status, "uint", networkError, "HRESULT")
        return result
    }
}
