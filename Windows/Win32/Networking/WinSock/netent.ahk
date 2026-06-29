#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PSTR.ahk" { PSTR }

/**
 * @namespace Windows.Win32.Networking.WinSock
 */
export default struct netent {
    #StructPack 8

    n_name : PSTR

    n_aliases : IntPtr

    n_addrtype : Int16

    n_net : UInt32

}
