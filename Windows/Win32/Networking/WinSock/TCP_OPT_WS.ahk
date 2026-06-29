#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Networking.WinSock
 */
export default struct TCP_OPT_WS {
    #StructPack 1

    Kind : Int8

    Length : Int8

    ShiftCnt : Int8

}
