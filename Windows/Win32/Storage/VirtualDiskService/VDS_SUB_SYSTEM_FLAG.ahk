#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Defines the set of valid flags for a subsystem object.
 * @remarks
 * 
 * This enumeration provides the values for the  <b>ulFlags</b> member of the 
 *     <a href="https://docs.microsoft.com/windows/desktop/api/vdshwprv/ns-vdshwprv-vds_sub_system_prop">VDS_SUB_SYSTEM_PROP</a> and <a href="https://docs.microsoft.com/windows/desktop/api/vdshwprv/ns-vdshwprv-vds_sub_system_prop2">VDS_SUB_SYSTEM_PROP2</a> structures.
 * 
 * <div class="alert"><b>Note</b>  Additional constants might be added to the <b>VDS_SUB_SYSTEM_FLAG</b> enumeration in future Windows versions. For this reason, your application must be designed to gracefully handle an unrecognized <b>VDS_SUB_SYSTEM_FLAG</b> enumeration constant.</div>
 * <div> </div>
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//vds/ne-vds-vds_sub_system_flag
 * @namespace Windows.Win32.Storage.VirtualDiskService
 * @version v4.0.30319
 */
class VDS_SUB_SYSTEM_FLAG extends Win32Enum{

    /**
     * The subsystem supports LUN masking. This flag applies only to external hardware 
     *       providers—internal hardware providers do not support LUN masking.
     * @type {Integer (Int32)}
     */
    static VDS_SF_LUN_MASKING_CAPABLE => 1

    /**
     * The provider supports LUNs with more than one plex.
     * @type {Integer (Int32)}
     */
    static VDS_SF_LUN_PLEXING_CAPABLE => 2

    /**
     * The provider supports automatic remapping of LUN extents to drive extents.
     * @type {Integer (Int32)}
     */
    static VDS_SF_LUN_REMAPPING_CAPABLE => 4

    /**
     * The provider supports the use of drive extents in LUN creation. If this flag is not set, the 
     *       provider uses only whole drives to create LUNs.
     * @type {Integer (Int32)}
     */
    static VDS_SF_DRIVE_EXTENT_CAPABLE => 8

    /**
     * The provider supports verifying the integrity of the read and write data using a checksum. If this 
     *       flag is not set, the provider does not support using a checksum.
     * @type {Integer (Int32)}
     */
    static VDS_SF_HARDWARE_CHECKSUM_CAPABLE => 16

    /**
     * The subsystem supports RADIUS.
     * @type {Integer (Int32)}
     */
    static VDS_SF_RADIUS_CAPABLE => 32

    /**
     * The subsystem supports read verification of data that has been written.
     * @type {Integer (Int32)}
     */
    static VDS_SF_READ_BACK_VERIFY_CAPABLE => 64

    /**
     * The subsystem supports write-through caching.
     * @type {Integer (Int32)}
     */
    static VDS_SF_WRITE_THROUGH_CACHING_CAPABLE => 128

    /**
     * The subsystem supports creation of automagic fault tolerant LUNs.
     * @type {Integer (Int32)}
     */
    static VDS_SF_SUPPORTS_FAULT_TOLERANT_LUNS => 512

    /**
     * The subsystem supports creation of automagic non-fault tolerant LUNs.
     * @type {Integer (Int32)}
     */
    static VDS_SF_SUPPORTS_NON_FAULT_TOLERANT_LUNS => 1024

    /**
     * The subsystem supports creation of simple LUNs.
     * @type {Integer (Int32)}
     */
    static VDS_SF_SUPPORTS_SIMPLE_LUNS => 2048

    /**
     * The subsystem supports creation of spanned LUNs.
     * @type {Integer (Int32)}
     */
    static VDS_SF_SUPPORTS_SPAN_LUNS => 4096

    /**
     * The subsystem supports creation of striped LUNs.
     * @type {Integer (Int32)}
     */
    static VDS_SF_SUPPORTS_STRIPE_LUNS => 8192

    /**
     * The subsystem supports creation of mirrored LUNs.
     * @type {Integer (Int32)}
     */
    static VDS_SF_SUPPORTS_MIRROR_LUNS => 16384

    /**
     * The subsystem supports creation of striped with parity LUNs.
     * @type {Integer (Int32)}
     */
    static VDS_SF_SUPPORTS_PARITY_LUNS => 32768

    /**
     * The subsystem supports one-way CHAP authentication.
     * @type {Integer (Int32)}
     */
    static VDS_SF_SUPPORTS_AUTH_CHAP => 65536

    /**
     * The subsystem supports mutual CHAP authentication.
     * @type {Integer (Int32)}
     */
    static VDS_SF_SUPPORTS_AUTH_MUTUAL_CHAP => 131072

    /**
     * The subsystem supports only simple target configurations and automatically assigns LUNs to targets during LUN 
     *       creation. Such a target must be configured with at least one associated portal in the target's portal group. The provider is responsible for correctly associating portals with the target. A VDS application should not assume that the subsystem has the ability to create or delete simple targets.
     * @type {Integer (Int32)}
     */
    static VDS_SF_SUPPORTS_SIMPLE_TARGET_CONFIG => 262144

    /**
     * The subsystem supports LUN numbering. See the <a href="https://docs.microsoft.com/windows/desktop/api/vdshwprv/nf-vdshwprv-ivdslunnumber-getlunnumber">IVdsLunNumber::GetLunNumber</a> method.
     * 
     * <b>Windows Server 2008, Windows Vista and Windows Server 2003:  </b>This flag is not supported.
     * @type {Integer (Int32)}
     */
    static VDS_SF_SUPPORTS_LUN_NUMBER => 524288

    /**
     * The subsystem supports LUNs that use a mirrored cache. See the <b>bUseMirroredCache</b> member of the <a href="https://docs.microsoft.com/windows/desktop/api/vdshwprv/ns-vdshwprv-vds_hints2">VDS_HINTS2</a> structure.
     * 
     * <b>Windows Server 2008, Windows Vista and Windows Server 2003:  </b>This flag is not supported.
     * @type {Integer (Int32)}
     */
    static VDS_SF_SUPPORTS_MIRRORED_CACHE => 1048576

    /**
     * The subsystem supports read caching on LUNs. See the <b>VDS_LF_READ_CACHE_ENABLED</b> value of the <a href="https://docs.microsoft.com/windows/desktop/api/vdshwprv/ne-vdshwprv-vds_lun_flag">VDS_LUN_FLAG</a> enumeration and the <b>bReadCachingEnabled</b> member of the <a href="https://docs.microsoft.com/windows/desktop/api/vdshwprv/ns-vdshwprv-vds_hints2">VDS_HINTS2</a> structure.
     * 
     * <b>Windows Server 2008, Windows Vista and Windows Server 2003:  </b>This flag is not supported.
     * @type {Integer (Int32)}
     */
    static VDS_SF_READ_CACHING_CAPABLE => 2097152

    /**
     * The subsystem supports write caching on LUNs. See the <b>VDS_LF_WRITE_CACHE_ENABLED</b> value of the <a href="https://docs.microsoft.com/windows/desktop/api/vdshwprv/ne-vdshwprv-vds_lun_flag">VDS_LUN_FLAG</a> enumeration and the <b>bWriteCachingEnabled</b> member of the <a href="https://docs.microsoft.com/windows/desktop/api/vdshwprv/ns-vdshwprv-vds_hints2">VDS_HINTS2</a> structure.
     * 
     * <b>Windows Server 2008, Windows Vista and Windows Server 2003:  </b>This flag is not supported.
     * @type {Integer (Int32)}
     */
    static VDS_SF_WRITE_CACHING_CAPABLE => 4194304

    /**
     * The subsystem supports media scanning on LUNs. See the <b>VDS_LF_MEDIA_SCAN_ENABLED</b> value of the <a href="https://docs.microsoft.com/windows/desktop/api/vdshwprv/ne-vdshwprv-vds_lun_flag">VDS_LUN_FLAG</a> enumeration and the <b>bMediaScanEnabled</b> member of the <a href="https://docs.microsoft.com/windows/desktop/api/vdshwprv/ns-vdshwprv-vds_hints2">VDS_HINTS2</a> structure.
     * 
     * <b>Windows Server 2008, Windows Vista and Windows Server 2003:  </b>This flag is not supported.
     * @type {Integer (Int32)}
     */
    static VDS_SF_MEDIA_SCAN_CAPABLE => 8388608

    /**
     * The subsystem supports consistency checking on LUNs. See the <b>VDS_LF_CONSISTENCY_CHECK_ENABLED</b> value of the <a href="https://docs.microsoft.com/windows/desktop/api/vdshwprv/ne-vdshwprv-vds_lun_flag">VDS_LUN_FLAG</a> enumeration and the <b>bConsistencyCheckEnabled</b> member of the <a href="https://docs.microsoft.com/windows/desktop/api/vdshwprv/ns-vdshwprv-vds_hints2">VDS_HINTS2</a> structure.
     * 
     * <b>Windows Server 2008, Windows Vista and Windows Server 2003:  </b>This flag is not supported.
     * @type {Integer (Int32)}
     */
    static VDS_SF_CONSISTENCY_CHECK_CAPABLE => 16777216
}
