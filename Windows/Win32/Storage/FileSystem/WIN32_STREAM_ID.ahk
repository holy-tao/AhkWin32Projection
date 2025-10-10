#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Contains stream data.
 * @see https://docs.microsoft.com/windows/win32/api//winbase/ns-winbase-win32_stream_id
 * @namespace Windows.Win32.Storage.FileSystem
 * @version v4.0.30319
 */
class WIN32_STREAM_ID extends Win32Struct
{
    static sizeof => 24

    static packingSize => 8

    /**
     * 
     * @type {Integer}
     */
    dwStreamId {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

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
     * @type {Integer}
     */
    dwStreamAttributes {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * Size of data, in bytes.
     * @type {Integer}
     */
    Size {
        get => NumGet(this, 8, "int64")
        set => NumPut("int64", value, this, 8)
    }

    /**
     * Length of the name of the alternative data stream, in bytes.
     * @type {Integer}
     */
    dwStreamNameSize {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * Unicode string that specifies the name of the alternative data stream.
     * @type {String}
     */
    cStreamName {
        get => StrGet(this.ptr + 20, 0, "UTF-16")
        set => StrPut(value, this.ptr + 20, 0, "UTF-16")
    }
}
