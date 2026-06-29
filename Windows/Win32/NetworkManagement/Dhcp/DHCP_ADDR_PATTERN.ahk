#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\BOOL.ahk" { BOOL }

/**
 * Contains the information regarding the link-layer address/pattern.
 * @see https://learn.microsoft.com/windows/win32/api/dhcpsapi/ns-dhcpsapi-dhcp_addr_pattern
 * @namespace Windows.Win32.NetworkManagement.Dhcp
 */
export default struct DHCP_ADDR_PATTERN {
    #StructPack 4

    /**
     * If <b>TRUE</b>, the hardware type member (<b>HWType</b>) will be matched; if <b>FALSE</b>, the hardware type member is ignored.
     */
    MatchHWType : BOOL

    /**
     * 8-bit integer value that specifies the hardware type of the address, specified in the pattern. Currently, only hardware type 1 (Ethernet 10 megabit) is supported as the filtering criterion.
     */
    HWType : Int8

    /**
     * If <b>TRUE</b>, <b>Pattern</b> contains a wildcard pattern; if <b>FALSE</b>, <b>Pattern</b> contains a hardware address.
     */
    IsWildcard : BOOL

    /**
     * 8-bit integer value that contains the length of the pattern, in bytes.
     */
    Length : Int8

    /**
     * Array of BYTE values that contain the pattern or hardware address.
     */
    Pattern : Int8[255]

}
