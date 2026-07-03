#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\PSTR.ahk" { PSTR }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import ".\NS_INFOA.ahk" { NS_INFOA }

/**
 * @namespace Windows.Win32.Networking.WinSock
 * @charset Unicode
 */
export default struct NETRESOURCE2W {
    #StructPack 8

    dwScope : UInt32

    dwType : UInt32

    dwUsage : UInt32

    dwDisplayType : UInt32

    lpLocalName : PWSTR

    lpRemoteName : PWSTR

    lpComment : PWSTR

    ns_info : NS_INFOA

    ServiceType : Guid

    dwProtocols : UInt32

    lpiProtocols : IntPtr

}
