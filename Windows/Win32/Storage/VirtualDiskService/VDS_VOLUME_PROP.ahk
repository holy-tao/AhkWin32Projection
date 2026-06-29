#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\VDS_FILE_SYSTEM_TYPE.ahk" { VDS_FILE_SYSTEM_TYPE }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import ".\VDS_TRANSITION_STATE.ahk" { VDS_TRANSITION_STATE }
#Import ".\VDS_HEALTH.ahk" { VDS_HEALTH }
#Import ".\VDS_VOLUME_TYPE.ahk" { VDS_VOLUME_TYPE }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\VDS_VOLUME_STATUS.ahk" { VDS_VOLUME_STATUS }

/**
 * Defines the properties of a volume object.
 * @remarks
 * The <a href="https://docs.microsoft.com/windows/desktop/api/vds/nf-vds-ivdsvolume-getproperties">IVdsVolume::GetProperties</a> method returns this structure to report the properties of a <a href="https://docs.microsoft.com/windows/desktop/VDS/volume-object">volume object</a>.
 * 
 * When a volume is offline, the <b>VDS_VF_PERMANENTLY_DISMOUNTED</b> flag is set in the <b>ulFlags</b> member of the <b>VDS_VOLUME_PROP</b> structure, and the <b>VDS_VS_OFFLINE</b> volume status value is also set in the <b>status</b> member of this structure.
 * @see https://learn.microsoft.com/windows/win32/api/vds/ns-vds-vds_volume_prop
 * @namespace Windows.Win32.Storage.VirtualDiskService
 */
export default struct VDS_VOLUME_PROP {
    #StructPack 8

    /**
     * The GUID of the volume.
     */
    id : Guid

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/api/vds/ne-vds-vds_volume_type">VDS_VOLUME_TYPE</a> enumeration value that specifies the type of the volume. Volume types are simple, spanned, striped (RAID-0), mirrored, or striped with parity (RAID-5).
     */
    type : VDS_VOLUME_TYPE

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/api/vds/ne-vds-vds_volume_status">VDS_VOLUME_STATUS</a> enumeration value that specifies the status of the volume.
     */
    status : VDS_VOLUME_STATUS

    /**
     * A  <a href="https://docs.microsoft.com/windows/desktop/api/vdshwprv/ne-vdshwprv-vds_health">VDS_HEALTH</a> enumeration value that specifies the health state of the volume.
     */
    health : VDS_HEALTH

    /**
     * A  <a href="https://docs.microsoft.com/windows/desktop/api/vdshwprv/ne-vdshwprv-vds_transition_state">VDS_TRANSITION_STATE</a> enumeration value that specifies the transition state of the volume.
     */
    TransitionState : VDS_TRANSITION_STATE

    /**
     * The size of the volume, in bytes.
     */
    ullSize : Int64

    /**
     * A bitmask of <a href="https://docs.microsoft.com/windows/desktop/api/vds/ne-vds-vds_volume_flag">VDS_VOLUME_FLAG</a> enumeration values that describe the volume.
     */
    ulFlags : UInt32

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/api/vdshwprv/ne-vdshwprv-vds_file_system_type">VDS_FILE_SYSTEM_TYPE</a> enumeration value that specifies the preferred file system for the volume. Must be one of the following: VDS_FST_NTFS, VDS_FST_FAT, VDS_FST_FAT32, VDS_FST_UDF, VDS_FST_CDFS, or VDS_FST_UNKNOWN.
     */
    RecommendedFileSystemType : VDS_FILE_SYSTEM_TYPE

    /**
     * The name used to open a handle for the volume with the <a href="https://docs.microsoft.com/windows/desktop/api/fileapi/nf-fileapi-createfilea">CreateFile</a> function. For example, \\?\GLOBALROOT\Device\HarddiskVolume1.
     */
    pwszName : PWSTR

}
