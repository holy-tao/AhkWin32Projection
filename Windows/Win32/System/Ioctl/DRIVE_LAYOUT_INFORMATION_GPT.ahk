#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Contains information about a drive's GUID partition table (GPT) partitions.
 * @see https://learn.microsoft.com/windows/win32/api/winioctl/ns-winioctl-drive_layout_information_gpt
 * @namespace Windows.Win32.System.Ioctl
 */
class DRIVE_LAYOUT_INFORMATION_GPT extends Win32Struct {
    static sizeof => 40

    static packingSize => 8

    /**
     * The <b>GUID</b> of the disk.
     * @type {Guid}
     */
    DiskId {
        get {
            if(!this.HasProp("__DiskId"))
                this.__DiskId := Guid(0, this)
            return this.__DiskId
        }
    }

    /**
     * The starting byte offset of the first usable block.
     * @type {Integer}
     */
    StartingUsableOffset {
        get => NumGet(this, 16, "int64")
        set => NumPut("int64", value, this, 16)
    }

    /**
     * The size of the usable blocks on the disk, in bytes.
     * @type {Integer}
     */
    UsableLength {
        get => NumGet(this, 24, "int64")
        set => NumPut("int64", value, this, 24)
    }

    /**
     * The maximum number of partitions that can be defined in the usable block.
     * @type {Integer}
     */
    MaxPartitionCount {
        get => NumGet(this, 32, "uint")
        set => NumPut("uint", value, this, 32)
    }
}
