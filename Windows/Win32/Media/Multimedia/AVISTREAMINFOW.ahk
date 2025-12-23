#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\RECT.ahk

/**
 * The AVISTREAMINFO structure contains information for a single stream. (Unicode)
 * @remarks
 * > [!NOTE]
 * > The vfw.h header defines AVISTREAMINFO as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
 * @see https://learn.microsoft.com/windows/win32/api/vfw/ns-vfw-avistreaminfow
 * @namespace Windows.Win32.Media.Multimedia
 * @version v4.0.30319
 * @charset Unicode
 */
class AVISTREAMINFOW extends Win32Struct
{
    static sizeof => 204

    static packingSize => 4

    /**
     * Four-character code indicating the stream type. The following constants have been defined for the data commonly found in AVI streams:
     * 
     * <table>
     * <tr>
     * <th>Constant</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="streamtypeAUDIO"></a><a id="streamtypeaudio"></a><a id="STREAMTYPEAUDIO"></a><dl>
     * <dt><b>streamtypeAUDIO</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Indicates an audio stream.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="streamtypeMIDI"></a><a id="streamtypemidi"></a><a id="STREAMTYPEMIDI"></a><dl>
     * <dt><b>streamtypeMIDI</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Indicates a MIDI stream.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="streamtypeTEXT"></a><a id="streamtypetext"></a><a id="STREAMTYPETEXT"></a><dl>
     * <dt><b>streamtypeTEXT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Indicates a text stream.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="streamtypeVIDEO"></a><a id="streamtypevideo"></a><a id="STREAMTYPEVIDEO"></a><dl>
     * <dt><b>streamtypeVIDEO</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Indicates a video stream.
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
     * Four-character code of the compressor handler that will compress this video stream when it is saved (for example, <a href="https://docs.microsoft.com/windows/desktop/api/vfw/nf-vfw-mmiofourcc">mmioFOURCC</a> ('M','S','V','C')). This member is not used for audio streams.
     * @type {Integer}
     */
    fccHandler {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * Applicable flags for the stream. The bits in the high-order word of these flags are specific to the type of data contained in the stream. The following flags are defined:
     * 
     * <table>
     * <tr>
     * <th>Name</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="AVISTREAMINFO_DISABLED"></a><a id="avistreaminfo_disabled"></a><dl>
     * <dt><b>AVISTREAMINFO_DISABLED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Indicates this stream should be rendered when explicitly enabled by the user.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="AVISTREAMINFO_FORMATCHANGES"></a><a id="avistreaminfo_formatchanges"></a><dl>
     * <dt><b>AVISTREAMINFO_FORMATCHANGES</b></dt>
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
     * Capability flags; currently unused.
     * @type {Integer}
     */
    dwCaps {
        get => NumGet(this, 12, "uint")
        set => NumPut("uint", value, this, 12)
    }

    /**
     * Priority of the stream.
     * @type {Integer}
     */
    wPriority {
        get => NumGet(this, 16, "ushort")
        set => NumPut("ushort", value, this, 16)
    }

    /**
     * Language of the stream.
     * @type {Integer}
     */
    wLanguage {
        get => NumGet(this, 18, "ushort")
        set => NumPut("ushort", value, this, 18)
    }

    /**
     * Time scale applicable for the stream. Dividing <b>dwRate</b> by <b>dwScale</b> gives the playback rate in number of samples per second.
     * 
     * For video streams, this rate should be the frame rate. For audio streams, this rate should correspond to the audio block size (the <b>nBlockAlign</b> member of the <a href="https://docs.microsoft.com/windows/win32/api/mmeapi/ns-mmeapi-waveformatex">WAVEFORMAT</a> or <a href="https://docs.microsoft.com/previous-versions/dd743663(v=vs.85)">PCMWAVEFORMAT</a> structure), which for PCM (Pulse Code Modulation) audio reduces to the sample rate.
     * @type {Integer}
     */
    dwScale {
        get => NumGet(this, 20, "uint")
        set => NumPut("uint", value, this, 20)
    }

    /**
     * Rate in an integer format. To obtain the rate in samples per second, divide this value by the value in <b>dwScale</b>.
     * @type {Integer}
     */
    dwRate {
        get => NumGet(this, 24, "uint")
        set => NumPut("uint", value, this, 24)
    }

    /**
     * Sample number of the first frame of the AVI file. The units are defined by dwRate and <b>dwScale</b>. Normally, this is zero, but it can specify a delay time for a stream that does not start concurrently with the file.
     * 
     * The 1.0 release of the AVI tools does not support a nonzero starting time.
     * @type {Integer}
     */
    dwStart {
        get => NumGet(this, 28, "uint")
        set => NumPut("uint", value, this, 28)
    }

    /**
     * Length of this stream. The units are defined by <b>dwRate</b> and <b>dwScale</b>.
     * @type {Integer}
     */
    dwLength {
        get => NumGet(this, 32, "uint")
        set => NumPut("uint", value, this, 32)
    }

    /**
     * Audio skew. This member specifies how much to skew the audio data ahead of the video frames in interleaved files. Typically, this is about 0.75 seconds.
     * @type {Integer}
     */
    dwInitialFrames {
        get => NumGet(this, 36, "uint")
        set => NumPut("uint", value, this, 36)
    }

    /**
     * Recommended buffer size, in bytes, for the stream. Typically, this member contains a value corresponding to the largest chunk in the stream. Using the correct buffer size makes playback more efficient. Use zero if you do not know the correct buffer size.
     * @type {Integer}
     */
    dwSuggestedBufferSize {
        get => NumGet(this, 40, "uint")
        set => NumPut("uint", value, this, 40)
    }

    /**
     * Quality indicator of the video data in the stream. Quality is represented as a number between 0 and 10,000. For compressed data, this typically represents the value of the quality parameter passed to the compression software. If set to –1, drivers use the default quality value.
     * @type {Integer}
     */
    dwQuality {
        get => NumGet(this, 44, "uint")
        set => NumPut("uint", value, this, 44)
    }

    /**
     * Size, in bytes, of a single data sample. If the value of this member is zero, the samples can vary in size and each data sample (such as a video frame) must be in a separate chunk. A nonzero value indicates that multiple samples of data can be grouped into a single chunk within the file.
     * 
     * For video streams, this number is typically zero, although it can be nonzero if all video frames are the same size. For audio streams, this number should be the same as the <b>nBlockAlign</b> member of the <a href="https://docs.microsoft.com/windows/win32/api/mmeapi/ns-mmeapi-waveformatex">WAVEFORMAT</a> or <a href="https://docs.microsoft.com/previous-versions/dd757713(v=vs.85)">WAVEFORMATEX</a> structure describing the audio.
     * @type {Integer}
     */
    dwSampleSize {
        get => NumGet(this, 48, "uint")
        set => NumPut("uint", value, this, 48)
    }

    /**
     * Dimensions of the video destination rectangle. The values represent the coordinates of upper left corner, the height, and the width of the rectangle.
     * @type {RECT}
     */
    rcFrame{
        get {
            if(!this.HasProp("__rcFrame"))
                this.__rcFrame := RECT(52, this)
            return this.__rcFrame
        }
    }

    /**
     * Number of times the stream has been edited. The stream handler maintains this count.
     * @type {Integer}
     */
    dwEditCount {
        get => NumGet(this, 68, "uint")
        set => NumPut("uint", value, this, 68)
    }

    /**
     * Number of times the stream format has changed. The stream handler maintains this count.
     * @type {Integer}
     */
    dwFormatChangeCount {
        get => NumGet(this, 72, "uint")
        set => NumPut("uint", value, this, 72)
    }

    /**
     * Null-terminated string containing a description of the stream.
     * @type {String}
     */
    szName {
        get => StrGet(this.ptr + 76, 63, "UTF-16")
        set => StrPut(value, this.ptr + 76, 63, "UTF-16")
    }
}
