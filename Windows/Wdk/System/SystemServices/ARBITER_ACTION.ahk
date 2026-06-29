#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
export default struct ARBITER_ACTION {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

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
