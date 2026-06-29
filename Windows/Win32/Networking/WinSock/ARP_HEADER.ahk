#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Networking.WinSock
 */
export default struct ARP_HEADER {
    #StructPack 2

    HardwareAddressSpace : UInt16

    ProtocolAddressSpace : UInt16

    HardwareAddressLength : Int8

    ProtocolAddressLength : Int8

    Opcode : UInt16

    SenderHardwareAddress : Int8[1]

}
