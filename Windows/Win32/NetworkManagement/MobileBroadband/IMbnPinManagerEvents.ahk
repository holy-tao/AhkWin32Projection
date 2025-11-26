#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Notification interface used to indicate when PIN Manager events have occurred.
 * @remarks
 * 
 * The following procedure describes how to register for notifications.
 * 
 * <ol>
 * <li>Get an <a href="https://docs.microsoft.com/windows/win32/api/ocidl/nn-ocidl-iconnectionpointcontainer">IConnectionPointContainer</a>  interface by calling <b>QueryInterface</b> on an <a href="https://docs.microsoft.com/windows/desktop/api/mbnapi/nn-mbnapi-imbninterfacemanager">IMbnInterfaceManager</a> object.</li>
 * <li>Call <a href="https://docs.microsoft.com/windows/win32/api/ocidl/nf-ocidl-iconnectionpointcontainer-findconnectionpoint">FindConnectionPoint</a> on the returned interface and pass <b>IID_IMbnPinManagerEvents</b> to <i>riid</i>.</li>
 * <li>Call <a href="https://docs.microsoft.com/windows/win32/api/ocidl/nf-ocidl-iconnectionpoint-advise">Advise</a> on the returned connection point and pass a pointer to an <b>IUnknown</b> interface on an object that implements <b>IMbnPinManagerEvents</b> to <i>pUnk</i>.</li>
 * </ol>
 * Notifications can be terminated by calling <a href="https://docs.microsoft.com/windows/win32/api/ocidl/nf-ocidl-iconnectionpoint-unadvise">Unadvise</a> on the connection point returned in step 2.
 * 
 * To view some code that registers for COM notifications, see the Client section of the <a href="https://docs.microsoft.com/archive/msdn-magazine/2007/september/clr-inside-out-com-connection-points">COM Connection Points</a> article.
 * 
 * @see https://docs.microsoft.com/windows/win32/api//mbnapi/nn-mbnapi-imbnpinmanagerevents
 * @namespace Windows.Win32.NetworkManagement.MobileBroadband
 * @version v4.0.30319
 */
class IMbnPinManagerEvents extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMbnPinManagerEvents
     * @type {Guid}
     */
    static IID => Guid("{dcbbbab6-2006-4bbb-aaee-338e368af6fa}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["OnPinListAvailable", "OnGetPinStateComplete"]

    /**
     * Notification method called by the Mobile Broadband service to indicate that the list of device PINs is available.
     * @param {IMbnPinManager} pinManager Pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/mbnapi/nn-mbnapi-imbnpinmanager">IMbnPinManager</a> interface that represents the Mobile Broadband device for which the PIN list is available.
     * @returns {HRESULT} This method must return <b>S_OK</b>.
     * @see https://docs.microsoft.com/windows/win32/api//mbnapi/nf-mbnapi-imbnpinmanagerevents-onpinlistavailable
     */
    OnPinListAvailable(pinManager) {
        result := ComCall(3, this, "ptr", pinManager, "HRESULT")
        return result
    }

    /**
     * Notification method called by the Mobile Broadband service to indicate the completion of an asynchronous operation triggered by a call to the GetPinState method of IMbnPinManager.
     * @param {IMbnPinManager} pinManager Pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/mbnapi/nn-mbnapi-imbnpinmanager">IMbnPinManager</a> interface that represents the Mobile Broadband device for which the operation was performed.
     * @param {MBN_PIN_INFO} pinInfo A <a href="https://docs.microsoft.com/windows/desktop/api/mbnapi/ns-mbnapi-mbn_pin_info">MBN_PIN_INFO</a> structure that contains the device PIN information.
     * 
     * If <b>pinInfo.pinState</b> is set to <b>MBN_PIN_STATE_NONE</b> then no PIN is expected to be entered by device.
     * 
     * If <b>pinInfo.pinState</b> is set to <b>MBN_PIN_STATE_ENTER</b> then the device is expecting a PIN to be entered and <b>pinInfo.pinType</b> represents the type of PIN expected by device.
     * 
     * If <b>pinInfo.pinState</b> is set to <b>MBN_PIN_STATE_UNBLOCK</b> then the device is PIN blocked and a PIN unblock operation should be tried to unblock the device. In this case, <b>pinInfo.pinType</b> represents the PIN type on which the unblock operation should be performed. 
     * 
     * 
     * If <b>pinInfo.pinState</b> is set to <b>MBN_PIN_STATE_ENTER</b> or <b>MBN_PIN_STATE_UNBLOCK</b>, then <b>pinInfo.attemptsRemaining</b> contains the number of attempts remaining to enter a valid PIN or PIN unblock key (PUK). If the number of attempts remaining is unknown then <b>pinInfo.attemptsRemaining</b> is set to <b>MBN_ATTEMPTS_REMAINING_UNKNOWN</b>.
     * @param {Integer} requestID The request ID assigned by the Mobile Broadband service to identify this operation.
     * @param {HRESULT} status The operation completion status.
     * @returns {HRESULT} This method must return <b>S_OK</b>.
     * @see https://docs.microsoft.com/windows/win32/api//mbnapi/nf-mbnapi-imbnpinmanagerevents-ongetpinstatecomplete
     */
    OnGetPinStateComplete(pinManager, pinInfo, requestID, status) {
        result := ComCall(4, this, "ptr", pinManager, "ptr", pinInfo, "uint", requestID, "int", status, "HRESULT")
        return result
    }
}
