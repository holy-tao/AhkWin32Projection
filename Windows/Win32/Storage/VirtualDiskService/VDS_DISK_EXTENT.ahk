#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Defines the properties of a disk extent.
 * @remarks
 * 
  * The <i>volumeId</i>, <i>plexId</i>, and 
  *     <i>memberIdx</i> members apply to data and ESP partitions only. If the extent lacks a volume 
  *     association, the GUIDs for <i>volumeId</i> and <i>plexId</i> are GUID_NULL, 
  *     and <i>memberIdx</i> is zero. The <i>memberIdx</i> member is always zero 
  *     unless the volume is striped or striped with parity (RAID-5). An extent can also be unallocated or free.
  *    
  * 
  * The <a href="https://docs.microsoft.com/windows/desktop/api/vds/nf-vds-ivdsdisk-queryextents">IVdsDisk::QueryExtents</a> method returns this 
  *     structure to report the property details of a disk extent. Likewise, the 
  *     <a href="https://docs.microsoft.com/windows/desktop/api/vds/nf-vds-ivdsvolumeplex-queryextents">IVdsVolumePlex::QueryExtents</a> method 
  *     returns it to report the details of the disk extents allocated to a plex.
  * 
  * A disk extent is a contiguous set of blocks on a single disk or LUN handled by a software provider. A drive 
  *     extent is not required to be a contiguous set of blocks.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//vds/ns-vds-vds_disk_extent
 * @namespace Windows.Win32.Storage.VirtualDiskService
 * @version v4.0.30319
 */
class VDS_DISK_EXTENT extends Win32Struct
{
    static sizeof => 56

    static packingSize => 8

    /**
     * The GUID of the disk.
     * @type {Pointer<Guid>}
     */
    diskId {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/api/vds/ne-vds-vds_disk_extent_type">VDS_DISK_EXTENT_TYPE</a> enumeration value that specifies the type of the disk extent.
     * @type {Integer}
     */
    type {
        get => NumGet(this, 8, "int")
        set => NumPut("int", value, this, 8)
    }

    /**
     * The disk offset, in bytes.
     * @type {Integer}
     */
    ullOffset {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * The size of the extent, in bytes.
     * @type {Integer}
     */
    ullSize {
        get => NumGet(this, 24, "uint")
        set => NumPut("uint", value, this, 24)
    }

    /**
     * The GUID of the volume to which the extent belongs.
     * @type {Pointer<Guid>}
     */
    volumeId {
        get => NumGet(this, 32, "ptr")
        set => NumPut("ptr", value, this, 32)
    }

    /**
     * If the extent is from a volume, this member is the GUID of the plex to which the extent belongs.
     * @type {Pointer<Guid>}
     */
    plexId {
        get => NumGet(this, 40, "ptr")
        set => NumPut("ptr", value, this, 40)
    }

    /**
     * If the extent is from a volume plex, this member is the zero-based index of the plex member to which the extent belongs.
     * @type {Integer}
     */
    memberIdx {
        get => NumGet(this, 48, "uint")
        set => NumPut("uint", value, this, 48)
    }
}
