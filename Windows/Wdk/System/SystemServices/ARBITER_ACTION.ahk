#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
class ARBITER_ACTION extends Win32Enum {

    /**
     * Native name: ArbiterActionTestAllocation
     * @type {Integer (Int32)}
     */
    static TestAllocation => 0

    /**
     * Native name: ArbiterActionRetestAllocation
     * @type {Integer (Int32)}
     */
    static RetestAllocation => 1

    /**
     * Native name: ArbiterActionCommitAllocation
     * @type {Integer (Int32)}
     */
    static CommitAllocation => 2

    /**
     * Native name: ArbiterActionRollbackAllocation
     * @type {Integer (Int32)}
     */
    static RollbackAllocation => 3

    /**
     * Native name: ArbiterActionQueryAllocatedResources
     * @type {Integer (Int32)}
     */
    static QueryAllocatedResources => 4

    /**
     * Native name: ArbiterActionWriteReservedResources
     * @type {Integer (Int32)}
     */
    static WriteReservedResources => 5

    /**
     * Native name: ArbiterActionQueryConflict
     * @type {Integer (Int32)}
     */
    static QueryConflict => 6

    /**
     * Native name: ArbiterActionQueryArbitrate
     * @type {Integer (Int32)}
     */
    static QueryArbitrate => 7

    /**
     * Native name: ArbiterActionAddReserved
     * @type {Integer (Int32)}
     */
    static AddReserved => 8

    /**
     * Native name: ArbiterActionBootAllocation
     * @type {Integer (Int32)}
     */
    static BootAllocation => 9
}
