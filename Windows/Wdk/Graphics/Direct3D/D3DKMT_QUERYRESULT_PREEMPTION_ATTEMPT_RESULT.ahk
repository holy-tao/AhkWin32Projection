#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Wdk.Graphics.Direct3D
 * @version v4.0.30319
 */
class D3DKMT_QUERYRESULT_PREEMPTION_ATTEMPT_RESULT extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static D3DKMT_PreemptionAttempt => 0

    /**
     * @type {Integer (Int32)}
     */
    static D3DKMT_PreemptionAttemptSuccess => 1

    /**
     * @type {Integer (Int32)}
     */
    static D3DKMT_PreemptionAttemptMissNoCommand => 2

    /**
     * @type {Integer (Int32)}
     */
    static D3DKMT_PreemptionAttemptMissNotEnabled => 3

    /**
     * @type {Integer (Int32)}
     */
    static D3DKMT_PreemptionAttemptMissNextFence => 4

    /**
     * @type {Integer (Int32)}
     */
    static D3DKMT_PreemptionAttemptMissPagingCommand => 5

    /**
     * @type {Integer (Int32)}
     */
    static D3DKMT_PreemptionAttemptMissSplittedCommand => 6

    /**
     * @type {Integer (Int32)}
     */
    static D3DKMT_PreemptionAttemptMissFenceCommand => 7

    /**
     * @type {Integer (Int32)}
     */
    static D3DKMT_PreemptionAttemptMissRenderPendingFlip => 8

    /**
     * @type {Integer (Int32)}
     */
    static D3DKMT_PreemptionAttemptMissNotMakingProgress => 9

    /**
     * @type {Integer (Int32)}
     */
    static D3DKMT_PreemptionAttemptMissLessPriority => 10

    /**
     * @type {Integer (Int32)}
     */
    static D3DKMT_PreemptionAttemptMissRemainingQuantum => 11

    /**
     * @type {Integer (Int32)}
     */
    static D3DKMT_PreemptionAttemptMissRemainingPreemptionQuantum => 12

    /**
     * @type {Integer (Int32)}
     */
    static D3DKMT_PreemptionAttemptMissAlreadyPreempting => 13

    /**
     * @type {Integer (Int32)}
     */
    static D3DKMT_PreemptionAttemptMissGlobalBlock => 14

    /**
     * @type {Integer (Int32)}
     */
    static D3DKMT_PreemptionAttemptMissAlreadyRunning => 15

    /**
     * @type {Integer (Int32)}
     */
    static D3DKMT_PreemptionAttemptStatisticsMax => 16
}
