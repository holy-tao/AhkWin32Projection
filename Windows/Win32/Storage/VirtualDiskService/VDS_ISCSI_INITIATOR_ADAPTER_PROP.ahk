#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\..\..\Guid.ahk" { Guid }

/**
 * The VDS_ISCSI_INITIATOR_ADAPTER_PROP structure (vdshwprv.h) defines the properties of an iSCSI initiator adapter.
 * @see https://learn.microsoft.com/windows/win32/api/vdshwprv/ns-vdshwprv-vds_iscsi_initiator_adapter_prop
 * @namespace Windows.Win32.Storage.VirtualDiskService
 */
export default struct VDS_ISCSI_INITIATOR_ADAPTER_PROP {
    #StructPack 8

    /**
     * The <b>VDS_OBJECT_ID</b> assigned to the initiator adapter.
     */
    id : Guid

    /**
     * A null-terminated, human-readable string that is the name of the initiator adapter.
     */
    pwszName : PWSTR

}
