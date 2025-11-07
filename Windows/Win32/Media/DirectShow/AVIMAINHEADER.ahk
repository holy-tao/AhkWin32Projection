#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The AVIMAINHEADER structure defines global information in an AVI file.
 * @remarks
 * 
 * The header file Vfw.h defines a <b>MainAVIHeader</b> structure that is equivalent to this structure, but omits the <b>fcc</b> and <b>cb</b> members.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//aviriff/ns-aviriff-avimainheader
 * @namespace Windows.Win32.Media.DirectShow
 * @version v4.0.30319
 */
class AVIMAINHEADER extends Win32Struct
{
    static sizeof => 64

    static packingSize => 4

    /**
     * Specifies a FOURCC code. The value must be 'avih'.
     * @type {Integer}
     */
    fcc {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Specifies the size of the structure, not including the initial 8 bytes.
     * @type {Integer}
     */
    cb {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * Specifies the number of microseconds between frames. This value indicates the overall timing for the file.
     * @type {Integer}
     */
    dwMicroSecPerFrame {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * Specifies the approximate maximum data rate of the file. This value indicates the number of bytes per second the system must handle to present an AVI sequence as specified by the other parameters contained in the main header and stream header chunks.
     * @type {Integer}
     */
    dwMaxBytesPerSec {
        get => NumGet(this, 12, "uint")
        set => NumPut("uint", value, this, 12)
    }

    /**
     * Specifies the alignment for data, in bytes. Pad the data to multiples of this value.
     * @type {Integer}
     */
    dwPaddingGranularity {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * Contains a bitwise combination of zero or more of the following flags:
     *           
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="AVIF_COPYRIGHTED"></a><a id="avif_copyrighted"></a><dl>
     * <dt><b>AVIF_COPYRIGHTED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Indicates the AVI file contains copyrighted data and software. When this flag is used, software should not permit the data to be duplicated.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="AVIF_HASINDEX"></a><a id="avif_hasindex"></a><dl>
     * <dt><b>AVIF_HASINDEX</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Indicates the AVI file has an index.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="AVIF_ISINTERLEAVED"></a><a id="avif_isinterleaved"></a><dl>
     * <dt><b>AVIF_ISINTERLEAVED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Indicates the AVI file is interleaved.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="AVIF_MUSTUSEINDEX"></a><a id="avif_mustuseindex"></a><dl>
     * <dt><b>AVIF_MUSTUSEINDEX</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Indicates that application should use the index, rather than the physical ordering of the chunks in the file, to determine the order of presentation of the data. For example, this flag could be used to create a list of frames for editing.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="AVIF_WASCAPTUREFILE"></a><a id="avif_wascapturefile"></a><dl>
     * <dt><b>AVIF_WASCAPTUREFILE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Indicates the AVI file is a specially allocated file used for capturing real-time video. Applications should warn the user before writing over a file with this flag set because the user probably defragmented this file.
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
     * Specifies the total number of frames of data in the file.
     * @type {Integer}
     */
    dwTotalFrames {
        get => NumGet(this, 24, "uint")
        set => NumPut("uint", value, this, 24)
    }

    /**
     * Specifies the initial frame for interleaved files. Noninterleaved files should specify zero. If you are creating interleaved files, specify the number of frames in the file prior to the initial frame of the AVI sequence in this member.
     * 
     * To give the audio driver enough audio to work with, the audio data in an interleaved file must be skewed from the video data. Typically, the audio data should be moved forward enough frames to allow approximately 0.75 seconds of audio data to be preloaded. The <b>dwInitialRecords</b> member should be set to the number of frames the audio is skewed. Also set the same value for the <b>dwInitialFrames</b> member of the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/avifmt/ns-avifmt-avistreamheader">AVISTREAMHEADER</a> structure in the audio stream header.
     * @type {Integer}
     */
    dwInitialFrames {
        get => NumGet(this, 28, "uint")
        set => NumPut("uint", value, this, 28)
    }

    /**
     * Specifies the number of streams in the file. For example, a file with audio and video has two streams.
     * @type {Integer}
     */
    dwStreams {
        get => NumGet(this, 32, "uint")
        set => NumPut("uint", value, this, 32)
    }

    /**
     * Specifies the suggested buffer size for reading the file. Generally, this size should be large enough to contain the largest chunk in the file. If set to zero, or if it is too small, the playback software will have to reallocate memory during playback, which will reduce performance. For an interleaved file, the buffer size should be large enough to read an entire record, and not just a chunk.
     * @type {Integer}
     */
    dwSuggestedBufferSize {
        get => NumGet(this, 36, "uint")
        set => NumPut("uint", value, this, 36)
    }

    /**
     * Specifies the width of the AVI file in pixels.
     * @type {Integer}
     */
    dwWidth {
        get => NumGet(this, 40, "uint")
        set => NumPut("uint", value, this, 40)
    }

    /**
     * Specifies the height of the AVI file in pixels.
     * @type {Integer}
     */
    dwHeight {
        get => NumGet(this, 44, "uint")
        set => NumPut("uint", value, this, 44)
    }

    /**
     * Reserved. Set this array to zero.
     * @type {Array<UInt32>}
     */
    dwReserved{
        get {
            if(!this.HasProp("__dwReservedProxyArray"))
                this.__dwReservedProxyArray := Win32FixedArray(this.ptr + 48, 4, Primitive, "uint")
            return this.__dwReservedProxyArray
        }
    }
}
