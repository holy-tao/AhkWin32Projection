#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }

/**
 * The CREDENTIAL_TARGET_INFORMATION structure contains the target computer's name, domain, and tree. (Unicode)
 * @remarks
 * > [!NOTE]
 * > The wincred.h header defines CREDENTIAL_TARGET_INFORMATION as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
 * @see https://learn.microsoft.com/windows/win32/api/wincred/ns-wincred-credential_target_informationw
 * @namespace Windows.Win32.Security.Credentials
 * @charset Unicode
 */
export default struct CREDENTIAL_TARGET_INFORMATIONW {
    #StructPack 8

    /**
     * Name of the target server as specified by the caller accessing the target. It is typically the NetBIOS or DNS name of the target server.
     */
    TargetName : PWSTR

    /**
     * NetBIOS name of the target server. If the name is not known, this member can be <b>NULL</b>.
     */
    NetbiosServerName : PWSTR

    /**
     * DNS name of the target server. If the name is not known, this member can be <b>NULL</b>.
     */
    DnsServerName : PWSTR

    /**
     * NetBIOS name of the target server's domain. If the name is not known, this member can be <b>NULL</b>. If the target server is a member of a workgroup, this member must be <b>NULL</b>.
     */
    NetbiosDomainName : PWSTR

    /**
     * DNS name of the target server's domain. If the name is not known, this member can be <b>NULL</b>. If the target server is a member of a workgroup, this member must be <b>NULL</b>.
     */
    DnsDomainName : PWSTR

    /**
     * DNS name of the target server's tree. If the tree name is not known, this member can be <b>NULL</b>. If the target server is a member of a workgroup, this member must be <b>NULL</b>.
     */
    DnsTreeName : PWSTR

    /**
     * Name of the authentication package that determined the values <b>NetbiosServerName</b>, <b>DnsServerName</b>, <b>NetbiosDomainName</b>, <b>DnsDomainName</b>, and <b>DnsTreeName</b> as a function of <b>TargetName</b>. This member can be passed to <a href="https://docs.microsoft.com/windows/desktop/api/sspi/nf-sspi-acquirecredentialshandlea">AcquireCredentialsHandle</a> as the package name.
     */
    PackageName : PWSTR

    /**
     * Attributes of the target. 
     * 
     * 
     * 
     * 
     * <ul>
     * <li>CRED_TI_SERVER_FORMAT_UNKNOWN 
     * 
     * 
     * (1) — Set if the authentication package cannot determine whether the server name is a DNS name or a NetBIOS name. In that case, the <b>NetbiosServerName</b> member is set to <b>NULL</b> and the <b>DnsServerName</b> member is set to the server name of unknown format.
     * 
     * </li>
     * <li>CRED_TI_DOMAIN_FORMAT_UNKNOWN 
     * 
     * 
     * (2) — Set if the authentication package cannot determine whether the domain name is a DNS name or a NetBIOS name. In that case, the <b>NetbiosDomainName</b> member is set to <b>NULL</b> and the <b>DnsDomainName</b> member is set to the domain name of unknown format.
     * 
     * </li>
     * <li>CRED_TI_ONLY_PASSWORD_REQUIRED 
     * 
     * 
     * (4) — Set if the authentication package has determined that the server only needs a password to authenticate. The caller can use this flag  to prompt only for a password and not a user name.
     * 
     * Stored credentials require a UserName member. A value of &lt;<i>DnsServerName</i>&gt;\Guest or &lt;<i>NetbiosServerName</i>&gt;\Guest should be used for these servers.
     * 
     * </li>
     * </ul>
     */
    Flags : UInt32

    /**
     * Number of elements in the <b>CredTypes</b> array.
     */
    CredTypeCount : UInt32

    /**
     * Array specifying the credential types acceptable by the authentication package used by the target server. Each element is one of the CRED_TYPE_* defines. The order of this array specifies the preference order of the authentication package. More preferable types are specified earlier in the list.
     */
    CredTypes : IntPtr

}
