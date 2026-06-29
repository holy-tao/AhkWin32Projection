#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * The IP_PATTERN structure applies a specific pattern or corresponding mask for the IP protocol. The IP_PATTERN structure designation is used by the traffic control interface in the application of packet filters.
 * @remarks
 * The following macros are defined in Traffic.h to make it easier to reference the members of the union: 
 * 
 * 
 * ``` syntax
 * @see https://learn.microsoft.com/windows/win32/api/traffic/ns-traffic-ip_pattern
 * @namespace Windows.Win32.NetworkManagement.QoS
 */
export default struct IP_PATTERN {
    #StructPack 4


    struct _S_un {

        struct _S_un_ports {
            s_srcport : UInt16

            s_dstport : UInt16

        }

        struct _S_un_icmp {
            s_type : Int8

            s_code : Int8

            filler : UInt16

        }

        S_un_ports : IP_PATTERN._S_un._S_un_ports

        static __New() {
            DefineProp(this.Prototype, 'S_un_icmp', { type: IP_PATTERN._S_un._S_un_icmp, offset: 0 })
            DefineProp(this.Prototype, 'S_Spi', { type: UInt32, offset: 0 })
            this.DeleteProp("__New")
        }
    }

    /**
     * Reserved for future use.
     */
    Reserved1 : UInt32

    /**
     * Reserved for future use.
     */
    Reserved2 : UInt32

    /**
     * Source address.
     */
    SrcAddr : UInt32

    /**
     * Destination address.
     */
    DstAddr : UInt32

    S_un : IP_PATTERN._S_un

    /**
     * Protocol identifier.
     */
    ProtocolId : Int8

    /**
     * Reserved for future use.
     */
    Reserved3 : Int8[3]

}
