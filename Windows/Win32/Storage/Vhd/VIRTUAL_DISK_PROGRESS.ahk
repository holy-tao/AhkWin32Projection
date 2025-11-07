#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Contains the progress and result data for the current virtual hard disk (VHD) operation, used by the GetVirtualDiskOperationProgress function.
 * @remarks
 * 
 * The <b>CurrentValue</b> and <b>CompletionValue</b> members are 
 *     intended to be used for calculating a percentage value, and the specific numeric values of each are not 
 *     significant in any way. Only the result of the following calculation is meaningful: 
 *     <b>CurrentValue</b> divided by <b>CompletionValue</b> multiplied by 100 
 *     equals percent complete, up to and including 100 percent, even when <b>OperationStatus</b> is 
 *     still returning <b>ERROR_IO_PENDING</b>. This percentage is not always guaranteed to increase 
 *     with subsequent calls to the 
 *     <a href="https://docs.microsoft.com/windows/win32/api/virtdisk/nf-virtdisk-getvirtualdiskoperationprogress">GetVirtualDiskOperationProgress</a> 
 *     function, and may decrease. These decreased percentages may be safely ignored if progress tracking is desired to 
 *     be only in the positive by locally storing the current maximum percentage.
 * 
 * The <b>CurrentValue</b> and <b>CompletionValue</b> members can vary in 
 *     subsequent calls to the 
 *     <a href="https://docs.microsoft.com/windows/win32/api/virtdisk/nf-virtdisk-getvirtualdiskoperationprogress">GetVirtualDiskOperationProgress</a> 
 *     function, so they must be used together at the same time from the same call. That is, it is not valid to save 
 *     either of them locally and then make another call to the 
 *     <b>GetVirtualDiskOperationProgress</b> 
 *     function expecting to use either of the previous values with the other value from the more recent call.
 * 
 * The <b>OperationStatus</b> member is the indicator of completion, not the percent-complete 
 *     calculation described previously. As long as this data member is returning with an 
 *     <b>ERROR_IO_PENDING</b> status code, the I/O operation is not yet complete.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//virtdisk/ns-virtdisk-virtual_disk_progress
 * @namespace Windows.Win32.Storage.Vhd
 * @version v4.0.30319
 */
class VIRTUAL_DISK_PROGRESS extends Win32Struct
{
    static sizeof => 24

    static packingSize => 8

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/Debug/system-error-codes">system error code</a> status value, this member will 
     *      be <b>ERROR_IO_PENDING</b> if the operation is still in progress; otherwise, the value is the 
     *      result code of the completed operation.
     * @type {Integer}
     */
    OperationStatus {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * The current progress of the operation, used in conjunction with the 
     *       <b>CompletionValue</b> member.
     * 
     * This value is meaningful only if 
     *      <b>OperationStatus</b> is <b>ERROR_IO_PENDING</b>.
     * @type {Integer}
     */
    CurrentValue {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * The value that the <b>CurrentValue</b> member would be if the operation were complete.
     * 
     * This value is meaningful only if <b>OperationStatus</b> is 
     *       <b>ERROR_IO_PENDING</b>.
     * @type {Integer}
     */
    CompletionValue {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }
}
