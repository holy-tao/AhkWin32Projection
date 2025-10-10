#Requires AutoHotkey v2.0.0 64-bit

/**
 * Defines the set of valid flags for a LUN object.
 * @remarks
 * 
  * This enumeration provides the values for the <i>ulFlags</i> member of the <a href="https://docs.microsoft.com/windows/desktop/api/vdshwprv/ns-vdshwprv-vds_lun_prop">VDS_LUN_PROP</a> structure and provides the value for the <b>VDS_LPF_LBN_REMAP_ENABLED</b> enumerator in the <a href="https://docs.microsoft.com/windows/desktop/api/vds/ne-vds-vds_lun_plex_flag">VDS_LUN_PLEX_FLAG</a> enumeration.
  * 
  * <div class="alert"><b>Note</b>  Additional constants might be added to the <b>VDS_LUN_FLAG</b> enumeration in future Windows versions. For this reason, your application must be designed to gracefully handle an unrecognized <b>VDS_LUN_FLAG</b> enumeration constant.</div>
  * <div> </div>
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//vds/ne-vds-vds_lun_flag
 * @namespace Windows.Win32.Storage.VirtualDiskService
 * @version v4.0.30319
 */
class VDS_LUN_FLAG{

    /**
     * The provider remaps LUN extents to drive extents automatically.
     * @type {Integer (Int32)}
     */
    static VDS_LF_LBN_REMAP_ENABLED => 1

    /**
     * The provider verifies writes by readback.
     * @type {Integer (Int32)}
     */
    static VDS_LF_READ_BACK_VERIFY_ENABLED => 2

    /**
     * The provider enables write-through caching on the LUN.
     * @type {Integer (Int32)}
     */
    static VDS_LF_WRITE_THROUGH_CACHING_ENABLED => 4

    /**
     * The provider verifies the integrity of the read and write data using a checksum.
     * @type {Integer (Int32)}
     */
    static VDS_LF_HARDWARE_CHECKSUM_ENABLED => 8

    /**
     * Read caching is enabled on the LUN.
 * 
 * <b>Windows Server 2008, Windows Vista and Windows Server 2003:  </b>This value is not supported.
     * @type {Integer (Int32)}
     */
    static VDS_LF_READ_CACHE_ENABLED => 16

    /**
     * Write caching is enabled on the LUN.
 * 
 * <b>Windows Server 2008, Windows Vista and Windows Server 2003:  </b>This value is not supported.
     * @type {Integer (Int32)}
     */
    static VDS_LF_WRITE_CACHE_ENABLED => 32

    /**
     * Media scanning is enabled on the LUN.
 * 
 * <b>Windows Server 2008, Windows Vista and Windows Server 2003:  </b>This value is not supported.
     * @type {Integer (Int32)}
     */
    static VDS_LF_MEDIA_SCAN_ENABLED => 64

    /**
     * Consistency checking is enabled on the LUN.
 * 
 * <b>Windows Server 2008, Windows Vista and Windows Server 2003:  </b>This value is not supported.
     * @type {Integer (Int32)}
     */
    static VDS_LF_CONSISTENCY_CHECK_ENABLED => 128

    /**
     * The LUN is a volume shadow copy LUN.
 * 
 * <b>Windows Server 2008, Windows Vista and Windows Server 2003:  </b>This value is not supported.
     * @type {Integer (Int32)}
     */
    static VDS_LF_SNAPSHOT => 256
}
