#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\LSA_UNICODE_STRING.ahk" { LSA_UNICODE_STRING }
#Import "..\..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import ".\LSA_LAST_INTER_LOGON_INFO.ahk" { LSA_LAST_INTER_LOGON_INFO }
#Import "..\..\PSID.ahk" { PSID }
#Import "..\..\..\Foundation\LUID.ahk" { LUID }

/**
 * Contains information about a logon session. (SECURITY_LOGON_SESSION_DATA)
 * @remarks
 * This structure is allocated by the LSA. When the structure is no longer required, free it by using the 
 * <a href="https://docs.microsoft.com/windows/desktop/api/ntsecapi/nf-ntsecapi-lsafreereturnbuffer">LSAFreeReturnBuffer</a> function.
 * @see https://learn.microsoft.com/windows/win32/api/ntsecapi/ns-ntsecapi-security_logon_session_data
 * @namespace Windows.Win32.Security.Authentication.Identity
 */
export default struct SECURITY_LOGON_SESSION_DATA {
    #StructPack 8

    /**
     * The size of the structure, in bytes.
     */
    Size : UInt32

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/SecGloss/l-gly">locally unique identifier</a> (LUID) that identifies a logon session.
     */
    LogonId : LUID

    /**
     * An 
     * <a href="https://docs.microsoft.com/windows/desktop/api/lsalookup/ns-lsalookup-lsa_unicode_string">LSA_UNICODE_STRING</a> structure that contains the account name of the <a href="https://docs.microsoft.com/windows/desktop/SecGloss/s-gly">security principal</a> that owns the logon session.
     */
    UserName : LSA_UNICODE_STRING

    /**
     * An <a href="https://docs.microsoft.com/windows/desktop/api/lsalookup/ns-lsalookup-lsa_unicode_string">LSA_UNICODE_STRING</a> structure that contains the name of the domain used to authenticate the owner of the logon session.
     */
    LogonDomain : LSA_UNICODE_STRING

    /**
     * An <a href="https://docs.microsoft.com/windows/desktop/api/lsalookup/ns-lsalookup-lsa_unicode_string">LSA_UNICODE_STRING</a> structure that contains the name of the <a href="https://docs.microsoft.com/windows/desktop/SecGloss/a-gly">authentication package</a> used to authenticate the owner of the logon session.
     */
    AuthenticationPackage : LSA_UNICODE_STRING

    /**
     * A 
     * <a href="https://docs.microsoft.com/windows/desktop/api/ntsecapi/ne-ntsecapi-security_logon_type">SECURITY_LOGON_TYPE</a> value that identifies the logon method.
     */
    LogonType : UInt32

    /**
     * A Terminal Services session identifier. This member may be zero.
     */
    Session : UInt32

    /**
     * A pointer to the user's <a href="https://docs.microsoft.com/windows/desktop/SecGloss/s-gly">security identifier</a> (SID).
     */
    Sid : PSID

    /**
     * The time the session owner logged on.
     */
    LogonTime : Int64

    /**
     * An <a href="https://docs.microsoft.com/windows/desktop/api/lsalookup/ns-lsalookup-lsa_unicode_string">LSA_UNICODE_STRING</a> structure  that contains the name of the server used to authenticate the owner of the logon session.
     */
    LogonServer : LSA_UNICODE_STRING

    /**
     * An <a href="https://docs.microsoft.com/windows/desktop/api/lsalookup/ns-lsalookup-lsa_unicode_string">LSA_UNICODE_STRING</a> structure  that contains the DNS name for the owner of the logon session.
     */
    DnsDomainName : LSA_UNICODE_STRING

    /**
     * An <a href="https://docs.microsoft.com/windows/desktop/api/lsalookup/ns-lsalookup-lsa_unicode_string">LSA_UNICODE_STRING</a> structure  that contains the <a href="https://docs.microsoft.com/windows/desktop/SecGloss/u-gly">user principal name</a> (UPN) for the owner of the logon session.
     */
    Upn : LSA_UNICODE_STRING

    /**
     * The user flags for the logon session.
     * 
     * <b>Windows Server 2003 R2, Windows XP with SP1 and earlier, Windows Server 2003 and Windows XP:  </b>This member is not supported.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="LOGON_OPTIMIZED"></a><a id="logon_optimized"></a><dl>
     * <dt><b>LOGON_OPTIMIZED</b></dt>
     * <dt>0x4000</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The logon is an optimized logon session.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="LOGON_WINLOGON"></a><a id="logon_winlogon"></a><dl>
     * <dt><b>LOGON_WINLOGON</b></dt>
     * <dt>0x8000</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The logon was created for Winlogon. 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="LOGON_PKINIT"></a><a id="logon_pkinit"></a><dl>
     * <dt><b>LOGON_PKINIT</b></dt>
     * <dt>0x10000</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The Kerberos PKINIT extension was used to authenticate the user in this logon session.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="LOGON_NOT_OPTIMIZED"></a><a id="logon_not_optimized"></a><dl>
     * <dt><b>LOGON_NOT_OPTIMIZED</b></dt>
     * <dt>0x20000</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Optimized logon has been disabled for this account.
     * 
     * </td>
     * </tr>
     * </table>
     */
    UserFlags : UInt32

    /**
     * An <a href="https://docs.microsoft.com/windows/desktop/api/ntsecapi/ns-ntsecapi-lsa_last_inter_logon_info">LSA_LAST_INTER_LOGON_INFO</a> structure that contains the information on the last logon session.
     * 
     * <b>Windows Server 2003 R2, Windows XP with SP1 and earlier, Windows Server 2003 and Windows XP:  </b>This member is not supported.
     */
    LastLogonInfo : LSA_LAST_INTER_LOGON_INFO

    /**
     * An <a href="https://docs.microsoft.com/windows/desktop/api/lsalookup/ns-lsalookup-lsa_unicode_string">LSA_UNICODE_STRING</a> structure  that contains the script used for logging on.
     * 
     * <b>Windows Server 2003 R2, Windows XP with SP1 and earlier, Windows Server 2003 and Windows XP:  </b>This member is not supported.
     */
    LogonScript : LSA_UNICODE_STRING

    /**
     * An <a href="https://docs.microsoft.com/windows/desktop/api/lsalookup/ns-lsalookup-lsa_unicode_string">LSA_UNICODE_STRING</a> structure  that contains the path to the user's profile.
     * 
     * <b>Windows Server 2003 R2, Windows XP with SP1 and earlier, Windows Server 2003 and Windows XP:  </b>This member is not supported.
     */
    ProfilePath : LSA_UNICODE_STRING

    /**
     * An <a href="https://docs.microsoft.com/windows/desktop/api/lsalookup/ns-lsalookup-lsa_unicode_string">LSA_UNICODE_STRING</a> structure  that contains the home directory for the logon session.
     * 
     * <b>Windows Server 2003 R2, Windows XP with SP1 and earlier, Windows Server 2003 and Windows XP:  </b>This member is not supported.
     */
    HomeDirectory : LSA_UNICODE_STRING

    /**
     * An <a href="https://docs.microsoft.com/windows/desktop/api/lsalookup/ns-lsalookup-lsa_unicode_string">LSA_UNICODE_STRING</a> structure  that contains the drive location of the home directory of the logon session.
     * 
     * <b>Windows Server 2003 R2, Windows XP with SP1 and earlier, Windows Server 2003 and Windows XP:  </b>This member is not supported.
     */
    HomeDirectoryDrive : LSA_UNICODE_STRING

    /**
     * The time stamp of when the session user logged off.
     * 
     * <b>Windows Server 2003 R2, Windows XP with SP1 and earlier, Windows Server 2003 and Windows XP:  </b>This member is not supported.
     */
    LogoffTime : Int64

    /**
     * The time that the logon session must end.
     * 
     * <b>Windows Server 2003 R2, Windows XP with SP1 and earlier, Windows Server 2003 and Windows XP:  </b>This member is not supported.
     */
    KickOffTime : Int64

    /**
     * The time  when the user last changed the password.   <b>Note</b> It is up to the Authentication Package to initialize this value and it may not be initialized.
     * 
     * <b>Windows Server 2003 R2, Windows XP with SP1 and earlier, Windows Server 2003 and Windows XP:  </b>This member is not supported.
     */
    PasswordLastSet : Int64

    /**
     * The password can be changed during the logon session. 
     * 
     * <b>Windows Server 2003 R2, Windows XP with SP1 and earlier, Windows Server 2003 and Windows XP:  </b>This member is not supported.
     */
    PasswordCanChange : Int64

    /**
     * The password must be changed during the logon session.
     * 
     * <b>Windows Server 2003 R2, Windows XP with SP1 and earlier, Windows Server 2003 and Windows XP:  </b>This member is not supported.
     */
    PasswordMustChange : Int64

}
