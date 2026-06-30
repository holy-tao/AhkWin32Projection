#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\VDS_IPADDRESS.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\VDS_IPADDRESS_TYPE.ahk

/**
 * The VDS_ISCSI_INITIATOR_PORTAL_PROP structure (vdshwprv.h) defines the properties of an iSCSI initiator portal.
 * @see https://learn.microsoft.com/windows/win32/api/vdshwprv/ns-vdshwprv-vds_iscsi_initiator_portal_prop
 * @namespace Windows.Win32.Storage.VirtualDiskService
 */
class VDS_ISCSI_INITIATOR_PORTAL_PROP extends Win32Struct {
    static sizeof => 572

    static packingSize => 4

    /**
     * The <b>VDS_OBJECT_ID</b> assigned to the initiator portal.
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
     * The IP address and port of the portal.
     * @type {VDS_IPADDRESS}
     */
    address {
        get {
            if(!this.HasProp("__address"))
                this.__address := VDS_IPADDRESS(16, this)
            return this.__address
        }
    }

    /**
     * The port index assigned to the portal by the iSCSI initiator service.
     * @type {Integer}
     */
    ulPortIndex {
        get => NumGet(this, 568, "uint")
        set => NumPut("uint", value, this, 568)
    }
}
