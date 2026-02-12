#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * This interface is a notification interface used to indicate when asynchronous PIN requests have completed.
 * @remarks
 * The following procedure describes how to register for notifications.
 * 
 * <ol>
 * <li>Get an <a href="https://docs.microsoft.com/windows/win32/api/ocidl/nn-ocidl-iconnectionpointcontainer">IConnectionPointContainer</a>  interface by calling <b>QueryInterface</b> on an <a href="https://docs.microsoft.com/windows/desktop/api/mbnapi/nn-mbnapi-imbninterfacemanager">IMbnInterfaceManager</a> object.</li>
 * <li>Call <a href="https://docs.microsoft.com/windows/win32/api/ocidl/nf-ocidl-iconnectionpointcontainer-findconnectionpoint">FindConnectionPoint</a> on the returned interface and pass <b>IID_IMbnPinEvents</b> to <i>riid</i>.</li>
 * <li>Call <a href="https://docs.microsoft.com/windows/win32/api/ocidl/nf-ocidl-iconnectionpoint-advise">Advise</a> on the returned connection point and pass a pointer to an <b>IUnknown</b> interface on an object that implements <b>IMbnPinEvents</b> to <i>pUnk</i>.</li>
 * </ol>
 * Notifications can be terminated by calling <a href="https://docs.microsoft.com/windows/win32/api/ocidl/nf-ocidl-iconnectionpoint-unadvise">Unadvise</a> on the connection point returned in step 2.
 * 
 * To view some code that registers for COM notifications, see the Client section of the <a href="https://docs.microsoft.com/archive/msdn-magazine/2007/september/clr-inside-out-com-connection-points">COM Connection Points</a> article.
 * @see https://learn.microsoft.com/windows/win32/api//content/mbnapi/nn-mbnapi-imbnpinevents
 * @namespace Windows.Win32.NetworkManagement.MobileBroadband
 * @version v4.0.30319
 */
class IMbnPinEvents extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMbnPinEvents
     * @type {Guid}
     */
    static IID => Guid("{dcbbbab6-2008-4bbb-aaee-338e368af6fa}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["OnEnableComplete", "OnDisableComplete", "OnEnterComplete", "OnChangeComplete", "OnUnblockComplete"]

    /**
     * Notification method called by the Mobile Broadband service to indicate that a PIN enable operation has completed.
     * @remarks
     * The <b>OnEnableComplete</b> method is called by the Mobile Broadband service to report the completion status of a PIN enable operation initialized by a call to the <a href="https://docs.microsoft.com/windows/desktop/api/mbnapi/nf-mbnapi-imbnpin-enable">Enable</a> method of <a href="https://docs.microsoft.com/windows/desktop/api/mbnapi/nn-mbnapi-imbnpin">IMbnPin</a>.
     * 
     * The contents of <i>pinInfo</i> are meaningful only when <i>status</i> is <b>E_MBN_FAILURE</b>.  The <b>pinState</b> member should be ignored and <b>pinType</b> field is set to the PIN type of the current <a href="https://docs.microsoft.com/windows/desktop/api/mbnapi/nn-mbnapi-imbnpin">IMbnPin</a> interface. This structure contains the attempts remaining to enter a valid PIN. 
     * 
     * 
     * For example, if the PIN passed to change a PIN type is incorrect then the operation will fail with a status code of <b>E_MBN_FAILURE</b>. In this case, <b>pinInfo.attemptsRemaining</b> specifies the number of attempts remaining to retry this operation.
     * If repeated attempts with the wrong PIN causes <b>attemptsRemaining</b> to become 0 then the application can call the <a href="https://docs.microsoft.com/windows/desktop/api/mbnapi/nf-mbnapi-imbnpinmanager-getpinstate">GetPinState</a> method of  <a href="https://docs.microsoft.com/windows/desktop/api/mbnapi/nn-mbnapi-imbnpinmanager">IMbnPinManager</a> to get the type of PIN required.
     * @param {IMbnPin} pin An <a href="https://docs.microsoft.com/windows/desktop/api/mbnapi/nn-mbnapi-imbnpin">IMbnPin</a> interface that represents  the PIN type.
     * @param {Pointer<MBN_PIN_INFO>} pinInfo A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/mbnapi/ns-mbnapi-mbn_pin_info">MBN_PIN_INFO</a> structure that contains information on remaining attempts, in case of failure operations.  The contents of <i>pinInfo</i> are meaningful only when <i>status</i> is <b>E_MBN_FAILURE</b>.
     * @param {Integer} requestID A request ID set by the Mobile Broadband service to identify the PIN enable request.
     * @param {HRESULT} status_ A status code that indicates the outcome of the operation.
     * @returns {HRESULT} This method must return <b>S_OK</b>.
     * @see https://learn.microsoft.com/windows/win32/api//content/mbnapi/nf-mbnapi-imbnpinevents-onenablecomplete
     */
    OnEnableComplete(pin, pinInfo, requestID, status_) {
        result := ComCall(3, this, "ptr", pin, "ptr", pinInfo, "uint", requestID, "int", status_, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Notification method called by the Mobile Broadband service to indicate that a PIN disable operation has completed.
     * @remarks
     * The <b>OnDisableComplete</b> method is called by the Mobile Broadband service to report the completion status of a PIN disable operation initialized by a call to the <a href="https://docs.microsoft.com/windows/desktop/api/mbnapi/nf-mbnapi-imbnpin-disable">Disable</a> method of <a href="https://docs.microsoft.com/windows/desktop/api/mbnapi/nn-mbnapi-imbnpin">IMbnPin</a>.
     * 
     * The contents of <i>pinInfo</i> are meaningful only when <i>status</i> is <b>E_MBN_FAILURE</b>.  The <b>pinState</b> member should be ignored and <b>pinType</b> field is set to the PIN type of the current <a href="https://docs.microsoft.com/windows/desktop/api/mbnapi/nn-mbnapi-imbnpin">IMbnPin</a> interface. This structure contains the attempts remaining to enter a valid PIN. 
     * 
     * 
     * For example, if the PIN passed to change a PIN type is incorrect then the operation will fail with a status code of <b>E_MBN_FAILURE</b>. In this case, <b>pinInfo.attemptsRemaining</b> specifies the number of attempts remaining to retry this operation.
     * If repeated attempts with the wrong PIN causes <b>attemptsRemaining</b> to become 0 then the application can call the <a href="https://docs.microsoft.com/windows/desktop/api/mbnapi/nf-mbnapi-imbnpinmanager-getpinstate">GetPinState</a> method of  <a href="https://docs.microsoft.com/windows/desktop/api/mbnapi/nn-mbnapi-imbnpinmanager">IMbnPinManager</a> to get the type of PIN required.
     * @param {IMbnPin} pin An <a href="https://docs.microsoft.com/windows/desktop/api/mbnapi/nn-mbnapi-imbnpin">IMbnPin</a> interface that the PIN type.
     * @param {Pointer<MBN_PIN_INFO>} pinInfo A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/mbnapi/ns-mbnapi-mbn_pin_info">MBN_PIN_INFO</a> structure that contains information on remaining attempts, in case of failure operations.  The contents of <i>pinInfo</i> are meaningful only when <i>status</i> is <b>E_MBN_FAILURE</b>.
     * @param {Integer} requestID A request ID set by the Mobile Broadband service to identify the PIN disable request.
     * @param {HRESULT} status_ A status code that indicates the outcome of the operation.
     * @returns {HRESULT} This method must return <b>S_OK</b>.
     * @see https://learn.microsoft.com/windows/win32/api//content/mbnapi/nf-mbnapi-imbnpinevents-ondisablecomplete
     */
    OnDisableComplete(pin, pinInfo, requestID, status_) {
        result := ComCall(4, this, "ptr", pin, "ptr", pinInfo, "uint", requestID, "int", status_, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Notification method called by the Mobile Broadband service to indicate that a PIN enter operation has completed.
     * @remarks
     * The <b>OnEnterComplete</b> method is called by the Mobile Broadband service to report the completion status of a PIN enter operation initialized by a call to the <a href="https://docs.microsoft.com/windows/desktop/api/mbnapi/nf-mbnapi-imbnpin-enter">Enter</a> method of <a href="https://docs.microsoft.com/windows/desktop/api/mbnapi/nn-mbnapi-imbnpin">IMbnPin</a>.
     * 
     * The contents of <i>pinInfo</i> are meaningful only when <i>status</i> is <b>E_MBN_FAILURE</b>.  The <b>pinState</b> member should be ignored and <b>pinType</b> field is set to the PIN type of the current <a href="https://docs.microsoft.com/windows/desktop/api/mbnapi/nn-mbnapi-imbnpin">IMbnPin</a> interface. This structure contains the attempts remaining to enter a valid PIN. 
     * 
     * 
     * For example, if the PIN passed to change a PIN type is incorrect then the operation will fail with a status code of <b>E_MBN_FAILURE</b>. In this case, <b>pinInfo.attemptsRemaining</b> specifies the number of attempts remaining to retry this operation.
     * If repeated attempts with the wrong PIN causes <b>attemptsRemaining</b> to become 0 then the application can call the <a href="https://docs.microsoft.com/windows/desktop/api/mbnapi/nf-mbnapi-imbnpinmanager-getpinstate">GetPinState</a> method of  <a href="https://docs.microsoft.com/windows/desktop/api/mbnapi/nn-mbnapi-imbnpinmanager">IMbnPinManager</a> to get the type of PIN required.
     * @param {IMbnPin} Pin An <a href="https://docs.microsoft.com/windows/desktop/api/mbnapi/nn-mbnapi-imbnpin">IMbnPin</a> interface that represents the PIN type.
     * @param {Pointer<MBN_PIN_INFO>} pinInfo A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/mbnapi/ns-mbnapi-mbn_pin_info">MBN_PIN_INFO</a> structure that contains information on remaining attempts, in case of failure operations.  The contents of <i>pinInfo</i> are meaningful only when <i>status</i> is <b>E_MBN_FAILURE</b>.
     * @param {Integer} requestID A request ID set by the Mobile Broadband service to identify the PIN enter request.
     * @param {HRESULT} status_ A status code that indicates the outcome of the operation.
     * @returns {HRESULT} This method must return <b>S_OK</b>.
     * @see https://learn.microsoft.com/windows/win32/api//content/mbnapi/nf-mbnapi-imbnpinevents-onentercomplete
     */
    OnEnterComplete(Pin, pinInfo, requestID, status_) {
        result := ComCall(5, this, "ptr", Pin, "ptr", pinInfo, "uint", requestID, "int", status_, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Notification method called by the Mobile Broadband service to indicate that a PIN change operation has completed.
     * @remarks
     * The <b>OnChangeComplete</b> method is called by the Mobile Broadband service to report the completion status of a PIN change operation initialized by a call to the <a href="https://docs.microsoft.com/windows/desktop/api/mbnapi/nf-mbnapi-imbnpin-change">Change</a> method of <a href="https://docs.microsoft.com/windows/desktop/api/mbnapi/nn-mbnapi-imbnpin">IMbnPin</a>.
     * 
     * The contents of <i>pinInfo</i> are meaningful only when <i>status</i> is <b>E_MBN_FAILURE</b>.  The <b>pinState</b> member should be ignored and <b>pinType</b> field is set to the PIN type of the current <a href="https://docs.microsoft.com/windows/desktop/api/mbnapi/nn-mbnapi-imbnpin">IMbnPin</a> interface. This structure contains the attempts remaining to enter a valid PIN.
     * 
     * For example, if the PIN passed to change a PIN type is incorrect then the operation will fail with a status code of <b>E_MBN_FAILURE</b>. In this case, <b>pinInfo.attemptsRemaining</b> specifies the number of attempts remaining to retry this operation.
     * If repeated attempts with the wrong PIN causes <b>attemptsRemaining</b> to become 0 then the application can call the <a href="https://docs.microsoft.com/windows/desktop/api/mbnapi/nf-mbnapi-imbnpinmanager-getpinstate">GetPinState</a> method of  <a href="https://docs.microsoft.com/windows/desktop/api/mbnapi/nn-mbnapi-imbnpinmanager">IMbnPinManager</a> to get the type of PIN required.
     * @param {IMbnPin} Pin An <a href="https://docs.microsoft.com/windows/desktop/api/mbnapi/nn-mbnapi-imbnpin">IMbnPin</a> interface that represents the PIN type.
     * @param {Pointer<MBN_PIN_INFO>} pinInfo A pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/mbnapi/ns-mbnapi-mbn_pin_info">MBN_PIN_INFO</a> structure that contains information on remaining attempts, in case of failure operations.  The contents of <i>pinInfo</i> are meaningful only when <i>status</i> is <b>E_MBN_FAILURE</b>.
     * @param {Integer} requestID A request ID set by the Mobile Broadband service to identify the PIN change request.
     * @param {HRESULT} status_ A status code that indicates the outcome of the PIN change operation.
     * @returns {HRESULT} This method must return <b>S_OK</b>.
     * @see https://learn.microsoft.com/windows/win32/api//content/mbnapi/nf-mbnapi-imbnpinevents-onchangecomplete
     */
    OnChangeComplete(Pin, pinInfo, requestID, status_) {
        result := ComCall(6, this, "ptr", Pin, "ptr", pinInfo, "uint", requestID, "int", status_, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Notification method called by the Mobile Broadband service to indicate that a PIN unblock operation has completed.
     * @remarks
     * The <b>OnUnblockComplete</b> method is called by the Mobile Broadband service to report the completion status of a PIN unblock operation initialized by a call to the <a href="https://docs.microsoft.com/windows/desktop/api/mbnapi/nf-mbnapi-imbnpin-unblock">Unblock</a> method of <a href="https://docs.microsoft.com/windows/desktop/api/mbnapi/nn-mbnapi-imbnpin">IMbnPin</a>. 
     * 
     * 
     * The contents of <i>pinInfo</i> are meaningful only when <i>status</i> is <b>E_MBN_FAILURE</b>.  The <b>pinState</b> member should be ignored and <b>pinType</b> field is set to the PIN type of the current <a href="https://docs.microsoft.com/windows/desktop/api/mbnapi/nn-mbnapi-imbnpin">IMbnPin</a> interface. This structure contains the attempts remaining to enter a valid PIN.
     * 
     * For example, if the PIN passed to change a PIN type is incorrect then the operation will fail with a status code of <b>E_MBN_FAILURE</b>. In this case, <b>pinInfo.attemptsRemaining</b> specifies the number of attempts remaining to retry this operation.
     * If repeated attempts with the wrong PIN causes <b>attemptsRemaining</b> to become 0 then the application can call the <a href="https://docs.microsoft.com/windows/desktop/api/mbnapi/nf-mbnapi-imbnpinmanager-getpinstate">GetPinState</a> method of  <a href="https://docs.microsoft.com/windows/desktop/api/mbnapi/nn-mbnapi-imbnpinmanager">IMbnPinManager</a> to get the type of PIN required.
     * 
     * If the device fails to unblock, and if the PUK blocking is of a <b>MBN_PIN_TYPE_PIN1</b> pin, then it will also result in the ready state of the device  changing to <b>MBN_READY_STATE_BAD_SIM</b>.  The calling application will be notified about the ReadyState change through the  <a href="https://docs.microsoft.com/windows/desktop/api/mbnapi/nf-mbnapi-imbninterfaceevents-onreadystatechange">OnReadyStateChange</a> member of <a href="https://docs.microsoft.com/windows/desktop/api/mbnapi/nn-mbnapi-imbninterfaceevents">IMbnInterfaceEvents</a>.
     * @param {IMbnPin} Pin An <a href="https://docs.microsoft.com/windows/desktop/api/mbnapi/nn-mbnapi-imbnpin">IMbnPin</a> interface that represents the PIN type.
     * @param {Pointer<MBN_PIN_INFO>} pinInfo A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/mbnapi/ns-mbnapi-mbn_pin_info">MBN_PIN_INFO</a> structure that contains information on remaining attempts, in case of failure operations.  The contents of <i>pinInfo</i> are meaningful only when <i>status</i> is <b>E_MBN_FAILURE</b>.
     * @param {Integer} requestID A request ID set by the Mobile Broadband service to identify the PIN unblock request.
     * @param {HRESULT} status_ A status code that indicates the outcome of the operation.
     * @returns {HRESULT} This method must return <b>S_OK</b>.
     * @see https://learn.microsoft.com/windows/win32/api//content/mbnapi/nf-mbnapi-imbnpinevents-onunblockcomplete
     */
    OnUnblockComplete(Pin, pinInfo, requestID, status_) {
        result := ComCall(7, this, "ptr", Pin, "ptr", pinInfo, "uint", requestID, "int", status_, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
