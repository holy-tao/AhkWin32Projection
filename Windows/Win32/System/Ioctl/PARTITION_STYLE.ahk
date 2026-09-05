#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Represents the format of a partition.
 * @see https://learn.microsoft.com/windows/win32/api/winioctl/ne-winioctl-partition_style
 * @namespace Windows.Win32.System.Ioctl
 */
class PARTITION_STYLE extends Win32Enum {

    /**
     * Master boot record (MBR) format. This corresponds to standard *AT-style* MBR partitions.
     * Native name: PARTITION_STYLE_MBR
     * @type {Integer (Int32)}
     */
    static MBR => 0

    /**
     * GUID Partition Table (GPT) format.
     * Native name: PARTITION_STYLE_GPT
     * @type {Integer (Int32)}
     */
    static GPT => 1

    /**
     * Partition not formatted in either of the recognized formats—MBR or GPT.
     * Native name: PARTITION_STYLE_RAW
     * @type {Integer (Int32)}
     */
    static RAW => 2
}
