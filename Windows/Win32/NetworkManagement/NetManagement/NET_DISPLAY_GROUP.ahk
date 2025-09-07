#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\PWSTR.ahk

/**
 * The NET_DISPLAY_GROUP structure contains information that an account manager can access to determine information about group accounts.
 * @see https://learn.microsoft.com/windows/win32/api/lmaccess/ns-lmaccess-net_display_group
 * @namespace Windows.Win32.NetworkManagement.NetManagement
 * @version v4.0.30319
 */
class NET_DISPLAY_GROUP extends Win32Struct
{
    static sizeof => 32

    static packingSize => 8

    /**
     * Type: <b>LPWSTR</b>
     * 
     * A pointer to a Unicode string that specifies the name of the group.
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
     * Type: <b>LPWSTR</b>
     * 
     * A pointer to a Unicode string that contains a comment associated with the group. This string can be a null string, or it can have any number of characters before the terminating null character.
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
     * Type: <b>DWORD</b>
     * 
     * The relative identifier (RID) of the group. The relative identifier is determined by the accounts database when the group is created. It uniquely identifies the group to the account manager within the domain. The 
     * <a href="https://docs.microsoft.com/windows/desktop/api/lmaccess/nf-lmaccess-netuseradd">NetUserAdd</a> and 
     * <a href="https://docs.microsoft.com/windows/desktop/api/lmaccess/nf-lmaccess-netusersetinfo">NetUserSetInfo</a> functions ignore this member. For more information about RIDs, see 
     * <a href="https://docs.microsoft.com/windows/desktop/SecAuthZ/sid-components">SID Components</a>.
     * @type {Integer}
     */
    grpi3_group_id {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * Type: <b>DWORD</b>
     * 
     * These attributes are hard-coded to SE_GROUP_MANDATORY, SE_GROUP_ENABLED, and SE_GROUP_ENABLED_BY_DEFAULT. For more information, see 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-token_groups">TOKEN_GROUPS</a>.
     * @type {Integer}
     */
    grpi3_attributes {
        get => NumGet(this, 20, "uint")
        set => NumPut("uint", value, this, 20)
    }

    /**
     * Type: <b>DWORD</b>
     * 
     * The index of the last entry returned by the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/lmaccess/nf-lmaccess-netquerydisplayinformation">NetQueryDisplayInformation</a> function. Pass this value as the <i>Index</i> parameter to 
     * <b>NetQueryDisplayInformation</b> to return the next logical entry. Note that you should not use the value of this member for any purpose except to retrieve more data with additional calls to 
     * <b>NetQueryDisplayInformation</b>.
     * @type {Integer}
     */
    grpi3_next_index {
        get => NumGet(this, 24, "uint")
        set => NumPut("uint", value, this, 24)
    }
}
