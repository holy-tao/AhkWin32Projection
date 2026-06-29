#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\WCHAR.ahk" { WCHAR }

/**
 * @namespace Windows.Win32.NetworkManagement.NetManagement
 */
export default struct MPR_PROTOCOL_0 {
    #StructPack 4

    dwProtocolId : UInt32

    wszProtocol : WCHAR[41]

    wszDLLName : WCHAR[49]

}
