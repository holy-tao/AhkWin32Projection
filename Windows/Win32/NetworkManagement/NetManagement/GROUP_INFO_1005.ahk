#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The GROUP_INFO_1005 structure contains the resource attributes associated with a global group.
 * @see https://docs.microsoft.com/windows/win32/api//lmaccess/ns-lmaccess-group_info_1005
 * @namespace Windows.Win32.NetworkManagement.NetManagement
 * @version v4.0.30319
 */
class GROUP_INFO_1005 extends Win32Struct
{
    static sizeof => 4

    static packingSize => 4

    /**
     * These attributes are hard-coded to SE_GROUP_MANDATORY, SE_GROUP_ENABLED, and SE_GROUP_ENABLED_BY_DEFAULT. For more information, see 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-token_groups">TOKEN_GROUPS</a>.
     * @type {Integer}
     */
    grpi1005_attributes {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }
}
