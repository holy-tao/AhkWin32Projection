#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Networking.WinSock
 */
export default struct SOCKADDR_VNS {
    #StructPack 2

    sin_family : UInt16

    net_address : Int8[4]

    subnet_addr : Int8[2]

    port : Int8[2]

    hops : Int8

    filler : Int8[5]

}
