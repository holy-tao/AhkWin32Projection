#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Contains encoding statistics from the Digital Living Network Alliance (DLNA) media sink.
 * @see https://learn.microsoft.com/windows/win32/api/mfmp2dlna/ns-mfmp2dlna-mfmpeg2dlnasinkstats
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class MFMPEG2DLNASINKSTATS extends Win32Struct
{
    static sizeof => 88

    static packingSize => 8

    /**
     * Total number of bytes written to the byte stream.
     * @type {Integer}
     */
    cBytesWritten {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * If <b>TRUE</b>, the video stream is a PAL format. Otherwise, the video stream is an NTSC format.
     * @type {BOOL}
     */
    fPAL {
        get => NumGet(this, 8, "int")
        set => NumPut("int", value, this, 8)
    }

    /**
     * A FOURCC code that specifies the video format.
     * @type {Integer}
     */
    fccVideo {
        get => NumGet(this, 12, "uint")
        set => NumPut("uint", value, this, 12)
    }

    /**
     * The width of the video frame, in pixels.
     * @type {Integer}
     */
    dwVideoWidth {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * The height of the video frame, in pixels.
     * @type {Integer}
     */
    dwVideoHeight {
        get => NumGet(this, 20, "uint")
        set => NumPut("uint", value, this, 20)
    }

    /**
     * The number of video frames received.
     * @type {Integer}
     */
    cVideoFramesReceived {
        get => NumGet(this, 24, "uint")
        set => NumPut("uint", value, this, 24)
    }

    /**
     * The number of video frames that have been encoded.
     * @type {Integer}
     */
    cVideoFramesEncoded {
        get => NumGet(this, 32, "uint")
        set => NumPut("uint", value, this, 32)
    }

    /**
     * The number of video frames that have been skipped.
     * @type {Integer}
     */
    cVideoFramesSkipped {
        get => NumGet(this, 40, "uint")
        set => NumPut("uint", value, this, 40)
    }

    /**
     * The number of black frames that have been encoded.
     * @type {Integer}
     */
    cBlackVideoFramesEncoded {
        get => NumGet(this, 48, "uint")
        set => NumPut("uint", value, this, 48)
    }

    /**
     * The number of duplicated video frames.
     * @type {Integer}
     */
    cVideoFramesDuplicated {
        get => NumGet(this, 56, "uint")
        set => NumPut("uint", value, this, 56)
    }

    /**
     * The audio sample rate, in samples per second.
     * @type {Integer}
     */
    cAudioSamplesPerSec {
        get => NumGet(this, 64, "uint")
        set => NumPut("uint", value, this, 64)
    }

    /**
     * The number of audio channels.
     * @type {Integer}
     */
    cAudioChannels {
        get => NumGet(this, 68, "uint")
        set => NumPut("uint", value, this, 68)
    }

    /**
     * The total amount of audio data received, in bytes.
     * @type {Integer}
     */
    cAudioBytesReceived {
        get => NumGet(this, 72, "uint")
        set => NumPut("uint", value, this, 72)
    }

    /**
     * The number of audio frames that have been encoded.
     * @type {Integer}
     */
    cAudioFramesEncoded {
        get => NumGet(this, 80, "uint")
        set => NumPut("uint", value, this, 80)
    }
}
