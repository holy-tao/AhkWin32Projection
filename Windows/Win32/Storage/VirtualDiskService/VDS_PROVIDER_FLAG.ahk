#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Defines the set of valid flags for a provider object.
 * @remarks
 * 
 * This enumeration provides the values for the <i>ulFlags</i> member of the 
 *     <a href="https://docs.microsoft.com/windows/desktop/api/vdshwprv/ns-vdshwprv-vds_provider_prop">VDS_PROVIDER_PROP</a> structure.
 * 
 * <div class="alert"><b>Note</b>  Additional constants might be added to the <b>VDS_PROVIDER_FLAG</b> enumeration in future Windows versions. For this reason, your application must be designed to gracefully handle an unrecognized <b>VDS_PROVIDER_FLAG</b> enumeration constant.</div>
 * <div> </div>
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//vds/ne-vds-vds_provider_flag
 * @namespace Windows.Win32.Storage.VirtualDiskService
 * @version v4.0.30319
 */
class VDS_PROVIDER_FLAG extends Win32Enum{

    /**
     * The provider is a dynamic  provider. If this flag is set for the provider of a disk, the disk is dynamic.
     * @type {Integer (Int32)}
     */
    static VDS_PF_DYNAMIC => 1

    /**
     * The operating system supplies this hardware provider to manage an internal hardware controller.
     * @type {Integer (Int32)}
     */
    static VDS_PF_INTERNAL_HARDWARE_PROVIDER => 2

    /**
     * The provider supports single-disk packs only. Typically, the basic provider sets this flag to 
     *       simulate a pack with one disk.
     * @type {Integer (Int32)}
     */
    static VDS_PF_ONE_DISK_ONLY_PER_PACK => 4

    /**
     * The provider is a dynamic provider that supports online status for only one pack at a time. 
     *      
     * 
     * <b>Windows Server 2003:  </b>Only applies to this release.
     * @type {Integer (Int32)}
     */
    static VDS_PF_ONE_PACK_ONLINE_ONLY => 8

    /**
     * All volumes managed by this provider must have contiguous space. This flag applies to basic 
     *       providers only.
     * @type {Integer (Int32)}
     */
    static VDS_PF_VOLUME_SPACE_MUST_BE_CONTIGUOUS => 16

    /**
     * If this flag is set, VDS sets the <b>VDS_SVF_SUPPORT_DYNAMIC</b> flag in the <a href="https://docs.microsoft.com/windows/desktop/api/vds/ns-vds-vds_service_prop">VDS_SERVICE_PROP</a> structure.
     * @type {Integer (Int32)}
     */
    static VDS_PF_SUPPORT_DYNAMIC => -2147483648

    /**
     * If this flag is set, VDS sets the <b>VDS_SVF_SUPPORT_FAULT_TOLERANT</b> 
     *       flag in the <a href="https://docs.microsoft.com/windows/desktop/api/vds/ns-vds-vds_service_prop">VDS_SERVICE_PROP</a> structure.
     * @type {Integer (Int32)}
     */
    static VDS_PF_SUPPORT_FAULT_TOLERANT => 1073741824

    /**
     * If this flag is set, VDS sets the <b>VDS_SVF_SUPPORT_DYNAMIC_1394</b> 
     *       flag in the <a href="https://docs.microsoft.com/windows/desktop/api/vds/ns-vds-vds_service_prop">VDS_SERVICE_PROP</a> structure.
     * @type {Integer (Int32)}
     */
    static VDS_PF_SUPPORT_DYNAMIC_1394 => 536870912

    /**
     * If this flag is set, VDS sets the <b>VDS_SVF_SUPPORT_MIRROR</b> flag in the <a href="https://docs.microsoft.com/windows/desktop/api/vds/ns-vds-vds_service_prop">VDS_SERVICE_PROP</a> structure.
     * 
     * <b>Windows Server 2008, Windows Vista and Windows Server 2003:  </b>Not supported.
     * @type {Integer (Int32)}
     */
    static VDS_PF_SUPPORT_MIRROR => 32

    /**
     * If this flag is set, VDS sets the <b>VDS_SVF_SUPPORT_RAID5</b> flag in the <a href="https://docs.microsoft.com/windows/desktop/api/vds/ns-vds-vds_service_prop">VDS_SERVICE_PROP</a> structure.
     * 
     * <b>Windows Server 2008, Windows Vista and Windows Server 2003:  </b>Not supported.
     * @type {Integer (Int32)}
     */
    static VDS_PF_SUPPORT_RAID5 => 64
}
