#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Defines a set of valid load balance policies for a path.
 * @remarks
 * 
 * <div class="alert"><b>Note</b>  Additional constants might be added to the <b>VDS_LOADBALANCE_POLICY_ENUM</b> enumeration in future Windows versions. For this reason, your application must be designed to gracefully handle an unrecognized <b>VDS_LOADBALANCE_POLICY_ENUM</b> enumeration constant.</div>
 * <div> </div>
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//vds/ne-vds-vds_loadbalance_policy_enum
 * @namespace Windows.Win32.Storage.VirtualDiskService
 * @version v4.0.30319
 */
class VDS_LOADBALANCE_POLICY_ENUM extends Win32Enum{

    /**
     * The policy is unknown.
     * @type {Integer (Int32)}
     */
    static VDS_LBP_UNKNOWN => 0

    /**
     * The policy uses one primary path with other paths being backup paths.
     * @type {Integer (Int32)}
     */
    static VDS_LBP_FAILOVER => 1

    /**
     * The policy uses all paths in round-robin fashion.
     * @type {Integer (Int32)}
     */
    static VDS_LBP_ROUND_ROBIN => 2

    /**
     * The policy uses primary paths in round-robin fashion. The backup paths are used if all of the primary paths 
     *      fail.
     * @type {Integer (Int32)}
     */
    static VDS_LBP_ROUND_ROBIN_WITH_SUBSET => 3

    /**
     * The policy uses the path with the least number of active requests.
     * @type {Integer (Int32)}
     */
    static VDS_LBP_DYN_LEAST_QUEUE_DEPTH => 4

    /**
     * The policy uses the path with the least weight (each path is assigned a weight).
     * @type {Integer (Int32)}
     */
    static VDS_LBP_WEIGHTED_PATHS => 5

    /**
     * The policy uses the path with the least blocks.
     * @type {Integer (Int32)}
     */
    static VDS_LBP_LEAST_BLOCKS => 6

    /**
     * The policy is a vendor-specific policy.
     * @type {Integer (Int32)}
     */
    static VDS_LBP_VENDOR_SPECIFIC => 7
}
