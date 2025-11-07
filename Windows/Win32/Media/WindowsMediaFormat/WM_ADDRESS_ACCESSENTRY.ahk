#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The WM_ADDRESS_ACCESSENTRY structure specifies an entry in an IP address access list.
 * @remarks
 * 
 * You can use the <b>inet_addr</b> function to convert a standard dotted-format string (such as "255.255.255.255") to the correct binary number in network byte order.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//wmsdkidl/ns-wmsdkidl-wm_address_accessentry
 * @namespace Windows.Win32.Media.WindowsMediaFormat
 * @version v4.0.30319
 */
class WM_ADDRESS_ACCESSENTRY extends Win32Struct
{
    static sizeof => 8

    static packingSize => 4

    /**
     * An IPv4 address, in network byte order.
     * @type {Integer}
     */
    dwIPAddress {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * An IPv4 address, in network byte order, to use as a bitmask. The bitmask defines which bits in the <b>dwIPAddress</b> field are matched against. For example, if the IP address is 206.73.118.1 and the mask is 255.255.255.0, only the first 24 bits of the address are examined. Thus, any IP addresses in the range 206.73.118.<i>XXX</i> would match this entry.
     * @type {Integer}
     */
    dwMask {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }
}
