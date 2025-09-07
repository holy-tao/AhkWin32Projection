#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\FILE_LEVEL_TRIM_RANGE.ahk

/**
 * Used as input to the FSCTL_FILE_LEVEL_TRIM control code.
 * @see https://learn.microsoft.com/windows/win32/api/winioctl/ns-winioctl-file_level_trim
 * @namespace Windows.Win32.System.Ioctl
 * @version v4.0.30319
 */
class FILE_LEVEL_TRIM extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * Reserved. Set to zero (0).
     * @type {Integer}
     */
    Key {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Number of <a href="https://docs.microsoft.com/windows/desktop/api/winioctl/ns-winioctl-file_level_trim_range">FILE_LEVEL_TRIM_RANGE</a> entries in 
     *       the <b>Ranges</b> member. On return should be compared with the 
     *       <b>NumRangesProcessed</b> member of the 
     *       <a href="https://docs.microsoft.com/windows/desktop/api/winioctl/ns-winioctl-file_level_trim_output">FILE_LEVEL_TRIM_OUTPUT</a> structure.
     * @type {Integer}
     */
    NumRanges {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * Array of ranges that describe the portions of the file that are to be trimmed.
     * @type {Array<FILE_LEVEL_TRIM_RANGE>}
     */
    Ranges{
        get {
            if(!this.HasProp("__RangesProxyArray"))
                this.__RangesProxyArray := Win32FixedArray(this.ptr + 8, 8, FILE_LEVEL_TRIM_RANGE, "")
            return this.__RangesProxyArray
        }
    }
}
