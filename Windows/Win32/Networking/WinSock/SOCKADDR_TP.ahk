#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Networking.WinSock
 */
export default struct SOCKADDR_TP {
    #StructPack 2

    tp_family : UInt16

    tp_addr_type : UInt16

    tp_taddr_len : UInt16

    tp_tsel_len : UInt16

    tp_addr : Int8[64]

}
