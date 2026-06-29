#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\Win32\NetworkManagement\Ndis\NET_IF_MEDIA_DUPLEX_STATE.ahk" { NET_IF_MEDIA_DUPLEX_STATE }
#Import ".\NDIS_SUPPORTED_PAUSE_FUNCTIONS.ahk" { NDIS_SUPPORTED_PAUSE_FUNCTIONS }

/**
 * @namespace Windows.Wdk.NetworkManagement.Ndis
 */
export default struct NDIS_LINK_PARAMETERS {
    #StructPack 8

    Header : IntPtr

    MediaDuplexState : NET_IF_MEDIA_DUPLEX_STATE

    XmitLinkSpeed : Int64

    RcvLinkSpeed : Int64

    PauseFunctions : NDIS_SUPPORTED_PAUSE_FUNCTIONS

    AutoNegotiationFlags : UInt32

}
