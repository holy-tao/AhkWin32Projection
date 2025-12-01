#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\RECT.ahk

/**
 * The AVISTREAMHEADER structure contains information about one stream in an AVI file.
 * @remarks
 * Some of the members of this structure are also present in the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/aviriff/ns-aviriff-avimainheader">AVIMAINHEADER</a> structure. The data in the <b>AVIMAINHEADER</b> structure applies to the whole file, while the data in the <b>AVISTREAMHEADER</b> structure applies to one stream.
 * 
 * The header file Vfw.h defines a <b>AVIStreamHeader</b> structure that is equivalent to this structure, but omits the <b>fcc</b> and <b>cb</b> members.
 * @see https://learn.microsoft.com/windows/win32/api/avifmt/ns-avifmt-avistreamheader
 * @namespace Windows.Win32.Media.DirectShow
 * @version v4.0.30319
 */
class AVIStreamHeader extends Win32Struct
{
    static sizeof => 64

    static packingSize => 8

    /**
     * Contains a FOURCC that specifies the type of the data contained in the stream. The following standard AVI values for video and audio are defined.
     * 
     * <table>
     * <tr>
     * <th>FOURCC</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="_auds_"></a><a id="_AUDS_"></a><dl>
     * <dt><b>'auds'</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Audio stream
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="_mids_"></a><a id="_MIDS_"></a><dl>
     * <dt><b>'mids'</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * MIDI stream
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="_txts_"></a><a id="_TXTS_"></a><dl>
     * <dt><b>'txts'</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Text stream
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="_vids_"></a><a id="_VIDS_"></a><dl>
     * <dt><b>'vids'</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Video stream
     * 
     * </td>
     * </tr>
     * </table>
     * @type {Integer}
     */
    fccType {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Optionally, contains a FOURCC that identifies a specific data handler. The data handler is the preferred handler for the stream. For audio and video streams, this specifies the codec for decoding the stream.
     * @type {Integer}
     */
    fccHandler {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * Contains any flags for the data stream. The bits in the high-order word of these flags are specific to the type of data contained in the stream. The following standard flags are defined.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="AVISF_DISABLED"></a><a id="avisf_disabled"></a><dl>
     * <dt><b>AVISF_DISABLED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Indicates this stream should not be enabled by default. 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="AVISF_VIDEO_PALCHANGES"></a><a id="avisf_video_palchanges"></a><dl>
     * <dt><b>AVISF_VIDEO_PALCHANGES</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Indicates this video stream contains palette changes. This flag warns the playback software that it will need to animate the palette. 
     * 
     * </td>
     * </tr>
     * </table>
     * @type {Integer}
     */
    dwFlags {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * Specifies priority of a stream type. For example, in a file with multiple audio streams, the one with the highest priority might be the default stream.
     * @type {Integer}
     */
    wPriority {
        get => NumGet(this, 12, "ushort")
        set => NumPut("ushort", value, this, 12)
    }

    /**
     * Language tag.
     * @type {Integer}
     */
    wLanguage {
        get => NumGet(this, 14, "ushort")
        set => NumPut("ushort", value, this, 14)
    }

    /**
     * Specifies how far audio data is skewed ahead of the video frames in interleaved files. Typically, this is about 0.75 seconds. If you are creating interleaved files, specify the number of frames in the file prior to the initial frame of the AVI sequence in this member. For more information, see the remarks for the <b>dwInitialFrames</b> member of the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/aviriff/ns-aviriff-avimainheader">AVIMAINHEADER</a> structure.
     * @type {Integer}
     */
    dwInitialFrames {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * Used with <b>dwRate</b> to specify the time scale that this stream will use. Dividing <b>dwRate</b> by <b>dwScale</b> gives the number of samples per second. For video streams, this is the frame rate. For audio streams, this rate corresponds to the time needed to play <b>nBlockAlign</b> bytes of audio, which for PCM audio is the just the sample rate.
     * @type {Integer}
     */
    dwScale {
        get => NumGet(this, 20, "uint")
        set => NumPut("uint", value, this, 20)
    }

    /**
     * See <b>dwScale</b>.
     * @type {Integer}
     */
    dwRate {
        get => NumGet(this, 24, "uint")
        set => NumPut("uint", value, this, 24)
    }

    /**
     * Specifies the starting time for this stream. The units are defined by the <b>dwRate</b> and <b>dwScale</b> members in the main file header. Usually, this is zero, but it can specify a delay time for a stream that does not start concurrently with the file.
     * @type {Integer}
     */
    dwStart {
        get => NumGet(this, 28, "uint")
        set => NumPut("uint", value, this, 28)
    }

    /**
     * Specifies the length of this stream. The units are defined by the <b>dwRate</b> and <b>dwScale</b> members of the stream's header.
     * @type {Integer}
     */
    dwLength {
        get => NumGet(this, 32, "uint")
        set => NumPut("uint", value, this, 32)
    }

    /**
     * Specifies how large a buffer should be used to read this stream. Typically, this contains a value corresponding to the largest chunk present in the stream. Using the correct buffer size makes playback more efficient. Use zero if you do not know the correct buffer size.
     * @type {Integer}
     */
    dwSuggestedBufferSize {
        get => NumGet(this, 36, "uint")
        set => NumPut("uint", value, this, 36)
    }

    /**
     * Specifies an indicator of the quality of the data in the stream. Quality is represented as a number between 0 and 10,000. For compressed data, this typically represents the value of the quality parameter passed to the compression software. If set to –1, drivers use the default quality value.
     * @type {Integer}
     */
    dwQuality {
        get => NumGet(this, 40, "uint")
        set => NumPut("uint", value, this, 40)
    }

    /**
     * Specifies the size of a single sample of data. This is set to zero if the samples can vary in size. If this number is nonzero, then multiple samples of data can be grouped into a single chunk within the file. If it is zero, each sample of data (such as a video frame) must be in a separate chunk. For video streams, this number is typically zero, although it can be nonzero if all video frames are the same size. For audio streams, this number should be the same as the <b>nBlockAlign</b> member of the <a href="https://docs.microsoft.com/previous-versions/dd757713(v=vs.85)">WAVEFORMATEX</a> structure describing the audio.
     * @type {Integer}
     */
    dwSampleSize {
        get => NumGet(this, 44, "uint")
        set => NumPut("uint", value, this, 44)
    }

    /**
     * Specifies the destination rectangle for a text or video stream within the movie rectangle specified by the <b>dwWidth</b> and <b>dwHeight</b> members of the AVI main header structure. The <b>rcFrame</b> member is typically used in support of multiple video streams. Set this rectangle to the coordinates corresponding to the movie rectangle to update the whole movie rectangle. Units for this member are pixels. The upper-left corner of the destination rectangle is relative to the upper-left corner of the movie rectangle.
     * @type {RECT}
     */
    rcFrame{
        get {
            if(!this.HasProp("__rcFrame"))
                this.__rcFrame := RECT(48, this)
            return this.__rcFrame
        }
    }
}
