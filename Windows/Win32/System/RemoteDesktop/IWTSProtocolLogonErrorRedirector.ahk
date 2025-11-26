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
     * IWTSProtocolLogonErrorRedirector::OnBeginPainting is no longer available. Instead, use IWRdsProtocolLogonErrorRedirector::OnBeginPainting.
     * @returns {HRESULT} When you are implementing this method, return <b>S_OK</b> if the function succeeds. If it fails, return an <b>HRESULT</b> value that indicates the error. For a list of common error codes, see <a href="/windows/desktop/SecCrypto/common-hresult-values">Common HRESULT Values</a>.
     * @see https://docs.microsoft.com/windows/win32/api//wtsprotocol/nf-wtsprotocol-iwtsprotocollogonerrorredirector-onbeginpainting
     */
    OnBeginPainting() {
        result := ComCall(3, this, "HRESULT")
        return result
    }

    /**
     * IWTSProtocolLogonErrorRedirector::RedirectStatus is no longer available. Instead, use IWRdsProtocolLogonErrorRedirector::RedirectStatus.
     * @param {PWSTR} pszMessage A pointer to a string that contains the logon status message.
     * @returns {Integer} 
     * @see https://docs.microsoft.com/windows/win32/api//wtsprotocol/nf-wtsprotocol-iwtsprotocollogonerrorredirector-redirectstatus
     */
    RedirectStatus(pszMessage) {
        pszMessage := pszMessage is String ? StrPtr(pszMessage) : pszMessage

        result := ComCall(4, this, "ptr", pszMessage, "int*", &pResponse := 0, "HRESULT")
        return pResponse
    }

    /**
     * IWTSProtocolLogonErrorRedirector::RedirectMessage is no longer available. Instead, use IWRdsProtocolLogonErrorRedirector::RedirectMessage.
     * @param {PWSTR} pszCaption A pointer to a string that contains the message box caption.
     * @param {PWSTR} pszMessage A pointer to a string that contains the logon message.
     * @param {Integer} uType An integer that contains the message box type. For more information, see the <b>MessageBox</b> function.
     * @returns {Integer} A pointer to a <a href="https://docs.microsoft.com/windows/win32/api/wtsdefs/ne-wtsdefs-wts_logon_error_redirector_response">WTS_LOGON_ERROR_REDIRECTOR_RESPONSE</a> enumeration that specifies to the Remote Desktop Services service the preferred response for redirecting the logon message.
     * @see https://docs.microsoft.com/windows/win32/api//wtsprotocol/nf-wtsprotocol-iwtsprotocollogonerrorredirector-redirectmessage
     */
    RedirectMessage(pszCaption, pszMessage, uType) {
        pszCaption := pszCaption is String ? StrPtr(pszCaption) : pszCaption
        pszMessage := pszMessage is String ? StrPtr(pszMessage) : pszMessage

        result := ComCall(5, this, "ptr", pszCaption, "ptr", pszMessage, "uint", uType, "int*", &pResponse := 0, "HRESULT")
        return pResponse
    }

    /**
     * IWTSProtocolLogonErrorRedirector::RedirectLogonError is no longer available. Instead, use IWRdsProtocolLogonErrorRedirector::RedirectLogonError.
     * @param {Integer} ntsStatus 
     * @param {Integer} ntsSubstatus 
     * @param {PWSTR} pszCaption A pointer to a string that contains the message box caption.
     * @param {PWSTR} pszMessage A pointer to a string that contains the message.
     * @param {Integer} uType An integer that contains the message box type. For more information, see the <b>MessageBox</b> function.
     * @returns {Integer} A pointer to a <a href="https://docs.microsoft.com/windows/win32/api/wtsdefs/ne-wtsdefs-wts_logon_error_redirector_response">WTS_LOGON_ERROR_REDIRECTOR_RESPONSE</a> enumeration that specifies to the Remote Desktop Services service the preferred response to the logon error.
     * @see https://docs.microsoft.com/windows/win32/api//wtsprotocol/nf-wtsprotocol-iwtsprotocollogonerrorredirector-redirectlogonerror
     */
    RedirectLogonError(ntsStatus, ntsSubstatus, pszCaption, pszMessage, uType) {
        pszCaption := pszCaption is String ? StrPtr(pszCaption) : pszCaption
        pszMessage := pszMessage is String ? StrPtr(pszMessage) : pszMessage

        result := ComCall(6, this, "int", ntsStatus, "int", ntsSubstatus, "ptr", pszCaption, "ptr", pszMessage, "uint", uType, "int*", &pResponse := 0, "HRESULT")
        return pResponse
    }
}
