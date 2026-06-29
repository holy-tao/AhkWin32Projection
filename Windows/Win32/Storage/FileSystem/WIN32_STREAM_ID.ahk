#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\WIN_STREAM_ID.ahk" { WIN_STREAM_ID }
#Import "..\..\Foundation\WCHAR.ahk" { WCHAR }

/**
 * Contains stream data.
 * @see https://learn.microsoft.com/windows/win32/api/winbase/ns-winbase-win32_stream_id
 * @namespace Windows.Win32.Storage.FileSystem
 */
export default struct WIN32_STREAM_ID {
    #StructPack 8

    dwStreamId : WIN_STREAM_ID

    /**
     * Attributes of data to facilitate cross-operating system transfer. This member can be one or more of the 
     *       following values.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="STREAM_MODIFIED_WHEN_READ"></a><a id="stream_modified_when_read"></a><dl>
     * <dt><b>STREAM_MODIFIED_WHEN_READ</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Attribute set if the stream contains data that is modified when read. Allows the backup application to 
     *         know that verification of data will fail.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="STREAM_CONTAINS_SECURITY"></a><a id="stream_contains_security"></a><dl>
     * <dt><b>STREAM_CONTAINS_SECURITY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Stream contains security data (general attributes). Allows the stream to be ignored on cross-operations 
     *         restore.
     * 
     * </td>
     * </tr>
     * </table>
     */
    dwStreamAttributes : UInt32

    /**
     * Size of data, in bytes.
     */
    Size : Int64

    /**
     * Length of the name of the alternative data stream, in bytes.
     */
    dwStreamNameSize : UInt32

    /**
     * Unicode string that specifies the name of the alternative data stream.
     */
    cStreamName : WCHAR[1]

}
