#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\DSROLE_MACHINE_ROLE.ahk" { DSROLE_MACHINE_ROLE }

/**
 * Used with the DsRoleGetPrimaryDomainInformation function to contain domain data.
 * @see https://learn.microsoft.com/windows/win32/api/dsrole/ns-dsrole-dsrole_primary_domain_info_basic
 * @namespace Windows.Win32.Networking.ActiveDirectory
 */
export default struct DSROLE_PRIMARY_DOMAIN_INFO_BASIC {
    #StructPack 8

    /**
     * Contains one of the <a href="https://docs.microsoft.com/windows/desktop/api/dsrole/ne-dsrole-dsrole_machine_role">DSROLE_MACHINE_ROLE</a> values that specifies the role of the computer.
     */
    MachineRole : DSROLE_MACHINE_ROLE

    Flags : UInt32

    /**
     * Pointer to a null-terminated Unicode string that contains the NetBIOS domain name.
     */
    DomainNameFlat : PWSTR

    /**
     * Pointer to a null-terminated Unicode string that contains the DNS domain name. This member is optional and may be <b>NULL</b>.
     */
    DomainNameDns : PWSTR

    /**
     * Pointer to a null-terminated Unicode string that contains the forest name. This member is optional and may be <b>NULL</b>.
     */
    DomainForestName : PWSTR

    /**
     * Contains the domain identifier. This member is valid only if the <b>Flags</b> member contains the <b>DSROLE_PRIMARY_DOMAIN_GUID_PRESENT</b> flag.
     */
    DomainGuid : Guid

}
