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
     * 
     * @param {PWSTR} pszHeaders 
     * @returns {HRESULT} 
     */
    SetInboundHttpHeaders(pszHeaders) {
        pszHeaders := pszHeaders is String ? StrPtr(pszHeaders) : pszHeaders

        result := ComCall(8, this, "ptr", pszHeaders, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<PWSTR>} ppszHeaders 
     * @returns {HRESULT} 
     */
    GetInboundHttpHeaders(ppszHeaders) {
        result := ComCall(9, this, "ptr", ppszHeaders, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {PWSTR} pszHeaders 
     * @returns {HRESULT} 
     */
    SetOutboundHttpHeaders(pszHeaders) {
        pszHeaders := pszHeaders is String ? StrPtr(pszHeaders) : pszHeaders

        result := ComCall(10, this, "ptr", pszHeaders, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<PWSTR>} ppszHeaders 
     * @returns {HRESULT} 
     */
    GetOutboundHttpHeaders(ppszHeaders) {
        result := ComCall(11, this, "ptr", ppszHeaders, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {PWSTR} pszId 
     * @returns {HRESULT} 
     */
    SetID(pszId) {
        pszId := pszId is String ? StrPtr(pszId) : pszId

        result := ComCall(12, this, "ptr", pszId, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<PWSTR>} ppszId 
     * @returns {HRESULT} 
     */
    GetID(ppszId) {
        result := ComCall(13, this, "ptr", ppszId, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IUnknown>} pContext 
     * @returns {HRESULT} 
     */
    SetContext(pContext) {
        result := ComCall(14, this, "ptr", pContext, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IUnknown>} ppContext 
     * @returns {HRESULT} 
     */
    GetContext(ppContext) {
        result := ComCall(15, this, "ptr", ppContext, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    Clear() {
        result := ComCall(16, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
