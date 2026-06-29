#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * The WM_ADDRESS_ACCESSENTRY structure specifies an entry in an IP address access list.
 * @remarks
 * You can use the <b>inet_addr</b> function to convert a standard dotted-format string (such as "255.255.255.255") to the correct binary number in network byte order.
 * @see https://learn.microsoft.com/windows/win32/api/wmsdkidl/ns-wmsdkidl-wm_address_accessentry
 * @namespace Windows.Win32.Media.WindowsMediaFormat
 */
export default struct WM_ADDRESS_ACCESSENTRY {
    #StructPack 4

    /**
     * An IPv4 address, in network byte order.
     */
    dwIPAddress : UInt32

    /**
     * An IPv4 address, in network byte order, to use as a bitmask. The bitmask defines which bits in the <b>dwIPAddress</b> field are matched against. For example, if the IP address is 206.73.118.1 and the mask is 255.255.255.0, only the first 24 bits of the address are examined. Thus, any IP addresses in the range 206.73.118.<i>XXX</i> would match this entry.
     */
    dwMask : UInt32

}
