#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\Ndis\NDIS_OBJECT_HEADER.ahk" { NDIS_OBJECT_HEADER }

/**
 * @namespace Windows.Win32.NetworkManagement.WiFi
 */
export default struct DOT11_EXTSTA_RECV_CONTEXT {
    #StructPack 8

    Header : NDIS_OBJECT_HEADER

    uReceiveFlags : UInt32

    uPhyId : UInt32

    uChCenterFrequency : UInt32

    usNumberOfMPDUsReceived : UInt16

    lRSSI : Int32

    ucDataRate : Int8

    uSizeMediaSpecificInfo : UInt32

    pvMediaSpecificInfo : IntPtr

    ullTimestamp : Int64

}
