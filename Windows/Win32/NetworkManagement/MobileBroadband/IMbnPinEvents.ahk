#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\MBN_PIN_INFO.ahk" { MBN_PIN_INFO }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }
#Import ".\IMbnPin.ahk" { IMbnPin }

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
 * @see https://learn.microsoft.com/windows/win32/api/mbnapi/nn-mbnapi-imbnpinevents
 * @namespace Windows.Win32.NetworkManagement.MobileBroadband
 */
export default struct IMbnPinEvents extends IUnknown {
    /**
     * The interface identifier for IMbnPinEvents
     * @type {Guid}
     */
    static IID := Guid("{dcbbbab6-2008-4bbb-aaee-338e368af6fa}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IMbnPinEvents interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        OnEnableComplete  : IntPtr
        OnDisableComplete : IntPtr
        OnEnterComplete   : IntPtr
        OnChangeComplete  : IntPtr
        OnUnblockComplete : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IMbnPinEvents.Vtbl()
        }
        super.__New(implObj, flags)
    }

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
     * @param {HRESULT} _status A status code that indicates the outcome of the operation.
     * @returns {HRESULT} This method must return <b>S_OK</b>.
     * @see https://learn.microsoft.com/windows/win32/api/mbnapi/nf-mbnapi-imbnpinevents-onenablecomplete
     */
    OnEnableComplete(pin, pinInfo, requestID, _status) {
        result := ComCall(3, this, "ptr", pin, MBN_PIN_INFO.Ptr, pinInfo, "uint", requestID, "int", _status, "HRESULT")
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
     * @param {HRESULT} _status A status code that indicates the outcome of the operation.
     * @returns {HRESULT} This method must return <b>S_OK</b>.
     * @see https://learn.microsoft.com/windows/win32/api/mbnapi/nf-mbnapi-imbnpinevents-ondisablecomplete
     */
    OnDisableComplete(pin, pinInfo, requestID, _status) {
        result := ComCall(4, this, "ptr", pin, MBN_PIN_INFO.Ptr, pinInfo, "uint", requestID, "int", _status, "HRESULT")
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
     * @param {HRESULT} _status A status code that indicates the outcome of the operation.
     * @returns {HRESULT} This method must return <b>S_OK</b>.
     * @see https://learn.microsoft.com/windows/win32/api/mbnapi/nf-mbnapi-imbnpinevents-onentercomplete
     */
    OnEnterComplete(Pin, pinInfo, requestID, _status) {
        result := ComCall(5, this, "ptr", Pin, MBN_PIN_INFO.Ptr, pinInfo, "uint", requestID, "int", _status, "HRESULT")
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
     * @param {HRESULT} _status A status code that indicates the outcome of the PIN change operation.
     * @returns {HRESULT} This method must return <b>S_OK</b>.
     * @see https://learn.microsoft.com/windows/win32/api/mbnapi/nf-mbnapi-imbnpinevents-onchangecomplete
     */
    OnChangeComplete(Pin, pinInfo, requestID, _status) {
        result := ComCall(6, this, "ptr", Pin, MBN_PIN_INFO.Ptr, pinInfo, "uint", requestID, "int", _status, "HRESULT")
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
     * @param {HRESULT} _status A status code that indicates the outcome of the operation.
     * @returns {HRESULT} This method must return <b>S_OK</b>.
     * @see https://learn.microsoft.com/windows/win32/api/mbnapi/nf-mbnapi-imbnpinevents-onunblockcomplete
     */
    OnUnblockComplete(Pin, pinInfo, requestID, _status) {
        result := ComCall(7, this, "ptr", Pin, MBN_PIN_INFO.Ptr, pinInfo, "uint", requestID, "int", _status, "HRESULT")
        return result
    }

    Query(iid) {
        if (IMbnPinEvents.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.OnEnableComplete := CallbackCreate(GetMethod(implObj, "OnEnableComplete"), flags, 5)
        this.vtbl.OnDisableComplete := CallbackCreate(GetMethod(implObj, "OnDisableComplete"), flags, 5)
        this.vtbl.OnEnterComplete := CallbackCreate(GetMethod(implObj, "OnEnterComplete"), flags, 5)
        this.vtbl.OnChangeComplete := CallbackCreate(GetMethod(implObj, "OnChangeComplete"), flags, 5)
        this.vtbl.OnUnblockComplete := CallbackCreate(GetMethod(implObj, "OnUnblockComplete"), flags, 5)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.OnEnableComplete)
        CallbackFree(this.vtbl.OnDisableComplete)
        CallbackFree(this.vtbl.OnEnterComplete)
        CallbackFree(this.vtbl.OnChangeComplete)
        CallbackFree(this.vtbl.OnUnblockComplete)
    }
}
