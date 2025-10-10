#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The AVICOMPRESSOPTIONS structure contains information about a stream and how it is compressed and saved. This structure passes data to the AVIMakeCompressedStream function (or the AVISave function, which uses AVIMakeCompressedStream).
 * @see https://docs.microsoft.com/windows/win32/api//vfw/ns-vfw-avicompressoptions
 * @namespace Windows.Win32.Media.Multimedia
 * @version v4.0.30319
 */
class AVICOMPRESSOPTIONS extends Win32Struct
{
    static sizeof => 56

    static packingSize => 8

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
     * Four-character code for the compressor handler that will compress this video stream when it is saved (for example, <a href="https://docs.microsoft.com/windows/desktop/api/vfw/nf-vfw-mmiofourcc">mmioFOURCC</a> ('M','S','V','C')). This member is not used for audio streams.
     * @type {Integer}
     */
    fccHandler {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * Maximum period between video key frames. This member is used only if the AVICOMPRESSF_KEYFRAMES flag is set; otherwise every video frame is a key frame.
     * @type {Integer}
     */
    dwKeyFrameEvery {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * Quality value passed to a video compressor. This member is not used for an audio compressor.
     * @type {Integer}
     */
    dwQuality {
        get => NumGet(this, 12, "uint")
        set => NumPut("uint", value, this, 12)
    }

    /**
     * Video compressor data rate. This member is used only if the AVICOMPRESSF_DATARATE flag is set.
     * @type {Integer}
     */
    dwBytesPerSecond {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * Flags used for compression. The following values are defined:
     * 
     * <table>
     * <tr>
     * <th>Name</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="AVICOMPRESSF_DATARATE"></a><a id="avicompressf_datarate"></a><dl>
     * <dt><b>AVICOMPRESSF_DATARATE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Compresses this video stream using the data rate specified in <b>dwBytesPerSecond</b>.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="AVICOMPRESSF_INTERLEAVE"></a><a id="avicompressf_interleave"></a><dl>
     * <dt><b>AVICOMPRESSF_INTERLEAVE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Interleaves this stream every <b>dwInterleaveEvery</b> frames with respect to the first stream.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="AVICOMPRESSF_KEYFRAMES"></a><a id="avicompressf_keyframes"></a><dl>
     * <dt><b>AVICOMPRESSF_KEYFRAMES</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Saves this video stream with key frames at least every <b>dwKeyFrameEvery</b> frames. By default, every frame will be a key frame.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="AVICOMPRESSF_VALID"></a><a id="avicompressf_valid"></a><dl>
     * <dt><b>AVICOMPRESSF_VALID</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Uses the data in this structure to set the default compression values for <a href="https://docs.microsoft.com/windows/desktop/api/vfw/nf-vfw-avisaveoptions">AVISaveOptions</a>. If an empty structure is passed and this flag is not set, some defaults will be chosen.
     * 
     * </td>
     * </tr>
     * </table>
     * @type {Integer}
     */
    dwFlags {
        get => NumGet(this, 20, "uint")
        set => NumPut("uint", value, this, 20)
    }

    /**
     * Pointer to a structure defining the data format. For an audio stream, this is an <b>LPWAVEFORMAT</b> structure.
     * @type {Pointer<Void>}
     */
    lpFormat {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }

    /**
     * Size, in bytes, of the data referenced by <b>lpFormat</b>.
     * @type {Integer}
     */
    cbFormat {
        get => NumGet(this, 32, "uint")
        set => NumPut("uint", value, this, 32)
    }

    /**
     * Video-compressor-specific data; used internally.
     * @type {Pointer<Void>}
     */
    lpParms {
        get => NumGet(this, 40, "ptr")
        set => NumPut("ptr", value, this, 40)
    }

    /**
     * Size, in bytes, of the data referenced by <b>lpParms</b>
     * @type {Integer}
     */
    cbParms {
        get => NumGet(this, 48, "uint")
        set => NumPut("uint", value, this, 48)
    }

    /**
     * Interleave factor for interspersing stream data with data from the first stream. Used only if the AVICOMPRESSF_INTERLEAVE flag is set.
     * @type {Integer}
     */
    dwInterleaveEvery {
        get => NumGet(this, 52, "uint")
        set => NumPut("uint", value, this, 52)
    }
}
