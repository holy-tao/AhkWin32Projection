#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\WCHAR.ahk" { WCHAR }

/**
 * Contains information about the stream found by the FindFirstStreamW or FindNextStreamW function.
 * @see https://learn.microsoft.com/windows/win32/api/fileapi/ns-fileapi-win32_find_stream_data
 * @namespace Windows.Win32.Storage.FileSystem
 */
export default struct WIN32_FIND_STREAM_DATA {
    #StructPack 8

    /**
     * A <a href="https://docs.microsoft.com/windows/win32/api/winnt/ns-winnt-large_integer-r1">LARGE_INTEGER</a> value that specifies the 
     *       size of the stream, in bytes.
     */
    StreamSize : Int64

    /**
     * The name of the stream. The string name format is 
     *       ":<i>streamname</i>:$<i>streamtype</i>".
     */
    cStreamName : WCHAR[296]

}
