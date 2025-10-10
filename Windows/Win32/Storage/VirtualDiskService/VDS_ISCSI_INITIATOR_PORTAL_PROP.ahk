#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\VDS_IPADDRESS.ahk

/**
 * Defines the properties of an iSCSI initiator portal.
 * @see https://docs.microsoft.com/windows/win32/api//vds/ns-vds-vds_iscsi_initiator_portal_prop
 * @namespace Windows.Win32.Storage.VirtualDiskService
 * @version v4.0.30319
 */
class VDS_ISCSI_INITIATOR_PORTAL_PROP extends Win32Struct
{
    static sizeof => 568

    static packingSize => 8

    /**
     * The <b>VDS_OBJECT_ID</b> assigned to the initiator portal.
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
     * The port index assigned to the portal by the iSCSI initiator service.
     * @type {Integer}
     */
    ulPortIndex {
        get => NumGet(this, 560, "uint")
        set => NumPut("uint", value, this, 560)
    }
}
