#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Defines the details of an input disk.
 * @remarks
 * A disk cannot contribute more than one plex to the same volume; however, a disk can contribute to multiple volumes.
 * 
 * 
 * Callers can specify a member index for all disks or use the default member index for all disks. Never mix specified and default member indexes for the disks included in the same array. Avoid using a default member index in conjunction with the <a href="https://docs.microsoft.com/windows/desktop/api/vds/nf-vds-ivdsvolume-extend">IVdsVolume::Extend</a> method, unless the volume has only one plex with only one member.
 * 
 * The <a href="https://docs.microsoft.com/windows/desktop/api/vds/nf-vds-ivdspack-createvolume">IVdsPack::CreateVolume</a>, <a href="https://docs.microsoft.com/windows/desktop/api/vds/nf-vds-ivdsvolume-extend">IVdsVolume::Extend</a>, and <a href="https://docs.microsoft.com/windows/desktop/api/vds/nf-vds-ivdsvolumeplex-repair">IVdsVolumePlex::Repair</a> methods pass this structure as an argument to specify disk input information.
 * @see https://learn.microsoft.com/windows/win32/api/vds/ns-vds-vds_input_disk
 * @namespace Windows.Win32.Storage.VirtualDiskService
 * @version v4.0.30319
 */
class VDS_INPUT_DISK extends Win32Struct
{
    static sizeof => 32

    static packingSize => 8

    /**
     * The GUID of the disk. This field is required.
     * @type {Pointer<Guid>}
     */
    diskId {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * Disk size in bytes. This field is required. The provider policy determines the offset, length, and number of disk extents allocated for an input disk.
     * @type {Integer}
     */
    ullSize {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * When extending a volume, the GUID for the plex to which the disk belongs. VDS ignores this member when creating a volume or  repairing a RAID-5 volume.
     * 
     * 
     * <div class="alert"><b>Note</b>  Callers can extend a volume only by extending all members of all plexes in the same operation.</div>
     * <div> </div>
     * @type {Pointer<Guid>}
     */
    plexId {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }

    /**
     * The member index of the disk to which the extent belongs. Either specify a <b>memberIdx</b> for all disks or specify it for none. VDS uses disks with the same <b>memberIdx</b> in the order they appear in the array. For example, the first disk in the array is always used first.
     * 
     * 
     * <div class="alert"><b>Note</b>  Do not specify <b>memberIdx</b> when repairing a RAID-5 volume.</div>
     * <div> </div>
     * @type {Integer}
     */
    memberIdx {
        get => NumGet(this, 24, "uint")
        set => NumPut("uint", value, this, 24)
    }
}
