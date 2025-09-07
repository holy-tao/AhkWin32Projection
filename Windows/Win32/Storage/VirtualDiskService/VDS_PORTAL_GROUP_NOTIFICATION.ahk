#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The VDS_PORTAL_GROUP_NOTIFICATION structure (vdshwprv.h) defines the details of iSCSI portal events.
 * @remarks
 * The <a href="https://docs.microsoft.com/windows/desktop/api/vdshwprv/ns-vdshwprv-vds_notification">VDS_NOTIFICATION</a> structure includes this 
  *     structure as a member.
  * 
  * An application can receive disk events by implementing the 
  *     <a href="https://docs.microsoft.com/windows/desktop/api/vdshwprv/nn-vdshwprv-ivdsadvisesink">IVdsAdviseSink</a> interface and passing the interface 
  *     pointer as an argument to the <a href="https://docs.microsoft.com/windows/desktop/api/vds/nf-vds-ivdsservice-advise">IVdsService::Advise</a> 
  *     method.
  * 
  * To get the portal group object, use the <a href="https://docs.microsoft.com/windows/desktop/api/vds/nf-vds-ivdsservice-getobject">IVdsService::GetObject</a> method. You can then use the <a href="https://docs.microsoft.com/windows/desktop/api/vdshwprv/nf-vdshwprv-ivdsiscsiportalgroup-getproperties">IVdsIscsiPortalGroup::GetProperties</a> method to get the portal group properties.
 * @see https://learn.microsoft.com/windows/win32/api/vdshwprv/ns-vdshwprv-vds_portal_group_notification
 * @namespace Windows.Win32.Storage.VirtualDiskService
 * @version v4.0.30319
 */
class VDS_PORTAL_GROUP_NOTIFICATION extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * Determines the iSCSI portal group event for which an application will be notified, as one of the following 
     *       values.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="VDS_NF_PORTAL_GROUP_ARRIVE"></a><a id="vds_nf_portal_group_arrive"></a><dl>
     * <dt><b>VDS_NF_PORTAL_GROUP_ARRIVE</b></dt>
     * <dt>129</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An iSCSI portal group has been created.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="VDS_NF_PORTAL_GROUP_DEPART"></a><a id="vds_nf_portal_group_depart"></a><dl>
     * <dt><b>VDS_NF_PORTAL_GROUP_DEPART</b></dt>
     * <dt>130</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An existing iSCSI portal group has been deleted.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="VDS_NF_PORTAL_GROUP_MODIFY"></a><a id="vds_nf_portal_group_modify"></a><dl>
     * <dt><b>VDS_NF_PORTAL_GROUP_MODIFY</b></dt>
     * <dt>131</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An existing iSCSI portal group has changed. An example of change that triggers this notification would be 
     *         changes to the <a href="https://docs.microsoft.com/windows/desktop/api/vdshwprv/ns-vdshwprv-vds_iscsi_portalgroup_prop">VDS_ISCSI_PORTALGROUP_PROP</a> 
     *         structure. Applications are responsible for determining the nature of any changes.
     * 
     * </td>
     * </tr>
     * </table>
     * @type {Integer}
     */
    ulEvent {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * The <b>VDS_OBJECT_ID</b> of the iSCSI portal that triggered the event.
     * @type {Pointer<Guid>}
     */
    portalGroupId {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }
}
