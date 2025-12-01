#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The VDS_ISCSI_PORTALGROUP_PROP structure (vdshwprv.h) defines the properties of an iSCSI portal group.
 * @see https://learn.microsoft.com/windows/win32/api/vdshwprv/ns-vdshwprv-vds_iscsi_portalgroup_prop
 * @namespace Windows.Win32.Storage.VirtualDiskService
 * @version v4.0.30319
 */
class VDS_ISCSI_PORTALGROUP_PROP extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * The <a href="https://docs.microsoft.com/windows/desktop/VDS/vds-data-types">VDS_OBJECT_ID</a> assigned to the portal group.
     * @type {Pointer<Guid>}
     */
    id {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * The portal group tag that is assigned by the provider to the portal group. For more information about portal group tags, see the iSCSI specification at <a href="https://www.ietf.org/rfc/rfc3720.txt">https://go.microsoft.com/fwlink/p/?linkid=158752</a>.
     * @type {Integer}
     */
    tag {
        get => NumGet(this, 8, "ushort")
        set => NumPut("ushort", value, this, 8)
    }
}
