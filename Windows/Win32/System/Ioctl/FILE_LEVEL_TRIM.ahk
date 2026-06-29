#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\FILE_LEVEL_TRIM_RANGE.ahk" { FILE_LEVEL_TRIM_RANGE }

/**
 * Used as input to the FSCTL_FILE_LEVEL_TRIM control code.
 * @see https://learn.microsoft.com/windows/win32/api/winioctl/ns-winioctl-file_level_trim
 * @namespace Windows.Win32.System.Ioctl
 */
export default struct FILE_LEVEL_TRIM {
    #StructPack 8

    /**
     * Reserved. Set to zero (0).
     */
    Key : UInt32

    /**
     * Number of <a href="https://docs.microsoft.com/windows/desktop/api/winioctl/ns-winioctl-file_level_trim_range">FILE_LEVEL_TRIM_RANGE</a> entries in 
     *       the <b>Ranges</b> member. On return should be compared with the 
     *       <b>NumRangesProcessed</b> member of the 
     *       <a href="https://docs.microsoft.com/windows/desktop/api/winioctl/ns-winioctl-file_level_trim_output">FILE_LEVEL_TRIM_OUTPUT</a> structure.
     */
    NumRanges : UInt32

    /**
     * Array of ranges that describe the portions of the file that are to be trimmed.
     */
    Ranges : FILE_LEVEL_TRIM_RANGE[1]

}
