#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\ADDRESS_FAMILY.ahk" { ADDRESS_FAMILY }

/**
 * @namespace Windows.Win32.Networking.WinSock
 */
export default struct SOCKADDR_DL {
    #StructPack 2

    sdl_family : ADDRESS_FAMILY

    sdl_data : Int8[8]

    sdl_zero : Int8[4]

}
