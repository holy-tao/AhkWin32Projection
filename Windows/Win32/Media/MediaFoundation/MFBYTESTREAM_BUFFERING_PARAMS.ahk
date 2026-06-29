#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\MF_LEAKY_BUCKET_PAIR.ahk" { MF_LEAKY_BUCKET_PAIR }

/**
 * Specifies the buffering parameters for a network byte stream.
 * @see https://learn.microsoft.com/windows/win32/api/mfidl/ns-mfidl-mfbytestream_buffering_params
 * @namespace Windows.Win32.Media.MediaFoundation
 */
export default struct MFBYTESTREAM_BUFFERING_PARAMS {
    #StructPack 8

    /**
     * Size of the file, in bytes. If the total size is unknown, set this member to -1.
     */
    cbTotalFileSize : Int64

    /**
     * Size of the playable media data in the file, excluding any trailing data that is not useful for playback. If this value is unknown, set this member to -1.
     */
    cbPlayableDataSize : Int64

    /**
     * Pointer to an array of <a href="https://docs.microsoft.com/windows/desktop/api/mfidl/ns-mfidl-mf_leaky_bucket_pair">MF_LEAKY_BUCKET_PAIR</a> structures. Each member of the array gives the buffer window for a particular bit rate.
     */
    prgBuckets : MF_LEAKY_BUCKET_PAIR.Ptr

    /**
     * The number of elements in the <b>prgBuckets</b> array.
     */
    cBuckets : UInt32

    /**
     * Amount of data to buffer from the network, in 100-nanosecond units. This value is in addition to the buffer windows defined in the <b>prgBuckets</b> member.
     */
    qwNetBufferingTime : Int64

    /**
     * Amount of additional data to buffer when seeking, in 100-nanosecond units. This value reflects the fact that downloading must start from the previous key frame before the seek point. If the value is unknown, set this member to zero.
     */
    qwExtraBufferingTimeDuringSeek : Int64

    /**
     * The playback duration of the file, in 100-nanosecond units. If the duration is unknown, set this member to zero.
     */
    qwPlayDuration : Int64

    /**
     * Playback rate.
     */
    dRate : Float32

}
