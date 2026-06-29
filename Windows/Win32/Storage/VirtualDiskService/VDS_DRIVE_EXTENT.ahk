#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import "..\..\..\..\Guid.ahk" { Guid }

/**
 * The VDS_DRIVE_EXTENT structure (vdshwprv.h) defines the properties of a drive extent.
 * @remarks
 * The <a href="https://docs.microsoft.com/windows/desktop/api/vdshwprv/nf-vdshwprv-ivdsdrive-queryextents">IVdsDrive::QueryExtents</a> 
 *     method returns this structure to report the properties of a drive extent. It is also returned by the 
 *     <a href="https://docs.microsoft.com/windows/desktop/api/vdshwprv/nf-vdshwprv-ivdslunplex-queryextents">IVdsLunPlex::QueryExtents</a> method to report 
 *     the details of a drive extent that is allocated to a plex.
 * 
 * A disk extent is a contiguous set of blocks on a single disk or LUN handled by a software provider. A drive 
 *     extent is not required to be a contiguous set of blocks.
 * @see https://learn.microsoft.com/windows/win32/api/vdshwprv/ns-vdshwprv-vds_drive_extent
 * @namespace Windows.Win32.Storage.VirtualDiskService
 */
export default struct VDS_DRIVE_EXTENT {
    #StructPack 8

    /**
     * The <b>VDS_OBJECT_ID</b> of the drive.
     */
    id : Guid

    /**
     * The <b>VDS_OBJECT_ID</b> of the LUN that is associated with the drive extent.
     */
    LunId : Guid

    /**
     * The size of the extent, in bytes.
     */
    ullSize : Int64

    /**
     * If <b>TRUE</b>, the extent is allocated to a LUN plex. If <b>FALSE</b>, the extent is unallocated.
     */
    bUsed : BOOL

}
