#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Used with the DsGetDcName function to receive data about a domain controller. (Unicode)
 * @remarks
 * > [!NOTE]
  * > The dsgetdc.h header defines DOMAIN_CONTROLLER_INFO as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
 * @see https://learn.microsoft.com/windows/win32/api/dsgetdc/ns-dsgetdc-domain_controller_infow
 * @namespace Windows.Win32.Networking.ActiveDirectory
 * @version v4.0.30319
 * @charset Unicode
 */
class DOMAIN_CONTROLLER_INFOW extends Win32Struct
{
    static sizeof => 72

    static packingSize => 8

    /**
     * Pointer to a null-terminated string that specifies the computer name of the discovered domain controller. The returned computer name is prefixed with "\\". The DNS-style name, for example, "\\phoenix.fabrikam.com", is returned, if available. If the DNS-style name is not available, the flat-style name (for example, "\\phoenix") is returned. This example would apply if the domain is a Windows NT 4.0 domain or if the domain does not support the IP family of protocols.
     * @type {Pointer<Char>}
     */
    DomainControllerName {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * Pointer to a null-terminated string that specifies the address of the discovered domain controller. The address is prefixed with "\\". This string is one of the types defined by the <b>DomainControllerAddressType</b> member.
     * @type {Pointer<Char>}
     */
    DomainControllerAddress {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * 
     * @type {Integer}
     */
    DomainControllerAddressType {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * The <b>GUID</b> of the domain. This member is zero if the domain controller does not have a Domain GUID; for example, the domain controller is not a Windows 2000 domain controller.
     * @type {Pointer<Guid>}
     */
    DomainGuid {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }

    /**
     * Pointer to a null-terminated string that specifies the name of the domain. The DNS-style name, for example, "fabrikam.com", is returned if available. Otherwise, the flat-style name, for example, "fabrikam", is returned. This name may be different than the requested domain name if the domain has been renamed.
     * @type {Pointer<Char>}
     */
    DomainName {
        get => NumGet(this, 32, "ptr")
        set => NumPut("ptr", value, this, 32)
    }

    /**
     * Pointer to a null-terminated string that specifies the name of the domain at the root of the DS tree. The DNS-style name, for example, "fabrikam.com", is returned if available. Otherwise, the flat-style name, for example, "fabrikam" is returned.
     * @type {Pointer<Char>}
     */
    DnsForestName {
        get => NumGet(this, 40, "ptr")
        set => NumPut("ptr", value, this, 40)
    }

    /**
     * Contains a set of flags that describe the domain controller.
     * @type {Integer}
     */
    Flags {
        get => NumGet(this, 48, "uint")
        set => NumPut("uint", value, this, 48)
    }

    /**
     * Pointer to a null-terminated string that specifies the name of the site where the domain controller is located. This member may be <b>NULL</b> if the domain controller is not in a site; for example, the domain controller is a Windows NT 4.0 domain controller.
     * @type {Pointer<Char>}
     */
    DcSiteName {
        get => NumGet(this, 56, "ptr")
        set => NumPut("ptr", value, this, 56)
    }

    /**
     * Pointer to a null-terminated string that specifies the name of the site that the computer belongs to. The computer is specified in the <i>ComputerName</i> parameter passed to <a href="https://docs.microsoft.com/windows/desktop/api/dsgetdc/nf-dsgetdc-dsgetdcnamea">DsGetDcName</a>. This member may be <b>NULL</b> if the site that contains the computer cannot be found; for example, if the DS administrator has not associated the subnet that the computer is in with a valid site.
     * @type {Pointer<Char>}
     */
    ClientSiteName {
        get => NumGet(this, 64, "ptr")
        set => NumPut("ptr", value, this, 64)
    }
}
