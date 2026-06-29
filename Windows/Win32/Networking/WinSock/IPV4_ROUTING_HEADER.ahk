#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\IPV4_OPTION_HEADER.ahk" { IPV4_OPTION_HEADER }

/**
 * @namespace Windows.Win32.Networking.WinSock
 */
export default struct IPV4_ROUTING_HEADER {
    #StructPack 1

    OptionHeader : IPV4_OPTION_HEADER

    Pointer : Int8

}
