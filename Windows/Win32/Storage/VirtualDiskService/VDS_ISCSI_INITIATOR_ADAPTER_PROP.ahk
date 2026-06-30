#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\PWSTR.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * The VDS_ISCSI_INITIATOR_ADAPTER_PROP structure (vdshwprv.h) defines the properties of an iSCSI initiator adapter.
 * @see https://learn.microsoft.com/windows/win32/api/vdshwprv/ns-vdshwprv-vds_iscsi_initiator_adapter_prop
 * @namespace Windows.Win32.Storage.VirtualDiskService
 */
class VDS_ISCSI_INITIATOR_ADAPTER_PROP extends Win32Struct {
    static sizeof => 24

    static packingSize => 8

    /**
     * The <b>VDS_OBJECT_ID</b> assigned to the initiator adapter.
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
     * A null-terminated, human-readable string that is the name of the initiator adapter.
     * @type {PWSTR}
     */
    pwszName {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }
}
