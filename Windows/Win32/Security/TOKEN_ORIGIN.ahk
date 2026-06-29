#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\Foundation\LUID.ahk" { LUID }

/**
 * Contains information about the origin of the logon session.
 * @see https://learn.microsoft.com/windows/win32/api/winnt/ns-winnt-token_origin
 * @namespace Windows.Win32.Security
 */
export default struct TOKEN_ORIGIN {
    #StructPack 4

    /**
     * <a href="https://docs.microsoft.com/windows/desktop/SecGloss/l-gly">Locally unique identifier</a> (LUID) for the <a href="https://docs.microsoft.com/windows/desktop/SecGloss/l-gly">logon session</a>. If the token  passed to <a href="https://docs.microsoft.com/windows/desktop/api/securitybaseapi/nf-securitybaseapi-gettokeninformation">GetTokenInformation</a> resulted from a logon using explicit credentials, such as passing name, domain, and password to the  <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-logonusera">LogonUser</a> function, then this member will contain the ID of the <i>logon session</i> that created it.  If the token resulted from  network authentication, such as a call to <a href="https://docs.microsoft.com/windows/desktop/api/sspi/nf-sspi-acceptsecuritycontext">AcceptSecurityContext</a>,  or a call to <b>LogonUser</b> with <i>dwLogonType</i> set to LOGON32_LOGON_NETWORK or LOGON32_LOGON_NETWORK_CLEARTEXT, then this member will be zero.
     */
    OriginatingLogonSession : LUID

}
