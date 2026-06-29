#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Networking.WinSock
 */
export default struct TCP_OPT_TS {
    #StructPack 4

    Kind : Int8

    Length : Int8

    Val : UInt32

    EcR : UInt32

}
