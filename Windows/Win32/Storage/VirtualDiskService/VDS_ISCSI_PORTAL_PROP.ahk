#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\VDS_IPADDRESS.ahk

/**
 * The VDS_ISCSI_PORTAL_PROP structure (vdshwprv.h) defines the properties of an iSCSI portal.
 * @see https://learn.microsoft.com/windows/win32/api/vdshwprv/ns-vdshwprv-vds_iscsi_portal_prop
 * @namespace Windows.Win32.Storage.VirtualDiskService
 * @version v4.0.30319
 */
class VDS_ISCSI_PORTAL_PROP extends Win32Struct
{
    static sizeof => 568

    static packingSize => 8

    /**
     * The <b>VDS_OBJECT_ID</b> of the portal.
     * @type {Pointer<Guid>}
     */
    id {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * The IP address and port of the portal.
     * @type {VDS_IPADDRESS}
     */
    address{
        get {
            if(!this.HasProp("__address"))
                this.__address := VDS_IPADDRESS(this.ptr + 8)
            return this.__address
        }
    }

    /**
     * The status of the portal, enumerated by 
     *      <a href="https://docs.microsoft.com/windows/desktop/api/vdshwprv/ne-vdshwprv-vds_iscsi_portal_status">VDS_ISCSI_PORTAL_STATUS</a>.
     * @type {Integer}
     */
    status {
        get => NumGet(this, 560, "int")
        set => NumPut("int", value, this, 560)
    }
}
