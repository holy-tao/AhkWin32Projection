#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\Win32\NetworkManagement\Ndis\NET_IF_OPER_STATUS.ahk" { NET_IF_OPER_STATUS }

/**
 * @namespace Windows.Wdk.NetworkManagement.Ndis
 */
export default struct NDIS_IP_OPER_STATUS {
    #StructPack 4

    AddressFamily : UInt32

    OperationalStatus : NET_IF_OPER_STATUS

    OperationalStatusFlags : UInt32

}
