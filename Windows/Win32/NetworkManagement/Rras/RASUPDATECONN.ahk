#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Networking\WinSock\IN_ADDR.ahk" { IN_ADDR }
#Import ".\RASAPIVERSION.ahk" { RASAPIVERSION }
#Import "..\..\Networking\WinSock\IN6_ADDR.ahk" { IN6_ADDR }
#Import ".\RASTUNNELENDPOINT.ahk" { RASTUNNELENDPOINT }

/**
 * @namespace Windows.Win32.NetworkManagement.Rras
 */
export default struct RASUPDATECONN {
    #StructPack 4

    version : RASAPIVERSION

    dwSize : UInt32

    dwFlags : UInt32

    dwIfIndex : UInt32

    localEndPoint : RASTUNNELENDPOINT

    remoteEndPoint : RASTUNNELENDPOINT

}
