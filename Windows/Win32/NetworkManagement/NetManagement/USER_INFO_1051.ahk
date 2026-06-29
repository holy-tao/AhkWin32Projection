#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * The USER_INFO_1051 structure contains the relative ID (RID) associated with the user account. This information level is valid only when you call the NetUserSetInfo function.
 * @see https://learn.microsoft.com/windows/win32/api/lmaccess/ns-lmaccess-user_info_1051
 * @namespace Windows.Win32.NetworkManagement.NetManagement
 */
export default struct USER_INFO_1051 {
    #StructPack 4

    /**
     * Specifies a <b>DWORD</b> value that contains the RID of the Primary Global Group for the user specified in the <i>username</i> parameter to the 
     * <b>NetUserSetInfo</b> function. This member must be the RID of a global group that represents the enrolled user. For more information about RIDs, see 
     * <a href="https://docs.microsoft.com/windows/desktop/SecAuthZ/sid-components">SID Components</a>.
     */
    usri1051_primary_group_id : UInt32

}
