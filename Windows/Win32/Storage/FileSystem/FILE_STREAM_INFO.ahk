#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

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
 * @version v4.0.30319
 */
class FILE_STREAM_INFO extends Win32Struct
{
    static sizeof => 32

    static packingSize => 8

    /**
     * The offset for the next <b>FILE_STREAM_INFO</b> entry that is returned. This member is zero if no other entries follow this one.
     * @type {Integer}
     */
    NextEntryOffset {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * The length, in bytes, of <b>StreamName</b>.
     * @type {Integer}
     */
    StreamNameLength {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * The size, in bytes,  of the data stream.
     * @type {Integer}
     */
    StreamSize {
        get => NumGet(this, 8, "int64")
        set => NumPut("int64", value, this, 8)
    }

    /**
     * The amount of space that  is allocated for the stream, in bytes.  This value is usually a multiple of the sector or cluster size of the underlying physical device.
     * @type {Integer}
     */
    StreamAllocationSize {
        get => NumGet(this, 16, "int64")
        set => NumPut("int64", value, this, 16)
    }

    /**
     * The stream name.
     * @type {String}
     */
    StreamName {
        get => StrGet(this.ptr + 24, 0, "UTF-16")
        set => StrPut(value, this.ptr + 24, 0, "UTF-16")
    }
}
