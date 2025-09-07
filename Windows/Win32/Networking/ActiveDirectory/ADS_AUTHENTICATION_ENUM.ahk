#Requires AutoHotkey v2.0.0 64-bit

/**
 * Specifies authentication options used in ADSI for binding to directory service objects.
 * @remarks
 * The <b>ADS_SECURE_AUTHENTICATION</b> flag can be used in combination with other flags such 
  *     as <b>ADS_READONLY_SERVER</b>, <b>ADS_PROMPT_CREDENTIALS</b>, 
  *     <b>ADS_FAST_BIND</b>, and so on.
  * 
  * Serverless binding refers to a process in which a client attempts to bind to an Active Directory object 
  *     without explicitly specifying an Active Directory server in the binding string. This is possible because the LDAP 
  *     provider relies on the locator services of Windows to find the best domain controller (DC) for the client. 
  *     However, the client must have an account on the Active Directory domain controller to take advantage of the 
  *     serverless binding feature, and the DC used by a serverless bind will always be located in the default domain; 
  *     that is, the domain associated with the current security context of the thread that performs the binding.
  * 
  * Because VBScript cannot read data from a type library, VBScript applications do not recognize the symbolic 
  *     constants as defined above. Use the numerical constants instead to set the appropriate flags in your VBScript 
  *     applications. To use the symbolic constants as a good programming practice, write explicit declarations of such 
  *     constants, as done here, in your Visual Basic Scripting edition application.
 * @see https://learn.microsoft.com/windows/win32/api/iads/ne-iads-ads_authentication_enum
 * @namespace Windows.Win32.Networking.ActiveDirectory
 * @version v4.0.30319
 */
class ADS_AUTHENTICATION_ENUM{

    /**
     * Requests secure authentication. When this flag is set, the WinNT provider uses NT LAN Manager (NTLM) to 
 *       authenticate the client. Active Directory will use Kerberos, and possibly NTLM, to authenticate the client. When 
 *       the user name and password are <b>NULL</b>, ADSI binds to the object using the security 
 *       context of the calling thread, which is either the security context of the user account under which the 
 *       application is running or of the client user account that the calling thread represents.
     * @type {Integer (UInt32)}
     */
    static ADS_SECURE_AUTHENTICATION => 1

    /**
     * Requires ADSI to use encryption for data exchange over the network.
 * 
 * <div class="alert"><b>Note</b>  This option is not supported by the WinNT provider.</div>
 * <div> </div>
     * @type {Integer (UInt32)}
     */
    static ADS_USE_ENCRYPTION => 2

    /**
     * The channel is encrypted using Secure Sockets Layer (SSL). Active Directory requires that the Certificate 
 *        Server be installed to support SSL.
 * 
 * If this flag is not combined with the <b>ADS_SECURE_AUTHENTICATION</b> flag and the 
 *        supplied credentials are <b>NULL</b>, the bind will be performed anonymously. If this flag 
 *        is combined with the <b>ADS_SECURE_AUTHENTICATION</b> flag and the supplied credentials are 
 *        <b>NULL</b>, then the credentials of the calling thread are used.
 * 
 * <div class="alert"><b>Note</b>  This option is not supported by the WinNT provider.</div>
 * <div> </div>
     * @type {Integer (UInt32)}
     */
    static ADS_USE_SSL => 2

    /**
     * A writable domain controller is not required. If your application only reads or queries data from Active 
 *        Directory, you should use this flag to open the sessions. This allows the application to take advantage of 
 *        Read-Only DCs (RODCs).
 * 
 * In Windows Server 2008, ADSI attempts to connect to either Read-Only DCs (RODCs) or writable DCs. This 
 *        allows the use of an RODC for the access and enables the application to run in a branch or perimeter network 
 *        (also known as DMZ, demilitarized zone, and screened subnet), without the need for direct connectivity with a 
 *        writable DC.
 * 
 * For more information about programming for RODC compatibility, see the 
 *        <a href="https://docs.microsoft.com/previous-versions/windows/it-pro/windows-server-2008-R2-and-2008/cc755190(v=ws.10)">Read-Only Domain Controllers Application Compatibility Guide</a>.
     * @type {Integer (UInt32)}
     */
    static ADS_READONLY_SERVER => 4

    /**
     * This flag is not supported.
     * @type {Integer (UInt32)}
     */
    static ADS_PROMPT_CREDENTIALS => 8

    /**
     * Request no authentication. The providers may attempt to bind the client, as an anonymous user, to the 
 *       target object. The WinNT provider does not support this flag. Active Directory establishes a connection between 
 *       the client and the targeted object, but will not perform authentication. Setting this flag amounts to requesting 
 *       an anonymous binding, which indicates all users as the security context.
     * @type {Integer (UInt32)}
     */
    static ADS_NO_AUTHENTICATION => 16

    /**
     * When this flag is set, ADSI will not attempt to query the <b>objectClass</b> 
 *        property and thus will only expose the base interfaces supported by all ADSI objects instead of the full object 
 *        support. A user can use this option to increase the performance in a series of object manipulations that involve 
 *        only methods of the base interfaces. However, ADSI will not verify that any of the requested objects actually 
 *        exist on the server. For more information, see 
 *        <a href="https://docs.microsoft.com/windows/desktop/ADSI/fast-binding-option-for-batch-writemodify-operations">Fast Binding Options for Batch Write/Modify Operations</a>.
 * 
 * This option is also useful for binding to non-Active Directory directory services, for example Exchange 5.5, 
 *        where the <b>objectClass</b> query would fail.
     * @type {Integer (UInt32)}
     */
    static ADS_FAST_BIND => 32

    /**
     * Verifies data integrity. The <b>ADS_SECURE_AUTHENTICATION</b> flag must also be set also 
 *        to use signing.
 * 
 * <div class="alert"><b>Note</b>  This option is not supported by the WinNT provider.</div>
 * <div> </div>
     * @type {Integer (UInt32)}
     */
    static ADS_USE_SIGNING => 64

    /**
     * Encrypts data using Kerberos. The <b>ADS_SECURE_AUTHENTICATION</b> flag must also be set 
 *        to use sealing.
 * 
 * <div class="alert"><b>Note</b>  This option is not supported by the WinNT provider.</div>
 * <div> </div>
     * @type {Integer (UInt32)}
     */
    static ADS_USE_SEALING => 128

    /**
     * Enables ADSI to delegate the user security context, which is necessary for moving objects across domains.
     * @type {Integer (UInt32)}
     */
    static ADS_USE_DELEGATION => 256

    /**
     * If an Active Directory DNS server name is passed in the LDAP path, this forces an A-record lookup and 
 *        bypasses any SRV record lookup when resolving the host name.
 * 
 * <div class="alert"><b>Note</b>  This option is not supported by the WinNT provider.</div>
 * <div> </div>
     * @type {Integer (UInt32)}
     */
    static ADS_SERVER_BIND => 512

    /**
     * Specify this flag to turn referral chasing off for the life of the connection. However, even when this flag 
 *        is specified, ADSI still allows the setting of referral chasing behavior for container enumeration when set 
 *        using <b>ADS_OPTION_REFERRALS</b> in 
 *        <a href="https://docs.microsoft.com/windows/win32/api/iads/ne-iads-ads_option_enum">ADS_OPTION_ENUM</a> (as documented in container enumeration 
 *        with referral chasing in 
 *        <a href="https://docs.microsoft.com/windows/desktop/api/iads/nf-iads-iadsobjectoptions-setoption">IADsObjectOptions::SetOption</a>) and 
 *        searching separately (as documented in 
 *        <a href="https://docs.microsoft.com/windows/desktop/ADSI/referral-chasing-with-idirectorysearch">Referral Chasing with IDirectorySearch</a>).
 * 
 * <div class="alert"><b>Note</b>  This option is not supported by the WinNT provider.</div>
 * <div> </div>
     * @type {Integer (UInt32)}
     */
    static ADS_NO_REFERRAL_CHASING => 1024

    /**
     * Reserved.
     * @type {Integer (UInt32)}
     */
    static ADS_AUTH_RESERVED => 2147483648
}
