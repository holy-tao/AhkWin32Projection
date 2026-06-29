#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\VDS_HEALTH.ahk
#Include ..\..\Foundation\PWSTR.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\VDS_VOLUME_TYPE.ahk
#Include .\VDS_TRANSITION_STATE.ahk
#Include .\VDS_FILE_SYSTEM_TYPE.ahk
#Include .\VDS_VOLUME_STATUS.ahk

/**
 * Defines the properties of a volume object. This structure is identical to the VDS_VOLUME_PROP structure, except that it also includes the volume GUIDs.
 * @remarks
 * The <a href="https://docs.microsoft.com/windows/desktop/api/vds/nf-vds-ivdsvolume2-getproperties2">IVdsVolume2::GetProperties2</a> method returns this structure to report the properties of a <a href="https://docs.microsoft.com/windows/desktop/VDS/volume-object">volume object</a>.
 * 
 * When a volume is offline, the <b>VDS_VF_PERMANENTLY_DISMOUNTED</b> flag is set in the <b>ulFlags</b> member of the <b>VDS_VOLUME_PROP2</b> structure, and the <b>VDS_VS_OFFLINE</b> volume status value is also set in the <b>status</b> member of this structure.
 * 
 * For GPT and dynamic volumes, the unique identifier that the <b>pUniqueId</b> member points to is globally unique.
 * 
 * For removable media drives, the volume exists and has its own unique identifier even if there is no media in the device. If a volume is formatted on removable media, that volume has its own unique identifier. For more information, see <a href="https://msdn.microsoft.com/library/ms802377.aspx">Supporting Mount Manager Requests in a Storage Class Driver</a>.
 * 
 * The format of the unique identifier may vary among different types of devices and volumes. For basic volumes on MBR disks, the unique identifier is based on the disk signature and partition offset. Because the disk signature and partition offset are DWORD values, the unique identifier cannot be guaranteed to be globally unique across computers.
 * 
 * If the disk signature changes, the volume's unique identifier also changes. Disk signature changes usually occur as a result of a collision during disk cloning.
 * 
 * Note that a unique identifier is not the same as a volume GUID path. To find the volume GUID paths for a volume, use the <a href="https://docs.microsoft.com/windows/desktop/api/vds/nf-vds-ivdsvolumemf3-queryvolumeguidpathnames">IVdsVolumeMF3::QueryVolumeGuidPathnames</a> method.
 * @see https://learn.microsoft.com/windows/win32/api/vds/ns-vds-vds_volume_prop2
 * @namespace Windows.Win32.Storage.VirtualDiskService
 */
class VDS_VOLUME_PROP2 extends Win32Struct {
    static sizeof => 72

    static packingSize => 8

    /**
     * The GUID of the volume.
     * @type {Guid}
     */
    id {
        get {
            if(!this.HasProp("__id"))
                this.__id := Guid(0, this)
            return this.__id
        }
    }

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/api/vds/ne-vds-vds_volume_type">VDS_VOLUME_TYPE</a> enumeration value that specifies the volume type. Volume types are simple, spanned, striped (RAID-0), mirrored, or striped with parity (RAID-5).
     * @type {VDS_VOLUME_TYPE}
     */
    type {
        get => NumGet(this, 16, "int")
        set => NumPut("int", value, this, 16)
    }

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/api/vds/ne-vds-vds_volume_status">VDS_VOLUME_STATUS</a> enumeration value that specifies the status of the volume.
     * @type {VDS_VOLUME_STATUS}
     */
    status {
        get => NumGet(this, 20, "int")
        set => NumPut("int", value, this, 20)
    }

    /**
     * A  <a href="https://docs.microsoft.com/windows/desktop/api/vdshwprv/ne-vdshwprv-vds_health">VDS_HEALTH</a> enumeration value that specifies the health state of the volume.
     * @type {VDS_HEALTH}
     */
    health {
        get => NumGet(this, 24, "int")
        set => NumPut("int", value, this, 24)
    }

    /**
     * A  <a href="https://docs.microsoft.com/windows/desktop/api/vdshwprv/ne-vdshwprv-vds_transition_state">VDS_TRANSITION_STATE</a> enumeration value that specifies the transition state of the volume.
     * @type {VDS_TRANSITION_STATE}
     */
    TransitionState {
        get => NumGet(this, 28, "int")
        set => NumPut("int", value, this, 28)
    }

    /**
     * The size of the volume, in bytes.
     * @type {Integer}
     */
    ullSize {
        get => NumGet(this, 32, "uint")
        set => NumPut("uint", value, this, 32)
    }

    /**
     * A bitmask of <a href="https://docs.microsoft.com/windows/desktop/api/vds/ne-vds-vds_volume_flag">VDS_VOLUME_FLAG</a> enumeration values that describe the volume.
     * @type {Integer}
     */
    ulFlags {
        get => NumGet(this, 40, "uint")
        set => NumPut("uint", value, this, 40)
    }

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/api/vdshwprv/ne-vdshwprv-vds_file_system_type">VDS_FILE_SYSTEM_TYPE</a> enumeration value that specifies the preferred file system for the volume. Must be one of the following: VDS_FST_NTFS, VDS_FST_FAT, VDS_FST_FAT32, VDS_FST_UDF, VDS_FST_CDFS, or VDS_FST_UNKNOWN.
     * @type {VDS_FILE_SYSTEM_TYPE}
     */
    RecommendedFileSystemType {
        get => NumGet(this, 44, "int")
        set => NumPut("int", value, this, 44)
    }

    /**
     * The length of the byte array that the <b>pUniqueId</b> member points to.
     * @type {Integer}
     */
    cbUniqueId {
        get => NumGet(this, 48, "uint")
        set => NumPut("uint", value, this, 48)
    }

    /**
     * The name that was used to open a handle for the volume with the <a href="https://docs.microsoft.com/windows/desktop/api/fileapi/nf-fileapi-createfilea">CreateFile</a> function. For example, \\?\GLOBALROOT\Device\HarddiskVolume1.
     * @type {PWSTR}
     */
    pwszName {
        get => NumGet(this, 56, "ptr")
        set => NumPut("ptr", value, this, 56)
    }

    /**
     * A byte array that contains the unique identifier for the volume.
     * @type {Pointer<Integer>}
     */
    pUniqueId {
        get => NumGet(this, 64, "ptr")
        set => NumPut("ptr", value, this, 64)
    }
}
