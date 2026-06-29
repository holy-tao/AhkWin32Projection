#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Contains alignment information for a file.
 * @see https://learn.microsoft.com/windows/win32/api/winbase/ns-winbase-file_alignment_info
 * @namespace Windows.Win32.Storage.FileSystem
 */
export default struct FILE_ALIGNMENT_INFO {
    #StructPack 4

    /**
     * Minimum alignment requirement, in bytes.
     */
    AlignmentRequirement : UInt32

}
