#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\NDIS_WAN_QUALITY.ahk" { NDIS_WAN_QUALITY }

/**
 * @namespace Windows.Wdk.NetworkManagement.Ndis
 */
export default struct NDIS_WAN_LINE_UP {
    #StructPack 8

    LinkSpeed : UInt32

    MaximumTotalSize : UInt32

    Quality : NDIS_WAN_QUALITY

    SendWindow : UInt16

    RemoteAddress : Int8[6]

    LocalAddress : Int8[6]

    ProtocolBufferLength : UInt32

    ProtocolBuffer : IntPtr

    ProtocolType : UInt16

    DeviceName : IntPtr

}
