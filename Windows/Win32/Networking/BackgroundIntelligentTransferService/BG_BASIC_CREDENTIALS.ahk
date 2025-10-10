#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The BG_BASIC_CREDENTIALS structure identifies the user name and password to authenticate.
 * @remarks
 * 
  * The following list identifies when the <b>UserName</b> and <b>Password</b> members are required based on the authentication scheme requested:
  * 
  * To protect the user name and password information, call the <b>SecureZeroMemory</b> function, defined in Winbase.h, to clear the <b>UserName</b> and <b>Password</b> buffers after you use the structure.
  * 
  * You can specify the user name like this.
  * 
  * <ul>
  * <li><i>DomainName</i><b>\</b><i>UserName</i>. Use <i>DomainName</i><b>\</b><i>UserName</i> if the server is in a domain and the <i>DomainName</i> is the domain to which the server belongs or is a trusted domain.
  * 
  * </li>
  * <li><i>ServerName</i><b>\</b><i>UserName</i>. Use <i>ServerName</i><b>\</b><i>UserName</i> if the account is a local account on the server. The <i>ServerName</i> is the name of the computer that is authenticating the credentials.
  * 
  * </li>
  * <li><i>UserName</i>. If you specify only <i>UserName</i>, the user's default domain name is prefixed to the user's name and the rules for the <i>DomainName</i><b>\</b><i>UserName</i> form apply.  Use this option only if the user is a member of a domain.
  * 
  * </li>
  * <li><b>NULL</b>. To use the user's logon credentials for NTLM or Kerberos authentication, set <b>UserName</b> to <b>NULL</b>. This works only if the user is in a trusted domain. Setting <b>UserName</b> to <b>NULL</b> for services running as a system account passes the computer's credentials for authentication. This option works only if the domain enables Kerberos authentication and you select Negotiate as the authentication scheme.
  * 
  * </li>
  * </ul>
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//bits1_5/ns-bits1_5-bg_basic_credentials
 * @namespace Windows.Win32.Networking.BackgroundIntelligentTransferService
 * @version v4.0.30319
 */
class BG_BASIC_CREDENTIALS extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * A null-terminated string that contains the user name to authenticate. The user name is limited to 300 characters, not including the null terminator. The format of the user name depends on the authentication scheme requested. For example, for Basic, NTLM, and Negotiate authentication, the user name is of the form <em>DomainName</em><strong>\\</strong><em>UserName</em>. For Passport authentication, the user name is an email address. For more information, see Remarks.
     * 
     * If <strong>NULL</strong>, default credentials for this session context are used.
     * @type {Pointer<Char>}
     */
    UserName {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * A null-terminated string that contains the password in plaintext. The password is limited to 65536 characters, not including the null terminator. The password can be blank. Set it to <strong>NULL</strong> if <strong>UserName</strong> is <strong>NULL</strong>. BITS encrypts the password before persisting the job if a network disconnect occurs or the user logs off.
     * 
     * Live ID encoded passwords are supported through Negotiate 2. For more information about Live IDs, see the <a href="https://docs.microsoft.com/office/">Windows Live ID SDK</a>.
     * @type {Pointer<Char>}
     */
    Password {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }
}
