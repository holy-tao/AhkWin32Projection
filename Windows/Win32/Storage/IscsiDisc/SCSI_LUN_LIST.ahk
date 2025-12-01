#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * SCSI_LUN_LIST structure is used to construct a list of logical unit numbers (LUNs) associated with target devices.
 * @see https://learn.microsoft.com/windows/win32/api/iscsidsc/ns-iscsidsc-scsi_lun_list
 * @namespace Windows.Win32.Storage.IscsiDisc
 * @version v4.0.30319
 */
class SCSI_LUN_LIST extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * The LUN assigned by the operating system to the target device when it was enumerated by the initiator Host Bus Adapter (HBA).
     * @type {Integer}
     */
    OSLUN {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * The LUN assigned by the target subsystem to the target device.
     * @type {Integer}
     */
    TargetLUN {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }
}
