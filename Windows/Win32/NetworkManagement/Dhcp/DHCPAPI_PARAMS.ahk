#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\BOOL.ahk" { BOOL }

/**
 * The DHCPAPI_PARAMS structure is used to request DHCP parameters.
 * @see https://learn.microsoft.com/windows/win32/api/dhcpcsdk/ns-dhcpcsdk-dhcpapi_params
 * @namespace Windows.Win32.NetworkManagement.Dhcp
 */
export default struct DHCPAPI_PARAMS {
    #StructPack 8

    /**
     * Reserved. Must be set to zero.
     */
    Flags : UInt32

    /**
     * Identifier for the DHCP parameter being requested.
     */
    OptionId : UInt32

    /**
     * Specifies whether the DHCP parameter is vendor-specific. Set to <b>TRUE</b> if the parameter is vendor-specific.
     */
    IsVendor : BOOL

    /**
     * Pointer to the parameter data.
     */
    Data : IntPtr

    nBytesData : UInt32

}
