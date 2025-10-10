#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The AVIFILEINFO structure contains global information for an entire AVI file.
 * @remarks
 * 
  * > [!NOTE]
  * > The vfw.h header defines AVIFILEINFO as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
  * 
 * @see https://docs.microsoft.com/windows/win32/api//vfw/ns-vfw-avifileinfow
 * @namespace Windows.Win32.Media.Multimedia
 * @version v4.0.30319
 * @charset Unicode
 */
class AVIFILEINFOW extends Win32Struct
{
    static sizeof => 172

    static packingSize => 4

    /**
     * Approximate maximum data rate of the AVI file.
     * @type {Integer}
     */
    dwMaxBytesPerSec {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * A bitwise <b>OR</b> of zero or more flags. The following flags are defined:
     * 
     * <table>
     * <tr>
     * <th>Name</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="AVIFILEINFO_HASINDEX"></a><a id="avifileinfo_hasindex"></a><dl>
     * <dt><b>AVIFILEINFO_HASINDEX</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The AVI file has an index at the end of the file. For good performance, all AVI files should contain an index.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="AVIFILEINFO_MUSTUSEINDEX"></a><a id="avifileinfo_mustuseindex"></a><dl>
     * <dt><b>AVIFILEINFO_MUSTUSEINDEX</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The file index contains the playback order for the chunks in the file. Use the index rather than the physical ordering of the chunks when playing back the data. This could be used for creating a list of frames for editing.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="AVIFILEINFO_ISINTERLEAVED"></a><a id="avifileinfo_isinterleaved"></a><dl>
     * <dt><b>AVIFILEINFO_ISINTERLEAVED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The AVI file is interleaved.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="AVIFILEINFO_WASCAPTUREFILE"></a><a id="avifileinfo_wascapturefile"></a><dl>
     * <dt><b>AVIFILEINFO_WASCAPTUREFILE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The AVI file is a specially allocated file used for capturing real-time video. Applications should warn the user before writing over a file with this flag set because the user probably defragmented this file.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="AVIFILEINFO_COPYRIGHTED"></a><a id="avifileinfo_copyrighted"></a><dl>
     * <dt><b>AVIFILEINFO_COPYRIGHTED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The AVI file contains copyrighted data and software. When this flag is used, software should not permit the data to be duplicated.
     * 
     * </td>
     * </tr>
     * </table>
     * @type {Integer}
     */
    dwFlags {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * Capability flags. The following flags are defined:
     * 
     * <table>
     * <tr>
     * <th>Name</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="AVIFILECAPS_CANREAD"></a><a id="avifilecaps_canread"></a><dl>
     * <dt><b>AVIFILECAPS_CANREAD</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An application can open the AVI file with the read privilege.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="AVIFILECAPS_CANWRITE"></a><a id="avifilecaps_canwrite"></a><dl>
     * <dt><b>AVIFILECAPS_CANWRITE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An application can open the AVI file with the write privilege.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="AVIFILECAPS_ALLKEYFRAMES"></a><a id="avifilecaps_allkeyframes"></a><dl>
     * <dt><b>AVIFILECAPS_ALLKEYFRAMES</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Every frame in the AVI file is a key frame.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="AVIFILECAPS_NOCOMPRESSION"></a><a id="avifilecaps_nocompression"></a><dl>
     * <dt><b>AVIFILECAPS_NOCOMPRESSION</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The AVI file does not use a compression method.
     * 
     * </td>
     * </tr>
     * </table>
     * @type {Integer}
     */
    dwCaps {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * Number of streams in the file. For example, a file with audio and video has at least two streams.
     * @type {Integer}
     */
    dwStreams {
        get => NumGet(this, 12, "uint")
        set => NumPut("uint", value, this, 12)
    }

    /**
     * Suggested buffer size, in bytes, for reading the file. Generally, this size should be large enough to contain the largest chunk in the file. For an interleaved file, this size should be large enough to read an entire record, not just a chunk.
     * 
     * If the buffer size is too small or is set to zero, the playback software will have to reallocate memory during playback, reducing performance.
     * @type {Integer}
     */
    dwSuggestedBufferSize {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * Width, in pixels, of the AVI file.
     * @type {Integer}
     */
    dwWidth {
        get => NumGet(this, 20, "uint")
        set => NumPut("uint", value, this, 20)
    }

    /**
     * Height, in pixels, of the AVI file.
     * @type {Integer}
     */
    dwHeight {
        get => NumGet(this, 24, "uint")
        set => NumPut("uint", value, this, 24)
    }

    /**
     * Time scale applicable for the entire file. Dividing <b>dwRate</b> by <b>dwScale</b> gives the number of samples per second.
     * 
     * Any stream can define its own time scale to supersede the file time scale.
     * @type {Integer}
     */
    dwScale {
        get => NumGet(this, 28, "uint")
        set => NumPut("uint", value, this, 28)
    }

    /**
     * Rate in an integer format. To obtain the rate in samples per second, divide this value by the value in <b>dwScale</b>.
     * @type {Integer}
     */
    dwRate {
        get => NumGet(this, 32, "uint")
        set => NumPut("uint", value, this, 32)
    }

    /**
     * Length of the AVI file. The units are defined by <b>dwRate</b> and <b>dwScale</b>.
     * @type {Integer}
     */
    dwLength {
        get => NumGet(this, 36, "uint")
        set => NumPut("uint", value, this, 36)
    }

    /**
     * Number of streams that have been added to or deleted from the AVI file.
     * @type {Integer}
     */
    dwEditCount {
        get => NumGet(this, 40, "uint")
        set => NumPut("uint", value, this, 40)
    }

    /**
     * Null-terminated string containing descriptive information for the file type.
     * @type {String}
     */
    szFileType {
        get => StrGet(this.ptr + 44, 63, "UTF-16")
        set => StrPut(value, this.ptr + 44, 63, "UTF-16")
    }
}
