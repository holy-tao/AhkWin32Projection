#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\NET_IF_OPER_STATUS.ahk" { NET_IF_OPER_STATUS }
#Import ".\NDIS_OBJECT_HEADER.ahk" { NDIS_OBJECT_HEADER }

/**
 * @namespace Windows.Win32.NetworkManagement.Ndis
 */
export default struct NDIS_OPER_STATE {
    #StructPack 4

    Header : NDIS_OBJECT_HEADER

    OperationalStatus : NET_IF_OPER_STATUS

    OperationalStatusFlags : UInt32

}
