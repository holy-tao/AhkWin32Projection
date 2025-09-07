#Requires AutoHotkey v2.0.0 64-bit

/**
 * Represents the format of a partition.
 * @see https://learn.microsoft.com/windows/win32/api/winioctl/ne-winioctl-partition_style
 * @namespace Windows.Win32.System.Ioctl
 * @version v4.0.30319
 */
class PARTITION_STYLE{

    /**
     * Master boot record (MBR) format. This corresponds to standard *AT-style* MBR partitions.
     * @type {Integer (Int32)}
     */
    static PARTITION_STYLE_MBR => 0

    /**
     * GUID Partition Table (GPT) format.
     * @type {Integer (Int32)}
     */
    static PARTITION_STYLE_GPT => 1

    /**
     * Partition not formatted in either of the recognized formats—MBR or GPT.
     * @type {Integer (Int32)}
     */
    static PARTITION_STYLE_RAW => 2
}
