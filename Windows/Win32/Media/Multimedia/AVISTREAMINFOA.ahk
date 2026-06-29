#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\RECT.ahk" { RECT }
#Import "..\..\Foundation\CHAR.ahk" { CHAR }

/**
 * The AVISTREAMINFO structure contains information for a single stream. (ANSI)
 * @remarks
 * > [!NOTE]
 * > The vfw.h header defines AVISTREAMINFO as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
 * @see https://learn.microsoft.com/windows/win32/api/vfw/ns-vfw-avistreaminfoa
 * @namespace Windows.Win32.Media.Multimedia
 * @charset ANSI
 */
export default struct AVISTREAMINFOA {
    #StructPack 4

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
     */
    fccType : UInt32

    /**
     * Four-character code of the compressor handler that will compress this video stream when it is saved (for example, <a href="https://docs.microsoft.com/windows/desktop/api/vfw/nf-vfw-mmiofourcc">mmioFOURCC</a> ('M','S','V','C')). This member is not used for audio streams.
     */
    fccHandler : UInt32

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
     */
    dwFlags : UInt32

    /**
     * Capability flags; currently unused.
     */
    dwCaps : UInt32

    /**
     * Priority of the stream.
     */
    wPriority : UInt16

    /**
     * Language of the stream.
     */
    wLanguage : UInt16

    /**
     * Time scale applicable for the stream. Dividing <b>dwRate</b> by <b>dwScale</b> gives the playback rate in number of samples per second.
     * 
     * For video streams, this rate should be the frame rate. For audio streams, this rate should correspond to the audio block size (the <b>nBlockAlign</b> member of the <a href="https://docs.microsoft.com/windows/win32/api/mmeapi/ns-mmeapi-waveformatex">WAVEFORMAT</a> or <a href="https://docs.microsoft.com/previous-versions/dd743663(v=vs.85)">PCMWAVEFORMAT</a> structure), which for PCM (Pulse Code Modulation) audio reduces to the sample rate.
     */
    dwScale : UInt32

    /**
     * Rate in an integer format. To obtain the rate in samples per second, divide this value by the value in <b>dwScale</b>.
     */
    dwRate : UInt32

    /**
     * Sample number of the first frame of the AVI file. The units are defined by dwRate and <b>dwScale</b>. Normally, this is zero, but it can specify a delay time for a stream that does not start concurrently with the file.
     * 
     * The 1.0 release of the AVI tools does not support a nonzero starting time.
     */
    dwStart : UInt32

    /**
     * Length of this stream. The units are defined by <b>dwRate</b> and <b>dwScale</b>.
     */
    dwLength : UInt32

    /**
     * Audio skew. This member specifies how much to skew the audio data ahead of the video frames in interleaved files. Typically, this is about 0.75 seconds.
     */
    dwInitialFrames : UInt32

    /**
     * Recommended buffer size, in bytes, for the stream. Typically, this member contains a value corresponding to the largest chunk in the stream. Using the correct buffer size makes playback more efficient. Use zero if you do not know the correct buffer size.
     */
    dwSuggestedBufferSize : UInt32

    /**
     * Quality indicator of the video data in the stream. Quality is represented as a number between 0 and 10,000. For compressed data, this typically represents the value of the quality parameter passed to the compression software. If set to –1, drivers use the default quality value.
     */
    dwQuality : UInt32

    /**
     * Size, in bytes, of a single data sample. If the value of this member is zero, the samples can vary in size and each data sample (such as a video frame) must be in a separate chunk. A nonzero value indicates that multiple samples of data can be grouped into a single chunk within the file.
     * 
     * For video streams, this number is typically zero, although it can be nonzero if all video frames are the same size. For audio streams, this number should be the same as the <b>nBlockAlign</b> member of the <a href="https://docs.microsoft.com/windows/win32/api/mmeapi/ns-mmeapi-waveformatex">WAVEFORMAT</a> or <a href="https://docs.microsoft.com/previous-versions/dd757713(v=vs.85)">WAVEFORMATEX</a> structure describing the audio.
     */
    dwSampleSize : UInt32

    /**
     * Dimensions of the video destination rectangle. The values represent the coordinates of upper left corner, the height, and the width of the rectangle.
     */
    rcFrame : RECT

    /**
     * Number of times the stream has been edited. The stream handler maintains this count.
     */
    dwEditCount : UInt32

    /**
     * Number of times the stream format has changed. The stream handler maintains this count.
     */
    dwFormatChangeCount : UInt32

    /**
     * Null-terminated string containing a description of the stream.
     */
    szName : CHAR[64]

}
