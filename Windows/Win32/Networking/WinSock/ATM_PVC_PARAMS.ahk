#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\FLOWSPEC.ahk" { FLOWSPEC }
#Import ".\ATM_CONNECTION_ID.ahk" { ATM_CONNECTION_ID }
#Import ".\QOS.ahk" { QOS }
#Import "..\..\Foundation\PSTR.ahk" { PSTR }
#Import ".\WSABUF.ahk" { WSABUF }

/**
 * @namespace Windows.Win32.Networking.WinSock
 */
export default struct ATM_PVC_PARAMS {
    #StructPack 8

    PvcConnectionId : ATM_CONNECTION_ID

    PvcQos : QOS

}
