#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\VDS_IPADDRESS_TYPE.ahk" { VDS_IPADDRESS_TYPE }
#Import ".\VDS_IPADDRESS.ahk" { VDS_IPADDRESS }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\VDS_ISCSI_PORTAL_STATUS.ahk" { VDS_ISCSI_PORTAL_STATUS }
#Import "..\..\Foundation\WCHAR.ahk" { WCHAR }

/**
 * The VDS_ISCSI_PORTAL_PROP structure (vdshwprv.h) defines the properties of an iSCSI portal.
 * @see https://learn.microsoft.com/windows/win32/api/vdshwprv/ns-vdshwprv-vds_iscsi_portal_prop
 * @namespace Windows.Win32.Storage.VirtualDiskService
 */
export default struct VDS_ISCSI_PORTAL_PROP {
    #StructPack 4

    /**
     * The <b>VDS_OBJECT_ID</b> of the portal.
     */
    id : Guid

    /**
     * The IP address and port of the portal.
     */
    address : VDS_IPADDRESS

    /**
     * The status of the portal, enumerated by 
     *      <a href="https://docs.microsoft.com/windows/desktop/api/vdshwprv/ne-vdshwprv-vds_iscsi_portal_status">VDS_ISCSI_PORTAL_STATUS</a>.
     */
    status : VDS_ISCSI_PORTAL_STATUS

}
