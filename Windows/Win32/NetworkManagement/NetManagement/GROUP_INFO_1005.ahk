#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * The GROUP_INFO_1005 structure contains the resource attributes associated with a global group.
 * @see https://learn.microsoft.com/windows/win32/api/lmaccess/ns-lmaccess-group_info_1005
 * @namespace Windows.Win32.NetworkManagement.NetManagement
 */
export default struct GROUP_INFO_1005 {
    #StructPack 4

    /**
     * These attributes are hard-coded to SE_GROUP_MANDATORY, SE_GROUP_ENABLED, and SE_GROUP_ENABLED_BY_DEFAULT. For more information, see 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-token_groups">TOKEN_GROUPS</a>.
     */
    grpi1005_attributes : UInt32

}
