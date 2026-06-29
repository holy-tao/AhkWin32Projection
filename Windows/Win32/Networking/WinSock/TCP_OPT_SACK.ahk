#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Networking.WinSock
 */
export default struct TCP_OPT_SACK {
    #StructPack 4


    struct tcp_opt_sack_block {
        Left : UInt32

        Right : UInt32

    }

    Kind : Int8

    Length : Int8

    Block : TCP_OPT_SACK.tcp_opt_sack_block[1]

}
