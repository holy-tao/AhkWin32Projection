#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Defines the set of valid flags for the service object.
 * @remarks
 * 
 * This enumeration provides the values for the <i>ulFlags</i> member of the 
 *     <a href="https://docs.microsoft.com/windows/desktop/api/vds/ns-vds-vds_service_prop">VDS_SERVICE_PROP</a> structure. The 
 *     <a href="https://docs.microsoft.com/windows/desktop/api/vds/nf-vds-ivdsservice-setflags">IVdsService::SetFlags</a> method passes the value as an 
 *     argument to set the <b>VDS_SVF_AUTO_MOUNT_OFF</b> flag.
 * 
 * <b>Windows Server 2003:  </b>Many of these enumerators are specific to the Windows Server 2003 platform, which supports 
 *       both 1394 and USB devices.
 * 
 * <div class="alert"><b>Note</b>  Additional constants might be added to the <b>VDS_SERVICE_FLAG</b> enumeration in future Windows versions. For this reason, your application must be designed to gracefully handle an unrecognized <b>VDS_SERVICE_FLAG</b> enumeration constant.</div>
 * <div> </div>
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//vds/ne-vds-vds_service_flag
 * @namespace Windows.Win32.Storage.VirtualDiskService
 * @version v4.0.30319
 */
class VDS_SERVICE_FLAG extends Win32Enum{

    /**
     * If set, the service supports dynamic disks.
     * @type {Integer (Int32)}
     */
    static VDS_SVF_SUPPORT_DYNAMIC => 1

    /**
     * If set, the service supports fault-tolerant volumes.
     * @type {Integer (Int32)}
     */
    static VDS_SVF_SUPPORT_FAULT_TOLERANT => 2

    /**
     * If set, the service supports GPT disks.
     * @type {Integer (Int32)}
     */
    static VDS_SVF_SUPPORT_GPT => 4

    /**
     * If set, the service supports dynamic 1394 disks.
     * @type {Integer (Int32)}
     */
    static VDS_SVF_SUPPORT_DYNAMIC_1394 => 8

    /**
     * If set, the host has the cluster service installed and configured, but not necessarily running.
     * @type {Integer (Int32)}
     */
    static VDS_SVF_CLUSTER_SERVICE_CONFIGURED => 16

    /**
     * If set, the auto-mount operation is turned off for the computer to prevent the operating system from 
     *       automatically mounting new partitions.
     * 
     * <div class="alert"><b>Note</b>  Beginning with Windows 8 and Windows Server 2012, this flag is deprecated. Instead, use the <a href="https://docs.microsoft.com/windows/desktop/api/vds/ne-vds-vds_san_policy">VDS_SAN_POLICY</a> enumeration to control default disk mounting behavior.</div>
     * <div> </div>
     * @type {Integer (Int32)}
     */
    static VDS_SVF_AUTO_MOUNT_OFF => 32

    /**
     * If set, configuration changes to VDS have occurred. After a successful installation, the uninstall 
     *       operation is valid only if the configuration changes.
     * @type {Integer (Int32)}
     */
    static VDS_SVF_OS_UNINSTALL_VALID => 64

    /**
     * If set, the machine boots from an EFI partition on a GPT disk.
     * 
     * <b>Windows Server 2003:  </b>This flag is not supported before Windows Server 2003 with SP1.
     * @type {Integer (Int32)}
     */
    static VDS_SVF_EFI => 128

    /**
     * The service supports mirrored volumes.
     * 
     * <b>Windows Server 2008, Windows Vista and Windows Server 2003:  </b>Not supported.
     * @type {Integer (Int32)}
     */
    static VDS_SVF_SUPPORT_MIRROR => 256

    /**
     * The service supports RAID-5 volumes.
     * 
     * <b>Windows Server 2008, Windows Vista and Windows Server 2003:  </b>Not supported.
     * @type {Integer (Int32)}
     */
    static VDS_SVF_SUPPORT_RAID5 => 512

    /**
     * 
     * @type {Integer (Int32)}
     */
    static VDS_SVF_SUPPORT_REFS => 1024
}
