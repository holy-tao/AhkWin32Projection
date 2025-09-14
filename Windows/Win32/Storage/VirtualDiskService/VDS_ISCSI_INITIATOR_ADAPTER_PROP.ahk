#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The VDS_ISCSI_INITIATOR_ADAPTER_PROP structure (vdshwprv.h) defines the properties of an iSCSI initiator adapter.
 * @see https://learn.microsoft.com/windows/win32/api/vdshwprv/ns-vdshwprv-vds_iscsi_initiator_adapter_prop
 * @namespace Windows.Win32.Storage.VirtualDiskService
 * @version v4.0.30319
 */
class VDS_ISCSI_INITIATOR_ADAPTER_PROP extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * The <b>VDS_OBJECT_ID</b> assigned to the initiator adapter.
     * @type {Pointer<Guid>}
     */
    id {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * A null-terminated, human-readable string that is the name of the initiator adapter.
     * @type {Pointer<PWSTR>}
     */
    pwszName {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }
}
