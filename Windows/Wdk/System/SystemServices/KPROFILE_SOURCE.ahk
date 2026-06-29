#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
export default struct KPROFILE_SOURCE {
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
    static ProfileTime => 0

    /**
     * @type {Integer (Int32)}
     */
    static ProfileAlignmentFixup => 1

    /**
     * @type {Integer (Int32)}
     */
    static ProfileTotalIssues => 2

    /**
     * @type {Integer (Int32)}
     */
    static ProfilePipelineDry => 3

    /**
     * @type {Integer (Int32)}
     */
    static ProfileLoadInstructions => 4

    /**
     * @type {Integer (Int32)}
     */
    static ProfilePipelineFrozen => 5

    /**
     * @type {Integer (Int32)}
     */
    static ProfileBranchInstructions => 6

    /**
     * @type {Integer (Int32)}
     */
    static ProfileTotalNonissues => 7

    /**
     * @type {Integer (Int32)}
     */
    static ProfileDcacheMisses => 8

    /**
     * @type {Integer (Int32)}
     */
    static ProfileIcacheMisses => 9

    /**
     * @type {Integer (Int32)}
     */
    static ProfileCacheMisses => 10

    /**
     * @type {Integer (Int32)}
     */
    static ProfileBranchMispredictions => 11

    /**
     * @type {Integer (Int32)}
     */
    static ProfileStoreInstructions => 12

    /**
     * @type {Integer (Int32)}
     */
    static ProfileFpInstructions => 13

    /**
     * @type {Integer (Int32)}
     */
    static ProfileIntegerInstructions => 14

    /**
     * @type {Integer (Int32)}
     */
    static Profile2Issue => 15

    /**
     * @type {Integer (Int32)}
     */
    static Profile3Issue => 16

    /**
     * @type {Integer (Int32)}
     */
    static Profile4Issue => 17

    /**
     * @type {Integer (Int32)}
     */
    static ProfileSpecialInstructions => 18

    /**
     * @type {Integer (Int32)}
     */
    static ProfileTotalCycles => 19

    /**
     * @type {Integer (Int32)}
     */
    static ProfileIcacheIssues => 20

    /**
     * @type {Integer (Int32)}
     */
    static ProfileDcacheAccesses => 21

    /**
     * @type {Integer (Int32)}
     */
    static ProfileMemoryBarrierCycles => 22

    /**
     * @type {Integer (Int32)}
     */
    static ProfileLoadLinkedIssues => 23

    /**
     * @type {Integer (Int32)}
     */
    static ProfileMaximum => 24
}
