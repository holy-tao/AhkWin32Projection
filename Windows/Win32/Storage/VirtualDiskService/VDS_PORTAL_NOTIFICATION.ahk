#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The VDS_PORTAL_NOTIFICATION structure (vdshwprv.h) defines the details of iSCSI portal events.
 * @remarks
 * The <a href="https://docs.microsoft.com/windows/desktop/api/vdshwprv/ns-vdshwprv-vds_notification">VDS_NOTIFICATION</a> structure includes this 
 *     structure as a member.
 * 
 * An application can receive disk events by implementing the 
 *     <a href="https://docs.microsoft.com/windows/desktop/api/vdshwprv/nn-vdshwprv-ivdsadvisesink">IVdsAdviseSink</a> interface and passing the interface 
 *     pointer as an argument to the <a href="https://docs.microsoft.com/windows/desktop/api/vds/nf-vds-ivdsservice-advise">IVdsService::Advise</a> 
 *     method.
 * 
 * To get the portal object, use the <a href="https://docs.microsoft.com/windows/desktop/api/vds/nf-vds-ivdsservice-getobject">IVdsService::GetObject</a> method. You can then use the <a href="https://docs.microsoft.com/windows/desktop/api/vdshwprv/nf-vdshwprv-ivdsiscsiportal-getproperties">IVdsIscsiPortal::GetProperties</a> method to get the portal properties.
 * @see https://learn.microsoft.com/windows/win32/api/vdshwprv/ns-vdshwprv-vds_portal_notification
 * @namespace Windows.Win32.Storage.VirtualDiskService
 * @version v4.0.30319
 */
class VDS_PORTAL_NOTIFICATION extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * Determines the iSCSI portal event for which an application will be notified, as one of the following 
     *       values.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="VDS_NF_PORTAL_ARRIVE"></a><a id="vds_nf_portal_arrive"></a><dl>
     * <dt><b>VDS_NF_PORTAL_ARRIVE</b></dt>
     * <dt>123</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An iSCSI portal has been created.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="VDS_NF_PORTAL_DEPART"></a><a id="vds_nf_portal_depart"></a><dl>
     * <dt><b>VDS_NF_PORTAL_DEPART</b></dt>
     * <dt>124</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An existing iSCSI portal has been removed.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="VDS_NF_PORTAL_MODIFY"></a><a id="vds_nf_portal_modify"></a><dl>
     * <dt><b>VDS_NF_PORTAL_MODIFY</b></dt>
     * <dt>125</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An existing iSCSI portal has changed. An example of change that triggers this notification would be
     *         changes to the <a href="https://docs.microsoft.com/windows/desktop/api/vdshwprv/ns-vdshwprv-vds_iscsi_portal_prop">VDS_ISCSI_PORTAL_PROP</a> 
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
    portalId {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }
}
