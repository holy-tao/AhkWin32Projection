#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Networking.WinSock
 */
export default struct ICMP_HEADER {
    #StructPack 2

    Type : Int8

    Code : Int8

    Checksum : UInt16

}
