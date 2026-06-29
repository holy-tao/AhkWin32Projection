#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Security\PSID.ahk" { PSID }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\PSTR.ahk" { PSTR }

/**
 * Used with the DsEnumerateDomainTrusts function to contain trust data for a domain. (ANSI)
 * @remarks
 * > [!NOTE]
 * > The dsgetdc.h header defines DS_DOMAIN_TRUSTS as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
 * @see https://learn.microsoft.com/windows/win32/api/dsgetdc/ns-dsgetdc-ds_domain_trustsa
 * @namespace Windows.Win32.Networking.ActiveDirectory
 * @charset ANSI
 */
export default struct DS_DOMAIN_TRUSTSA {
    #StructPack 8

    /**
     * Pointer to a null-terminated string that contains the NetBIOS name of the domain.
     */
    NetbiosDomainName : PSTR

    /**
     * Pointer to a null-terminated string that contains the DNS name of the domain. This member may be <b>NULL</b>.
     */
    DnsDomainName : PSTR

    Flags : UInt32

    /**
     * Contains the index in the <i>Domains</i> array returned by the <a href="https://docs.microsoft.com/windows/desktop/api/dsgetdc/nf-dsgetdc-dsenumeratedomaintrustsa">DsEnumerateDomainTrusts</a> function that corresponds to the parent domain of the domain represented by this structure. This member is only valid if the all of the following conditions are met:
     * 
     * <ul>
     * <li>The <b>DS_DOMAIN_IN_FOREST</b> flag was specified in the <i>Flags</i> parameter of the <a href="https://docs.microsoft.com/windows/desktop/api/dsgetdc/nf-dsgetdc-dsenumeratedomaintrustsa">DsEnumerateDomainTrusts</a> function.</li>
     * <li>The <b>Flags</b> member of this structure does not contain the <b>DS_DOMAIN_TREE_ROOT</b> flag.</li>
     * </ul>
     */
    ParentIndex : UInt32

    /**
     * Contains a value that indicates the type of trust represented by this structure. Possible values for this member are documented in the <b>TrustType</b> member of the <a href="https://docs.microsoft.com/windows/desktop/api/ntsecapi/ns-ntsecapi-trusted_domain_information_ex">TRUSTED_DOMAIN_INFORMATION_EX</a> structure.
     */
    TrustType : UInt32

    /**
     * Contains a value that indicates the attributes of the trust represented by this structure. Possible values for this member are documented in the <b>TrustAttribute</b> member of the <a href="https://docs.microsoft.com/windows/desktop/api/ntsecapi/ns-ntsecapi-trusted_domain_information_ex">TRUSTED_DOMAIN_INFORMATION_EX</a> structure.
     */
    TrustAttributes : UInt32

    /**
     * Contains the security identifier of the domain represented by this structure.
     */
    DomainSid : PSID

    /**
     * Contains the GUID of the domain represented by this structure.
     */
    DomainGuid : Guid

}
