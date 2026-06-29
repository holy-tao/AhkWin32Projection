#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\IPV6_OPTION_HEADER.ahk" { IPV6_OPTION_HEADER }

/**
 * @namespace Windows.Win32.Networking.WinSock
 */
export default struct IPV6_OPTION_ROUTER_ALERT {
    #StructPack 1

    Header : IPV6_OPTION_HEADER

    Value : Int8[2]

}
