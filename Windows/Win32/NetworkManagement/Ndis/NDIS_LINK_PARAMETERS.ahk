#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\NDIS_OBJECT_HEADER.ahk" { NDIS_OBJECT_HEADER }
#Import ".\NDIS_SUPPORTED_PAUSE_FUNCTIONS.ahk" { NDIS_SUPPORTED_PAUSE_FUNCTIONS }
#Import ".\NET_IF_MEDIA_DUPLEX_STATE.ahk" { NET_IF_MEDIA_DUPLEX_STATE }

/**
 * @namespace Windows.Win32.NetworkManagement.Ndis
 */
export default struct NDIS_LINK_PARAMETERS {
    #StructPack 8

    Header : NDIS_OBJECT_HEADER

    MediaDuplexState : NET_IF_MEDIA_DUPLEX_STATE

    XmitLinkSpeed : Int64

    RcvLinkSpeed : Int64

    PauseFunctions : NDIS_SUPPORTED_PAUSE_FUNCTIONS

    AutoNegotiationFlags : UInt32

}
