#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\VDS_DISK_EXTENT_TYPE.ahk" { VDS_DISK_EXTENT_TYPE }
#Import "..\..\..\..\Guid.ahk" { Guid }

/**
 * Defines the properties of a disk extent.
 * @remarks
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
 * @see https://learn.microsoft.com/windows/win32/api/vds/ns-vds-vds_disk_extent
 * @namespace Windows.Win32.Storage.VirtualDiskService
 */
export default struct VDS_DISK_EXTENT {
    #StructPack 8

    /**
     * The GUID of the disk.
     */
    diskId : Guid

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/api/vds/ne-vds-vds_disk_extent_type">VDS_DISK_EXTENT_TYPE</a> enumeration value that specifies the type of the disk extent.
     */
    type : VDS_DISK_EXTENT_TYPE

    /**
     * The disk offset, in bytes.
     */
    ullOffset : Int64

    /**
     * The size of the extent, in bytes.
     */
    ullSize : Int64

    /**
     * The GUID of the volume to which the extent belongs.
     */
    volumeId : Guid

    /**
     * If the extent is from a volume, this member is the GUID of the plex to which the extent belongs.
     */
    plexId : Guid

    /**
     * If the extent is from a volume plex, this member is the zero-based index of the plex member to which the extent belongs.
     */
    memberIdx : UInt32

}
