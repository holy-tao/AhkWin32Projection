#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The VDS_DRIVE_PROP2 structure (vdshwprv.h) defines the properties of a drive object.
 * @remarks
 * This structure is used by the <a href="https://docs.microsoft.com/windows/desktop/api/vdshwprv/nf-vdshwprv-ivdsdrive2-getproperties2">IVdsDrive2::GetProperties2</a> method to return the properties for a <a href="https://docs.microsoft.com/windows/desktop/VDS/drive-object">drive object</a>.
 * @see https://learn.microsoft.com/windows/win32/api/vdshwprv/ns-vdshwprv-vds_drive_prop2
 * @namespace Windows.Win32.Storage.VirtualDiskService
 * @version v4.0.30319
 */
class VDS_DRIVE_PROP2 extends Win32Struct
{
    static sizeof => 64

    static packingSize => 8

    /**
     * The GUID of the drive object.
     * @type {Pointer<Guid>}
     */
    id {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * The size of the drive, in bytes.
     * @type {Integer}
     */
    ullSize {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * A <b>NULL</b>-terminated wide-character string that contains the name of the drive.
     * @type {Pointer<PWSTR>}
     */
    pwszFriendlyName {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }

    /**
     * A <b>NULL</b>-terminated wide-character string that contains the drive identifier.
     * @type {Pointer<PWSTR>}
     */
    pwszIdentification {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }

    /**
     * A bitmask of  
     *       <a href="https://docs.microsoft.com/windows/desktop/api/vdshwprv/ne-vdshwprv-vds_drive_flag">VDS_DRIVE_FLAG</a> enumeration values.
     * @type {Integer}
     */
    ulFlags {
        get => NumGet(this, 32, "uint")
        set => NumPut("uint", value, this, 32)
    }

    /**
     * A  
     *       <a href="https://docs.microsoft.com/windows/desktop/api/vdshwprv/ne-vdshwprv-vds_drive_status">VDS_DRIVE_STATUS</a> enumeration value that specifies the status of the drive.
     * @type {Integer}
     */
    status {
        get => NumGet(this, 36, "int")
        set => NumPut("int", value, this, 36)
    }

    /**
     * A 
     *       <a href="https://docs.microsoft.com/windows/desktop/api/vdshwprv/ne-vdshwprv-vds_health">VDS_HEALTH</a> enumeration value that specifies the health status of the drive. The following are the valid values for this member.
     * 
     * <b>Windows Server 2008, Windows Vista and Windows Server 2003:  </b><b>VDS_H_REPLACED</b> and <b>VDS_H_PENDING_FAILURE</b> are not supported.
     * @type {Integer}
     */
    health {
        get => NumGet(this, 40, "int")
        set => NumPut("int", value, this, 40)
    }

    /**
     * The number of the bus to which the drive is connected. This number is an implementer-assigned value that uniquely identifies the bus within the subsystem. It is not constrained by the number of buses that the subsystem contains, and it is not related to the value of the <b>sNumberOfInternalBuses</b> member of the <a href="https://docs.microsoft.com/windows/desktop/api/vdshwprv/ns-vdshwprv-vds_sub_system_prop">VDS_SUB_SYSTEM_PROP</a> structure.
     * @type {Integer}
     */
    sInternalBusNumber {
        get => NumGet(this, 44, "short")
        set => NumPut("short", value, this, 44)
    }

    /**
     * The number of the slot that the drive occupies. This number is an implementer-assigned value that uniquely identifies the slot within the bus. It is not constrained by the number of slots that the bus contains, and it is not related to the value of the <b>sMaxNumberOfSlotsEachBus</b> member of the <a href="https://docs.microsoft.com/windows/desktop/api/vdshwprv/ns-vdshwprv-vds_sub_system_prop">VDS_SUB_SYSTEM_PROP</a> structure.
     * @type {Integer}
     */
    sSlotNumber {
        get => NumGet(this, 46, "short")
        set => NumPut("short", value, this, 46)
    }

    /**
     * The number of the enclosure that contains the drive. A value of ULONG_MAX indicates that this number is not defined for the drive. Because some enclosure numbering schemes are zero-based, zero is a valid value for this member. This member corresponds to the <i>ulEnclosureNumber</i>  parameter of the <a href="https://docs.microsoft.com/windows/desktop/api/vdshwprv/nf-vdshwprv-ivdssubsystem2-getdrive2">IVdsSubSystem2::GetDrive2</a> method.
     * @type {Integer}
     */
    ulEnclosureNumber {
        get => NumGet(this, 48, "uint")
        set => NumPut("uint", value, this, 48)
    }

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/api/vdslun/ne-vdslun-vds_storage_bus_type">VDS_STORAGE_BUS_TYPE</a> value that specifies the bus type of the drive. A value of zero means that the bus type is unknown.
     * @type {Integer}
     */
    busType {
        get => NumGet(this, 52, "int")
        set => NumPut("int", value, this, 52)
    }

    /**
     * The spindle speed of the drive, in RPM. The default value for this member is zero. A value of zero means that the spindle speed is unknown. A value of 1 means that the drive does not have rotating media. (For example, it might be a solid-state drive.)
     * @type {Integer}
     */
    ulSpindleSpeed {
        get => NumGet(this, 56, "uint")
        set => NumPut("uint", value, this, 56)
    }
}
