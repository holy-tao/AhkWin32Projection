#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\WCHAR.ahk" { WCHAR }

/**
 * @namespace Windows.Win32.Graphics.Printing
 */
export default struct PORT_DATA_2 {
    #StructPack 4

    sztPortName : WCHAR[64]

    dwVersion : UInt32

    dwProtocol : UInt32

    cbSize : UInt32 := this.Size

    dwReserved : UInt32

    sztHostAddress : WCHAR[128]

    sztSNMPCommunity : WCHAR[33]

    dwDoubleSpool : UInt32

    sztQueue : WCHAR[33]

    Reserved : Int8[514]

    dwPortNumber : UInt32

    dwSNMPEnabled : UInt32

    dwSNMPDevIndex : UInt32

    dwPortMonitorMibIndex : UInt32

}
