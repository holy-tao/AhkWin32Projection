#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Wdk.System.SystemServices
 * @version v4.0.30319
 */
class KPROFILE_SOURCE extends Win32Enum{

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
