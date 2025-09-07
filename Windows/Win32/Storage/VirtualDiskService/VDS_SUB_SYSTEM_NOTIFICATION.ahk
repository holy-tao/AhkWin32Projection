#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The VDS_SUB_SYSTEM_NOTIFICATION structure (vdshwprv.h) defines the details of subsystem events.
 * @remarks
 * The <a href="https://docs.microsoft.com/windows/desktop/api/vdshwprv/ns-vdshwprv-vds_notification">VDS_NOTIFICATION</a> structure includes this 
  *     structure as a member.
  * 
  * An application can receive subsystem events by implementing the 
  *     <a href="https://docs.microsoft.com/windows/desktop/api/vdshwprv/nn-vdshwprv-ivdsadvisesink">IVdsAdviseSink</a> interface and passing the interface 
  *     pointer as an argument to the 
  *     <a href="https://docs.microsoft.com/windows/desktop/api/vds/nf-vds-ivdsservice-advise">IVdsService::Advise</a> method.
  * 
  * To get the subsystem object, use the <a href="https://docs.microsoft.com/windows/desktop/api/vds/nf-vds-ivdsservice-getobject">IVdsService::GetObject</a> method. You can then use the <a href="https://docs.microsoft.com/windows/desktop/api/vdshwprv/nf-vdshwprv-ivdssubsystem-getproperties">IVdsSubSystem::GetProperties</a> method or the <a href="https://docs.microsoft.com/windows/desktop/api/vdshwprv/nf-vdshwprv-ivdssubsystem2-getproperties2">IVdsSubSystem2::GetProperties2</a> methodto get the subsystem properties.
 * @see https://learn.microsoft.com/windows/win32/api/vdshwprv/ns-vdshwprv-vds_sub_system_notification
 * @namespace Windows.Win32.Storage.VirtualDiskService
 * @version v4.0.30319
 */
class VDS_SUB_SYSTEM_NOTIFICATION extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * Determines the subsystem event for which an application will be notified, as one of the following 
     *       values.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="VDS_NF_SUB_SYSTEM_ARRIVE"></a><a id="vds_nf_sub_system_arrive"></a><dl>
     * <dt><b>VDS_NF_SUB_SYSTEM_ARRIVE</b></dt>
     * <dt>101</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A new subsystem was connected to the server or network.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="VDS_NF_SUB_SYSTEM_DEPART"></a><a id="vds_nf_sub_system_depart"></a><dl>
     * <dt><b>VDS_NF_SUB_SYSTEM_DEPART</b></dt>
     * <dt>102</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An existing subsystem was disconnected.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="VDS_NF_SUB_SYSTEM_MODIFY"></a><a id="vds_nf_sub_system_modify"></a><dl>
     * <dt><b>VDS_NF_SUB_SYSTEM_MODIFY</b></dt>
     * <dt>151</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A member of the <a href="https://docs.microsoft.com/windows/desktop/api/vdshwprv/ns-vdshwprv-vds_sub_system_prop">VDS_SUB_SYSTEM_PROP</a> 
     *         structure was changed.
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
     * The subsystem's GUID.
     * @type {Pointer<Guid>}
     */
    subSystemId {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }
}
