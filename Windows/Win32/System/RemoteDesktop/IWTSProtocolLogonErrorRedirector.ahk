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

    static sizeof => A_PtrSize
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
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["OnBeginPainting", "RedirectStatus", "RedirectMessage", "RedirectLogonError"]

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wtsprotocol/nf-wtsprotocol-iwtsprotocollogonerrorredirector-onbeginpainting
     */
    OnBeginPainting() {
        result := ComCall(3, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} pszMessage 
     * @param {Pointer<Integer>} pResponse 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wtsprotocol/nf-wtsprotocol-iwtsprotocollogonerrorredirector-redirectstatus
     */
    RedirectStatus(pszMessage, pResponse) {
        pszMessage := pszMessage is String ? StrPtr(pszMessage) : pszMessage

        pResponseMarshal := pResponse is VarRef ? "int*" : "ptr"

        result := ComCall(4, this, "ptr", pszMessage, pResponseMarshal, pResponse, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} pszCaption 
     * @param {PWSTR} pszMessage 
     * @param {Integer} uType 
     * @param {Pointer<Integer>} pResponse 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wtsprotocol/nf-wtsprotocol-iwtsprotocollogonerrorredirector-redirectmessage
     */
    RedirectMessage(pszCaption, pszMessage, uType, pResponse) {
        pszCaption := pszCaption is String ? StrPtr(pszCaption) : pszCaption
        pszMessage := pszMessage is String ? StrPtr(pszMessage) : pszMessage

        pResponseMarshal := pResponse is VarRef ? "int*" : "ptr"

        result := ComCall(5, this, "ptr", pszCaption, "ptr", pszMessage, "uint", uType, pResponseMarshal, pResponse, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} ntsStatus 
     * @param {Integer} ntsSubstatus 
     * @param {PWSTR} pszCaption 
     * @param {PWSTR} pszMessage 
     * @param {Integer} uType 
     * @param {Pointer<Integer>} pResponse 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wtsprotocol/nf-wtsprotocol-iwtsprotocollogonerrorredirector-redirectlogonerror
     */
    RedirectLogonError(ntsStatus, ntsSubstatus, pszCaption, pszMessage, uType, pResponse) {
        pszCaption := pszCaption is String ? StrPtr(pszCaption) : pszCaption
        pszMessage := pszMessage is String ? StrPtr(pszMessage) : pszMessage

        pResponseMarshal := pResponse is VarRef ? "int*" : "ptr"

        result := ComCall(6, this, "int", ntsStatus, "int", ntsSubstatus, "ptr", pszCaption, "ptr", pszMessage, "uint", uType, pResponseMarshal, pResponse, "HRESULT")
        return result
    }
}
