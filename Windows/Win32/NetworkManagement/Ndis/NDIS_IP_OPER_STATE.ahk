#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\NDIS_OBJECT_HEADER.ahk" { NDIS_OBJECT_HEADER }
#Import ".\NDIS_IP_OPER_STATUS.ahk" { NDIS_IP_OPER_STATUS }
#Import ".\NET_IF_OPER_STATUS.ahk" { NET_IF_OPER_STATUS }

/**
 * @namespace Windows.Win32.NetworkManagement.Ndis
 */
export default struct NDIS_IP_OPER_STATE {
    #StructPack 4

    Header : NDIS_OBJECT_HEADER

    Flags : UInt32

    IpOperationalStatus : NDIS_IP_OPER_STATUS

}
