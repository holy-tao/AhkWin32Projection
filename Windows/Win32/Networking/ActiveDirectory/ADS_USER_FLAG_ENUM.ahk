#Requires AutoHotkey v2.0.0 64-bit

/**
 * Defines the flags used for setting user properties in the directory.
 * @remarks
 * For more information, see <a href="https://docs.microsoft.com/windows/desktop/AD/managing-users">Managing Users</a>.
  * 
  * For more information, and a code example that shows how to set the 
  *      <b>ADS_UF_DONT_EXPIRE_PASSWD</b> value on a user 
  *      <b>userAccountControl</b> attribute, see 
  *      <a href="https://docs.microsoft.com/windows/desktop/ADSI/password-never-expires">Password Never Expires</a>.
  * 
  * <div class="alert"><b>Note</b>  Because VBScript cannot read data from a type library, VBScript applications do not understand the symbolic 
  *     constants as defined above. Use the numerical constants, instead, to set the appropriate flags in your VBScript 
  *     applications. To use the symbolic constants as a good programming practice, create explicit declarations of such 
  *     constants, as done here, in your VBScript applications.</div>
  * <div> </div>
 * @see https://learn.microsoft.com/windows/win32/api/iads/ne-iads-ads_user_flag_enum
 * @namespace Windows.Win32.Networking.ActiveDirectory
 * @version v4.0.30319
 */
class ADS_USER_FLAG_ENUM{

    /**
     * The logon script is executed. This flag does not work for the ADSI LDAP provider on either read or write 
 *       operations. For the  ADSI WinNT provider, this flag is  read-only data, and it cannot be set for user 
 *       objects.
     * @type {Integer (Int32)}
     */
    static ADS_UF_SCRIPT => 1

    /**
     * The user account is disabled.
     * @type {Integer (Int32)}
     */
    static ADS_UF_ACCOUNTDISABLE => 2

    /**
     * The home directory is required.
     * @type {Integer (Int32)}
     */
    static ADS_UF_HOMEDIR_REQUIRED => 8

    /**
     * The account is currently locked out.
     * @type {Integer (Int32)}
     */
    static ADS_UF_LOCKOUT => 16

    /**
     * No password is required.
     * @type {Integer (Int32)}
     */
    static ADS_UF_PASSWD_NOTREQD => 32

    /**
     * The user cannot change the password. This flag can be read, but not set directly.  For more information and 
 *       a code example that shows how to prevent a user from changing the password, see 
 *       <a href="https://docs.microsoft.com/windows/desktop/ADSI/user-cannot-change-password">User Cannot Change Password</a>.
     * @type {Integer (Int32)}
     */
    static ADS_UF_PASSWD_CANT_CHANGE => 64

    /**
     * The user can send an encrypted password.
     * @type {Integer (Int32)}
     */
    static ADS_UF_ENCRYPTED_TEXT_PASSWORD_ALLOWED => 128

    /**
     * This is an account for users whose primary account is in another domain. This account provides user access 
 *       to this domain, but not to any domain that trusts this domain. Also known as a  local user account.
     * @type {Integer (Int32)}
     */
    static ADS_UF_TEMP_DUPLICATE_ACCOUNT => 256

    /**
     * This is a default account type that represents a typical user.
     * @type {Integer (Int32)}
     */
    static ADS_UF_NORMAL_ACCOUNT => 512

    /**
     * This is a permit to trust account for a system domain that trusts other domains.
     * @type {Integer (Int32)}
     */
    static ADS_UF_INTERDOMAIN_TRUST_ACCOUNT => 2048

    /**
     * This is a computer account for a Windows or Windows Server that is a member of this domain.
     * @type {Integer (Int32)}
     */
    static ADS_UF_WORKSTATION_TRUST_ACCOUNT => 4096

    /**
     * This is a computer account for a system backup domain controller that is a member of this domain.
     * @type {Integer (Int32)}
     */
    static ADS_UF_SERVER_TRUST_ACCOUNT => 8192

    /**
     * When set, the password will not expire on this account.
     * @type {Integer (Int32)}
     */
    static ADS_UF_DONT_EXPIRE_PASSWD => 65536

    /**
     * This is an Majority Node Set (MNS) logon account. With MNS, you can configure a multi-node Windows cluster 
 *       without using a common shared disk.
     * @type {Integer (Int32)}
     */
    static ADS_UF_MNS_LOGON_ACCOUNT => 131072

    /**
     * When set, this flag will force the user to log on using a smart card.
     * @type {Integer (Int32)}
     */
    static ADS_UF_SMARTCARD_REQUIRED => 262144

    /**
     * When set, the service account (user or computer account), under which a service runs, is trusted for 
 *       Kerberos delegation. Any such service can impersonate a client requesting the service. To enable a service for 
 *       Kerberos delegation, set this flag on the  <b>userAccountControl</b> property of the 
 *       service account.
     * @type {Integer (Int32)}
     */
    static ADS_UF_TRUSTED_FOR_DELEGATION => 524288

    /**
     * When set, the security context of the user will not be delegated to a service even if the service account 
 *       is set as trusted for Kerberos delegation.
     * @type {Integer (Int32)}
     */
    static ADS_UF_NOT_DELEGATED => 1048576

    /**
     * Restrict this principal to use only Data Encryption Standard (DES) encryption types for keys.
     * @type {Integer (Int32)}
     */
    static ADS_UF_USE_DES_KEY_ONLY => 2097152

    /**
     * This account does not require Kerberos preauthentication for logon.
     * @type {Integer (Int32)}
     */
    static ADS_UF_DONT_REQUIRE_PREAUTH => 4194304

    /**
     * The user password has expired. This flag is created by the system using data from the  password last set 
 *       attribute and the domain policy.  It is read-only and cannot be set. To manually set a user password as expired, 
 *       use the <a href="https://docs.microsoft.com/windows/desktop/api/lmaccess/nf-lmaccess-netusersetinfo">NetUserSetInfo</a> function with the 
 *       <a href="https://docs.microsoft.com/windows/desktop/api/lmaccess/ns-lmaccess-user_info_3">USER_INFO_3</a> 
 *       (<b>usri3_password_expired</b> member) or 
 *       <a href="https://docs.microsoft.com/windows/desktop/api/lmaccess/ns-lmaccess-user_info_4">USER_INFO_4</a> 
 *       (<b>usri4_password_expired</b> member) structure.
     * @type {Integer (Int32)}
     */
    static ADS_UF_PASSWORD_EXPIRED => 8388608

    /**
     * The account is enabled for delegation. This is a security-sensitive setting; accounts with this option 
 *       enabled should be strictly controlled. This setting enables a service running under the account to assume a 
 *       client identity and authenticate as that user to other remote servers on the network.
     * @type {Integer (Int32)}
     */
    static ADS_UF_TRUSTED_TO_AUTHENTICATE_FOR_DELEGATION => 16777216
}
