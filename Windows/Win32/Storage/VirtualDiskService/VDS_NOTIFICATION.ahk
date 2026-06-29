#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\VDS_PARTITION_NOTIFICATION.ahk" { VDS_PARTITION_NOTIFICATION }
#Import ".\VDS_DRIVE_LETTER_NOTIFICATION.ahk" { VDS_DRIVE_LETTER_NOTIFICATION }
#Import ".\VDS_PACK_NOTIFICATION.ahk" { VDS_PACK_NOTIFICATION }
#Import ".\VDS_PORTAL_NOTIFICATION.ahk" { VDS_PORTAL_NOTIFICATION }
#Import ".\VDS_RECOVER_ACTION.ahk" { VDS_RECOVER_ACTION }
#Import ".\VDS_CONTROLLER_NOTIFICATION.ahk" { VDS_CONTROLLER_NOTIFICATION }
#Import ".\VDS_NF_DISK.ahk" { VDS_NF_DISK }
#Import ".\VDS_NF_CONTROLLER.ahk" { VDS_NF_CONTROLLER }
#Import ".\VDS_SERVICE_NOTIFICATION.ahk" { VDS_SERVICE_NOTIFICATION }
#Import ".\VDS_MOUNT_POINT_NOTIFICATION.ahk" { VDS_MOUNT_POINT_NOTIFICATION }
#Import ".\VDS_FILE_SYSTEM_NOTIFICATION.ahk" { VDS_FILE_SYSTEM_NOTIFICATION }
#Import ".\VDS_DISK_NOTIFICATION.ahk" { VDS_DISK_NOTIFICATION }
#Import ".\VDS_NF_PACK.ahk" { VDS_NF_PACK }
#Import ".\VDS_NF_LUN.ahk" { VDS_NF_LUN }
#Import ".\VDS_NF_DRIVE.ahk" { VDS_NF_DRIVE }
#Import ".\VDS_NF_FILE_SYSTEM.ahk" { VDS_NF_FILE_SYSTEM }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\VDS_LUN_NOTIFICATION.ahk" { VDS_LUN_NOTIFICATION }
#Import ".\VDS_DRIVE_NOTIFICATION.ahk" { VDS_DRIVE_NOTIFICATION }
#Import ".\VDS_TARGET_NOTIFICATION.ahk" { VDS_TARGET_NOTIFICATION }
#Import ".\VDS_NF_PORT.ahk" { VDS_NF_PORT }
#Import ".\VDS_PORT_NOTIFICATION.ahk" { VDS_PORT_NOTIFICATION }
#Import ".\VDS_NOTIFICATION_TARGET_TYPE.ahk" { VDS_NOTIFICATION_TARGET_TYPE }
#Import ".\VDS_VOLUME_NOTIFICATION.ahk" { VDS_VOLUME_NOTIFICATION }
#Import ".\VDS_PORTAL_GROUP_NOTIFICATION.ahk" { VDS_PORTAL_GROUP_NOTIFICATION }
#Import ".\VDS_SUB_SYSTEM_NOTIFICATION.ahk" { VDS_SUB_SYSTEM_NOTIFICATION }

/**
 * The VDS_NOTIFICATION structure (vdshwprv.h) defines the VDS notification structures specific to each notification target type (subject).
 * @remarks
 * Applications pass this structure in the <i>pNotificationArray</i> parameter of  the 
 *     <a href="https://docs.microsoft.com/windows/desktop/api/vdshwprv/nf-vdshwprv-ivdsadvisesink-onnotify">IVdsAdviseSink::OnNotify</a> method.
 * 
 * The members of this structure are aligned on an 8-byte boundary.
 * @see https://learn.microsoft.com/windows/win32/api/vdshwprv/ns-vdshwprv-vds_notification
 * @namespace Windows.Win32.Storage.VirtualDiskService
 */
export default struct VDS_NOTIFICATION {
    #StructPack 8

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
     */
    objectType : VDS_NOTIFICATION_TARGET_TYPE

    Pack : VDS_PACK_NOTIFICATION

    static __New() {
        DefineProp(this.Prototype, 'Disk', { type: VDS_DISK_NOTIFICATION, offset: 8 })
        DefineProp(this.Prototype, 'Volume', { type: VDS_VOLUME_NOTIFICATION, offset: 8 })
        DefineProp(this.Prototype, 'Partition', { type: VDS_PARTITION_NOTIFICATION, offset: 8 })
        DefineProp(this.Prototype, 'Letter', { type: VDS_DRIVE_LETTER_NOTIFICATION, offset: 8 })
        DefineProp(this.Prototype, 'FileSystem', { type: VDS_FILE_SYSTEM_NOTIFICATION, offset: 8 })
        DefineProp(this.Prototype, 'MountPoint', { type: VDS_MOUNT_POINT_NOTIFICATION, offset: 8 })
        DefineProp(this.Prototype, 'SubSystem', { type: VDS_SUB_SYSTEM_NOTIFICATION, offset: 8 })
        DefineProp(this.Prototype, 'Controller', { type: VDS_CONTROLLER_NOTIFICATION, offset: 8 })
        DefineProp(this.Prototype, 'Drive', { type: VDS_DRIVE_NOTIFICATION, offset: 8 })
        DefineProp(this.Prototype, 'Lun', { type: VDS_LUN_NOTIFICATION, offset: 8 })
        DefineProp(this.Prototype, 'Port', { type: VDS_PORT_NOTIFICATION, offset: 8 })
        DefineProp(this.Prototype, 'Portal', { type: VDS_PORTAL_NOTIFICATION, offset: 8 })
        DefineProp(this.Prototype, 'Target', { type: VDS_TARGET_NOTIFICATION, offset: 8 })
        DefineProp(this.Prototype, 'PortalGroup', { type: VDS_PORTAL_GROUP_NOTIFICATION, offset: 8 })
        DefineProp(this.Prototype, 'Service', { type: VDS_SERVICE_NOTIFICATION, offset: 8 })
        this.DeleteProp("__New")
    }
}
