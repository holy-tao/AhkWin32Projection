#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\GPT_ATTRIBUTES.ahk

/**
 * Contains GUID partition table (GPT) partition information.
 * @remarks
 * The GPT partition format is required for disks that are used to boot computers that use 
 *     Extended Firmware Interface (EFI) firmware. GPT data disks can reside on x86, x64, and Itanium-based 
 *     architectures.
 * 
 * Starting with 
 *     Windows Server 2003 with SP1, GPT is supported on all Windows platforms, not only platforms that use 
 *     EFI.
 * @see https://learn.microsoft.com/windows/win32/api/winioctl/ns-winioctl-partition_information_gpt
 * @namespace Windows.Win32.System.Ioctl
 */
class PARTITION_INFORMATION_GPT extends Win32Struct {
    static sizeof => 112

    static packingSize => 8

    /**
     * A <b>GUID</b> that identifies the partition type.
     * 
     * Each partition type that the EFI specification supports is identified by its own 
     *        <b>GUID</b>, which is published by the developer of the partition.
     * @type {Guid}
     */
    PartitionType {
        get {
            if(!this.HasProp("__PartitionType"))
                this.__PartitionType := Guid(0, this)
            return this.__PartitionType
        }
    }

    /**
     * The GUID of the partition.
     * @type {Guid}
     */
    PartitionId {
        get {
            if(!this.HasProp("__PartitionId"))
                this.__PartitionId := Guid(16, this)
            return this.__PartitionId
        }
    }

    /**
     * The Extensible Firmware Interface (EFI) attributes of the partition.
     * @type {GPT_ATTRIBUTES}
     */
    Attributes {
        get => NumGet(this, 32, "int64")
        set => NumPut("int64", value, this, 32)
    }

    /**
     * A wide-character string that describes the partition.
     * @type {String}
     */
    Name {
        get => StrGet(this.ptr + 40, 35, "UTF-16")
        set => StrPut(value, this.ptr + 40, 35, "UTF-16")
    }
}
