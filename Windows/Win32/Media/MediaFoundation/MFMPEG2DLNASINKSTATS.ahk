#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\BOOL.ahk" { BOOL }

/**
 * Contains encoding statistics from the Digital Living Network Alliance (DLNA) media sink.
 * @see https://learn.microsoft.com/windows/win32/api/mfmp2dlna/ns-mfmp2dlna-mfmpeg2dlnasinkstats
 * @namespace Windows.Win32.Media.MediaFoundation
 */
export default struct MFMPEG2DLNASINKSTATS {
    #StructPack 8

    /**
     * Total number of bytes written to the byte stream.
     */
    cBytesWritten : Int64

    /**
     * If <b>TRUE</b>, the video stream is a PAL format. Otherwise, the video stream is an NTSC format.
     */
    fPAL : BOOL

    /**
     * A FOURCC code that specifies the video format.
     */
    fccVideo : UInt32

    /**
     * The width of the video frame, in pixels.
     */
    dwVideoWidth : UInt32

    /**
     * The height of the video frame, in pixels.
     */
    dwVideoHeight : UInt32

    /**
     * The number of video frames received.
     */
    cVideoFramesReceived : Int64

    /**
     * The number of video frames that have been encoded.
     */
    cVideoFramesEncoded : Int64

    /**
     * The number of video frames that have been skipped.
     */
    cVideoFramesSkipped : Int64

    /**
     * The number of black frames that have been encoded.
     */
    cBlackVideoFramesEncoded : Int64

    /**
     * The number of duplicated video frames.
     */
    cVideoFramesDuplicated : Int64

    /**
     * The audio sample rate, in samples per second.
     */
    cAudioSamplesPerSec : UInt32

    /**
     * The number of audio channels.
     */
    cAudioChannels : UInt32

    /**
     * The total amount of audio data received, in bytes.
     */
    cAudioBytesReceived : Int64

    /**
     * The number of audio frames that have been encoded.
     */
    cAudioFramesEncoded : Int64

}
