#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\HANDLE.ahk" { HANDLE }

/**
 * Contains parameters for the FSCTL_DUPLICATE_EXTENTS control code that performs the Block Cloning operation.
 * @see https://learn.microsoft.com/windows/win32/api/winioctl/ns-winioctl-duplicate_extents_data
 * @namespace Windows.Win32.System.Ioctl
 */
export default struct DUPLICATE_EXTENTS_DATA {
    #StructPack 8

    /**
     * A handle to the source file from which the byte range is to be copied.
     * To retrieve a file handle, use the <a href="https://docs.microsoft.com/windows/desktop/api/fileapi/nf-fileapi-createfilea">CreateFile</a> function.
     */
    FileHandle : HANDLE

    /**
     * The offset, in bytes, to the beginning of the range to copy from the source file.
     */
    SourceFileOffset : Int64

    /**
     * The offset, in bytes, to place the copied byte range in the destination file.
     */
    TargetFileOffset : Int64

    /**
     * The length, in bytes, of the range to copy.
     */
    ByteCount : Int64

}
