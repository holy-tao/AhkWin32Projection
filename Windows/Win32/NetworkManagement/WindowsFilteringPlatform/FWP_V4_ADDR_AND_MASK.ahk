#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Specifies IPv4 address and mask in host order.
 * @see https://docs.microsoft.com/windows/win32/api//fwptypes/ns-fwptypes-fwp_v4_addr_and_mask
 * @namespace Windows.Win32.NetworkManagement.WindowsFilteringPlatform
 * @version v4.0.30319
 */
class FWP_V4_ADDR_AND_MASK extends Win32Struct
{
    static sizeof => 8

    static packingSize => 4

    /**
     * Specifies an IPv4 address.
     * @type {Integer}
     */
    addr {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Specifies an IPv4 mask.
     * @type {Integer}
     */
    mask {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }
}
