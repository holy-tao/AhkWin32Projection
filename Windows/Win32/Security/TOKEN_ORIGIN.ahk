#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Struct.ahk
#Include ..\Foundation\LUID.ahk

/**
 * Contains information about the origin of the logon session.
 * @see https://docs.microsoft.com/windows/win32/api//winnt/ns-winnt-token_origin
 * @namespace Windows.Win32.Security
 * @version v4.0.30319
 */
class TOKEN_ORIGIN extends Win32Struct
{
    static sizeof => 8

    static packingSize => 8

    /**
     * <a href="https://docs.microsoft.com/windows/desktop/SecGloss/l-gly">Locally unique identifier</a> (LUID) for the <a href="https://docs.microsoft.com/windows/desktop/SecGloss/l-gly">logon session</a>. If the token  passed to <a href="https://docs.microsoft.com/windows/desktop/api/securitybaseapi/nf-securitybaseapi-gettokeninformation">GetTokenInformation</a> resulted from a logon using explicit credentials, such as passing name, domain, and password to the  <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-logonusera">LogonUser</a> function, then this member will contain the ID of the <i>logon session</i> that created it.  If the token resulted from  network authentication, such as a call to <a href="https://docs.microsoft.com/windows/desktop/api/sspi/nf-sspi-acceptsecuritycontext">AcceptSecurityContext</a>,  or a call to <b>LogonUser</b> with <i>dwLogonType</i> set to LOGON32_LOGON_NETWORK or LOGON32_LOGON_NETWORK_CLEARTEXT, then this member will be zero.
     * @type {LUID}
     */
    OriginatingLogonSession{
        get {
            if(!this.HasProp("__OriginatingLogonSession"))
                this.__OriginatingLogonSession := LUID(this.ptr + 0)
            return this.__OriginatingLogonSession
        }
    }
}
