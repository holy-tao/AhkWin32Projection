#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\IPPROTO.ahk" { IPPROTO }

/**
 * @namespace Windows.Win32.Networking.WinSock
 */
export default struct IN_RECVERR {
    #StructPack 4

    protocol : IPPROTO

    info : UInt32

    type : Int8

    code : Int8

}
