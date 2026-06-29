#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Security\SID_AND_ATTRIBUTES.ahk" { SID_AND_ATTRIBUTES }

/**
 * The INET_FIREWALL_AC_CAPABILITIES structure contains information about the capabilities of an app container.
 * @see https://learn.microsoft.com/windows/win32/api/netfw/ns-netfw-inet_firewall_ac_capabilities
 * @namespace Windows.Win32.NetworkManagement.WindowsFirewall
 */
export default struct INET_FIREWALL_AC_CAPABILITIES {
    #StructPack 8

    /**
     * Type: <b>DWORD</b>
     * 
     * The number of security identifiers (SIDs) in the <b>capabilities</b> member.
     */
    count : UInt32

    /**
     * Type: <b>SID_AND_ATTRIBUTES*</b>
     * 
     * Security information related to the app container's capabilities.
     */
    capabilities : SID_AND_ATTRIBUTES.Ptr

}
