#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.NetworkManagement.Ndis
 */
export default struct NDIS_WAN_GET_STATS {
    #StructPack 4

    LocalAddress : Int8[6]

    BytesSent : UInt32

    BytesRcvd : UInt32

    FramesSent : UInt32

    FramesRcvd : UInt32

    CRCErrors : UInt32

    TimeoutErrors : UInt32

    AlignmentErrors : UInt32

    SerialOverrunErrors : UInt32

    FramingErrors : UInt32

    BufferOverrunErrors : UInt32

    BytesTransmittedUncompressed : UInt32

    BytesReceivedUncompressed : UInt32

    BytesTransmittedCompressed : UInt32

    BytesReceivedCompressed : UInt32

}
