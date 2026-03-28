#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Notification interface used to indicate when registration events have occurred.
 * @remarks
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
 * @see https://learn.microsoft.com/windows/win32/api/mbnapi/nn-mbnapi-imbnregistrationevents
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
     * Notification method called by the Mobile Broadband service to indicate that registration mode information is available.
     * @remarks
     * The <b>OnRegisterModeAvailable</b> method is called by the Mobile Broadband service to signal that  the registration mode information for a device is available. An application can call the <a href="https://docs.microsoft.com/windows/desktop/api/mbnapi/nf-mbnapi-imbnregistration-getregistermode">GetRegisterMode</a> method of the passed <a href="https://docs.microsoft.com/windows/desktop/api/mbnapi/nn-mbnapi-imbnregistration">IMbnRegistration</a> get the current registration mode of the device.
     * @param {IMbnRegistration} newInterface Pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/mbnapi/nn-mbnapi-imbnregistration">IMbnRegistration</a> interface that represents the applicable device.
     * @returns {HRESULT} This method must return <b>S_OK</b>.
     * @see https://learn.microsoft.com/windows/win32/api/mbnapi/nf-mbnapi-imbnregistrationevents-onregistermodeavailable
     */
    OnRegisterModeAvailable(newInterface) {
        result := ComCall(3, this, "ptr", newInterface, "HRESULT")
        return result
    }

    /**
     * Notification method called by the Mobile Broadband service to indicate a change in the device's registration state.
     * @remarks
     * The <b>OnRegisterStateChange</b> method is called by the Mobile Broadband service to signal a change in the device registration state. It may  be called if any of the following changes:
     * 
     * <ul>
     * <li>There is a change in the registration state of the device.  For example, if the device goes from its home network to a roaming network, then the registration state can change from <b>MBN_REGISTER_STATE_HOME</b> to <b>MBN_REGISTER_STATE_ROAMING</b>.</li>
     * <li>There is a change in registered provider ID, name, or roaming text.</li>
     * <li>There is a change in the last reported network error code for a registration operation.</li>
     * </ul>
     * An application can use the passed <a href="https://docs.microsoft.com/windows/desktop/api/mbnapi/nn-mbnapi-imbnregistration">IMbnRegistration</a> interface to get the updated registration state data.
     * @param {IMbnRegistration} newInterface Pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/mbnapi/nn-mbnapi-imbnregistration">IMbnRegistration</a> interface that represents the applicable device.
     * @returns {HRESULT} This method must return <b>S_OK</b>.
     * @see https://learn.microsoft.com/windows/win32/api/mbnapi/nf-mbnapi-imbnregistrationevents-onregisterstatechange
     */
    OnRegisterStateChange(newInterface) {
        result := ComCall(4, this, "ptr", newInterface, "HRESULT")
        return result
    }

    /**
     * Notification method called by the Mobile Broadband service to indicate a change in the device packet service state.
     * @remarks
     * The <b>OnPacketServiceStateChange</b> method is called by the Mobile Broadband service to signal a change in the packet service state of the device. This can occur if	there is a change in the current data class, the available data class, or a packet attach network error.
     * An application can use the passed <a href="https://docs.microsoft.com/windows/desktop/api/mbnapi/nn-mbnapi-imbnregistration">IMbnRegistration</a> interface to get updated state values.
     * @param {IMbnRegistration} newInterface Pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/mbnapi/nn-mbnapi-imbnregistration">IMbnRegistration</a> interface that represents the device whose packet service state has changed.
     * @returns {HRESULT} This method must return <b>S_OK</b>.
     * @see https://learn.microsoft.com/windows/win32/api/mbnapi/nf-mbnapi-imbnregistrationevents-onpacketservicestatechange
     */
    OnPacketServiceStateChange(newInterface) {
        result := ComCall(5, this, "ptr", newInterface, "HRESULT")
        return result
    }

    /**
     * Notification method called by the Mobile Broadband service to indicate that it has completed a set registration operation.
     * @param {IMbnRegistration} newInterface Pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/mbnapi/nn-mbnapi-imbnregistration">IMbnRegistration</a> interface that represents the applicable device.  The handling application can use this interface to get the current registration state of the device.
     * @param {Integer} requestID The request ID assigned by the Mobile Broadband service to track the set registration operation.
     * @param {HRESULT} _status 
     * @returns {HRESULT} This method must return <b>S_OK</b>.
     * @see https://learn.microsoft.com/windows/win32/api/mbnapi/nf-mbnapi-imbnregistrationevents-onsetregistermodecomplete
     */
    OnSetRegisterModeComplete(newInterface, requestID, _status) {
        result := ComCall(6, this, "ptr", newInterface, "uint", requestID, "int", _status, "HRESULT")
        return result
    }
}
