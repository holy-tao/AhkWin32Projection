#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Networking\WinSock\IN_ADDR.ahk" { IN_ADDR }
#Import ".\VPN_TS_IP_ADDRESS.ahk" { VPN_TS_IP_ADDRESS }
#Import ".\MPR_VPN_TS_TYPE.ahk" { MPR_VPN_TS_TYPE }
#Import "..\..\Networking\WinSock\IN6_ADDR.ahk" { IN6_ADDR }

/**
 * @namespace Windows.Win32.NetworkManagement.Rras
 */
export default struct MPR_VPN_TRAFFIC_SELECTOR {
    #StructPack 4

    type : MPR_VPN_TS_TYPE

    protocolId : Int8

    portStart : UInt16

    portEnd : UInt16

    tsPayloadId : UInt16

    addrStart : VPN_TS_IP_ADDRESS

    addrEnd : VPN_TS_IP_ADDRESS

}
