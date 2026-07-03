#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import ".\AUTHNEXTSTEP.ahk" { AUTHNEXTSTEP }
#Import ".\DAV_CALLBACK_CRED.ahk" { DAV_CALLBACK_CRED }

/**
 * The WebDAV client calls the application-defined DavAuthCallback callback function to prompt the user for credentials.
 * @remarks
 * The <i>DavAuthCallback</i> callback function must be registered by calling the <a href="https://docs.microsoft.com/windows/desktop/api/davclnt/nf-davclnt-davregisterauthcallback">DavRegisterAuthCallback</a> function.
 * 
 * To unregister this callback function, use the <a href="https://docs.microsoft.com/windows/desktop/api/davclnt/nf-davclnt-davunregisterauthcallback">DavUnregisterAuthCallback</a> function.
 * 
 * This callback function should prompt the user for credentials (either a <a href="https://docs.microsoft.com/windows/desktop/api/davclnt/ns-davclnt-dav_callback_auth_unp">user name and password</a> or an <a href="https://docs.microsoft.com/windows/desktop/api/davclnt/ns-davclnt-dav_callback_auth_blob">authentication BLOB</a>) and store this information in the appropriate member of the <a href="https://docs.microsoft.com/windows/desktop/api/davclnt/ns-davclnt-dav_callback_cred">DAV_CALLBACK_CRED</a> structure that the <i>pCallbackCred</i> parameter points to.
 * @see https://learn.microsoft.com/windows/win32/api/davclnt/nc-davclnt-pfndavauthcallback
 * @namespace Windows.Win32.NetworkManagement.WebDav
 */
export default struct PFNDAVAUTHCALLBACK {
    value : IntPtr

    __value {
        set {
            if (value is PFNDAVAUTHCALLBACK) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {PWSTR} lpwzServerName A pointer to a <b>NULL</b>-terminated Unicode string that contains the name of the target server.
     * @param {PWSTR} lpwzRemoteName A pointer to a <b>NULL</b>-terminated Unicode string that contains the name of the network resource.
     * @param {Integer} dwAuthScheme A bitmask of flags that specify the authentication schemes to be used.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="DAV_AUTHN_SCHEME_BASIC"></a><a id="dav_authn_scheme_basic"></a><dl>
     * <dt><b>DAV_AUTHN_SCHEME_BASIC</b></dt>
     * <dt>0x00000001</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Basic authentication is to be used.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="DAV_AUTHN_SCHEME_NTLM"></a><a id="dav_authn_scheme_ntlm"></a><dl>
     * <dt><b>DAV_AUTHN_SCHEME_NTLM</b></dt>
     * <dt>0x00000002</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * 
     * <a href="https://docs.microsoft.com/windows/desktop/SecAuthN/microsoft-ntlm">Microsoft NTLM</a> authentication is to be used.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="DAV_AUTHN_SCHEME_PASSPORT"></a><a id="dav_authn_scheme_passport"></a><dl>
     * <dt><b>DAV_AUTHN_SCHEME_PASSPORT</b></dt>
     * <dt>0x00000004</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * 
     * <a href="https://docs.microsoft.com/windows/desktop/WinHttp/passport-authentication-in-winhttp">Passport authentication</a> is to be used.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="DAV_AUTHN_SCHEME_DIGEST"></a><a id="dav_authn_scheme_digest"></a><dl>
     * <dt><b>DAV_AUTHN_SCHEME_DIGEST</b></dt>
     * <dt>0x00000008</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * 
     * <a href="https://docs.microsoft.com/windows/desktop/SecAuthN/microsoft-digest-authentication">Microsoft Digest authentication</a> is to be used.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="DAV_AUTHN_SCHEME_NEGOTIATE"></a><a id="dav_authn_scheme_negotiate"></a><dl>
     * <dt><b>DAV_AUTHN_SCHEME_NEGOTIATE</b></dt>
     * <dt>0x00000010</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * 
     * <a href="https://docs.microsoft.com/windows/desktop/SecAuthN/microsoft-negotiate">Microsoft Negotiate</a> is to be used.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="DAV_AUTHN_SCHEME_CERT"></a><a id="dav_authn_scheme_cert"></a><dl>
     * <dt><b>DAV_AUTHN_SCHEME_CERT</b></dt>
     * <dt>0x00010000</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Certificate authentication is to be used.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="DAV_AUTHN_SCHEME_FBA"></a><a id="dav_authn_scheme_fba"></a><dl>
     * <dt><b>DAV_AUTHN_SCHEME_FBA</b></dt>
     * <dt>0x00100000</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Forms-based authentication is to be used.
     * 
     * </td>
     * </tr>
     * </table>
     * @param {Integer} dwFlags The flags that the WebDAV service passed in the <i>dwFlags</i> parameter when it called the <a href="https://docs.microsoft.com/windows/desktop/api/npapi/nf-npapi-npaddconnection3">NPAddConnection3</a> function.
     * @param {Pointer<DAV_CALLBACK_CRED>} pCallbackCred A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/davclnt/ns-davclnt-dav_callback_cred">DAV_CALLBACK_CRED</a> structure.
     * @param {Pointer<AUTHNEXTSTEP>} NextStep A pointer to an  <a href="https://docs.microsoft.com/windows/desktop/api/davclnt/ne-davclnt-authnextstep">AUTHNEXTSTEP</a> enumeration value that specifies the next action that the WebDAV client should take after  a successful call to the <i>DavAuthCallback</i> callback function.
     * @param {Pointer<Pointer<PFNDAVAUTHCALLBACK_FREECRED>>} pFreeCred A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/davclnt/nc-davclnt-pfndavauthcallback_freecred">DavFreeCredCallback</a> callback function.
     * @returns {Integer} If the function succeeds, the return value is ERROR_SUCCESS.
     * 
     * If the function fails, the return value is a <a href="https://docs.microsoft.com/windows/desktop/Debug/system-error-codes">system error code</a>.
     */
    Call(lpwzServerName, lpwzRemoteName, dwAuthScheme, dwFlags, pCallbackCred, NextStep, pFreeCred) {
        lpwzServerName := lpwzServerName is String ? StrPtr(lpwzServerName) : lpwzServerName
        lpwzRemoteName := lpwzRemoteName is String ? StrPtr(lpwzRemoteName) : lpwzRemoteName

        NextStepMarshal := NextStep is VarRef ? "int*" : "ptr"
        pFreeCredMarshal := pFreeCred is VarRef ? "ptr*" : "ptr"

        result := DllCall(this.value, "ptr", lpwzServerName, "ptr", lpwzRemoteName, UInt32, dwAuthScheme, UInt32, dwFlags, DAV_CALLBACK_CRED.Ptr, pCallbackCred, NextStepMarshal, NextStep, pFreeCredMarshal, pFreeCred, UInt32)
        return result
    }

    /**
     * A PFNDAVAUTHCALLBACK that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PFNDAVAUTHCALLBACK {
        /**
         * Creates a PFNDAVAUTHCALLBACK pointer that invokes the given AHK function when called.
         * @param {Func(PWSTR, PWSTR, UInt32, UInt32, DAV_CALLBACK_CRED, "int*", "ptr*") => UInt32} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 7)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 7 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [PWSTR, PWSTR, UInt32, UInt32, DAV_CALLBACK_CRED.Ptr, "int*", "ptr*", UInt32])
        }

        __Delete() => CallbackFree(this.value)
    }
}
