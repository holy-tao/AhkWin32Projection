#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Contains raw SCSI virtual disk response parameters.
 * @see https://learn.microsoft.com/windows/win32/api/virtdisk/ns-virtdisk-raw_scsi_virtual_disk_response
 * @namespace Windows.Win32.Storage.Vhd
 * @version v4.0.30319
 */
class RAW_SCSI_VIRTUAL_DISK_RESPONSE extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * A [RAW_SCSI_VIRTUAL_DISK_PARAMETERS](./ns-virtdisk-raw_scsi_virtual_disk_parameters.md) structure being passed to or from the VHD functions.
     * @type {Integer}
     */
    Version {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    ScsiStatus {
        get => NumGet(this, 8, "char")
        set => NumPut("char", value, this, 8)
    }

    /**
     * @type {Integer}
     */
    SenseInfoLength {
        get => NumGet(this, 9, "char")
        set => NumPut("char", value, this, 9)
    }

    /**
     * @type {Integer}
     */
    DataTransferLength {
        get => NumGet(this, 12, "uint")
        set => NumPut("uint", value, this, 12)
    }
}
