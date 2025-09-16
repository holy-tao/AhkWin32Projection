#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Used with the DsEnumerateDomainTrusts function to contain trust data for a domain. (ANSI)
 * @remarks
 * > [!NOTE]
  * > The dsgetdc.h header defines DS_DOMAIN_TRUSTS as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
 * @see https://learn.microsoft.com/windows/win32/api/dsgetdc/ns-dsgetdc-ds_domain_trustsa
 * @namespace Windows.Win32.Networking.ActiveDirectory
 * @version v4.0.30319
 * @charset ANSI
 */
class DS_DOMAIN_TRUSTSA extends Win32Struct
{
    static sizeof => 48

    static packingSize => 8

    /**
     * Pointer to a null-terminated string that contains the NetBIOS name of the domain.
     * @type {Pointer<PSTR>}
     */
    NetbiosDomainName {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * Pointer to a null-terminated string that contains the DNS name of the domain. This member may be <b>NULL</b>.
     * @type {Pointer<PSTR>}
     */
    DnsDomainName {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * 
     * @type {Integer}
     */
    Flags {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * Contains the index in the <i>Domains</i> array returned by the <a href="https://docs.microsoft.com/windows/desktop/api/dsgetdc/nf-dsgetdc-dsenumeratedomaintrustsa">DsEnumerateDomainTrusts</a> function that corresponds to the parent domain of the domain represented by this structure. This member is only valid if the all of the following conditions are met:
     * 
     * <ul>
     * <li>The <b>DS_DOMAIN_IN_FOREST</b> flag was specified in the <i>Flags</i> parameter of the <a href="https://docs.microsoft.com/windows/desktop/api/dsgetdc/nf-dsgetdc-dsenumeratedomaintrustsa">DsEnumerateDomainTrusts</a> function.</li>
     * <li>The <b>Flags</b> member of this structure does not contain the <b>DS_DOMAIN_TREE_ROOT</b> flag.</li>
     * </ul>
     * @type {Integer}
     */
    ParentIndex {
        get => NumGet(this, 20, "uint")
        set => NumPut("uint", value, this, 20)
    }

    /**
     * Contains a value that indicates the type of trust represented by this structure. Possible values for this member are documented in the <b>TrustType</b> member of the <a href="https://docs.microsoft.com/windows/desktop/api/ntsecapi/ns-ntsecapi-trusted_domain_information_ex">TRUSTED_DOMAIN_INFORMATION_EX</a> structure.
     * @type {Integer}
     */
    TrustType {
        get => NumGet(this, 24, "uint")
        set => NumPut("uint", value, this, 24)
    }

    /**
     * Contains a value that indicates the attributes of the trust represented by this structure. Possible values for this member are documented in the <b>TrustAttribute</b> member of the <a href="https://docs.microsoft.com/windows/desktop/api/ntsecapi/ns-ntsecapi-trusted_domain_information_ex">TRUSTED_DOMAIN_INFORMATION_EX</a> structure.
     * @type {Integer}
     */
    TrustAttributes {
        get => NumGet(this, 28, "uint")
        set => NumPut("uint", value, this, 28)
    }

    /**
     * Contains the security identifier of the domain represented by this structure.
     * @type {Pointer<PSID>}
     */
    DomainSid {
        get => NumGet(this, 32, "ptr")
        set => NumPut("ptr", value, this, 32)
    }

    /**
     * Contains the GUID of the domain represented by this structure.
     * @type {Pointer<Guid>}
     */
    DomainGuid {
        get => NumGet(this, 40, "ptr")
        set => NumPut("ptr", value, this, 40)
    }
}
