#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\WCHAR.ahk" { WCHAR }

/**
 * Receives file stream information for the specified file.
 * @remarks
 * The <b>FILE_STREAM_INFO</b> structure is used to enumerate the streams for a file.
 * 
 * 
 * 
 * Support for named data streams is file-system-specific. 
 * 
 * 
 * 
 * The <b>FILE_STREAM_INFO</b> structure must be aligned on a <b>LONGLONG</b> (8-byte) boundary. If a buffer contains two or more of these structures, the <b>NextEntryOffset</b> value in each entry, except the last, falls on an 8-byte boundary.
 * @see https://learn.microsoft.com/windows/win32/api/winbase/ns-winbase-file_stream_info
 * @namespace Windows.Win32.Storage.FileSystem
 */
export default struct FILE_STREAM_INFO {
    #StructPack 8

    /**
     * The offset for the next <b>FILE_STREAM_INFO</b> entry that is returned. This member is zero if no other entries follow this one.
     */
    NextEntryOffset : UInt32

    /**
     * The length, in bytes, of <b>StreamName</b>.
     */
    StreamNameLength : UInt32

    /**
     * The size, in bytes,  of the data stream.
     */
    StreamSize : Int64

    /**
     * The amount of space that  is allocated for the stream, in bytes.  This value is usually a multiple of the sector or cluster size of the underlying physical device.
     */
    StreamAllocationSize : Int64

    /**
     * The stream name.
     */
    StreamName : WCHAR[1]

}
