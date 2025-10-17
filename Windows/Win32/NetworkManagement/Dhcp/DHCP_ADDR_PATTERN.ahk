#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Contains the information regarding the link-layer address/pattern.
 * @see https://docs.microsoft.com/windows/win32/api//dhcpsapi/ns-dhcpsapi-dhcp_addr_pattern
 * @namespace Windows.Win32.NetworkManagement.Dhcp
 * @version v4.0.30319
 */
class DHCP_ADDR_PATTERN extends Win32Struct
{
    static sizeof => 268

    static packingSize => 4

    /**
     * If <b>TRUE</b>, the hardware type member (<b>HWType</b>) will be matched; if <b>FALSE</b>, the hardware type member is ignored.
     * @type {BOOL}
     */
    MatchHWType {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * 8-bit integer value that specifies the hardware type of the address, specified in the pattern. Currently, only hardware type 1 (Ethernet 10 megabit) is supported as the filtering criterion.
     * @type {Integer}
     */
    HWType {
        get => NumGet(this, 4, "char")
        set => NumPut("char", value, this, 4)
    }

    /**
     * If <b>TRUE</b>, <b>Pattern</b> contains a wildcard pattern; if <b>FALSE</b>, <b>Pattern</b> contains a hardware address.
     * @type {BOOL}
     */
    IsWildcard {
        get => NumGet(this, 8, "int")
        set => NumPut("int", value, this, 8)
    }

    /**
     * 8-bit integer value that contains the length of the pattern, in bytes.
     * @type {Integer}
     */
    Length {
        get => NumGet(this, 12, "char")
        set => NumPut("char", value, this, 12)
    }

    /**
     * Array of BYTE values that contain the pattern or hardware address.
     * @type {Array<Byte>}
     */
    Pattern{
        get {
            if(!this.HasProp("__PatternProxyArray"))
                this.__PatternProxyArray := Win32FixedArray(this.ptr + 13, 255, Primitive, "char")
            return this.__PatternProxyArray
        }
    }
}
