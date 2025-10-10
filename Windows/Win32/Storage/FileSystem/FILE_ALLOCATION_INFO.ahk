#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Contains the total number of bytes that should be allocated for a file.
 * @remarks
 * 
  * The end-of-file (EOF) position for a file must always be less than or equal to the file allocation size. If the allocation size is set to a value that is less than EOF, the EOF position is automatically adjusted to match the file allocation size.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//winbase/ns-winbase-file_allocation_info
 * @namespace Windows.Win32.Storage.FileSystem
 * @version v4.0.30319
 */
class FILE_ALLOCATION_INFO extends Win32Struct
{
    static sizeof => 8

    static packingSize => 8

    /**
     * The new file allocation size, in bytes. This value is typically a multiple of the sector or cluster size for the underlying physical device.
     * @type {Integer}
     */
    AllocationSize {
        get => NumGet(this, 0, "int64")
        set => NumPut("int64", value, this, 0)
    }
}
