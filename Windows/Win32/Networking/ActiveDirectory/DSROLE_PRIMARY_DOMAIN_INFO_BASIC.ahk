#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Used with the DsRoleGetPrimaryDomainInformation function to contain domain data.
 * @see https://learn.microsoft.com/windows/win32/api/dsrole/ns-dsrole-dsrole_primary_domain_info_basic
 * @namespace Windows.Win32.Networking.ActiveDirectory
 * @version v4.0.30319
 */
class DSROLE_PRIMARY_DOMAIN_INFO_BASIC extends Win32Struct
{
    static sizeof => 40

    static packingSize => 8

    /**
     * Contains one of the <a href="https://docs.microsoft.com/windows/desktop/api/dsrole/ne-dsrole-dsrole_machine_role">DSROLE_MACHINE_ROLE</a> values that specifies the role of the computer.
     * @type {Integer}
     */
    MachineRole {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * 
     * @type {Integer}
     */
    Flags {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * Pointer to a null-terminated Unicode string that contains the NetBIOS domain name.
     * @type {Pointer<PWSTR>}
     */
    DomainNameFlat {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * Pointer to a null-terminated Unicode string that contains the DNS domain name. This member is optional and may be <b>NULL</b>.
     * @type {Pointer<PWSTR>}
     */
    DomainNameDns {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }

    /**
     * Pointer to a null-terminated Unicode string that contains the forest name. This member is optional and may be <b>NULL</b>.
     * @type {Pointer<PWSTR>}
     */
    DomainForestName {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }

    /**
     * Contains the domain identifier. This member is valid only if the <b>Flags</b> member contains the <b>DSROLE_PRIMARY_DOMAIN_GUID_PRESENT</b> flag.
     * @type {Pointer<Guid>}
     */
    DomainGuid {
        get => NumGet(this, 32, "ptr")
        set => NumPut("ptr", value, this, 32)
    }
}
