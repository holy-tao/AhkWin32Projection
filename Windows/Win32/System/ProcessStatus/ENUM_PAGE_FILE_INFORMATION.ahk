#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Contains information about a pagefile.
 * @see https://docs.microsoft.com/windows/win32/api//psapi/ns-psapi-enum_page_file_information
 * @namespace Windows.Win32.System.ProcessStatus
 * @version v4.0.30319
 */
class ENUM_PAGE_FILE_INFORMATION extends Win32Struct
{
    static sizeof => 32

    static packingSize => 8

    /**
     * The size of this structure, in bytes.
     * @type {Integer}
     */
    cb {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * This member is reserved.
     * @type {Integer}
     */
    Reserved {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * The total size of the pagefile, in pages.
     * @type {Pointer}
     */
    TotalSize {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * The current pagefile usage, in pages.
     * @type {Pointer}
     */
    TotalInUse {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }

    /**
     * The peak pagefile usage, in pages.
     * @type {Pointer}
     */
    PeakUsage {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }
}
