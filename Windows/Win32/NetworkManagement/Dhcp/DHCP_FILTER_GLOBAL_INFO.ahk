#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\BOOL.ahk" { BOOL }

/**
 * Contains information about the enabling and disabling of the allow and deny filter lists.
 * @see https://learn.microsoft.com/windows/win32/api/dhcpsapi/ns-dhcpsapi-dhcp_filter_global_info
 * @namespace Windows.Win32.NetworkManagement.Dhcp
 */
export default struct DHCP_FILTER_GLOBAL_INFO {
    #StructPack 4

    /**
     * If <b>TRUE</b>, the allow list is enabled; if <b>FALSE</b>, it is disabled.
     */
    EnforceAllowList : BOOL

    /**
     * If <b>TRUE</b>, the deny list is enabled; if <b>FALSE</b>, it is disabled.
     */
    EnforceDenyList : BOOL

}
