#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BOOL.ahk

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
class VDS_DRIVE_EXTENT extends Win32Struct {
    static sizeof => 48

    static packingSize => 8

    /**
     * The <b>VDS_OBJECT_ID</b> of the drive.
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
     * The <b>VDS_OBJECT_ID</b> of the LUN that is associated with the drive extent.
     * @type {Guid}
     */
    LunId {
        get {
            if(!this.HasProp("__LunId"))
                this.__LunId := Guid(16, this)
            return this.__LunId
        }
    }

    /**
     * The size of the extent, in bytes.
     * @type {Integer}
     */
    ullSize {
        get => NumGet(this, 32, "uint")
        set => NumPut("uint", value, this, 32)
    }

    /**
     * If <b>TRUE</b>, the extent is allocated to a LUN plex. If <b>FALSE</b>, the extent is unallocated.
     * @type {BOOL}
     */
    bUsed {
        get => NumGet(this, 40, "int")
        set => NumPut("int", value, this, 40)
    }
}
