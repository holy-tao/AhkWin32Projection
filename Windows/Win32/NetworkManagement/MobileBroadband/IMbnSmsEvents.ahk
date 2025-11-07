#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * This notification interface signals an application with the completion status of SMS operations and changes in the device SMS status.
 * @remarks
 * 
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
 * 
 * @see https://docs.microsoft.com/windows/win32/api//mbnapi/nn-mbnapi-imbnsmsevents
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
     * 
     * @param {IMbnSms} sms 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mbnapi/nf-mbnapi-imbnsmsevents-onsmsconfigurationchange
     */
    OnSmsConfigurationChange(sms) {
        result := ComCall(3, this, "ptr", sms, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IMbnSms} sms 
     * @param {Integer} requestID 
     * @param {HRESULT} status 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mbnapi/nf-mbnapi-imbnsmsevents-onsetsmsconfigurationcomplete
     */
    OnSetSmsConfigurationComplete(sms, requestID, status) {
        result := ComCall(4, this, "ptr", sms, "uint", requestID, "int", status, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IMbnSms} sms 
     * @param {Integer} requestID 
     * @param {HRESULT} status 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mbnapi/nf-mbnapi-imbnsmsevents-onsmssendcomplete
     */
    OnSmsSendComplete(sms, requestID, status) {
        result := ComCall(5, this, "ptr", sms, "uint", requestID, "int", status, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IMbnSms} sms 
     * @param {Integer} smsFormat 
     * @param {Pointer<SAFEARRAY>} readMsgs 
     * @param {VARIANT_BOOL} moreMsgs 
     * @param {Integer} requestID 
     * @param {HRESULT} status 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mbnapi/nf-mbnapi-imbnsmsevents-onsmsreadcomplete
     */
    OnSmsReadComplete(sms, smsFormat, readMsgs, moreMsgs, requestID, status) {
        result := ComCall(6, this, "ptr", sms, "int", smsFormat, "ptr", readMsgs, "short", moreMsgs, "uint", requestID, "int", status, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IMbnSms} sms 
     * @param {Integer} smsFormat 
     * @param {Pointer<SAFEARRAY>} readMsgs 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mbnapi/nf-mbnapi-imbnsmsevents-onsmsnewclass0message
     */
    OnSmsNewClass0Message(sms, smsFormat, readMsgs) {
        result := ComCall(7, this, "ptr", sms, "int", smsFormat, "ptr", readMsgs, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IMbnSms} sms 
     * @param {Integer} requestID 
     * @param {HRESULT} status 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mbnapi/nf-mbnapi-imbnsmsevents-onsmsdeletecomplete
     */
    OnSmsDeleteComplete(sms, requestID, status) {
        result := ComCall(8, this, "ptr", sms, "uint", requestID, "int", status, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IMbnSms} sms 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mbnapi/nf-mbnapi-imbnsmsevents-onsmsstatuschange
     */
    OnSmsStatusChange(sms) {
        result := ComCall(9, this, "ptr", sms, "HRESULT")
        return result
    }
}
