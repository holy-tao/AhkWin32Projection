#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\CREATE_DISK_GPT.ahk

/**
 * Contains information that the IOCTL_DISK_CREATE_DISK control code uses to initialize GUID partition table (GPT), master boot record (MBR), or raw disks.
 * @see https://learn.microsoft.com/windows/win32/api/winioctl/ns-winioctl-create_disk
 * @namespace Windows.Win32.System.Ioctl
 * @version v4.0.30319
 */
class CREATE_DISK extends Win32Struct
{
    static sizeof => 24

    static packingSize => 8

    /**
     * The format of a partition. 
     * 
     * For more information, see 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winioctl/ne-winioctl-partition_style">PARTITION_STYLE</a>.
     * @type {Integer}
     */
    PartitionStyle {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    Mbr {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * @type {CREATE_DISK_GPT}
     */
    Gpt{
        get {
            if(!this.HasProp("__Gpt"))
                this.__Gpt := CREATE_DISK_GPT(this.ptr + 8)
            return this.__Gpt
        }
    }
}
