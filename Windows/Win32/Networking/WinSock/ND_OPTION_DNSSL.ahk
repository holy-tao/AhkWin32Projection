#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Networking.WinSock
 */
export default struct ND_OPTION_DNSSL {
    #StructPack 4

    nd_opt_dnssl_type : Int8

    nd_opt_dnssl_len : Int8

    nd_opt_dnssl_reserved : UInt16

    nd_opt_dnssl_lifetime : UInt32

}
