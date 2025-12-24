#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Is used by generated stub code to send faults or responses to incoming messages.
 * @see https://docs.microsoft.com/windows/win32/api//wsdhost/nn-wsdhost-iwsdservicemessaging
 * @namespace Windows.Win32.Devices.WebServicesOnDevices
 * @version v4.0.30319
 */
class IWSDServiceMessaging extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IWSDServiceMessaging
     * @type {Guid}
     */
    static IID => Guid("{94974cf4-0cab-460d-a3f6-7a0ad623c0e6}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["SendResponse", "FaultRequest"]

    /**
     * Sends a response message matching a given request context.
     * @param {Pointer<Void>} pBody Pointer to the message body to send in the response message.
     * @param {Pointer<WSD_OPERATION>} pOperation Pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/wsdtypes/ns-wsdtypes-wsd_operation">WSD_OPERATION</a> structure that contains the type of response to send.
     * @param {IWSDMessageParameters} pMessageParameters Pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/wsdbase/nn-wsdbase-iwsdmessageparameters">IWSDMessageParameters</a> object that contains the message parameters from the original request message.
     * @returns {HRESULT} Possible return values include, but are not limited to, the following.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Method succeeded.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_POINTER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * <i>pOperation</i> or <i>pMessageParameters</i> is <b>NULL</b>. 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_ABORT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The method could not be completed.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_OUTOFMEMORY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Insufficient memory to complete the operation.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_FAIL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The method failed.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//wsdhost/nf-wsdhost-iwsdservicemessaging-sendresponse
     */
    SendResponse(pBody, pOperation, pMessageParameters) {
        pBodyMarshal := pBody is VarRef ? "ptr" : "ptr"

        result := ComCall(3, this, pBodyMarshal, pBody, "ptr", pOperation, "ptr", pMessageParameters, "HRESULT")
        return result
    }

    /**
     * Sends a fault matching a given request context.
     * @param {Pointer<WSD_SOAP_HEADER>} pRequestHeader Pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/wsdtypes/ns-wsdtypes-wsd_soap_header">WSD_SOAP_HEADER</a> structure that contains the SOAP header of the original request that caused the fault.
     * @param {IWSDMessageParameters} pMessageParameters Pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/wsdbase/nn-wsdbase-iwsdmessageparameters">IWSDMessageParameters</a> object that contains the message parameters for the original request that caused the fault.
     * @param {Pointer<WSD_SOAP_FAULT>} pFault Pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/wsdtypes/ns-wsdtypes-wsd_soap_fault">WSD_SOAP_FAULT</a> structure that describes the fault to serialize and send. If this parameter is omitted, a fault of type <b>wsa:EndpointUnavailable</b> will be sent.
     * @returns {HRESULT} Possible return values include, but are not limited to, the following.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Method succeeded.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * <i>pRequestHeader</i> or <i>pMessageParameters</i> is <b>NULL</b>. 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_ABORT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The method could not be completed.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_OUTOFMEMORY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Insufficient memory to complete the operation.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_FAIL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The method failed.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//wsdhost/nf-wsdhost-iwsdservicemessaging-faultrequest
     */
    FaultRequest(pRequestHeader, pMessageParameters, pFault) {
        result := ComCall(4, this, "ptr", pRequestHeader, "ptr", pMessageParameters, "ptr", pFault, "HRESULT")
        return result
    }
}
