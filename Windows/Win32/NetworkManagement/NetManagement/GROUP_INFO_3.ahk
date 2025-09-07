#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\PWSTR.ahk
#Include ..\..\Security\PSID.ahk

/**
 * The GROUP_INFO_3 structure contains information about a global group, including name, security identifier (SID), and resource attributes.
 * @see https://learn.microsoft.com/windows/win32/api/lmaccess/ns-lmaccess-group_info_3
 * @namespace Windows.Win32.NetworkManagement.NetManagement
 * @version v4.0.30319
 */
class GROUP_INFO_3 extends Win32Struct
{
    static sizeof => 32

    static packingSize => 8

    /**
     * Pointer to a null-terminated Unicode character string that specifies the name of the global group. 
     * 
     * 
     * 
     * 
     * When you call the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/lmaccess/nf-lmaccess-netgroupsetinfo">NetGroupSetInfo</a> function this member is ignored.
     * @type {PWSTR}
     */
    grpi3_name{
        get {
            if(!this.HasProp("__grpi3_name"))
                this.__grpi3_name := PWSTR(this.ptr + 0)
            return this.__grpi3_name
        }
    }

    /**
     * Pointer to a null-terminated Unicode character string that contains a remark associated with the global group. This member can be a null string. The comment can contain MAXCOMMENTSZ characters.
     * @type {PWSTR}
     */
    grpi3_comment{
        get {
            if(!this.HasProp("__grpi3_comment"))
                this.__grpi3_comment := PWSTR(this.ptr + 8)
            return this.__grpi3_comment
        }
    }

    /**
     * Pointer to a 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-sid">SID</a> structure that contains the 
     * <a href="https://docs.microsoft.com/windows/desktop/SecAuthZ/security-identifiers">security identifier (SID)</a> that uniquely identifies the global group. The 
     * <a href="https://docs.microsoft.com/windows/desktop/api/lmaccess/nf-lmaccess-netuseradd">NetUserAdd</a> and 
     * <a href="https://docs.microsoft.com/windows/desktop/api/lmaccess/nf-lmaccess-netusersetinfo">NetUserSetInfo</a> functions ignore this member.
     * @type {PSID}
     */
    grpi3_group_sid{
        get {
            if(!this.HasProp("__grpi3_group_sid"))
                this.__grpi3_group_sid := PSID(this.ptr + 16)
            return this.__grpi3_group_sid
        }
    }

    /**
     * These attributes are hard-coded to SE_GROUP_MANDATORY, SE_GROUP_ENABLED, and SE_GROUP_ENABLED_BY_DEFAULT. For more information, see 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-token_groups">TOKEN_GROUPS</a>.
     * @type {Integer}
     */
    grpi3_attributes {
        get => NumGet(this, 24, "uint")
        set => NumPut("uint", value, this, 24)
    }
}
