#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }

/**
 * The LOCALGROUP_MEMBERS_INFO_3 structure contains the account name and domain name associated with a local group member.
 * @remarks
 * User account names are limited to 20 characters and group names are limited to 256 characters. In addition, account names cannot be terminated by a period and they cannot include commas or any of the following printable characters: ", /, \, [, ], :, |, &lt;, &gt;, +, =, ;, ?, *. Names also cannot include characters in the range 1-31, which are nonprintable.
 * @see https://learn.microsoft.com/windows/win32/api/lmaccess/ns-lmaccess-localgroup_members_info_3
 * @namespace Windows.Win32.NetworkManagement.NetManagement
 */
export default struct LOCALGROUP_MEMBERS_INFO_3 {
    #StructPack 8

    /**
     * Pointer to a null-terminated Unicode string specifying the account name of the local group member prefixed by the domain name and the "\" separator character. For example: 
     * 
     * 
     * 
     * 
     * 
     * ``` syntax
     * &lt;DomainName&gt;\&lt;AccountName&gt;
     * 
     * ```
     */
    lgrmi3_domainandname : PWSTR

}
