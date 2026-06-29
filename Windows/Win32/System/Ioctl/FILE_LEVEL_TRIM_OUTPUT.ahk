#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Used as output to the FSCTL_FILE_LEVEL_TRIM control code.
 * @see https://learn.microsoft.com/windows/win32/api/winioctl/ns-winioctl-file_level_trim_output
 * @namespace Windows.Win32.System.Ioctl
 */
export default struct FILE_LEVEL_TRIM_OUTPUT {
    #StructPack 4

    /**
     * Contains the number of ranges that were successfully processed. This may be less than the value passed in 
     *       the <b>NumRanges</b> member of the 
     *       <a href="https://docs.microsoft.com/windows/desktop/api/winioctl/ni-winioctl-fsctl_file_level_trim">FILE_LEVEL_TRIM</a> structure. If it is then the last 
     *       ranges in the array were not processed.
     */
    NumRangesProcessed : UInt32

}
