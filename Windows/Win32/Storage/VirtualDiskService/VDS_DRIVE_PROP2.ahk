#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import ".\VDS_DRIVE_STATUS.ahk" { VDS_DRIVE_STATUS }
#Import ".\VDS_HEALTH.ahk" { VDS_HEALTH }
#Import ".\VDS_STORAGE_BUS_TYPE.ahk" { VDS_STORAGE_BUS_TYPE }
#Import "..\..\..\..\Guid.ahk" { Guid }

/**
 * The VDS_DRIVE_PROP2 structure (vdshwprv.h) defines the properties of a drive object.
 * @remarks
 * This structure is used by the <a href="https://docs.microsoft.com/windows/desktop/api/vdshwprv/nf-vdshwprv-ivdsdrive2-getproperties2">IVdsDrive2::GetProperties2</a> method to return the properties for a <a href="https://docs.microsoft.com/windows/desktop/VDS/drive-object">drive object</a>.
 * @see https://learn.microsoft.com/windows/win32/api/vdshwprv/ns-vdshwprv-vds_drive_prop2
 * @namespace Windows.Win32.Storage.VirtualDiskService
 */
export default struct VDS_DRIVE_PROP2 {
    #StructPack 8

    /**
     * The GUID of the drive object.
     */
    id : Guid

    /**
     * The size of the drive, in bytes.
     */
    ullSize : Int64

    /**
     * A <b>NULL</b>-terminated wide-character string that contains the name of the drive.
     */
    pwszFriendlyName : PWSTR

    /**
     * A <b>NULL</b>-terminated wide-character string that contains the drive identifier.
     */
    pwszIdentification : PWSTR

    /**
     * A bitmask of  
     *       <a href="https://docs.microsoft.com/windows/desktop/api/vdshwprv/ne-vdshwprv-vds_drive_flag">VDS_DRIVE_FLAG</a> enumeration values.
     */
    ulFlags : UInt32

    /**
     * A  
     *       <a href="https://docs.microsoft.com/windows/desktop/api/vdshwprv/ne-vdshwprv-vds_drive_status">VDS_DRIVE_STATUS</a> enumeration value that specifies the status of the drive.
     */
    status : VDS_DRIVE_STATUS

    /**
     * A 
     *       <a href="https://docs.microsoft.com/windows/desktop/api/vdshwprv/ne-vdshwprv-vds_health">VDS_HEALTH</a> enumeration value that specifies the health status of the drive. The following are the valid values for this member.
     * 
     * <b>Windows Server 2008, Windows Vista and Windows Server 2003:  </b><b>VDS_H_REPLACED</b> and <b>VDS_H_PENDING_FAILURE</b> are not supported.
     */
    health : VDS_HEALTH

    /**
     * The number of the bus to which the drive is connected. This number is an implementer-assigned value that uniquely identifies the bus within the subsystem. It is not constrained by the number of buses that the subsystem contains, and it is not related to the value of the <b>sNumberOfInternalBuses</b> member of the <a href="https://docs.microsoft.com/windows/desktop/api/vdshwprv/ns-vdshwprv-vds_sub_system_prop">VDS_SUB_SYSTEM_PROP</a> structure.
     */
    sInternalBusNumber : Int16

    /**
     * The number of the slot that the drive occupies. This number is an implementer-assigned value that uniquely identifies the slot within the bus. It is not constrained by the number of slots that the bus contains, and it is not related to the value of the <b>sMaxNumberOfSlotsEachBus</b> member of the <a href="https://docs.microsoft.com/windows/desktop/api/vdshwprv/ns-vdshwprv-vds_sub_system_prop">VDS_SUB_SYSTEM_PROP</a> structure.
     */
    sSlotNumber : Int16

    /**
     * The number of the enclosure that contains the drive. A value of ULONG_MAX indicates that this number is not defined for the drive. Because some enclosure numbering schemes are zero-based, zero is a valid value for this member. This member corresponds to the <i>ulEnclosureNumber</i>  parameter of the <a href="https://docs.microsoft.com/windows/desktop/api/vdshwprv/nf-vdshwprv-ivdssubsystem2-getdrive2">IVdsSubSystem2::GetDrive2</a> method.
     */
    ulEnclosureNumber : UInt32

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/api/vdslun/ne-vdslun-vds_storage_bus_type">VDS_STORAGE_BUS_TYPE</a> value that specifies the bus type of the drive. A value of zero means that the bus type is unknown.
     */
    busType : VDS_STORAGE_BUS_TYPE

    /**
     * The spindle speed of the drive, in RPM. The default value for this member is zero. A value of zero means that the spindle speed is unknown. A value of 1 means that the drive does not have rotating media. (For example, it might be a solid-state drive.)
     */
    ulSpindleSpeed : UInt32

}
