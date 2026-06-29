#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * SCSI_LUN_LIST structure is used to construct a list of logical unit numbers (LUNs) associated with target devices.
 * @see https://learn.microsoft.com/windows/win32/api/iscsidsc/ns-iscsidsc-scsi_lun_list
 * @namespace Windows.Win32.Storage.IscsiDisc
 */
export default struct SCSI_LUN_LIST {
    #StructPack 8

    /**
     * The LUN assigned by the operating system to the target device when it was enumerated by the initiator Host Bus Adapter (HBA).
     */
    OSLUN : UInt32

    /**
     * The LUN assigned by the target subsystem to the target device.
     */
    TargetLUN : Int64

}
