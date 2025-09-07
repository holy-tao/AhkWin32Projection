#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

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
 * @version v4.0.30319
 */
class VDS_DRIVE_EXTENT extends Win32Struct
{
    static sizeof => 32

    static packingSize => 8

    /**
     * The <b>VDS_OBJECT_ID</b> of the drive.
     * @type {Pointer<Guid>}
     */
    id {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * The <b>VDS_OBJECT_ID</b> of the LUN that is associated with the drive extent.
     * @type {Pointer<Guid>}
     */
    LunId {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * The size of the extent, in bytes.
     * @type {Integer}
     */
    ullSize {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * If <b>TRUE</b>, the extent is allocated to a LUN plex. If <b>FALSE</b>, the extent is unallocated.
     * @type {Integer}
     */
    bUsed {
        get => NumGet(this, 24, "int")
        set => NumPut("int", value, this, 24)
    }
}
