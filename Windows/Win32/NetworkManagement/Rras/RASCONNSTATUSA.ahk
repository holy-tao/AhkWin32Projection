#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Networking\WinSock\IN_ADDR.ahk" { IN_ADDR }
#Import ".\RASTUNNELENDPOINT.ahk" { RASTUNNELENDPOINT }
#Import ".\RASCONNSUBSTATE.ahk" { RASCONNSUBSTATE }
#Import ".\RASCONNSTATE.ahk" { RASCONNSTATE }
#Import "..\..\Networking\WinSock\IN6_ADDR.ahk" { IN6_ADDR }
#Import "..\..\Foundation\CHAR.ahk" { CHAR }

/**
 * @namespace Windows.Win32.NetworkManagement.Rras
 * @charset ANSI
 */
export default struct RASCONNSTATUSA {
    #StructPack 4

    dwSize : UInt32

    rasconnstate : RASCONNSTATE

    dwError : UInt32

    szDeviceType : CHAR[17]

    szDeviceName : CHAR[129]

    szPhoneNumber : CHAR[129]

    localEndPoint : RASTUNNELENDPOINT

    remoteEndPoint : RASTUNNELENDPOINT

    rasconnsubstate : RASCONNSUBSTATE

}
