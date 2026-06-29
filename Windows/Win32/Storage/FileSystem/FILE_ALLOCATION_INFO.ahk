#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Contains the total number of bytes that should be allocated for a file.
 * @remarks
 * The end-of-file (EOF) position for a file must always be less than or equal to the file allocation size. If the allocation size is set to a value that is less than EOF, the EOF position is automatically adjusted to match the file allocation size.
 * @see https://learn.microsoft.com/windows/win32/api/winbase/ns-winbase-file_allocation_info
 * @namespace Windows.Win32.Storage.FileSystem
 */
export default struct FILE_ALLOCATION_INFO {
    #StructPack 8

    /**
     * The new file allocation size, in bytes. This value is typically a multiple of the sector or cluster size for the underlying physical device.
     */
    AllocationSize : Int64

}
