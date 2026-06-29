#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Networking.WinSock
 */
export default struct ND_OPTION_RDNSS {
    #StructPack 4

    nd_opt_rdnss_type : Int8

    nd_opt_rdnss_len : Int8

    nd_opt_rdnss_reserved : UInt16

    nd_opt_rdnss_lifetime : UInt32

}
