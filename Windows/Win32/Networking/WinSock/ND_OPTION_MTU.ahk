#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Networking.WinSock
 */
export default struct ND_OPTION_MTU {
    #StructPack 4

    nd_opt_mtu_type : Int8

    nd_opt_mtu_len : Int8

    nd_opt_mtu_reserved : UInt16

    nd_opt_mtu_mtu : UInt32

}
