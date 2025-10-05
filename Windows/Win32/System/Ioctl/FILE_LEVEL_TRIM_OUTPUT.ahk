#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Used as output to the FSCTL_FILE_LEVEL_TRIM control code.
 * @see https://learn.microsoft.com/windows/win32/api/winioctl/ns-winioctl-file_level_trim_output
 * @namespace Windows.Win32.System.Ioctl
 * @version v4.0.30319
 */
class FILE_LEVEL_TRIM_OUTPUT extends Win32Struct
{
    static sizeof => 4

    static packingSize => 4

    /**
     * Contains the number of ranges that were successfully processed. This may be less than the value passed in 
     *       the <b>NumRanges</b> member of the 
     *       <a href="https://docs.microsoft.com/windows/desktop/api/winioctl/ni-winioctl-fsctl_file_level_trim">FILE_LEVEL_TRIM</a> structure. If it is then the last 
     *       ranges in the array were not processed.
     * @type {Integer}
     */
    NumRangesProcessed {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }
}
