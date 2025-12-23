#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Contains information about the stream found by the FindFirstStreamW or FindNextStreamW function.
 * @see https://learn.microsoft.com/windows/win32/api/fileapi/ns-fileapi-win32_find_stream_data
 * @namespace Windows.Win32.Storage.FileSystem
 * @version v4.0.30319
 */
class WIN32_FIND_STREAM_DATA extends Win32Struct
{
    static sizeof => 600

    static packingSize => 8

    /**
     * A <a href="https://docs.microsoft.com/windows/win32/api/winnt/ns-winnt-large_integer-r1">LARGE_INTEGER</a> value that specifies the 
     *       size of the stream, in bytes.
     * @type {Integer}
     */
    StreamSize {
        get => NumGet(this, 0, "int64")
        set => NumPut("int64", value, this, 0)
    }

    /**
     * The name of the stream. The string name format is 
     *       ":<i>streamname</i>:$<i>streamtype</i>".
     * @type {String}
     */
    cStreamName {
        get => StrGet(this.ptr + 8, 295, "UTF-16")
        set => StrPut(value, this.ptr + 8, 295, "UTF-16")
    }
}
