#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Represents the format of a partition.
 * @see https://learn.microsoft.com/windows/win32/api/winioctl/ne-winioctl-partition_style
 * @namespace Windows.Win32.System.Ioctl
 */
export default struct PARTITION_STYLE {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

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
