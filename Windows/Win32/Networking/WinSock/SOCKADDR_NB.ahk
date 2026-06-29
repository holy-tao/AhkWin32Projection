#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\CHAR.ahk" { CHAR }

/**
 * @namespace Windows.Win32.Networking.WinSock
 */
export default struct SOCKADDR_NB {
    #StructPack 2

    snb_family : Int16

    snb_type : UInt16

    snb_name : CHAR[16]

}
