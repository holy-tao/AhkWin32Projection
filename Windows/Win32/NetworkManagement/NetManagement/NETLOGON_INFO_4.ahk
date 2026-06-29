#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }

/**
 * Defines a level-4 control query response from a domain controller.
 * @see https://learn.microsoft.com/windows/win32/api/lmaccess/ns-lmaccess-netlogon_info_4
 * @namespace Windows.Win32.NetworkManagement.NetManagement
 */
export default struct NETLOGON_INFO_4 {
    #StructPack 8

    /**
     * A marshaled pointer to a string that contains the trusted domain controller name.
     */
    netlog4_trusted_dc_name : PWSTR

    /**
     * A marshaled pointer to a string that contains the trusted domain name.
     */
    netlog4_trusted_domain_name : PWSTR

}
