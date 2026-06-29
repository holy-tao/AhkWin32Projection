#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\WTS_LOGON_ERROR_REDIRECTOR_RESPONSE.ahk" { WTS_LOGON_ERROR_REDIRECTOR_RESPONSE }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\Com\IUnknown.ahk" { IUnknown }

/**
 * Exposes methods called by the Remote Desktop Services service to update logon status and determine how to direct logon error messages.
 * @remarks
 * To avoid a possible deadlock when calling any of the methods on this interface, you should not make any function or method calls that will directly or indirectly result in a Remote Desktop Services API being called. If you need to make any outbound call, you should start a new thread and make the outbound call from the new thread.
 * @see https://learn.microsoft.com/windows/win32/api/wtsprotocol/nn-wtsprotocol-iwrdsprotocollogonerrorredirector
 * @namespace Windows.Win32.System.RemoteDesktop
 */
export default struct IWRdsProtocolLogonErrorRedirector extends IUnknown {
    /**
     * The interface identifier for IWRdsProtocolLogonErrorRedirector
     * @type {Guid}
     */
    static IID := Guid("{519fe83b-142a-4120-a3d5-a405d315281a}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IWRdsProtocolLogonErrorRedirector interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        OnBeginPainting    : IntPtr
        RedirectStatus     : IntPtr
        RedirectMessage    : IntPtr
        RedirectLogonError : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IWRdsProtocolLogonErrorRedirector.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Notifies the protocol that the logon user interface is ready to begin painting.
     * @returns {HRESULT} When you are implementing this method, return <b>S_OK</b> if the function succeeds. If it fails, return an <b>HRESULT</b> value that indicates the error. For a list of common error codes, see <a href="https://docs.microsoft.com/windows/desktop/SecCrypto/common-hresult-values">Common HRESULT Values</a>.
     * @see https://learn.microsoft.com/windows/win32/api/wtsprotocol/nf-wtsprotocol-iwrdsprotocollogonerrorredirector-onbeginpainting
     */
    OnBeginPainting() {
        result := ComCall(3, this, "HRESULT")
        return result
    }

    /**
     * Queries the protocol regarding how to redirect the client logon status update.
     * @param {PWSTR} pszMessage A pointer to a string that contains the logon status message.
     * @returns {WTS_LOGON_ERROR_REDIRECTOR_RESPONSE} A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/wtsdefs/ne-wtsdefs-wts_logon_error_redirector_response">WRDS_LOGON_ERROR_REDIRECTOR_RESPONSE</a> enumeration that contains the response.
     * @see https://learn.microsoft.com/windows/win32/api/wtsprotocol/nf-wtsprotocol-iwrdsprotocollogonerrorredirector-redirectstatus
     */
    RedirectStatus(pszMessage) {
        pszMessage := pszMessage is String ? StrPtr(pszMessage) : pszMessage

        result := ComCall(4, this, "ptr", pszMessage, "int*", &pResponse := 0, "HRESULT")
        return pResponse
    }

    /**
     * Queries the protocol regarding how to redirect the logon message.
     * @param {PWSTR} pszCaption A pointer to a string that contains the message box caption.
     * @param {PWSTR} pszMessage A pointer to a string that contains the logon message.
     * @param {Integer} uType An integer that contains the message box type. For more information, see the <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-messagebox">MessageBox</a> function.
     * @returns {WTS_LOGON_ERROR_REDIRECTOR_RESPONSE} A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/wtsdefs/ne-wtsdefs-wts_logon_error_redirector_response">WRDS_LOGON_ERROR_REDIRECTOR_RESPONSE</a> enumeration that specifies to the Remote Desktop Services service the preferred response for redirecting the logon message.
     * @see https://learn.microsoft.com/windows/win32/api/wtsprotocol/nf-wtsprotocol-iwrdsprotocollogonerrorredirector-redirectmessage
     */
    RedirectMessage(pszCaption, pszMessage, uType) {
        pszCaption := pszCaption is String ? StrPtr(pszCaption) : pszCaption
        pszMessage := pszMessage is String ? StrPtr(pszMessage) : pszMessage

        result := ComCall(5, this, "ptr", pszCaption, "ptr", pszMessage, "uint", uType, "int*", &pResponse := 0, "HRESULT")
        return pResponse
    }

    /**
     * Queries the protocol for the action to take in response to a logon error.
     * @param {Integer} ntsStatus 
     * @param {Integer} ntsSubstatus 
     * @param {PWSTR} pszCaption A pointer to a string that contains the message box caption.
     * @param {PWSTR} pszMessage A pointer to a string that contains the message.
     * @param {Integer} uType An integer that contains the message box type. For more information, see the <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-messagebox">MessageBox</a> function.
     * @returns {WTS_LOGON_ERROR_REDIRECTOR_RESPONSE} A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/wtsdefs/ne-wtsdefs-wts_logon_error_redirector_response">WRDS_LOGON_ERROR_REDIRECTOR_RESPONSE</a> enumeration that specifies to the Remote Desktop Services service the preferred response to the logon error.
     * @see https://learn.microsoft.com/windows/win32/api/wtsprotocol/nf-wtsprotocol-iwrdsprotocollogonerrorredirector-redirectlogonerror
     */
    RedirectLogonError(ntsStatus, ntsSubstatus, pszCaption, pszMessage, uType) {
        pszCaption := pszCaption is String ? StrPtr(pszCaption) : pszCaption
        pszMessage := pszMessage is String ? StrPtr(pszMessage) : pszMessage

        result := ComCall(6, this, "int", ntsStatus, "int", ntsSubstatus, "ptr", pszCaption, "ptr", pszMessage, "uint", uType, "int*", &pResponse := 0, "HRESULT")
        return pResponse
    }

    Query(iid) {
        if (IWRdsProtocolLogonErrorRedirector.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.OnBeginPainting := CallbackCreate(GetMethod(implObj, "OnBeginPainting"), flags, 1)
        this.vtbl.RedirectStatus := CallbackCreate(GetMethod(implObj, "RedirectStatus"), flags, 3)
        this.vtbl.RedirectMessage := CallbackCreate(GetMethod(implObj, "RedirectMessage"), flags, 5)
        this.vtbl.RedirectLogonError := CallbackCreate(GetMethod(implObj, "RedirectLogonError"), flags, 7)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.OnBeginPainting)
        CallbackFree(this.vtbl.RedirectStatus)
        CallbackFree(this.vtbl.RedirectMessage)
        CallbackFree(this.vtbl.RedirectLogonError)
    }
}
