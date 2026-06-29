#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\ADDRESS_FAMILY.ahk" { ADDRESS_FAMILY }
#Import "..\..\Foundation\CHAR.ahk" { CHAR }

/**
 * @namespace Windows.Win32.Networking.WinSock
 */
export default struct SOCKADDR_UN {
    #StructPack 2

    sun_family : ADDRESS_FAMILY

    sun_path : CHAR[108]

}
