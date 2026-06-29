#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Defines an IPv6 client class ID.
 * @see https://learn.microsoft.com/windows/win32/api/dhcpv6csdk/ns-dhcpv6csdk-dhcpv6capi_classid
 * @namespace Windows.Win32.NetworkManagement.Dhcp
 */
export default struct DHCPV6CAPI_CLASSID {
    #StructPack 8

    /**
     * Reserved for future use.  Must be set to 0.
     */
    Flags : UInt32

    /**
     * Class ID binary data.
     */
    Data : IntPtr

    nBytesData : UInt32

}
