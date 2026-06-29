#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Contains information about a pagefile.
 * @see https://learn.microsoft.com/windows/win32/api/psapi/ns-psapi-enum_page_file_information
 * @namespace Windows.Win32.System.ProcessStatus
 */
export default struct ENUM_PAGE_FILE_INFORMATION {
    #StructPack 8

    /**
     * The size of this structure, in bytes.
     */
    cb : UInt32

    /**
     * This member is reserved.
     */
    Reserved : UInt32

    /**
     * The total size of the pagefile, in pages.
     */
    TotalSize : IntPtr

    /**
     * The current pagefile usage, in pages.
     */
    TotalInUse : IntPtr

    /**
     * The peak pagefile usage, in pages.
     */
    PeakUsage : IntPtr

}
