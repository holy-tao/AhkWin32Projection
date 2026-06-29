#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\BOOL.ahk" { BOOL }

/**
 * Contains a requested parameter.
 * @see https://learn.microsoft.com/windows/win32/api/dhcpv6csdk/ns-dhcpv6csdk-dhcpv6capi_params
 * @namespace Windows.Win32.NetworkManagement.Dhcp
 */
export default struct DHCPV6CAPI_PARAMS {
    #StructPack 8

    /**
     * Reserved for future use.
     */
    Flags : UInt32

    /**
     * Identifier for the DHCPv6 parameter being requested.
     * 
     * <a id="DHCPV6_OPTION_CLIENTID"></a>
     * <a id="dhcpv6_option_clientid"></a>
     */
    OptionId : UInt32

    /**
     * This option is set to <b>TRUE</b> if this parameter is vendor-specific.  Otherwise, it is <b>FALSE</b>.
     */
    IsVendor : BOOL

    /**
     * Contains the actual parameter data.
     */
    Data : IntPtr

    /**
     * Size of the <b>Data</b> member, in bytes.
     */
    nBytesData : UInt32

}
