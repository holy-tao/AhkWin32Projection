#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\PSTR.ahk" { PSTR }

/**
 * Used with the DsGetDcName function to receive data about a domain controller. (ANSI)
 * @remarks
 * > [!NOTE]
 * > The dsgetdc.h header defines DOMAIN_CONTROLLER_INFO as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
 * @see https://learn.microsoft.com/windows/win32/api/dsgetdc/ns-dsgetdc-domain_controller_infoa
 * @namespace Windows.Win32.Networking.ActiveDirectory
 * @charset ANSI
 */
export default struct DOMAIN_CONTROLLER_INFOA {
    #StructPack 8

    /**
     * Pointer to a null-terminated string that specifies the computer name of the discovered domain controller. The returned computer name is prefixed with "\\". The DNS-style name, for example, "\\phoenix.fabrikam.com", is returned, if available. If the DNS-style name is not available, the flat-style name (for example, "\\phoenix") is returned. This example would apply if the domain is a Windows NT 4.0 domain or if the domain does not support the IP family of protocols.
     */
    DomainControllerName : PSTR

    /**
     * Pointer to a null-terminated string that specifies the address of the discovered domain controller. The address is prefixed with "\\". This string is one of the types defined by the <b>DomainControllerAddressType</b> member.
     */
    DomainControllerAddress : PSTR

    DomainControllerAddressType : UInt32

    /**
     * The <b>GUID</b> of the domain. This member is zero if the domain controller does not have a Domain GUID; for example, the domain controller is not a Windows 2000 domain controller.
     */
    DomainGuid : Guid

    /**
     * Pointer to a null-terminated string that specifies the name of the domain. The DNS-style name, for example, "fabrikam.com", is returned if available. Otherwise, the flat-style name, for example, "fabrikam", is returned. This name may be different than the requested domain name if the domain has been renamed.
     */
    DomainName : PSTR

    /**
     * Pointer to a null-terminated string that specifies the name of the domain at the root of the DS tree. The DNS-style name, for example, "fabrikam.com", is returned if available. Otherwise, the flat-style name, for example, "fabrikam" is returned.
     */
    DnsForestName : PSTR

    /**
     * Contains a set of flags that describe the domain controller.
     */
    Flags : UInt32

    /**
     * Pointer to a null-terminated string that specifies the name of the site where the domain controller is located. This member may be <b>NULL</b> if the domain controller is not in a site; for example, the domain controller is a Windows NT 4.0 domain controller.
     */
    DcSiteName : PSTR

    /**
     * Pointer to a null-terminated string that specifies the name of the site that the computer belongs to. The computer is specified in the <i>ComputerName</i> parameter passed to <a href="https://docs.microsoft.com/windows/desktop/api/dsgetdc/nf-dsgetdc-dsgetdcnamea">DsGetDcName</a>. This member may be <b>NULL</b> if the site that contains the computer cannot be found; for example, if the DS administrator has not associated the subnet that the computer is in with a valid site.
     */
    ClientSiteName : PSTR

}
