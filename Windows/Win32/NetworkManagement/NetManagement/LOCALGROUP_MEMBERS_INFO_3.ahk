#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The LOCALGROUP_MEMBERS_INFO_3 structure contains the account name and domain name associated with a local group member.
 * @remarks
 * 
  * User account names are limited to 20 characters and group names are limited to 256 characters. In addition, account names cannot be terminated by a period and they cannot include commas or any of the following printable characters: ", /, \, [, ], :, |, &lt;, &gt;, +, =, ;, ?, *. Names also cannot include characters in the range 1-31, which are nonprintable.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//lmaccess/ns-lmaccess-localgroup_members_info_3
 * @namespace Windows.Win32.NetworkManagement.NetManagement
 * @version v4.0.30319
 */
class LOCALGROUP_MEMBERS_INFO_3 extends Win32Struct
{
    static sizeof => 8

    static packingSize => 8

    /**
     * Pointer to a null-terminated Unicode string specifying the account name of the local group member prefixed by the domain name and the "\" separator character. For example: 
     * 
     * 
     * 
     * 
     * <pre class="syntax" xml:space="preserve"><code>&lt;DomainName&gt;\&lt;AccountName&gt;
     * </code></pre>
     * @type {PWSTR}
     */
    lgrmi3_domainandname {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }
}
