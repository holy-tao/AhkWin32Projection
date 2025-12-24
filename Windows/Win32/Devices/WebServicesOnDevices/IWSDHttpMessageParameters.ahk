#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk
#Include .\IWSDMessageParameters.ahk

/**
 * Provides access to the HTTP headers used when transmitting messages via SOAP-over-HTTP.
 * @see https://docs.microsoft.com/windows/win32/api//wsdbase/nn-wsdbase-iwsdhttpmessageparameters
 * @namespace Windows.Win32.Devices.WebServicesOnDevices
 * @version v4.0.30319
 */
class IWSDHttpMessageParameters extends IWSDMessageParameters{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IWSDHttpMessageParameters
     * @type {Guid}
     */
    static IID => Guid("{540bd122-5c83-4dec-b396-ea62a2697fdf}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 8

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["SetInboundHttpHeaders", "GetInboundHttpHeaders", "SetOutboundHttpHeaders", "GetOutboundHttpHeaders", "SetID", "GetID", "SetContext", "GetContext", "Clear"]

    /**
     * Sets the HTTP headers used for inbound SOAP-over-HTTP transmissions.
     * @param {PWSTR} pszHeaders The HTTP headers to be set.
     * @returns {HRESULT} Possible return values include, but are not limited to, the following:
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
     * Method completed successfully.
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
     * The length in characters of <i>pszHeaders</i> exceeds WSD_MAX_TEXT_LENGTH (8192). 
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
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//wsdbase/nf-wsdbase-iwsdhttpmessageparameters-setinboundhttpheaders
     */
    SetInboundHttpHeaders(pszHeaders) {
        pszHeaders := pszHeaders is String ? StrPtr(pszHeaders) : pszHeaders

        result := ComCall(8, this, "ptr", pszHeaders, "HRESULT")
        return result
    }

    /**
     * Retrieves the current HTTP headers used for inbound SOAP-over-HTTP transmissions.
     * @returns {PWSTR} Pointer used to receive the current HTTP headers in use. Do not deallocate this pointer.
     * @see https://docs.microsoft.com/windows/win32/api//wsdbase/nf-wsdbase-iwsdhttpmessageparameters-getinboundhttpheaders
     */
    GetInboundHttpHeaders() {
        result := ComCall(9, this, "ptr*", &ppszHeaders := 0, "HRESULT")
        return ppszHeaders
    }

    /**
     * Sets the HTTP headers used for outbound SOAP-over-HTTP transmissions.
     * @param {PWSTR} pszHeaders The HTTP headers to be set.
     * @returns {HRESULT} Possible return values include, but are not limited to, the following:
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
     * Method completed successfully.
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
     * The length in characters of <i>pszHeaders</i> exceeds WSD_MAX_TEXT_LENGTH (8192). 
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
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//wsdbase/nf-wsdbase-iwsdhttpmessageparameters-setoutboundhttpheaders
     */
    SetOutboundHttpHeaders(pszHeaders) {
        pszHeaders := pszHeaders is String ? StrPtr(pszHeaders) : pszHeaders

        result := ComCall(10, this, "ptr", pszHeaders, "HRESULT")
        return result
    }

    /**
     * Retrieves the current HTTP headers used for outbound SOAP-over-HTTP transmissions.
     * @returns {PWSTR} Pointer used to receive the current HTTP headers in use.  Do not deallocate this pointer.
     * @see https://docs.microsoft.com/windows/win32/api//wsdbase/nf-wsdbase-iwsdhttpmessageparameters-getoutboundhttpheaders
     */
    GetOutboundHttpHeaders() {
        result := ComCall(11, this, "ptr*", &ppszHeaders := 0, "HRESULT")
        return ppszHeaders
    }

    /**
     * Sets the transport ID for the current transaction.
     * @param {PWSTR} pszId Pointer to the desired transport ID for the current transaction.
     * @returns {HRESULT} Possible return values include, but are not limited to, the following:
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
     * Method completed successfully.
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
     * <i>pszId</i> is <b>NULL</b> or the length in characters of <i>pszId</i> exceeds WSD_MAX_TEXT_LENGTH (8192). 
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
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//wsdbase/nf-wsdbase-iwsdhttpmessageparameters-setid
     */
    SetID(pszId) {
        pszId := pszId is String ? StrPtr(pszId) : pszId

        result := ComCall(12, this, "ptr", pszId, "HRESULT")
        return result
    }

    /**
     * Retrieves the transport ID for the current transaction.
     * @returns {PWSTR} Pointer used to return the transport ID for the current transaction. Do not deallocate this pointer.
     * @see https://docs.microsoft.com/windows/win32/api//wsdbase/nf-wsdbase-iwsdhttpmessageparameters-getid
     */
    GetID() {
        result := ComCall(13, this, "ptr*", &ppszId := 0, "HRESULT")
        return ppszId
    }

    /**
     * Sets the private transmission context for the current transaction.
     * @param {IUnknown} pContext Pointer to the desired private transmission context for the current transaction.
     * @returns {HRESULT} This method can return one of these values.
     * 
     * 
     * Possible return values include, but are not limited to, the following.
     * 
     * 
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
     * Method completed successfully.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//wsdbase/nf-wsdbase-iwsdhttpmessageparameters-setcontext
     */
    SetContext(pContext) {
        result := ComCall(14, this, "ptr", pContext, "HRESULT")
        return result
    }

    /**
     * Retrieves the private transmission context for the current transaction.
     * @returns {IUnknown} Pointer to the pointer used to retrieve the desired private transmission context for the current transaction.
     * @see https://docs.microsoft.com/windows/win32/api//wsdbase/nf-wsdbase-iwsdhttpmessageparameters-getcontext
     */
    GetContext() {
        result := ComCall(15, this, "ptr*", &ppContext := 0, "HRESULT")
        return IUnknown(ppContext)
    }

    /**
     * Clears the HTTP headers used for SOAP-over-HTTP transmissions.
     * @returns {HRESULT} This method can return one of these values.
     * 
     * 
     * Possible return values include, but are not limited to, the following.
     * 
     * 
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
     * Method completed successfully.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//wsdbase/nf-wsdbase-iwsdhttpmessageparameters-clear
     */
    Clear() {
        result := ComCall(16, this, "HRESULT")
        return result
    }
}
