#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Contains output of a repair copies operation returned from the FSCTL_REPAIR_COPIES control code.
 * @see https://docs.microsoft.com/windows/win32/api//winioctl/ns-winioctl-repair_copies_output
 * @namespace Windows.Win32.System.Ioctl
 * @version v4.0.30319
 */
class REPAIR_COPIES_OUTPUT extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * Set to <c>sizeof(REPAIR_COPIES_OUTPUT)</c>.
     * @type {Integer}
     */
    Size {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Indicates the status of the repair operation. The value is a <b>NTSTATUS</b> value. 
     *       See 
     *       <a href="https://docs.microsoft.com/openspecs/windows_protocols/ms-erref/596a1078-e883-4972-9bbc-49e60bebca55">http://msdn.microsoft.com/en-us/library/cc704588(PROT.10).aspx</a> 
     *       for a list of <b>NTSTATUS</b> values.
     * @type {Integer}
     */
    Status {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * If the <b>Status</b> member indicates the operation was not successful, this is the 
     *       file offset to use to resume repair operations, skipping the range where errors were found.
     * @type {Integer}
     */
    ResumeFileOffset {
        get => NumGet(this, 8, "int64")
        set => NumPut("int64", value, this, 8)
    }
}
