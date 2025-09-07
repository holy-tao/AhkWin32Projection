#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\PWSTR.ahk

/**
 * The CREDENTIAL_TARGET_INFORMATION structure contains the target computer's name, domain, and tree. (Unicode)
 * @remarks
 * > [!NOTE]
  * > The wincred.h header defines CREDENTIAL_TARGET_INFORMATION as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
 * @see https://learn.microsoft.com/windows/win32/api/wincred/ns-wincred-credential_target_informationw
 * @namespace Windows.Win32.Security.Credentials
 * @version v4.0.30319
 * @charset Unicode
 */
class CREDENTIAL_TARGET_INFORMATIONW extends Win32Struct
{
    static sizeof => 72

    static packingSize => 8

    /**
     * Name of the target server as specified by the caller accessing the target. It is typically the NetBIOS or DNS name of the target server.
     * @type {PWSTR}
     */
    TargetName{
        get {
            if(!this.HasProp("__TargetName"))
                this.__TargetName := PWSTR(this.ptr + 0)
            return this.__TargetName
        }
    }

    /**
     * NetBIOS name of the target server. If the name is not known, this member can be <b>NULL</b>.
     * @type {PWSTR}
     */
    NetbiosServerName{
        get {
            if(!this.HasProp("__NetbiosServerName"))
                this.__NetbiosServerName := PWSTR(this.ptr + 8)
            return this.__NetbiosServerName
        }
    }

    /**
     * DNS name of the target server. If the name is not known, this member can be <b>NULL</b>.
     * @type {PWSTR}
     */
    DnsServerName{
        get {
            if(!this.HasProp("__DnsServerName"))
                this.__DnsServerName := PWSTR(this.ptr + 16)
            return this.__DnsServerName
        }
    }

    /**
     * NetBIOS name of the target server's domain. If the name is not known, this member can be <b>NULL</b>. If the target server is a member of a workgroup, this member must be <b>NULL</b>.
     * @type {PWSTR}
     */
    NetbiosDomainName{
        get {
            if(!this.HasProp("__NetbiosDomainName"))
                this.__NetbiosDomainName := PWSTR(this.ptr + 24)
            return this.__NetbiosDomainName
        }
    }

    /**
     * DNS name of the target server's domain. If the name is not known, this member can be <b>NULL</b>. If the target server is a member of a workgroup, this member must be <b>NULL</b>.
     * @type {PWSTR}
     */
    DnsDomainName{
        get {
            if(!this.HasProp("__DnsDomainName"))
                this.__DnsDomainName := PWSTR(this.ptr + 32)
            return this.__DnsDomainName
        }
    }

    /**
     * DNS name of the target server's tree. If the tree name is not known, this member can be <b>NULL</b>. If the target server is a member of a workgroup, this member must be <b>NULL</b>.
     * @type {PWSTR}
     */
    DnsTreeName{
        get {
            if(!this.HasProp("__DnsTreeName"))
                this.__DnsTreeName := PWSTR(this.ptr + 40)
            return this.__DnsTreeName
        }
    }

    /**
     * Name of the authentication package that determined the values <b>NetbiosServerName</b>, <b>DnsServerName</b>, <b>NetbiosDomainName</b>, <b>DnsDomainName</b>, and <b>DnsTreeName</b> as a function of <b>TargetName</b>. This member can be passed to <a href="https://docs.microsoft.com/windows/desktop/api/sspi/nf-sspi-acquirecredentialshandlea">AcquireCredentialsHandle</a> as the package name.
     * @type {PWSTR}
     */
    PackageName{
        get {
            if(!this.HasProp("__PackageName"))
                this.__PackageName := PWSTR(this.ptr + 48)
            return this.__PackageName
        }
    }

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
     * @type {Integer}
     */
    Flags {
        get => NumGet(this, 56, "uint")
        set => NumPut("uint", value, this, 56)
    }

    /**
     * Number of elements in the <b>CredTypes</b> array.
     * @type {Integer}
     */
    CredTypeCount {
        get => NumGet(this, 60, "uint")
        set => NumPut("uint", value, this, 60)
    }

    /**
     * Array specifying the credential types acceptable by the authentication package used by the target server. Each element is one of the CRED_TYPE_* defines. The order of this array specifies the preference order of the authentication package. More preferable types are specified earlier in the list.
     * @type {Pointer<UInt32>}
     */
    CredTypes {
        get => NumGet(this, 64, "ptr")
        set => NumPut("ptr", value, this, 64)
    }
}
