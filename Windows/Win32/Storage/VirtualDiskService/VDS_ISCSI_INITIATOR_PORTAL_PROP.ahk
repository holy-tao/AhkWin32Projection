#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\VDS_IPADDRESS_TYPE.ahk" { VDS_IPADDRESS_TYPE }
#Import ".\VDS_IPADDRESS.ahk" { VDS_IPADDRESS }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\WCHAR.ahk" { WCHAR }

/**
 * The VDS_ISCSI_INITIATOR_PORTAL_PROP structure (vdshwprv.h) defines the properties of an iSCSI initiator portal.
 * @see https://learn.microsoft.com/windows/win32/api/vdshwprv/ns-vdshwprv-vds_iscsi_initiator_portal_prop
 * @namespace Windows.Win32.Storage.VirtualDiskService
 */
export default struct VDS_ISCSI_INITIATOR_PORTAL_PROP {
    #StructPack 4

    /**
     * The <b>VDS_OBJECT_ID</b> assigned to the initiator portal.
     */
    id : Guid

    /**
     * The IP address and port of the portal.
     */
    address : VDS_IPADDRESS

    /**
     * The port index assigned to the portal by the iSCSI initiator service.
     */
    ulPortIndex : UInt32

}
