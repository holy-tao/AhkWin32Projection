#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\CHAR.ahk" { CHAR }

/**
 * The AVIFILEINFO structure contains global information for an entire AVI file. (ANSI)
 * @remarks
 * > [!NOTE]
 * > The vfw.h header defines AVIFILEINFO as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
 * @see https://learn.microsoft.com/windows/win32/api/vfw/ns-vfw-avifileinfoa
 * @namespace Windows.Win32.Media.Multimedia
 * @charset ANSI
 */
export default struct AVIFILEINFOA {
    #StructPack 4

    /**
     * Approximate maximum data rate of the AVI file.
     */
    dwMaxBytesPerSec : UInt32

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
     */
    dwFlags : UInt32

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
     */
    dwCaps : UInt32

    /**
     * Number of streams in the file. For example, a file with audio and video has at least two streams.
     */
    dwStreams : UInt32

    /**
     * Suggested buffer size, in bytes, for reading the file. Generally, this size should be large enough to contain the largest chunk in the file. For an interleaved file, this size should be large enough to read an entire record, not just a chunk.
     * 
     * If the buffer size is too small or is set to zero, the playback software will have to reallocate memory during playback, reducing performance.
     */
    dwSuggestedBufferSize : UInt32

    /**
     * Width, in pixels, of the AVI file.
     */
    dwWidth : UInt32

    /**
     * Height, in pixels, of the AVI file.
     */
    dwHeight : UInt32

    /**
     * Time scale applicable for the entire file. Dividing <b>dwRate</b> by <b>dwScale</b> gives the number of samples per second.
     * 
     * Any stream can define its own time scale to supersede the file time scale.
     */
    dwScale : UInt32

    /**
     * Rate in an integer format. To obtain the rate in samples per second, divide this value by the value in <b>dwScale</b>.
     */
    dwRate : UInt32

    /**
     * Length of the AVI file. The units are defined by <b>dwRate</b> and <b>dwScale</b>.
     */
    dwLength : UInt32

    /**
     * Number of streams that have been added to or deleted from the AVI file.
     */
    dwEditCount : UInt32

    /**
     * Null-terminated string containing descriptive information for the file type.
     */
    szFileType : CHAR[64]

}
