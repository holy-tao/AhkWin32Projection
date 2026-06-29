#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Contains information about a video compression format. This structure is used in the MFVIDEOFORMAT structure.
 * @remarks
 * For uncompressed video formats, set the structure members to zero.
 * @see https://learn.microsoft.com/windows/win32/api/mfobjects/ns-mfobjects-mfvideocompressedinfo
 * @namespace Windows.Win32.Media.MediaFoundation
 */
export default struct MFVideoCompressedInfo {
    #StructPack 8

    /**
     * Average bit rate of the encoded video stream, in bits per second.
     */
    AvgBitrate : Int64

    /**
     * Expected error rate, in bits per second.
     */
    AvgBitErrorRate : Int64

    /**
     * Number of frames between key frames.
     */
    MaxKeyFrameSpacing : UInt32

}
