#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Networking.WinSock
 */
export default struct ND_OPTION_RD_HDR {
    #StructPack 4

    nd_opt_rh_type : Int8

    nd_opt_rh_len : Int8

    nd_opt_rh_reserved1 : UInt16

    nd_opt_rh_reserved2 : UInt32

}
