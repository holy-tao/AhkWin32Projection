#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The TC_GEN_FILTER structure creates a filter that matches a certain set of packet attributes or criteria, which can subsequently be used to associate packets that meet the attribute criteria with a particular flow.
 * @see https://learn.microsoft.com/windows/win32/api/traffic/ns-traffic-tc_gen_filter
 * @namespace Windows.Win32.NetworkManagement.QoS
 * @version v4.0.30319
 */
class TC_GEN_FILTER extends Win32Struct
{
    static sizeof => 24

    static packingSize => 8

    /**
     * Defines the filter type to be applied with the filter, as defined in Ntddndis.h. With the designation of a specific filter in <b>AddressType</b>, the generic filter structure 
     * <b>TC_GEN_FILTER</b> provides a specific filter type.
     * @type {Integer}
     */
    AddressType {
        get => NumGet(this, 0, "ushort")
        set => NumPut("ushort", value, this, 0)
    }

    /**
     * Size of the <b>Pattern</b> member, in bytes.
     * @type {Integer}
     */
    PatternSize {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * Indicates the specific format of the pattern to be applied to the filter, such as 
     * <a href="https://docs.microsoft.com/windows/desktop/api/traffic/ns-traffic-ip_pattern">IP_PATTERN</a>. The pattern specifies which bits of a given packet should be evaluated when determining whether a packet is included in the filter.
     * @type {Pointer<Void>}
     */
    Pattern {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * A bitmask applied to the bits designated in the <b>Pattern</b> member. The application of the <b>Mask</b> member to the <b>Pattern</b> member determines which bits in the <b>Pattern</b> member are significant (should be applied to the filter criteria). Note that the <b>Mask</b> member must be of the same type as the <b>Pattern</b> member.
     * @type {Pointer<Void>}
     */
    Mask {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }
}
