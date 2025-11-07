#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Contains information about a video compression format. This structure is used in the MFVIDEOFORMAT structure.
 * @remarks
 * 
 * For uncompressed video formats, set the structure members to zero.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//mfobjects/ns-mfobjects-mfvideocompressedinfo
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class MFVideoCompressedInfo extends Win32Struct
{
    static sizeof => 24

    static packingSize => 8

    /**
     * Average bit rate of the encoded video stream, in bits per second.
     * @type {Integer}
     */
    AvgBitrate {
        get => NumGet(this, 0, "int64")
        set => NumPut("int64", value, this, 0)
    }

    /**
     * Expected error rate, in bits per second.
     * @type {Integer}
     */
    AvgBitErrorRate {
        get => NumGet(this, 8, "int64")
        set => NumPut("int64", value, this, 8)
    }

    /**
     * Number of frames between key frames.
     * @type {Integer}
     */
    MaxKeyFrameSpacing {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }
}
