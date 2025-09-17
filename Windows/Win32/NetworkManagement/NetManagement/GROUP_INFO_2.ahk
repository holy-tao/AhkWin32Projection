#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The GROUP_INFO_2 structure contains information about a global group, including name, identifier, and resource attributes.
 * @remarks
 * User account names are limited to 20 characters and group names are limited to 256 characters. In addition, account names cannot be terminated by a period and they cannot include commas or any of the following printable characters: ", /, \, [, ], :, |, &lt;, &gt;, +, =, ;, ?, *. Names also cannot include characters in the range 1-31, which are nonprintable.
 * @see https://learn.microsoft.com/windows/win32/api/lmaccess/ns-lmaccess-group_info_2
 * @namespace Windows.Win32.NetworkManagement.NetManagement
 * @version v4.0.30319
 */
class GROUP_INFO_2 extends Win32Struct
{
    static sizeof => 24

    static packingSize => 8

    /**
     * Pointer to a null-terminated Unicode character string that specifies the name of the global group. For more information, see the following Remarks section. 
     * 
     * 
     * 
     * 
     * When you call the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/lmaccess/nf-lmaccess-netgroupsetinfo">NetGroupSetInfo</a> function this member is ignored.
     * @type {Pointer<Char>}
     */
    grpi2_name {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * Pointer to a null-terminated Unicode character string that contains a remark associated with the global group. This member can be a null string. The comment can contain MAXCOMMENTSZ characters.
     * @type {Pointer<Char>}
     */
    grpi2_comment {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * The relative identifier (RID) of the global group. The 
     * <a href="https://docs.microsoft.com/windows/desktop/api/lmaccess/nf-lmaccess-netuseradd">NetUserAdd</a> and 
     * <a href="https://docs.microsoft.com/windows/desktop/api/lmaccess/nf-lmaccess-netusersetinfo">NetUserSetInfo</a> functions ignore this member. For more information about RIDs, see 
     * <a href="https://docs.microsoft.com/windows/desktop/SecAuthZ/sid-components">SID Components</a>.
     * @type {Integer}
     */
    grpi2_group_id {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * These attributes are hard-coded to SE_GROUP_MANDATORY, SE_GROUP_ENABLED, and SE_GROUP_ENABLED_BY_DEFAULT. For more information, see 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-token_groups">TOKEN_GROUPS</a>.
     * @type {Integer}
     */
    grpi2_attributes {
        get => NumGet(this, 20, "uint")
        set => NumPut("uint", value, this, 20)
    }
}
