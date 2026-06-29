#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\..\Guid.ahk" { Guid }

/**
 * The VDS_ISCSI_PORTALGROUP_PROP structure (vdshwprv.h) defines the properties of an iSCSI portal group.
 * @see https://learn.microsoft.com/windows/win32/api/vdshwprv/ns-vdshwprv-vds_iscsi_portalgroup_prop
 * @namespace Windows.Win32.Storage.VirtualDiskService
 */
export default struct VDS_ISCSI_PORTALGROUP_PROP {
    #StructPack 4

    /**
     * The <a href="https://docs.microsoft.com/windows/desktop/VDS/vds-data-types">VDS_OBJECT_ID</a> assigned to the portal group.
     */
    id : Guid

    /**
     * The portal group tag that is assigned by the provider to the portal group. For more information about portal group tags, see the iSCSI specification at <a href="https://www.ietf.org/rfc/rfc3720.txt">https://go.microsoft.com/fwlink/p/?linkid=158752</a>.
     */
    tag : UInt16

}
