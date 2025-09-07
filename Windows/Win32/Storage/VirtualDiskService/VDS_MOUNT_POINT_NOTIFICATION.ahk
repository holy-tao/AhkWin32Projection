#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The VDS_MOUNT_POINT_NOTIFICATION structure (vdshwprv.h) represents data returned by the software provider because a drive letter or volume GUID path changed.
 * @remarks
 * The <a href="https://docs.microsoft.com/windows/desktop/api/vdshwprv/ns-vdshwprv-vds_notification">VDS_NOTIFICATION</a> structure includes this 
  *     structure as a member.
  * 
  * An application can receive these event notifications by implementing the 
  *     <a href="https://docs.microsoft.com/windows/desktop/api/vdshwprv/nn-vdshwprv-ivdsadvisesink">IVdsAdviseSink</a> interface and passing the interface 
  *     pointer as an argument to the <a href="https://docs.microsoft.com/windows/desktop/api/vds/nf-vds-ivdsservice-advise">IVdsService::Advise</a> 
  *     method.
 * @see https://learn.microsoft.com/windows/win32/api/vdshwprv/ns-vdshwprv-vds_mount_point_notification
 * @namespace Windows.Win32.Storage.VirtualDiskService
 * @version v4.0.30319
 */
class VDS_MOUNT_POINT_NOTIFICATION extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * Determines the event for which an application will be notified, as the following value.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="VDS_NF_MOUNT_POINTS_CHANGE"></a><a id="vds_nf_mount_points_change"></a><dl>
     * <dt><b>VDS_NF_MOUNT_POINTS_CHANGE</b></dt>
     * <dt>205</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The drive letter  or volume GUID path changed.
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
     * The GUID of the volume object associated with the drive letter or volume GUID path that triggered the event.
     * @type {Pointer<Guid>}
     */
    volumeId {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }
}
