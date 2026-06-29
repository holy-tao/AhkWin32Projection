#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IWSDMessageParameters.ahk" { IWSDMessageParameters }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * Provides access to the HTTP headers used when transmitting messages via SOAP-over-HTTP.
 * @see https://learn.microsoft.com/windows/win32/api/wsdbase/nn-wsdbase-iwsdhttpmessageparameters
 * @namespace Windows.Win32.Devices.WebServicesOnDevices
 */
export default struct IWSDHttpMessageParameters extends IWSDMessageParameters {
    /**
     * The interface identifier for IWSDHttpMessageParameters
     * @type {Guid}
     */
    static IID := Guid("{540bd122-5c83-4dec-b396-ea62a2697fdf}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IWSDHttpMessageParameters interfaces
    */
    struct Vtbl extends IWSDMessageParameters.Vtbl {
        SetInboundHttpHeaders  : IntPtr
        GetInboundHttpHeaders  : IntPtr
        SetOutboundHttpHeaders : IntPtr
        GetOutboundHttpHeaders : IntPtr
        SetID                  : IntPtr
        GetID                  : IntPtr
        SetContext             : IntPtr
        GetContext             : IntPtr
        Clear                  : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IWSDHttpMessageParameters.Vtbl()
        }
        super.__New(implObj, flags)
    }

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
     * @see https://learn.microsoft.com/windows/win32/api/wsdbase/nf-wsdbase-iwsdhttpmessageparameters-setinboundhttpheaders
     */
    SetInboundHttpHeaders(pszHeaders) {
        pszHeaders := pszHeaders is String ? StrPtr(pszHeaders) : pszHeaders

        result := ComCall(8, this, "ptr", pszHeaders, "HRESULT")
        return result
    }

    /**
     * Retrieves the current HTTP headers used for inbound SOAP-over-HTTP transmissions.
     * @returns {PWSTR} Pointer used to receive the current HTTP headers in use. Do not deallocate this pointer.
     * @see https://learn.microsoft.com/windows/win32/api/wsdbase/nf-wsdbase-iwsdhttpmessageparameters-getinboundhttpheaders
     */
    GetInboundHttpHeaders() {
        result := ComCall(9, this, PWSTR.Ptr, &ppszHeaders := 0, "HRESULT")
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
     * @see https://learn.microsoft.com/windows/win32/api/wsdbase/nf-wsdbase-iwsdhttpmessageparameters-setoutboundhttpheaders
     */
    SetOutboundHttpHeaders(pszHeaders) {
        pszHeaders := pszHeaders is String ? StrPtr(pszHeaders) : pszHeaders

        result := ComCall(10, this, "ptr", pszHeaders, "HRESULT")
        return result
    }

    /**
     * Retrieves the current HTTP headers used for outbound SOAP-over-HTTP transmissions.
     * @returns {PWSTR} Pointer used to receive the current HTTP headers in use.  Do not deallocate this pointer.
     * @see https://learn.microsoft.com/windows/win32/api/wsdbase/nf-wsdbase-iwsdhttpmessageparameters-getoutboundhttpheaders
     */
    GetOutboundHttpHeaders() {
        result := ComCall(11, this, PWSTR.Ptr, &ppszHeaders := 0, "HRESULT")
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
     * @see https://learn.microsoft.com/windows/win32/api/wsdbase/nf-wsdbase-iwsdhttpmessageparameters-setid
     */
    SetID(pszId) {
        pszId := pszId is String ? StrPtr(pszId) : pszId

        result := ComCall(12, this, "ptr", pszId, "HRESULT")
        return result
    }

    /**
     * Retrieves the transport ID for the current transaction.
     * @returns {PWSTR} Pointer used to return the transport ID for the current transaction. Do not deallocate this pointer.
     * @see https://learn.microsoft.com/windows/win32/api/wsdbase/nf-wsdbase-iwsdhttpmessageparameters-getid
     */
    GetID() {
        result := ComCall(13, this, PWSTR.Ptr, &ppszId := 0, "HRESULT")
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
     * @see https://learn.microsoft.com/windows/win32/api/wsdbase/nf-wsdbase-iwsdhttpmessageparameters-setcontext
     */
    SetContext(pContext) {
        result := ComCall(14, this, "ptr", pContext, "HRESULT")
        return result
    }

    /**
     * Retrieves the private transmission context for the current transaction.
     * @returns {IUnknown} Pointer to the pointer used to retrieve the desired private transmission context for the current transaction.
     * @see https://learn.microsoft.com/windows/win32/api/wsdbase/nf-wsdbase-iwsdhttpmessageparameters-getcontext
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
     * @see https://learn.microsoft.com/windows/win32/api/wsdbase/nf-wsdbase-iwsdhttpmessageparameters-clear
     */
    Clear() {
        result := ComCall(16, this, "HRESULT")
        return result
    }

    Query(iid) {
        if (IWSDHttpMessageParameters.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.SetInboundHttpHeaders := CallbackCreate(GetMethod(implObj, "SetInboundHttpHeaders"), flags, 2)
        this.vtbl.GetInboundHttpHeaders := CallbackCreate(GetMethod(implObj, "GetInboundHttpHeaders"), flags, 2)
        this.vtbl.SetOutboundHttpHeaders := CallbackCreate(GetMethod(implObj, "SetOutboundHttpHeaders"), flags, 2)
        this.vtbl.GetOutboundHttpHeaders := CallbackCreate(GetMethod(implObj, "GetOutboundHttpHeaders"), flags, 2)
        this.vtbl.SetID := CallbackCreate(GetMethod(implObj, "SetID"), flags, 2)
        this.vtbl.GetID := CallbackCreate(GetMethod(implObj, "GetID"), flags, 2)
        this.vtbl.SetContext := CallbackCreate(GetMethod(implObj, "SetContext"), flags, 2)
        this.vtbl.GetContext := CallbackCreate(GetMethod(implObj, "GetContext"), flags, 2)
        this.vtbl.Clear := CallbackCreate(GetMethod(implObj, "Clear"), flags, 1)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.SetInboundHttpHeaders)
        CallbackFree(this.vtbl.GetInboundHttpHeaders)
        CallbackFree(this.vtbl.SetOutboundHttpHeaders)
        CallbackFree(this.vtbl.GetOutboundHttpHeaders)
        CallbackFree(this.vtbl.SetID)
        CallbackFree(this.vtbl.GetID)
        CallbackFree(this.vtbl.SetContext)
        CallbackFree(this.vtbl.GetContext)
        CallbackFree(this.vtbl.Clear)
    }
}
