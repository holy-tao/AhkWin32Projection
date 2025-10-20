#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * Exposes methods called by the Remote Desktop Services service to update logon status and determine how to direct logon error messages.
 * @remarks
 * 
  * To avoid a possible deadlock when calling any of the methods on this interface, you should not make any function or method calls that will directly or indirectly result in a Remote Desktop Services API being called. If you need to make any outbound call, you should start a new thread and make the outbound call from the new thread.
  * 
 * @see https://docs.microsoft.com/windows/win32/api//wtsprotocol/nn-wtsprotocol-iwrdsprotocollogonerrorredirector
 * @namespace Windows.Win32.System.RemoteDesktop
 * @version v4.0.30319
 */
class IWRdsProtocolLogonErrorRedirector extends IUnknown{
    /**
     * The interface identifier for IWRdsProtocolLogonErrorRedirector
     * @type {Guid}
     */
    static IID => Guid("{519fe83b-142a-4120-a3d5-a405d315281a}")

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
