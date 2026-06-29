#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\NS_INFOA.ahk" { NS_INFOA }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\PSTR.ahk" { PSTR }

/**
 * @namespace Windows.Win32.Networking.WinSock
 * @charset ANSI
 */
export default struct NETRESOURCE2A {
    #StructPack 8

    dwScope : UInt32

    dwType : UInt32

    dwUsage : UInt32

    dwDisplayType : UInt32

    lpLocalName : PSTR

    lpRemoteName : PSTR

    lpComment : PSTR

    ns_info : NS_INFOA

    ServiceType : Guid

    dwProtocols : UInt32

    lpiProtocols : IntPtr

}
