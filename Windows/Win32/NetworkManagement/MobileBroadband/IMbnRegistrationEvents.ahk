#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Notification interface used to indicate when registration events have occurred.
 * @remarks
 * 
  * The following procedure describes how to register for notifications.
  * 
  * <ol>
  * <li>Get an <a href="https://docs.microsoft.com/windows/win32/api/ocidl/nn-ocidl-iconnectionpointcontainer">IConnectionPointContainer</a>  interface by calling <b>QueryInterface</b> on an <a href="https://docs.microsoft.com/windows/desktop/api/mbnapi/nn-mbnapi-imbninterfacemanager">IMbnInterfaceManager</a> object.</li>
  * <li>Call <a href="https://docs.microsoft.com/windows/win32/api/ocidl/nf-ocidl-iconnectionpointcontainer-findconnectionpoint">FindConnectionPoint</a> on the returned interface and pass <b>IID_IMbnRegistrationEvents</b> to <i>riid</i>.</li>
  * <li>Call <a href="https://docs.microsoft.com/windows/win32/api/ocidl/nf-ocidl-iconnectionpoint-advise">Advise</a> on the returned connection point and pass a pointer to an <b>IUnknown</b> interface on an object that implements <b>IMbnRegistrationEvents</b> to <i>pUnk</i>.</li>
  * </ol>
  * Notifications can be terminated by calling <a href="https://docs.microsoft.com/windows/win32/api/ocidl/nf-ocidl-iconnectionpoint-unadvise">Unadvise</a> on the connection point returned in step 2.
  * 
  * To view some code that registers for COM notifications, see the Client section of the <a href="https://docs.microsoft.com/archive/msdn-magazine/2007/september/clr-inside-out-com-connection-points">COM Connection Points</a> article.
  * 
 * @see https://docs.microsoft.com/windows/win32/api//mbnapi/nn-mbnapi-imbnregistrationevents
 * @namespace Windows.Win32.NetworkManagement.MobileBroadband
 * @version v4.0.30319
 */
class IMbnRegistrationEvents extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMbnRegistrationEvents
     * @type {Guid}
     */
    static IID => Guid("{dcbbbab6-200a-4bbb-aaee-338e368af6fa}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["OnRegisterModeAvailable", "OnRegisterStateChange", "OnPacketServiceStateChange", "OnSetRegisterModeComplete"]

    /**
     * 
     * @param {IMbnRegistration} newInterface 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mbnapi/nf-mbnapi-imbnregistrationevents-onregistermodeavailable
     */
    OnRegisterModeAvailable(newInterface) {
        result := ComCall(3, this, "ptr", newInterface, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IMbnRegistration} newInterface 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mbnapi/nf-mbnapi-imbnregistrationevents-onregisterstatechange
     */
    OnRegisterStateChange(newInterface) {
        result := ComCall(4, this, "ptr", newInterface, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IMbnRegistration} newInterface 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mbnapi/nf-mbnapi-imbnregistrationevents-onpacketservicestatechange
     */
    OnPacketServiceStateChange(newInterface) {
        result := ComCall(5, this, "ptr", newInterface, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IMbnRegistration} newInterface 
     * @param {Integer} requestID 
     * @param {HRESULT} status 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mbnapi/nf-mbnapi-imbnregistrationevents-onsetregistermodecomplete
     */
    OnSetRegisterModeComplete(newInterface, requestID, status) {
        result := ComCall(6, this, "ptr", newInterface, "uint", requestID, "int", status, "HRESULT")
        return result
    }
}
