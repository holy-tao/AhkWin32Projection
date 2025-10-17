#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\VDS_PACK_NOTIFICATION.ahk
#Include .\VDS_DISK_NOTIFICATION.ahk
#Include .\VDS_VOLUME_NOTIFICATION.ahk
#Include .\VDS_PARTITION_NOTIFICATION.ahk
#Include .\VDS_DRIVE_LETTER_NOTIFICATION.ahk
#Include .\VDS_FILE_SYSTEM_NOTIFICATION.ahk
#Include .\VDS_MOUNT_POINT_NOTIFICATION.ahk
#Include .\VDS_SUB_SYSTEM_NOTIFICATION.ahk
#Include .\VDS_CONTROLLER_NOTIFICATION.ahk
#Include .\VDS_DRIVE_NOTIFICATION.ahk
#Include .\VDS_LUN_NOTIFICATION.ahk
#Include .\VDS_PORT_NOTIFICATION.ahk
#Include .\VDS_PORTAL_NOTIFICATION.ahk
#Include .\VDS_TARGET_NOTIFICATION.ahk
#Include .\VDS_PORTAL_GROUP_NOTIFICATION.ahk
#Include .\VDS_SERVICE_NOTIFICATION.ahk

/**
 * Defines the VDS notification structures specific to each notification target type (subject).
 * @remarks
 * 
  * Applications pass this structure in the <i>pNotificationArray</i> parameter of  the 
  *     <a href="https://docs.microsoft.com/windows/desktop/api/vdshwprv/nf-vdshwprv-ivdsadvisesink-onnotify">IVdsAdviseSink::OnNotify</a> method.
  * 
  * The members of this structure are aligned on an 8-byte boundary.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//vds/ns-vds-vds_notification
 * @namespace Windows.Win32.Storage.VirtualDiskService
 * @version v4.0.30319
 */
class VDS_NOTIFICATION extends Win32Struct
{
    static sizeof => 40

    static packingSize => 8

    /**
     * Discriminant for the union enumerated by 
     *       <a href="https://docs.microsoft.com/windows/desktop/api/vdshwprv/ne-vdshwprv-vds_notification_target_type">VDS_NOTIFICATION_TARGET_TYPE</a>.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="VDS_NTT_PACK"></a><a id="vds_ntt_pack"></a><dl>
     * <dt><b><b>VDS_NTT_PACK</b></b></dt>
     * <dt>10</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The subject of the notification is a disk pack. Use the <b>Pack</b> member 
     *         structure.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="VDS_NTT_DISK"></a><a id="vds_ntt_disk"></a><dl>
     * <dt><b><b>VDS_NTT_DISK</b></b></dt>
     * <dt>13</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The subject of the notification is a disk. Use the <b>Disk</b> member 
     *         structure.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="VDS_NTT_VOLUME"></a><a id="vds_ntt_volume"></a><dl>
     * <dt><b><b>VDS_NTT_VOLUME</b></b></dt>
     * <dt>11</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The subject of the notification is a volume. Use the <b>Volume</b> member 
     *         structure.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="VDS_NTT_PARTITION"></a><a id="vds_ntt_partition"></a><dl>
     * <dt><b><b>VDS_NTT_PARTITION</b></b></dt>
     * <dt>60</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The subject of the notification is a partition. Use the <b>Partition</b> member 
     *         structure.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="VDS_NTT_DRIVE_LETTER"></a><a id="vds_ntt_drive_letter"></a><dl>
     * <dt><b><b>VDS_NTT_DRIVE_LETTER</b></b></dt>
     * <dt>61</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The subject of the notification is a drive letter. Use the <b>Letter</b> member 
     *         structure.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="VDS_NTT_FILE_SYSTEM"></a><a id="vds_ntt_file_system"></a><dl>
     * <dt><b><b>VDS_NTT_FILE_SYSTEM</b></b></dt>
     * <dt>62</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The subject of the notification is a file system. Use the <b>FileSystem</b> member 
     *         structure.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="VDS_NTT_MOUNT_POINT"></a><a id="vds_ntt_mount_point"></a><dl>
     * <dt><b><b>VDS_NTT_MOUNT_POINT</b></b></dt>
     * <dt>63</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The subject of the notification is a drive letter  or volume GUID path. Use the <b>MountPoint</b> member 
     *         structure.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="VDS_NTT_SUB_SYSTEM"></a><a id="vds_ntt_sub_system"></a><dl>
     * <dt><b><b>VDS_NTT_SUB_SYSTEM</b></b></dt>
     * <dt>30</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Used by hardware providers. The subject of the notification is a subsystem. Use the 
     *         <b>SubSystem</b> member structure.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="VDS_NTT_CONTROLLER"></a><a id="vds_ntt_controller"></a><dl>
     * <dt><b><b>VDS_NTT_CONTROLLER</b></b></dt>
     * <dt>31</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Used by hardware providers. The subject of the notification is a controller. Use the 
     *         <b>Controller</b> member structure.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="VDS_NTT_DRIVE"></a><a id="vds_ntt_drive"></a><dl>
     * <dt><b><b>VDS_NTT_DRIVE</b></b></dt>
     * <dt>32</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Used by hardware providers. The subject of the notification is a drive. Use the 
     *         <b>Drive</b> member structure.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="VDS_NTT_LUN"></a><a id="vds_ntt_lun"></a><dl>
     * <dt><b><b>VDS_NTT_LUN</b></b></dt>
     * <dt>33</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Used by hardware providers. The subject of the notification is a LUN. Use the 
     *         <b>Lun</b> member structure.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="VDS_NTT_PORT"></a><a id="vds_ntt_port"></a><dl>
     * <dt><b><b>VDS_NTT_PORT</b></b></dt>
     * <dt>35</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The subject of the notification is a controller port. Use the 
     *         <b>Port</b> member structure.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="VDS_NTT_PORTAL"></a><a id="vds_ntt_portal"></a><dl>
     * <dt><b><b>VDS_NTT_PORTAL</b></b></dt>
     * <dt>36</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The subject of the notification is an iSCSI portal. Use the 
     *         <b>Portal</b> member structure.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="VDS_NTT_TARGET"></a><a id="vds_ntt_target"></a><dl>
     * <dt><b><b>VDS_NTT_TARGET</b></b></dt>
     * <dt>37</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The subject of the notification is an iSCSI target. Use the 
     *         <b>Target</b> member structure.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="VDS_NTT_PORTAL_GROUP"></a><a id="vds_ntt_portal_group"></a><dl>
     * <dt><b><b>VDS_NTT_PORTAL_GROUP</b></b></dt>
     * <dt>38</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The subject of the notification is an iSCSI portal group. Use the 
     *         <b>PortalGroup</b> member structure.
     * 
     * </td>
     * </tr>
     * </table>
     * @type {Integer}
     */
    objectType {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * @type {VDS_PACK_NOTIFICATION}
     */
    Pack{
        get {
            if(!this.HasProp("__Pack"))
                this.__Pack := VDS_PACK_NOTIFICATION(8, this)
            return this.__Pack
        }
    }

    /**
     * @type {VDS_DISK_NOTIFICATION}
     */
    Disk{
        get {
            if(!this.HasProp("__Disk"))
                this.__Disk := VDS_DISK_NOTIFICATION(8, this)
            return this.__Disk
        }
    }

    /**
     * @type {VDS_VOLUME_NOTIFICATION}
     */
    Volume{
        get {
            if(!this.HasProp("__Volume"))
                this.__Volume := VDS_VOLUME_NOTIFICATION(8, this)
            return this.__Volume
        }
    }

    /**
     * @type {VDS_PARTITION_NOTIFICATION}
     */
    Partition{
        get {
            if(!this.HasProp("__Partition"))
                this.__Partition := VDS_PARTITION_NOTIFICATION(8, this)
            return this.__Partition
        }
    }

    /**
     * @type {VDS_DRIVE_LETTER_NOTIFICATION}
     */
    Letter{
        get {
            if(!this.HasProp("__Letter"))
                this.__Letter := VDS_DRIVE_LETTER_NOTIFICATION(8, this)
            return this.__Letter
        }
    }

    /**
     * @type {VDS_FILE_SYSTEM_NOTIFICATION}
     */
    FileSystem{
        get {
            if(!this.HasProp("__FileSystem"))
                this.__FileSystem := VDS_FILE_SYSTEM_NOTIFICATION(8, this)
            return this.__FileSystem
        }
    }

    /**
     * @type {VDS_MOUNT_POINT_NOTIFICATION}
     */
    MountPoint{
        get {
            if(!this.HasProp("__MountPoint"))
                this.__MountPoint := VDS_MOUNT_POINT_NOTIFICATION(8, this)
            return this.__MountPoint
        }
    }

    /**
     * @type {VDS_SUB_SYSTEM_NOTIFICATION}
     */
    SubSystem{
        get {
            if(!this.HasProp("__SubSystem"))
                this.__SubSystem := VDS_SUB_SYSTEM_NOTIFICATION(8, this)
            return this.__SubSystem
        }
    }

    /**
     * @type {VDS_CONTROLLER_NOTIFICATION}
     */
    Controller{
        get {
            if(!this.HasProp("__Controller"))
                this.__Controller := VDS_CONTROLLER_NOTIFICATION(8, this)
            return this.__Controller
        }
    }

    /**
     * @type {VDS_DRIVE_NOTIFICATION}
     */
    Drive{
        get {
            if(!this.HasProp("__Drive"))
                this.__Drive := VDS_DRIVE_NOTIFICATION(8, this)
            return this.__Drive
        }
    }

    /**
     * @type {VDS_LUN_NOTIFICATION}
     */
    Lun{
        get {
            if(!this.HasProp("__Lun"))
                this.__Lun := VDS_LUN_NOTIFICATION(8, this)
            return this.__Lun
        }
    }

    /**
     * @type {VDS_PORT_NOTIFICATION}
     */
    Port{
        get {
            if(!this.HasProp("__Port"))
                this.__Port := VDS_PORT_NOTIFICATION(8, this)
            return this.__Port
        }
    }

    /**
     * @type {VDS_PORTAL_NOTIFICATION}
     */
    Portal{
        get {
            if(!this.HasProp("__Portal"))
                this.__Portal := VDS_PORTAL_NOTIFICATION(8, this)
            return this.__Portal
        }
    }

    /**
     * @type {VDS_TARGET_NOTIFICATION}
     */
    Target{
        get {
            if(!this.HasProp("__Target"))
                this.__Target := VDS_TARGET_NOTIFICATION(8, this)
            return this.__Target
        }
    }

    /**
     * @type {VDS_PORTAL_GROUP_NOTIFICATION}
     */
    PortalGroup{
        get {
            if(!this.HasProp("__PortalGroup"))
                this.__PortalGroup := VDS_PORTAL_GROUP_NOTIFICATION(8, this)
            return this.__PortalGroup
        }
    }

    /**
     * @type {VDS_SERVICE_NOTIFICATION}
     */
    Service{
        get {
            if(!this.HasProp("__Service"))
                this.__Service := VDS_SERVICE_NOTIFICATION(8, this)
            return this.__Service
        }
    }
}
