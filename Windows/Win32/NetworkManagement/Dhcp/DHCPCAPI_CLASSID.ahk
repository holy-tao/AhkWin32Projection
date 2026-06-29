#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * The DHCPCAPI_CLASSID structure defines a client Class ID.
 * @see https://learn.microsoft.com/windows/win32/api/dhcpcsdk/ns-dhcpcsdk-dhcpcapi_classid
 * @namespace Windows.Win32.NetworkManagement.Dhcp
 */
export default struct DHCPCAPI_CLASSID {
    #StructPack 8

    /**
     * Reserved. Must be set to zero.
     */
    Flags : UInt32

    /**
     * Class ID binary data.
     */
    Data : IntPtr

    nBytesData : UInt32

}
