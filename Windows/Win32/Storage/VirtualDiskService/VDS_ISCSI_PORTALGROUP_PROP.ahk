#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * The VDS_ISCSI_PORTALGROUP_PROP structure (vdshwprv.h) defines the properties of an iSCSI portal group.
 * @see https://learn.microsoft.com/windows/win32/api/vdshwprv/ns-vdshwprv-vds_iscsi_portalgroup_prop
 * @namespace Windows.Win32.Storage.VirtualDiskService
 */
class VDS_ISCSI_PORTALGROUP_PROP extends Win32Struct {
    static sizeof => 20

    static packingSize => 4

    /**
     * The <a href="https://docs.microsoft.com/windows/desktop/VDS/vds-data-types">VDS_OBJECT_ID</a> assigned to the portal group.
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
     * The portal group tag that is assigned by the provider to the portal group. For more information about portal group tags, see the iSCSI specification at <a href="https://www.ietf.org/rfc/rfc3720.txt">https://go.microsoft.com/fwlink/p/?linkid=158752</a>.
     * @type {Integer}
     */
    tag {
        get => NumGet(this, 16, "ushort")
        set => NumPut("ushort", value, this, 16)
    }
}
