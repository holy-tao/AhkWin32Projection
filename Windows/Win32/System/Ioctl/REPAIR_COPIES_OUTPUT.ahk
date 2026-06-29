#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Contains output of a repair copies operation returned from the FSCTL_REPAIR_COPIES control code.
 * @see https://learn.microsoft.com/windows/win32/api/winioctl/ns-winioctl-repair_copies_output
 * @namespace Windows.Win32.System.Ioctl
 */
export default struct REPAIR_COPIES_OUTPUT {
    #StructPack 8

    /**
     * Set to <c>sizeof(REPAIR_COPIES_OUTPUT)</c>.
     */
    Size : UInt32

    /**
     * Indicates the status of the repair operation. The value is a <b>NTSTATUS</b> value. 
     *       See 
     *       <a href="https://docs.microsoft.com/openspecs/windows_protocols/ms-erref/596a1078-e883-4972-9bbc-49e60bebca55">http://msdn.microsoft.com/en-us/library/cc704588(PROT.10).aspx</a> 
     *       for a list of <b>NTSTATUS</b> values.
     */
    Status : UInt32

    /**
     * If the <b>Status</b> member indicates the operation was not successful, this is the 
     *       file offset to use to resume repair operations, skipping the range where errors were found.
     */
    ResumeFileOffset : Int64

}
