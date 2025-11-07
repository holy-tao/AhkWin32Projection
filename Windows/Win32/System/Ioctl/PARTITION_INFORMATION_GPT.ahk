#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Contains GUID partition table (GPT) partition information.
 * @remarks
 * 
 * The GPT partition format is required for disks that are used to boot computers that use 
 *     Extended Firmware Interface (EFI) firmware. GPT data disks can reside on x86, x64, and Itanium-based 
 *     architectures.
 * 
 * Starting with 
 *     Windows Server 2003 with SP1, GPT is supported on all Windows platforms, not only platforms that use 
 *     EFI.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//winioctl/ns-winioctl-partition_information_gpt
 * @namespace Windows.Win32.System.Ioctl
 * @version v4.0.30319
 */
class PARTITION_INFORMATION_GPT extends Win32Struct
{
    static sizeof => 96

    static packingSize => 8

    /**
     * A <b>GUID</b> that identifies the partition type.
     * 
     * Each partition type that the EFI specification supports is identified by its own 
     *        <b>GUID</b>, which is published by the developer of the partition.
     * @type {Pointer<Guid>}
     */
    PartitionType {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * The GUID of the partition.
     * @type {Pointer<Guid>}
     */
    PartitionId {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * The Extensible Firmware Interface (EFI) attributes of the partition.
     * @type {Integer}
     */
    Attributes {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * A wide-character string that describes the partition.
     * @type {String}
     */
    Name {
        get => StrGet(this.ptr + 24, 35, "UTF-16")
        set => StrPut(value, this.ptr + 24, 35, "UTF-16")
    }
}
