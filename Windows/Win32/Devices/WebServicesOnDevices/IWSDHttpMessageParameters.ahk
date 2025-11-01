#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
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
     * 
     * @param {PWSTR} pszHeaders 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wsdbase/nf-wsdbase-iwsdhttpmessageparameters-setinboundhttpheaders
     */
    SetInboundHttpHeaders(pszHeaders) {
        pszHeaders := pszHeaders is String ? StrPtr(pszHeaders) : pszHeaders

        result := ComCall(8, this, "ptr", pszHeaders, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<PWSTR>} ppszHeaders 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wsdbase/nf-wsdbase-iwsdhttpmessageparameters-getinboundhttpheaders
     */
    GetInboundHttpHeaders(ppszHeaders) {
        result := ComCall(9, this, "ptr", ppszHeaders, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} pszHeaders 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wsdbase/nf-wsdbase-iwsdhttpmessageparameters-setoutboundhttpheaders
     */
    SetOutboundHttpHeaders(pszHeaders) {
        pszHeaders := pszHeaders is String ? StrPtr(pszHeaders) : pszHeaders

        result := ComCall(10, this, "ptr", pszHeaders, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<PWSTR>} ppszHeaders 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wsdbase/nf-wsdbase-iwsdhttpmessageparameters-getoutboundhttpheaders
     */
    GetOutboundHttpHeaders(ppszHeaders) {
        result := ComCall(11, this, "ptr", ppszHeaders, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} pszId 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wsdbase/nf-wsdbase-iwsdhttpmessageparameters-setid
     */
    SetID(pszId) {
        pszId := pszId is String ? StrPtr(pszId) : pszId

        result := ComCall(12, this, "ptr", pszId, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<PWSTR>} ppszId 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wsdbase/nf-wsdbase-iwsdhttpmessageparameters-getid
     */
    GetID(ppszId) {
        result := ComCall(13, this, "ptr", ppszId, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IUnknown} pContext 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wsdbase/nf-wsdbase-iwsdhttpmessageparameters-setcontext
     */
    SetContext(pContext) {
        result := ComCall(14, this, "ptr", pContext, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IUnknown>} ppContext 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wsdbase/nf-wsdbase-iwsdhttpmessageparameters-getcontext
     */
    GetContext(ppContext) {
        result := ComCall(15, this, "ptr*", ppContext, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wsdbase/nf-wsdbase-iwsdhttpmessageparameters-clear
     */
    Clear() {
        result := ComCall(16, this, "HRESULT")
        return result
    }
}
