#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Networking.WinSock
 */
export default struct IPV6_ROUTING_HEADER {
    #StructPack 1

    NextHeader : Int8

    Length : Int8

    RoutingType : Int8

    SegmentsLeft : Int8

    Reserved : Int8[4]

}
