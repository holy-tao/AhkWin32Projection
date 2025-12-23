#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * The VDS_NOTIFICATION_TARGET_TYPE enumeration (vdshwprv.h) defines the set of the valid target types of a VDS notification.
 * @remarks
 * The <a href="https://docs.microsoft.com/windows/desktop/api/vdshwprv/ns-vdshwprv-vds_notification">VDS_NOTIFICATION</a> structure includes a <b>VDS_NOTIFICATION_TARGET_TYPE</b> 
 *     value as a member to indicate a notification type. Some values in the <b>VDS_NOTIFICATION_TARGET_TYPE</b> correspond to values in the <a href="https://docs.microsoft.com/windows/desktop/api/vdshwprv/ne-vdshwprv-vds_object_type">VDS_OBJECT_TYPE</a> enumeration. For the integer value of a VDS object type, 
 *     such as a volume or LUN object, see the 
 *     <a href="https://docs.microsoft.com/windows/desktop/api/vdshwprv/ne-vdshwprv-vds_object_type">VDS_OBJECT_TYPE</a> enumeration.
 * 
 * <div class="alert"><b>Note</b>  Additional constants might be added to the <b>VDS_NOTIFICATION_TARGET_TYPE</b> enumeration in future Windows versions. For this reason, your application must be designed to gracefully handle an unrecognized <b>VDS_NOTIFICATION_TARGET_TYPE</b> enumeration constant.</div>
 * <div> </div>
 * @see https://learn.microsoft.com/windows/win32/api/vdshwprv/ne-vdshwprv-vds_notification_target_type
 * @namespace Windows.Win32.Storage.VirtualDiskService
 * @version v4.0.30319
 */
class VDS_NOTIFICATION_TARGET_TYPE extends Win32Enum{

    /**
     * This value is reserved.
     * @type {Integer (Int32)}
     */
    static VDS_NTT_UNKNOWN => 0

    /**
     * The target is a disk pack. This value corresponds to the <b>VDS_OT_PACK</b> value in the  <a href="https://docs.microsoft.com/windows/desktop/api/vdshwprv/ne-vdshwprv-vds_object_type">VDS_OBJECT_TYPE</a> enumeration.
     * @type {Integer (Int32)}
     */
    static VDS_NTT_PACK => 10

    /**
     * The target is a volume. This value corresponds to the <b>VDS_OT_VOLUME</b> value in the  <a href="https://docs.microsoft.com/windows/desktop/api/vdshwprv/ne-vdshwprv-vds_object_type">VDS_OBJECT_TYPE</a> enumeration.
     * @type {Integer (Int32)}
     */
    static VDS_NTT_VOLUME => 11

    /**
     * The target is a disk. This value corresponds to the <b>VDS_OT_DISK</b> value in the  <a href="https://docs.microsoft.com/windows/desktop/api/vdshwprv/ne-vdshwprv-vds_object_type">VDS_OBJECT_TYPE</a> enumeration.
     * @type {Integer (Int32)}
     */
    static VDS_NTT_DISK => 13

    /**
     * The target is a partition.
     * @type {Integer (Int32)}
     */
    static VDS_NTT_PARTITION => 60

    /**
     * The target is a drive letter.
     * @type {Integer (Int32)}
     */
    static VDS_NTT_DRIVE_LETTER => 61

    /**
     * The target is a file system.
     * @type {Integer (Int32)}
     */
    static VDS_NTT_FILE_SYSTEM => 62

    /**
     * The target is a drive letter  or volume GUID path.
     * @type {Integer (Int32)}
     */
    static VDS_NTT_MOUNT_POINT => 63

    /**
     * The target is a subsystem. This value corresponds to the <b>VDS_OT_SUB_SYSTEM</b> value in the  <a href="https://docs.microsoft.com/windows/desktop/api/vdshwprv/ne-vdshwprv-vds_object_type">VDS_OBJECT_TYPE</a> enumeration.
     * @type {Integer (Int32)}
     */
    static VDS_NTT_SUB_SYSTEM => 30

    /**
     * The target is a controller. This value corresponds to the <b>VDS_OT_CONTROLLER</b> value in the  <a href="https://docs.microsoft.com/windows/desktop/api/vdshwprv/ne-vdshwprv-vds_object_type">VDS_OBJECT_TYPE</a> enumeration.
     * @type {Integer (Int32)}
     */
    static VDS_NTT_CONTROLLER => 31

    /**
     * The target is a drive. This value corresponds to the <b>VDS_OT_DRIVE</b> value in the  <a href="https://docs.microsoft.com/windows/desktop/api/vdshwprv/ne-vdshwprv-vds_object_type">VDS_OBJECT_TYPE</a> enumeration.
     * @type {Integer (Int32)}
     */
    static VDS_NTT_DRIVE => 32

    /**
     * The target is a LUN. This value corresponds to the <b>VDS_OT_LUN</b> value in the  <a href="https://docs.microsoft.com/windows/desktop/api/vdshwprv/ne-vdshwprv-vds_object_type">VDS_OBJECT_TYPE</a> enumeration.
     * @type {Integer (Int32)}
     */
    static VDS_NTT_LUN => 33

    /**
     * The target is a controller port.
     *        This value corresponds to the <b>VDS_OT_PORT</b> value in the  <a href="https://docs.microsoft.com/windows/desktop/api/vdshwprv/ne-vdshwprv-vds_object_type">VDS_OBJECT_TYPE</a> enumeration.
     * 
     * <div class="alert"><b>Note</b>  This value is not supported on VDS 1.0.</div>
     * <div> </div>
     * @type {Integer (Int32)}
     */
    static VDS_NTT_PORT => 35

    /**
     * The target is an iSCSI portal.
     *        This value corresponds to the <b>VDS_OT_PORTAL</b> value in the  <a href="https://docs.microsoft.com/windows/desktop/api/vdshwprv/ne-vdshwprv-vds_object_type">VDS_OBJECT_TYPE</a> enumeration.
     * 
     * <div class="alert"><b>Note</b>  This value is not supported on VDS 1.0.</div>
     * <div> </div>
     * @type {Integer (Int32)}
     */
    static VDS_NTT_PORTAL => 36

    /**
     * The target is a target.
     *        This value corresponds to the <b>VDS_OT_TARGET</b> value in the  <a href="https://docs.microsoft.com/windows/desktop/api/vdshwprv/ne-vdshwprv-vds_object_type">VDS_OBJECT_TYPE</a> enumeration.
     * 
     * <div class="alert"><b>Note</b>  This value is not supported on VDS 1.0.</div>
     * <div> </div>
     * @type {Integer (Int32)}
     */
    static VDS_NTT_TARGET => 37

    /**
     * The target is an iSCSI portal group.
     *        This value corresponds to the <b>VDS_PORTAL_GROUP</b> value in the  <a href="https://docs.microsoft.com/windows/desktop/api/vdshwprv/ne-vdshwprv-vds_object_type">VDS_OBJECT_TYPE</a> enumeration.
     * 
     * <div class="alert"><b>Note</b>  This value is not supported on VDS 1.0.</div>
     * <div> </div>
     * @type {Integer (Int32)}
     */
    static VDS_NTT_PORTAL_GROUP => 38

    /**
     * This member is not currently used.
     * @type {Integer (Int32)}
     */
    static VDS_NTT_SERVICE => 200
}
