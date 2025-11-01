#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\Com\IDispatch.ahk

/**
 * The ISensLogon2 interface handles logon events fired by SENS.
 * @see https://docs.microsoft.com/windows/win32/api//sensevts/nn-sensevts-isenslogon2
 * @namespace Windows.Win32.System.EventNotificationService
 * @version v4.0.30319
 */
class ISensLogon2 extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ISensLogon2
     * @type {Guid}
     */
    static IID => Guid("{d597bab4-5b9f-11d1-8dd2-00aa004abd5e}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Logon", "Logoff", "SessionDisconnect", "SessionReconnect", "PostShell"]

    /**
     * 
     * @param {BSTR} bstrUserName 
     * @param {Integer} dwSessionId 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/sensevts/nf-sensevts-isenslogon2-logon
     */
    Logon(bstrUserName, dwSessionId) {
        bstrUserName := bstrUserName is String ? BSTR.Alloc(bstrUserName).Value : bstrUserName

        result := ComCall(7, this, "ptr", bstrUserName, "uint", dwSessionId, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} bstrUserName 
     * @param {Integer} dwSessionId 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/sensevts/nf-sensevts-isenslogon2-logoff
     */
    Logoff(bstrUserName, dwSessionId) {
        bstrUserName := bstrUserName is String ? BSTR.Alloc(bstrUserName).Value : bstrUserName

        result := ComCall(8, this, "ptr", bstrUserName, "uint", dwSessionId, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} bstrUserName 
     * @param {Integer} dwSessionId 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/sensevts/nf-sensevts-isenslogon2-sessiondisconnect
     */
    SessionDisconnect(bstrUserName, dwSessionId) {
        bstrUserName := bstrUserName is String ? BSTR.Alloc(bstrUserName).Value : bstrUserName

        result := ComCall(9, this, "ptr", bstrUserName, "uint", dwSessionId, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} bstrUserName 
     * @param {Integer} dwSessionId 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/sensevts/nf-sensevts-isenslogon2-sessionreconnect
     */
    SessionReconnect(bstrUserName, dwSessionId) {
        bstrUserName := bstrUserName is String ? BSTR.Alloc(bstrUserName).Value : bstrUserName

        result := ComCall(10, this, "ptr", bstrUserName, "uint", dwSessionId, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} bstrUserName 
     * @param {Integer} dwSessionId 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/sensevts/nf-sensevts-isenslogon2-postshell
     */
    PostShell(bstrUserName, dwSessionId) {
        bstrUserName := bstrUserName is String ? BSTR.Alloc(bstrUserName).Value : bstrUserName

        result := ComCall(11, this, "ptr", bstrUserName, "uint", dwSessionId, "HRESULT")
        return result
    }
}
