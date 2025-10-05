#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The USER_INFO_1051 structure contains the relative ID (RID) associated with the user account. This information level is valid only when you call the NetUserSetInfo function.
 * @see https://learn.microsoft.com/windows/win32/api/lmaccess/ns-lmaccess-user_info_1051
 * @namespace Windows.Win32.NetworkManagement.NetManagement
 * @version v4.0.30319
 */
class USER_INFO_1051 extends Win32Struct
{
    static sizeof => 4

    static packingSize => 4

    /**
     * Specifies a <b>DWORD</b> value that contains the RID of the Primary Global Group for the user specified in the <i>username</i> parameter to the 
     * <b>NetUserSetInfo</b> function. This member must be the RID of a global group that represents the enrolled user. For more information about RIDs, see 
     * <a href="https://docs.microsoft.com/windows/desktop/SecAuthZ/sid-components">SID Components</a>.
     * @type {Integer}
     */
    usri1051_primary_group_id {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }
}
