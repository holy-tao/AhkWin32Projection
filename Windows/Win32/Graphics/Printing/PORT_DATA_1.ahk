#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\WCHAR.ahk" { WCHAR }

/**
 * @namespace Windows.Win32.Graphics.Printing
 */
export default struct PORT_DATA_1 {
    #StructPack 4

    sztPortName : WCHAR[64]

    dwVersion : UInt32

    dwProtocol : UInt32

    cbSize : UInt32 := this.Size

    dwReserved : UInt32

    sztHostAddress : WCHAR[49]

    sztSNMPCommunity : WCHAR[33]

    dwDoubleSpool : UInt32

    sztQueue : WCHAR[33]

    sztIPAddress : WCHAR[16]

    Reserved : Int8[540]

    dwPortNumber : UInt32

    dwSNMPEnabled : UInt32

    dwSNMPDevIndex : UInt32

}
