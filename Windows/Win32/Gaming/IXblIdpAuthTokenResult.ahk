#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\System\Com\IUnknown.ahk

/**
 * Reserved for Microsoft use.
 * @see https://docs.microsoft.com/windows/win32/api//xblidpauthmanager/nn-xblidpauthmanager-ixblidpauthtokenresult
 * @namespace Windows.Win32.Gaming
 * @version v4.0.30319
 */
class IXblIdpAuthTokenResult extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IXblIdpAuthTokenResult
     * @type {Guid}
     */
    static IID => Guid("{46ce0225-f267-4d68-b299-b2762552dec1}")

    /**
     * The class identifier for XblIdpAuthTokenResult
     * @type {Guid}
     */
    static CLSID => Guid("{9f493441-744a-410c-ae2b-9a22f7c7731f}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetStatus", "GetErrorCode", "GetToken", "GetSignature", "GetSandbox", "GetEnvironment", "GetMsaAccountId", "GetXuid", "GetGamertag", "GetAgeGroup", "GetPrivileges", "GetMsaTarget", "GetMsaPolicy", "GetMsaAppId", "GetRedirect", "GetMessage", "GetHelpId", "GetEnforcementBans", "GetRestrictions", "GetTitleRestrictions"]

    /**
     * 
     * @param {Pointer<Integer>} status 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/xblidpauthmanager/nf-xblidpauthmanager-ixblidpauthtokenresult-getstatus
     */
    GetStatus(status) {
        result := ComCall(3, this, "int*", status, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<HRESULT>} errorCode 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/xblidpauthmanager/nf-xblidpauthmanager-ixblidpauthtokenresult-geterrorcode
     */
    GetErrorCode(errorCode) {
        result := ComCall(4, this, "ptr", errorCode, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<PWSTR>} token 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/xblidpauthmanager/nf-xblidpauthmanager-ixblidpauthtokenresult-gettoken
     */
    GetToken(token) {
        result := ComCall(5, this, "ptr", token, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<PWSTR>} signature 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/xblidpauthmanager/nf-xblidpauthmanager-ixblidpauthtokenresult-getsignature
     */
    GetSignature(signature) {
        result := ComCall(6, this, "ptr", signature, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<PWSTR>} sandbox 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/xblidpauthmanager/nf-xblidpauthmanager-ixblidpauthtokenresult-getsandbox
     */
    GetSandbox(sandbox) {
        result := ComCall(7, this, "ptr", sandbox, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<PWSTR>} environment 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/xblidpauthmanager/nf-xblidpauthmanager-ixblidpauthtokenresult-getenvironment
     */
    GetEnvironment(environment) {
        result := ComCall(8, this, "ptr", environment, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<PWSTR>} msaAccountId 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/xblidpauthmanager/nf-xblidpauthmanager-ixblidpauthtokenresult-getmsaaccountid
     */
    GetMsaAccountId(msaAccountId) {
        result := ComCall(9, this, "ptr", msaAccountId, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<PWSTR>} xuid 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/xblidpauthmanager/nf-xblidpauthmanager-ixblidpauthtokenresult-getxuid
     */
    GetXuid(xuid) {
        result := ComCall(10, this, "ptr", xuid, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<PWSTR>} gamertag 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/xblidpauthmanager/nf-xblidpauthmanager-ixblidpauthtokenresult-getgamertag
     */
    GetGamertag(gamertag) {
        result := ComCall(11, this, "ptr", gamertag, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<PWSTR>} ageGroup 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/xblidpauthmanager/nf-xblidpauthmanager-ixblidpauthtokenresult-getagegroup
     */
    GetAgeGroup(ageGroup) {
        result := ComCall(12, this, "ptr", ageGroup, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<PWSTR>} privileges 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/xblidpauthmanager/nf-xblidpauthmanager-ixblidpauthtokenresult-getprivileges
     */
    GetPrivileges(privileges) {
        result := ComCall(13, this, "ptr", privileges, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<PWSTR>} msaTarget 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/xblidpauthmanager/nf-xblidpauthmanager-ixblidpauthtokenresult-getmsatarget
     */
    GetMsaTarget(msaTarget) {
        result := ComCall(14, this, "ptr", msaTarget, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<PWSTR>} msaPolicy 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/xblidpauthmanager/nf-xblidpauthmanager-ixblidpauthtokenresult-getmsapolicy
     */
    GetMsaPolicy(msaPolicy) {
        result := ComCall(15, this, "ptr", msaPolicy, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<PWSTR>} msaAppId 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/xblidpauthmanager/nf-xblidpauthmanager-ixblidpauthtokenresult-getmsaappid
     */
    GetMsaAppId(msaAppId) {
        result := ComCall(16, this, "ptr", msaAppId, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<PWSTR>} redirect 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/xblidpauthmanager/nf-xblidpauthmanager-ixblidpauthtokenresult-getredirect
     */
    GetRedirect(redirect) {
        result := ComCall(17, this, "ptr", redirect, "HRESULT")
        return result
    }

    /**
     * Retrieves a message from the calling thread's message queue. The function dispatches incoming sent messages until a posted message is available for retrieval.
     * @param {Pointer<PWSTR>} message 
     * @returns {HRESULT} Type: <b>BOOL</b>
     * 
     * If the function retrieves a message other than <a href="/windows/desktop/winmsg/wm-quit">WM_QUIT</a>, the return value is nonzero.
     * 
     * If the function retrieves the <a href="/windows/desktop/winmsg/wm-quit">WM_QUIT</a> message, the return value is zero. 
     * 
     * If there is an error, the return value is -1. For example, the function fails if <i>hWnd</i> is an invalid window handle or <i>lpMsg</i> is an invalid pointer. To get extended error information, call <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * 
     * Because the return value can be nonzero, zero, or -1, avoid code like this:
     * 
     * 
     * ```
     * while (GetMessage( lpMsg, hWnd, 0, 0)) ...
     * ```
     * 
     * 
     * The possibility of a -1 return value in the case that hWnd is an invalid parameter (such as referring to a window that has already been destroyed) means that such code can lead to fatal application errors. Instead, use code like this:
     * 
     * 
     * ```
     * BOOL bRet;
     * 
     * while( (bRet = GetMessage( &msg, hWnd, 0, 0 )) != 0)
     * { 
     *     if (bRet == -1)
     *     {
     *         // handle the error and possibly exit
     *     }
     *     else
     *     {
     *         TranslateMessage(&msg); 
     *         DispatchMessage(&msg); 
     *     }
     * }
     * ```
     * @see https://docs.microsoft.com/windows/win32/api//winuser/nf-winuser-getmessage
     */
    GetMessage(message) {
        result := ComCall(18, this, "ptr", message, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<PWSTR>} helpId 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/xblidpauthmanager/nf-xblidpauthmanager-ixblidpauthtokenresult-gethelpid
     */
    GetHelpId(helpId) {
        result := ComCall(19, this, "ptr", helpId, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<PWSTR>} enforcementBans 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/xblidpauthmanager/nf-xblidpauthmanager-ixblidpauthtokenresult-getenforcementbans
     */
    GetEnforcementBans(enforcementBans) {
        result := ComCall(20, this, "ptr", enforcementBans, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<PWSTR>} restrictions 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/xblidpauthmanager/nf-xblidpauthmanager-ixblidpauthtokenresult-getrestrictions
     */
    GetRestrictions(restrictions) {
        result := ComCall(21, this, "ptr", restrictions, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<PWSTR>} titleRestrictions 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/xblidpauthmanager/nf-xblidpauthmanager-ixblidpauthtokenresult-gettitlerestrictions
     */
    GetTitleRestrictions(titleRestrictions) {
        result := ComCall(22, this, "ptr", titleRestrictions, "HRESULT")
        return result
    }
}
