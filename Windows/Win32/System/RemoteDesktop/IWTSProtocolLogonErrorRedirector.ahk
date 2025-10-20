#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * IWTSProtocolLogonErrorRedirector is no longer available. Instead, use IWRdsProtocolLogonErrorRedirector.
 * @see https://docs.microsoft.com/windows/win32/api//wtsprotocol/nn-wtsprotocol-iwtsprotocollogonerrorredirector
 * @namespace Windows.Win32.System.RemoteDesktop
 * @version v4.0.30319
 */
class IWTSProtocolLogonErrorRedirector extends IUnknown{
    /**
     * The interface identifier for IWTSProtocolLogonErrorRedirector
     * @type {Guid}
     */
    static IID => Guid("{fd9b61a7-2916-4627-8dee-4328711ad6cb}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @returns {HRESULT} 
     */
    OnBeginPainting() {
        result := ComCall(3, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {PWSTR} pszMessage 
     * @param {Pointer<Int32>} pResponse 
     * @returns {HRESULT} 
     */
    RedirectStatus(pszMessage, pResponse) {
        pszMessage := pszMessage is String ? StrPtr(pszMessage) : pszMessage

        result := ComCall(4, this, "ptr", pszMessage, "int*", pResponse, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {PWSTR} pszCaption 
     * @param {PWSTR} pszMessage 
     * @param {Integer} uType 
     * @param {Pointer<Int32>} pResponse 
     * @returns {HRESULT} 
     */
    RedirectMessage(pszCaption, pszMessage, uType, pResponse) {
        pszCaption := pszCaption is String ? StrPtr(pszCaption) : pszCaption
        pszMessage := pszMessage is String ? StrPtr(pszMessage) : pszMessage

        result := ComCall(5, this, "ptr", pszCaption, "ptr", pszMessage, "uint", uType, "int*", pResponse, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} ntsStatus 
     * @param {Integer} ntsSubstatus 
     * @param {PWSTR} pszCaption 
     * @param {PWSTR} pszMessage 
     * @param {Integer} uType 
     * @param {Pointer<Int32>} pResponse 
     * @returns {HRESULT} 
     */
    RedirectLogonError(ntsStatus, ntsSubstatus, pszCaption, pszMessage, uType, pResponse) {
        pszCaption := pszCaption is String ? StrPtr(pszCaption) : pszCaption
        pszMessage := pszMessage is String ? StrPtr(pszMessage) : pszMessage

        result := ComCall(6, this, "int", ntsStatus, "int", ntsSubstatus, "ptr", pszCaption, "ptr", pszMessage, "uint", uType, "int*", pResponse, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
