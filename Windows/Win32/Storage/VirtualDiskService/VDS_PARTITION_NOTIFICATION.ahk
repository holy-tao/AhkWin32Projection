#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The VDS_PARTITION_NOTIFICATION structure (vdshwprv.h) defines the details of partition events.
 * @remarks
 * The <a href="https://docs.microsoft.com/windows/desktop/api/vdshwprv/ns-vdshwprv-vds_notification">VDS_NOTIFICATION</a> structure includes this 
 *     structure as a member.
 * 
 * An application can receive partition events by implementing the 
 *     <a href="https://docs.microsoft.com/windows/desktop/api/vdshwprv/nn-vdshwprv-ivdsadvisesink">IVdsAdviseSink</a> interface and passing the interface 
 *     pointer as an argument to the <a href="https://docs.microsoft.com/windows/desktop/api/vds/nf-vds-ivdsservice-advise">IVdsService::Advise</a> 
 *     method.
 * @see https://learn.microsoft.com/windows/win32/api/vdshwprv/ns-vdshwprv-vds_partition_notification
 * @namespace Windows.Win32.Storage.VirtualDiskService
 * @version v4.0.30319
 */
class VDS_PARTITION_NOTIFICATION extends Win32Struct
{
    static sizeof => 24

    static packingSize => 8

    /**
     * Determines the partition event for which an application will be notified, as one of the following 
     *       values.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="VDS_NF_PARTITION_ARRIVE"></a><a id="vds_nf_partition_arrive"></a><dl>
     * <dt><b>VDS_NF_PARTITION_ARRIVE</b></dt>
     * <dt>11</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A new partition arrived. If the partition is a volume, the event also triggers a volume-arrival 
     *         notification.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="VDS_NF_PARTITION_DEPART"></a><a id="vds_nf_partition_depart"></a><dl>
     * <dt><b>VDS_NF_PARTITION_DEPART</b></dt>
     * <dt>12</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An existing partition was removed. If the partition is a volume, the event also triggers a 
     *         volume-departure notification.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="VDS_NF_PARTITION_MODIFY"></a><a id="vds_nf_partition_modify"></a><dl>
     * <dt><b>VDS_NF_PARTITION_MODIFY</b></dt>
     * <dt>13</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A member was changed in the <a href="https://docs.microsoft.com/windows/desktop/api/vds/ns-vds-vds_partition_prop">VDS_PARTITION_PROP</a> 
     *        structure for the partition. If the partition is a volume, and if the properties of the partition have 
     *         changed, a <b>VDS_NF_VOLUME_MODIFY</b> notification is also sent.
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
     * The GUID of the disk containing the partition that triggered the event.
     * @type {Pointer<Guid>}
     */
    diskId {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * The Partition offset.
     * @type {Integer}
     */
    ullOffset {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }
}
