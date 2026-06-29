#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Networking.WinSock
 */
export default struct IPV6_OPTION_HEADER {
    #StructPack 1

    Type : Int8

    DataLength : Int8

}
