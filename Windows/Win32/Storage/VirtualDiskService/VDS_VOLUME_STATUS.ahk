#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Defines the set of object status values for a volume.
 * @remarks
 * 
 * When the <a href="https://docs.microsoft.com/windows/desktop/api/vds/nf-vds-ivdspack-getproperties">IVdsPack::GetProperties</a> method returns a <a href="https://docs.microsoft.com/windows/desktop/api/vds/ns-vds-vds_pack_prop">VDS_PACK_PROP</a> structure whose <b>status</b> member is VDS_PS_OFFLINE, VDS sets the status for all the  volumes in the pack to VDS_VS_FAILED. VDS sets the status for specific volume types to VDS_VS_FAILED under the following conditions:
 * 
 * <ul>
 * <li>For simple, spanned, and striped volumes—whenever a disk is missing.</li>
 * <li>For mirrored volumes—when any disk, except the last disk, is missing or has write errors that  the plex transitions to a detached condition. Likewise, if it is the last (non-stale) plex and the disk is missing.</li>
 * <li>For stripe with parity (RAID-5)—when the second disk is missing, or if one column becomes detached (because the disk is missing or the column has write errors), and a second disk is missing.</li>
 * </ul>
 * The <a href="https://docs.microsoft.com/windows/desktop/api/vds/ns-vds-vds_volume_prop">VDS_VOLUME_PROP</a>structure includes a <b>VDS_VOLUME_STATUS</b> value as a member to indicate the status of a volume.
 * 
 * <div class="alert"><b>Note</b>  Additional constants might be added to the <b>VDS_VOLUME_STATUS</b> enumeration in future Windows versions. For this reason, your application must be designed to gracefully handle an unrecognized <b>VDS_VOLUME_STATUS</b> enumeration constant.</div>
 * <div> </div>
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//vds/ne-vds-vds_volume_status
 * @namespace Windows.Win32.Storage.VirtualDiskService
 * @version v4.0.30319
 */
class VDS_VOLUME_STATUS extends Win32Enum{

    /**
     * The status of the volume is unknown. This value does not apply to dynamic volumes.
     * @type {Integer (Int32)}
     */
    static VDS_VS_UNKNOWN => 0

    /**
     * The volume is available.
     * @type {Integer (Int32)}
     */
    static VDS_VS_ONLINE => 1

    /**
     * The volume is removable media, such as a CD-ROM.
     * @type {Integer (Int32)}
     */
    static VDS_VS_NO_MEDIA => 3

    /**
     * The volume is unavailable.
     * @type {Integer (Int32)}
     */
    static VDS_VS_FAILED => 5

    /**
     * The volume is offline.
     * 
     * <b>Windows Server 2008, Windows Vista and Windows Server 2003:  </b>Not supported. If the volume is offline, the <b>VDS_VF_PERMANENTLY_DISMOUNTED</b> flag is set in the <b>ulFlags</b> member of the <a href="https://docs.microsoft.com/windows/desktop/api/vds/ns-vds-vds_volume_prop">VDS_VOLUME_PROP</a> or <a href="https://docs.microsoft.com/windows/desktop/api/vds/ns-vds-vds_volume_prop2">VDS_VOLUME_PROP2</a> structure.
     * @type {Integer (Int32)}
     */
    static VDS_VS_OFFLINE => 4
}
