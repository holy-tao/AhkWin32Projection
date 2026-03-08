#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * This notification interface signals an application with the completion status of SMS operations and changes in the device SMS status.
 * @remarks
 * The following procedure describes how to register for notifications.
 * 
 * <ol>
 * <li>Get an <a href="https://docs.microsoft.com/windows/win32/api/ocidl/nn-ocidl-iconnectionpointcontainer">IConnectionPointContainer</a>  interface by calling <b>QueryInterface</b> on an <a href="https://docs.microsoft.com/windows/desktop/api/mbnapi/nn-mbnapi-imbninterfacemanager">IMbnInterfaceManager</a> object.</li>
 * <li>Call <a href="https://docs.microsoft.com/windows/win32/api/ocidl/nf-ocidl-iconnectionpointcontainer-findconnectionpoint">FindConnectionPoint</a> on the returned interface and pass <b>IID_IMbnSmsEvents</b> to <i>riid</i>.</li>
 * <li>Call <a href="https://docs.microsoft.com/windows/win32/api/ocidl/nf-ocidl-iconnectionpoint-advise">Advise</a> on the returned connection point and pass a pointer to an <b>IUnknown</b> interface on an object that implements <b>IMbnSmsEvents</b> to <i>pUnk</i>.</li>
 * </ol>
 * Notifications can be terminated by calling <a href="https://docs.microsoft.com/windows/win32/api/ocidl/nf-ocidl-iconnectionpoint-unadvise">Unadvise</a> on the connection point returned in step 2.
 * 
 * To view some code that registers for COM notifications, see the Client section of the <a href="https://docs.microsoft.com/archive/msdn-magazine/2007/september/clr-inside-out-com-connection-points">COM Connection Points</a> article.
 * @see https://learn.microsoft.com/windows/win32/api/mbnapi/nn-mbnapi-imbnsmsevents
 * @namespace Windows.Win32.NetworkManagement.MobileBroadband
 * @version v4.0.30319
 */
class IMbnSmsEvents extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMbnSmsEvents
     * @type {Guid}
     */
    static IID => Guid("{dcbbbab6-2016-4bbb-aaee-338e368af6fa}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["OnSmsConfigurationChange", "OnSetSmsConfigurationComplete", "OnSmsSendComplete", "OnSmsReadComplete", "OnSmsNewClass0Message", "OnSmsDeleteComplete", "OnSmsStatusChange"]

    /**
     * Notification method that indicates that SMS configuration has changed or is available.
     * @remarks
     * An application can use the <a href="https://docs.microsoft.com/windows/desktop/api/mbnapi/nn-mbnapi-imbnsms">IMbnSms</a> to get the new configuration details.
     * @param {IMbnSms} sms A pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/mbnapi/nn-mbnapi-imbnsms">IMbnSms</a> interface representing the Mobile Broadband device for which the SMS configuration is now available.
     * @returns {HRESULT} This method must return <b>S_OK</b>.
     * @see https://learn.microsoft.com/windows/win32/api/mbnapi/nf-mbnapi-imbnsmsevents-onsmsconfigurationchange
     */
    OnSmsConfigurationChange(sms) {
        result := ComCall(3, this, "ptr", sms, "HRESULT")
        return result
    }

    /**
     * Notification method signaling that a set SMS configuration operation has completed, or that the SMS subsystem is initialized and ready for operation.
     * @remarks
     * This method is used to notify an application of the completion of a set SMS configuration operation. The application can use the passed <a href="https://docs.microsoft.com/windows/desktop/api/mbnapi/nn-mbnapi-imbnsms">IMbnSms</a> interface to get the new configuration information. It is also used by the device to indicate the readiness of the device's SMS subsystem. Upon system startup or device insertion, this method will be called to notify applications that the device SMS subsystem is ready for operation.
     * @param {IMbnSms} sms A pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/mbnapi/nn-mbnapi-imbnsms">IMbnSms</a> interface representing the Mobile Broadband device for which the SMS configuration has been updated.
     * @param {Integer} requestID A request ID assigned by the Mobile Broadband service to identify the operation.
     * @param {HRESULT} status A status code that indicates the outcome of the operation.
     * @returns {HRESULT} This method must return <b>S_OK</b>.
     * @see https://learn.microsoft.com/windows/win32/api/mbnapi/nf-mbnapi-imbnsmsevents-onsetsmsconfigurationcomplete
     */
    OnSetSmsConfigurationComplete(sms, requestID, status) {
        result := ComCall(4, this, "ptr", sms, "uint", requestID, "int", status, "HRESULT")
        return result
    }

    /**
     * Notification method that indicates the completion of a message send operation.
     * @remarks
     * A send operation should be tried only after the device is successfully registered to the network.
     * @param {IMbnSms} sms An <a href="https://docs.microsoft.com/windows/desktop/api/mbnapi/nn-mbnapi-imbnsms">IMbnSms</a> interface representing the Mobile Broadband device from which the operation completed.
     * @param {Integer} requestID A  request ID assigned by the Mobile Broadband service to identify the operation.
     * @param {HRESULT} status A status code that indicates the outcome of the operation.
     * @returns {HRESULT} This method must return <b>S_OK</b>.
     * @see https://learn.microsoft.com/windows/win32/api/mbnapi/nf-mbnapi-imbnsmsevents-onsmssendcomplete
     */
    OnSmsSendComplete(sms, requestID, status) {
        result := ComCall(5, this, "ptr", sms, "uint", requestID, "int", status, "HRESULT")
        return result
    }

    /**
     * Notification method indicating the completion of a message read operation.
     * @remarks
     * For GSM devices, the calling application should call <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-queryinterface(q)">QueryInterface</a> on the each element in <i>readMsgs</i> for an <a href="https://docs.microsoft.com/windows/desktop/api/mbnapi/nn-mbnapi-imbnsmsreadmsgpdu">IMbnSmsReadMsgPdu</a> interface.
     * 
     *   For CDMA devices, if <i>smsFormat</i> is <b>MBN_SMS_FORMAT_TEXT</b>,  the application should call <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-queryinterface(q)">QueryInterface</a> for an <a href="https://docs.microsoft.com/windows/desktop/api/mbnapi/nn-mbnapi-imbnsmsreadmsgtextcdma">IMbnSmsReadMsgTextCdma</a> interface; otherwise, if <i>smsFormat</i> is <b>MBN_SMS_FORMAT_PDU</b>, the application should call <b>QueryInterface</b> for an <a href="https://docs.microsoft.com/windows/desktop/api/mbnapi/nn-mbnapi-imbnsmsreadmsgpdu">IMbnSmsReadMsgPdu</a> interface.
     * 
     * If a read request results in a large amount of messages being read, then <b>OnSmsReadComplete</b> may be called repeatedly until <i>moreMsgs</i> indicates there are no more messages to be read.
     * @param {IMbnSms} sms An <a href="https://docs.microsoft.com/windows/desktop/api/mbnapi/nn-mbnapi-imbnsms">IMbnSms</a> interface representing the message store that completed the operation.
     * @param {Integer} smsFormat An <a href="https://docs.microsoft.com/windows/desktop/api/mbnapi/ne-mbnapi-mbn_sms_format">MBN_SMS_FORMAT</a> value that defines the format of the SMS message.
     * @param {Pointer<SAFEARRAY>} readMsgs An array of messages read from the device.
     * @param {VARIANT_BOOL} moreMsgs A Boolean value that indicates whether there are more messages still being processed.  If this is <b>TRUE</b>, then <b>OnSmsReadComplete</b> will be called repeatedly until there are not more messages and <i>moreMsgs</i> is <b>FALSE</b>.
     * @param {Integer} requestID A request ID assigned by the Mobile Broadband service to identify the message read operation.
     * @param {HRESULT} status A status code that indicates the outcome of the operation.
     * @returns {HRESULT} This method must return <b>S_OK</b>.
     * @see https://learn.microsoft.com/windows/win32/api/mbnapi/nf-mbnapi-imbnsmsevents-onsmsreadcomplete
     */
    OnSmsReadComplete(sms, smsFormat, readMsgs, moreMsgs, requestID, status) {
        result := ComCall(6, this, "ptr", sms, "int", smsFormat, "ptr", readMsgs, "short", moreMsgs, "uint", requestID, "int", status, "HRESULT")
        return result
    }

    /**
     * Notification method signaling the arrival of a new class 0/flash message.
     * @remarks
     * For GSM devices, the calling application should call <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-queryinterface(q)">QueryInterface</a> on each element in <i>readMsgs</i> for an <a href="https://docs.microsoft.com/windows/desktop/api/mbnapi/nn-mbnapi-imbnsmsreadmsgpdu">IMbnSmsReadMsgPdu</a> interface.
     * 
     * For CDMA devices, if <i>smsFormat</i> is <b>MBN_SMS_FORMAT_TEXT</b>, then the calling application should call <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-queryinterface(q)">QueryInterface</a> for a <a href="https://docs.microsoft.com/windows/desktop/api/mbnapi/nn-mbnapi-imbnsmsreadmsgtextcdma">IMbnSmsReadMsgTextCdma</a> interface. If <i>smsFormat</i> is <b>MBN_SMS_FORMAT_PDU</b>, then the calling application should call <b>QueryInterface</b> for a <a href="https://docs.microsoft.com/windows/desktop/api/mbnapi/nn-mbnapi-imbnsmsreadmsgpdu">IMbnSmsReadMsgPdu</a> interface.
     * @param {IMbnSms} sms An <a href="https://docs.microsoft.com/windows/desktop/api/mbnapi/nn-mbnapi-imbnsms">IMbnSms</a> interface representing the Mobile Broadband device that received the new message(s).
     * @param {Integer} smsFormat An <a href="https://docs.microsoft.com/windows/desktop/api/mbnapi/ne-mbnapi-mbn_sms_format">MBN_SMS_FORMAT</a> value that defines the format of the new SMS message.
     * @param {Pointer<SAFEARRAY>} readMsgs An array of new messages.
     * @returns {HRESULT} This method must return <b>S_OK</b>.
     * @see https://learn.microsoft.com/windows/win32/api/mbnapi/nf-mbnapi-imbnsmsevents-onsmsnewclass0message
     */
    OnSmsNewClass0Message(sms, smsFormat, readMsgs) {
        result := ComCall(7, this, "ptr", sms, "int", smsFormat, "ptr", readMsgs, "HRESULT")
        return result
    }

    /**
     * Notification method that signals the completion of an SMS deletion operation.
     * @param {IMbnSms} sms An <a href="https://docs.microsoft.com/windows/desktop/api/mbnapi/nn-mbnapi-imbnsms">IMbnSms</a> interface representing the Mobile Broadband device from which the messages were deleted.
     * @param {Integer} requestID A request ID assigned by the Mobile Broadband service to identify the operation.
     * @param {HRESULT} status A status code that indicates the outcome of the operation.
     * @returns {HRESULT} This method must return <b>S_OK</b>.
     * @see https://learn.microsoft.com/windows/win32/api/mbnapi/nf-mbnapi-imbnsmsevents-onsmsdeletecomplete
     */
    OnSmsDeleteComplete(sms, requestID, status) {
        result := ComCall(8, this, "ptr", sms, "uint", requestID, "int", status, "HRESULT")
        return result
    }

    /**
     * Notification method indicating a change in the status of the message store.
     * @remarks
     * An application can use the <a href="https://docs.microsoft.com/windows/desktop/api/mbnapi/nn-mbnapi-imbnsms">IMbnSms</a> interface to get the new status information.
     * @param {IMbnSms} sms An <a href="https://docs.microsoft.com/windows/desktop/api/mbnapi/nn-mbnapi-imbnsms">IMbnSms</a> interface representing the Mobile Broadband device for which the message store status has changed.
     * @returns {HRESULT} This method must return <b>S_OK</b>.
     * @see https://learn.microsoft.com/windows/win32/api/mbnapi/nf-mbnapi-imbnsmsevents-onsmsstatuschange
     */
    OnSmsStatusChange(sms) {
        result := ComCall(9, this, "ptr", sms, "HRESULT")
        return result
    }
}
