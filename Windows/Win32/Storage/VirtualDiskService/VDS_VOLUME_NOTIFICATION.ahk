#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Defines the details of volume events.
 * @remarks
 * 
 * The <a href="https://docs.microsoft.com/windows/desktop/api/vdshwprv/ns-vdshwprv-vds_notification">VDS_NOTIFICATION</a> structure includes this 
 *     structure as a member.
 * 
 * An application can receive volume events by implementing the 
 *     <a href="https://docs.microsoft.com/windows/desktop/api/vdshwprv/nn-vdshwprv-ivdsadvisesink">IVdsAdviseSink</a> interface and passing the interface 
 *     pointer as an argument to the <a href="https://docs.microsoft.com/windows/desktop/api/vds/nf-vds-ivdsservice-advise">IVdsService::Advise</a> 
 *     method.
 * 
 * To get the volume object, use the <a href="https://docs.microsoft.com/windows/desktop/api/vds/nf-vds-ivdsservice-getobject">IVdsService::GetObject</a> method. You can then use the <a href="https://docs.microsoft.com/windows/desktop/api/vds/nf-vds-ivdsvolume-getproperties">IVdsVolume::GetProperties</a> method or the <a href="https://docs.microsoft.com/windows/desktop/api/vds/nf-vds-ivdsvolume2-getproperties2">IVdsVolume2::GetProperties2</a> method to get the volume properties.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//vds/ns-vds-vds_volume_notification
 * @namespace Windows.Win32.Storage.VirtualDiskService
 * @version v4.0.30319
 */
class VDS_VOLUME_NOTIFICATION extends Win32Struct
{
    static sizeof => 32

    static packingSize => 8

    /**
     * Determines the volume event for which an application will be notified, as one of the following 
     *       values.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="VDS_NF_VOLUME_ARRIVE"></a><a id="vds_nf_volume_arrive"></a><dl>
     * <dt><b>VDS_NF_VOLUME_ARRIVE</b></dt>
     * <dt>4</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A new volume arrived.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="VDS_NF_VOLUME_DEPART"></a><a id="vds_nf_volume_depart"></a><dl>
     * <dt><b>VDS_NF_VOLUME_DEPART</b></dt>
     * <dt>5</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An existing volume was removed.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="VDS_NF_VOLUME_MODIFY"></a><a id="vds_nf_volume_modify"></a><dl>
     * <dt><b>VDS_NF_VOLUME_MODIFY</b></dt>
     * <dt>6</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A member of the <a href="https://docs.microsoft.com/windows/desktop/api/vds/ns-vds-vds_volume_prop">VDS_VOLUME_PROP</a> structure 
     *         changed. This value can also indicate a change in one of the plexes associated with the volume, such as 
     *        the addition, removal, or repair of a plex.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="VDS_NF_VOLUME_REBUILDING_PROGRESS"></a><a id="vds_nf_volume_rebuilding_progress"></a><dl>
     * <dt><b>VDS_NF_VOLUME_REBUILDING_PROGRESS</b></dt>
     * <dt>7</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A volume is being rebuilt.
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
     * The <b>VDS_OBJECT_ID</b> of the volume that triggered the event.
     * @type {Pointer<Guid>}
     */
    volumeId {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * The <b>VDS_OBJECT_ID</b> of a volume plex. VDS applies this identifier during the 
     *       rebuild operation, which can execute on multiple plexes at different rates.
     * @type {Pointer<Guid>}
     */
    plexId {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }

    /**
     * The degree to which the operation is complete.
     * @type {Integer}
     */
    ulPercentCompleted {
        get => NumGet(this, 24, "uint")
        set => NumPut("uint", value, this, 24)
    }
}
