#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * The VDS_PROVIDER_LBSUPPORT_FLAG enumeration (vdshwprv.h) specifies the set of valid flags for indicating which load balance policies a hardware provider supports.
 * @remarks
 * <div class="alert"><b>Note</b>  Additional constants might be added to the <b>VDS_PROVIDER_LBSUPPORT_FLAG</b> enumeration in future Windows versions. For this reason, your application must be designed to gracefully handle an unrecognized <b>VDS_PROVIDER_LBSUPPORT_FLAG</b> enumeration constant.</div>
 * <div> </div>
 * @see https://learn.microsoft.com/windows/win32/api/vdshwprv/ne-vdshwprv-vds_provider_lbsupport_flag
 * @namespace Windows.Win32.Storage.VirtualDiskService
 * @version v4.0.30319
 */
class VDS_PROVIDER_LBSUPPORT_FLAG extends Win32Enum{

    /**
     * The provider supports using one primary path with the other paths being backup paths.
     * @type {Integer (Int32)}
     */
    static VDS_LBF_FAILOVER => 1

    /**
     * The provider supports using all paths in round robin fashion.
     * @type {Integer (Int32)}
     */
    static VDS_LBF_ROUND_ROBIN => 2

    /**
     * The provider supports using primary paths in round robin fashion. The backup paths are used if all of the 
     *       primary paths fail.
     * @type {Integer (Int32)}
     */
    static VDS_LBF_ROUND_ROBIN_WITH_SUBSET => 4

    /**
     * The provider supports using the path with the least number of active requests.
     * @type {Integer (Int32)}
     */
    static VDS_LBF_DYN_LEAST_QUEUE_DEPTH => 8

    /**
     * The provider supports using the path with the least weight (each path is assigned a weight).
     * @type {Integer (Int32)}
     */
    static VDS_LBF_WEIGHTED_PATHS => 16

    /**
     * The provider supports using the path with the least blocks.
     * @type {Integer (Int32)}
     */
    static VDS_LBF_LEAST_BLOCKS => 32

    /**
     * The provider supports a vendor-specific policy.
     * @type {Integer (Int32)}
     */
    static VDS_LBF_VENDOR_SPECIFIC => 64
}
