#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * The VDS_VOLUME_NOTIFICATION structure (vdshwprv.h) defines the details of volume events.
 * @remarks
 * The <a href="https://docs.microsoft.com/windows/desktop/api/vdshwprv/ns-vdshwprv-vds_notification">VDS_NOTIFICATION</a> structure includes this 
 *     structure as a member.
 * 
 * An application can receive volume events by implementing the 
 *     <a href="https://docs.microsoft.com/windows/desktop/api/vdshwprv/nn-vdshwprv-ivdsadvisesink">IVdsAdviseSink</a> interface and passing the interface 
 *     pointer as an argument to the <a href="https://docs.microsoft.com/windows/desktop/api/vds/nf-vds-ivdsservice-advise">IVdsService::Advise</a> 
 *     method.
 * 
 * To get the volume object, use the <a href="https://docs.microsoft.com/windows/desktop/api/vds/nf-vds-ivdsservice-getobject">IVdsService::GetObject</a> method. You can then use the <a href="https://docs.microsoft.com/windows/desktop/api/vds/nf-vds-ivdsvolume-getproperties">IVdsVolume::GetProperties</a> method or the <a href="https://docs.microsoft.com/windows/desktop/api/vds/nf-vds-ivdsvolume2-getproperties2">IVdsVolume2::GetProperties2</a> method to get the volume properties.
 * @see https://learn.microsoft.com/windows/win32/api/vdshwprv/ns-vdshwprv-vds_volume_notification
 * @namespace Windows.Win32.Storage.VirtualDiskService
 */
class VDS_VOLUME_NOTIFICATION extends Win32Struct {
    static sizeof => 40

    static packingSize => 4

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
     * @type {Guid}
     */
    volumeId {
        get {
            if(!this.HasProp("__volumeId"))
                this.__volumeId := Guid(4, this)
            return this.__volumeId
        }
    }

    /**
     * The <b>VDS_OBJECT_ID</b> of a volume plex. VDS applies this identifier during the 
     *       rebuild operation, which can execute on multiple plexes at different rates.
     * @type {Guid}
     */
    plexId {
        get {
            if(!this.HasProp("__plexId"))
                this.__plexId := Guid(20, this)
            return this.__plexId
        }
    }

    /**
     * The degree to which the operation is complete.
     * @type {Integer}
     */
    ulPercentCompleted {
        get => NumGet(this, 36, "uint")
        set => NumPut("uint", value, this, 36)
    }
}
