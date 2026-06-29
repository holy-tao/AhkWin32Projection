#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\ADDRESS_FAMILY.ahk" { ADDRESS_FAMILY }
#Import "..\..\Foundation\CHAR.ahk" { CHAR }

/**
 * @namespace Windows.Win32.Networking.WinSock
 */
export default struct SOCKADDR_STORAGE {
    #StructPack 8

    ss_family : ADDRESS_FAMILY

    __ss_pad1 : CHAR[6]

    __ss_align : Int64

    __ss_pad2 : CHAR[112]

}
