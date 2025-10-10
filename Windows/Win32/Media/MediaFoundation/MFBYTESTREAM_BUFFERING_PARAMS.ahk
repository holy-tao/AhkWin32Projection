#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Specifies the buffering parameters for a network byte stream.
 * @see https://docs.microsoft.com/windows/win32/api//mfidl/ns-mfidl-mfbytestream_buffering_params
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class MFBYTESTREAM_BUFFERING_PARAMS extends Win32Struct
{
    static sizeof => 64

    static packingSize => 8

    /**
     * Size of the file, in bytes. If the total size is unknown, set this member to -1.
     * @type {Integer}
     */
    cbTotalFileSize {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Size of the playable media data in the file, excluding any trailing data that is not useful for playback. If this value is unknown, set this member to -1.
     * @type {Integer}
     */
    cbPlayableDataSize {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * Pointer to an array of <a href="https://docs.microsoft.com/windows/desktop/api/mfidl/ns-mfidl-mf_leaky_bucket_pair">MF_LEAKY_BUCKET_PAIR</a> structures. Each member of the array gives the buffer window for a particular bit rate.
     * @type {Pointer<MF_LEAKY_BUCKET_PAIR>}
     */
    prgBuckets {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }

    /**
     * The number of elements in the <b>prgBuckets</b> array.
     * @type {Integer}
     */
    cBuckets {
        get => NumGet(this, 24, "uint")
        set => NumPut("uint", value, this, 24)
    }

    /**
     * Amount of data to buffer from the network, in 100-nanosecond units. This value is in addition to the buffer windows defined in the <b>prgBuckets</b> member.
     * @type {Integer}
     */
    qwNetBufferingTime {
        get => NumGet(this, 32, "uint")
        set => NumPut("uint", value, this, 32)
    }

    /**
     * Amount of additional data to buffer when seeking, in 100-nanosecond units. This value reflects the fact that downloading must start from the previous key frame before the seek point. If the value is unknown, set this member to zero.
     * @type {Integer}
     */
    qwExtraBufferingTimeDuringSeek {
        get => NumGet(this, 40, "uint")
        set => NumPut("uint", value, this, 40)
    }

    /**
     * The playback duration of the file, in 100-nanosecond units. If the duration is unknown, set this member to zero.
     * @type {Integer}
     */
    qwPlayDuration {
        get => NumGet(this, 48, "uint")
        set => NumPut("uint", value, this, 48)
    }

    /**
     * Playback rate.
     * @type {Float}
     */
    dRate {
        get => NumGet(this, 56, "float")
        set => NumPut("float", value, this, 56)
    }
}
