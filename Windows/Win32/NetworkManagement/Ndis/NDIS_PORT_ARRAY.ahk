#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\NDIS_PORT_TYPE.ahk" { NDIS_PORT_TYPE }
#Import ".\NDIS_PORT_AUTHORIZATION_STATE.ahk" { NDIS_PORT_AUTHORIZATION_STATE }
#Import ".\NDIS_OBJECT_HEADER.ahk" { NDIS_OBJECT_HEADER }
#Import ".\NDIS_PORT_CHARACTERISTICS.ahk" { NDIS_PORT_CHARACTERISTICS }
#Import ".\NDIS_PORT_CONTROL_STATE.ahk" { NDIS_PORT_CONTROL_STATE }
#Import ".\NET_IF_MEDIA_CONNECT_STATE.ahk" { NET_IF_MEDIA_CONNECT_STATE }
#Import ".\NET_IF_DIRECTION_TYPE.ahk" { NET_IF_DIRECTION_TYPE }

/**
 * @namespace Windows.Win32.NetworkManagement.Ndis
 */
export default struct NDIS_PORT_ARRAY {
    #StructPack 8

    Header : NDIS_OBJECT_HEADER

    NumberOfPorts : UInt32

    OffsetFirstPort : UInt32

    ElementSize : UInt32

    Ports : NDIS_PORT_CHARACTERISTICS[1]

}
