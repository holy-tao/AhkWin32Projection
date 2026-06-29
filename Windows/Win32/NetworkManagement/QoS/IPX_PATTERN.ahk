#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * The IPX_PATTERN structure applies a specific pattern or corresponding mask for the IPX protocol. The IPX_PATTERN structure designation is used by the traffic control interface in the application of packet filters.
 * @see https://learn.microsoft.com/windows/win32/api/traffic/ns-traffic-ipx_pattern
 * @namespace Windows.Win32.NetworkManagement.QoS
 */
export default struct IPX_PATTERN {
    #StructPack 4


    struct _Src {
        NetworkAddress : UInt32

        NodeAddress : Int8[6]

        Socket : UInt16

    }

    Src : IPX_PATTERN._Src

    Dest : IPX_PATTERN._Src

}
