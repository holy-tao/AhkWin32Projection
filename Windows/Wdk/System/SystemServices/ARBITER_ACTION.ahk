#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Wdk.System.SystemServices
 * @version v4.0.30319
 */
class ARBITER_ACTION extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static ArbiterActionTestAllocation => 0

    /**
     * @type {Integer (Int32)}
     */
    static ArbiterActionRetestAllocation => 1

    /**
     * @type {Integer (Int32)}
     */
    static ArbiterActionCommitAllocation => 2

    /**
     * @type {Integer (Int32)}
     */
    static ArbiterActionRollbackAllocation => 3

    /**
     * @type {Integer (Int32)}
     */
    static ArbiterActionQueryAllocatedResources => 4

    /**
     * @type {Integer (Int32)}
     */
    static ArbiterActionWriteReservedResources => 5

    /**
     * @type {Integer (Int32)}
     */
    static ArbiterActionQueryConflict => 6

    /**
     * @type {Integer (Int32)}
     */
    static ArbiterActionQueryArbitrate => 7

    /**
     * @type {Integer (Int32)}
     */
    static ArbiterActionAddReserved => 8

    /**
     * @type {Integer (Int32)}
     */
    static ArbiterActionBootAllocation => 9
}
