#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\Win32\NetworkManagement\Ndis\NET_IF_OPER_STATUS.ahk" { NET_IF_OPER_STATUS }

/**
 * @namespace Windows.Wdk.NetworkManagement.Ndis
 */
export default struct NDIS_OPER_STATE {
    #StructPack 8

    Header : IntPtr

    OperationalStatus : NET_IF_OPER_STATUS

    OperationalStatusFlags : UInt32

}
