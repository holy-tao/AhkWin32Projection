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
     * 
     * @param {Pointer<Int32>} status 
     * @returns {HRESULT} 
     */
    GetStatus(status) {
        result := ComCall(3, this, "int*", status, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<HRESULT>} errorCode 
     * @returns {HRESULT} 
     */
    GetErrorCode(errorCode) {
        result := ComCall(4, this, "ptr", errorCode, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<PWSTR>} token 
     * @returns {HRESULT} 
     */
    GetToken(token) {
        result := ComCall(5, this, "ptr", token, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<PWSTR>} signature 
     * @returns {HRESULT} 
     */
    GetSignature(signature) {
        result := ComCall(6, this, "ptr", signature, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<PWSTR>} sandbox 
     * @returns {HRESULT} 
     */
    GetSandbox(sandbox) {
        result := ComCall(7, this, "ptr", sandbox, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<PWSTR>} environment 
     * @returns {HRESULT} 
     */
    GetEnvironment(environment) {
        result := ComCall(8, this, "ptr", environment, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<PWSTR>} msaAccountId 
     * @returns {HRESULT} 
     */
    GetMsaAccountId(msaAccountId) {
        result := ComCall(9, this, "ptr", msaAccountId, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<PWSTR>} xuid 
     * @returns {HRESULT} 
     */
    GetXuid(xuid) {
        result := ComCall(10, this, "ptr", xuid, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<PWSTR>} gamertag 
     * @returns {HRESULT} 
     */
    GetGamertag(gamertag) {
        result := ComCall(11, this, "ptr", gamertag, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<PWSTR>} ageGroup 
     * @returns {HRESULT} 
     */
    GetAgeGroup(ageGroup) {
        result := ComCall(12, this, "ptr", ageGroup, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<PWSTR>} privileges 
     * @returns {HRESULT} 
     */
    GetPrivileges(privileges) {
        result := ComCall(13, this, "ptr", privileges, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<PWSTR>} msaTarget 
     * @returns {HRESULT} 
     */
    GetMsaTarget(msaTarget) {
        result := ComCall(14, this, "ptr", msaTarget, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<PWSTR>} msaPolicy 
     * @returns {HRESULT} 
     */
    GetMsaPolicy(msaPolicy) {
        result := ComCall(15, this, "ptr", msaPolicy, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<PWSTR>} msaAppId 
     * @returns {HRESULT} 
     */
    GetMsaAppId(msaAppId) {
        result := ComCall(16, this, "ptr", msaAppId, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<PWSTR>} redirect 
     * @returns {HRESULT} 
     */
    GetRedirect(redirect) {
        result := ComCall(17, this, "ptr", redirect, "int")
        if(result != 0)
            throw OSError(result)

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
        result := ComCall(18, this, "ptr", message, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<PWSTR>} helpId 
     * @returns {HRESULT} 
     */
    GetHelpId(helpId) {
        result := ComCall(19, this, "ptr", helpId, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<PWSTR>} enforcementBans 
     * @returns {HRESULT} 
     */
    GetEnforcementBans(enforcementBans) {
        result := ComCall(20, this, "ptr", enforcementBans, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<PWSTR>} restrictions 
     * @returns {HRESULT} 
     */
    GetRestrictions(restrictions) {
        result := ComCall(21, this, "ptr", restrictions, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<PWSTR>} titleRestrictions 
     * @returns {HRESULT} 
     */
    GetTitleRestrictions(titleRestrictions) {
        result := ComCall(22, this, "ptr", titleRestrictions, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
