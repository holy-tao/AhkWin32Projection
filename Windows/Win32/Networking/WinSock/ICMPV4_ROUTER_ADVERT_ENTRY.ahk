#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\IN_ADDR.ahk" { IN_ADDR }

/**
 * @namespace Windows.Win32.Networking.WinSock
 */
export default struct ICMPV4_ROUTER_ADVERT_ENTRY {
    #StructPack 4

    RouterAdvertAddr : IN_ADDR

    PreferenceLevel : Int32

}
