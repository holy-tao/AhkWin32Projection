#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Networking.WinSock
 */
export default struct ND_OPTION_HDR {
    #StructPack 1

    nd_opt_type : Int8

    nd_opt_len : Int8

}
