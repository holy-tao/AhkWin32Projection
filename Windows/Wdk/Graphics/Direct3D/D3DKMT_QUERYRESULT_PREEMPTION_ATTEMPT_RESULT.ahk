#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Wdk.Graphics.Direct3D
 */
class D3DKMT_QUERYRESULT_PREEMPTION_ATTEMPT_RESULT extends Win32Enum {

    /**
     * @type {Integer (Int32)}
     */
    static D3DKMT_PreemptionAttempt => 0

    /**
     * Native name: D3DKMT_PreemptionAttemptSuccess
     * @type {Integer (Int32)}
     */
    static Success => 1

    /**
     * Native name: D3DKMT_PreemptionAttemptMissNoCommand
     * @type {Integer (Int32)}
     */
    static MissNoCommand => 2

    /**
     * Native name: D3DKMT_PreemptionAttemptMissNotEnabled
     * @type {Integer (Int32)}
     */
    static MissNotEnabled => 3

    /**
     * Native name: D3DKMT_PreemptionAttemptMissNextFence
     * @type {Integer (Int32)}
     */
    static MissNextFence => 4

    /**
     * Native name: D3DKMT_PreemptionAttemptMissPagingCommand
     * @type {Integer (Int32)}
     */
    static MissPagingCommand => 5

    /**
     * Native name: D3DKMT_PreemptionAttemptMissSplittedCommand
     * @type {Integer (Int32)}
     */
    static MissSplittedCommand => 6

    /**
     * Native name: D3DKMT_PreemptionAttemptMissFenceCommand
     * @type {Integer (Int32)}
     */
    static MissFenceCommand => 7

    /**
     * Native name: D3DKMT_PreemptionAttemptMissRenderPendingFlip
     * @type {Integer (Int32)}
     */
    static MissRenderPendingFlip => 8

    /**
     * Native name: D3DKMT_PreemptionAttemptMissNotMakingProgress
     * @type {Integer (Int32)}
     */
    static MissNotMakingProgress => 9

    /**
     * Native name: D3DKMT_PreemptionAttemptMissLessPriority
     * @type {Integer (Int32)}
     */
    static MissLessPriority => 10

    /**
     * Native name: D3DKMT_PreemptionAttemptMissRemainingQuantum
     * @type {Integer (Int32)}
     */
    static MissRemainingQuantum => 11

    /**
     * Native name: D3DKMT_PreemptionAttemptMissRemainingPreemptionQuantum
     * @type {Integer (Int32)}
     */
    static MissRemainingPreemptionQuantum => 12

    /**
     * Native name: D3DKMT_PreemptionAttemptMissAlreadyPreempting
     * @type {Integer (Int32)}
     */
    static MissAlreadyPreempting => 13

    /**
     * Native name: D3DKMT_PreemptionAttemptMissGlobalBlock
     * @type {Integer (Int32)}
     */
    static MissGlobalBlock => 14

    /**
     * Native name: D3DKMT_PreemptionAttemptMissAlreadyRunning
     * @type {Integer (Int32)}
     */
    static MissAlreadyRunning => 15

    /**
     * Native name: D3DKMT_PreemptionAttemptStatisticsMax
     * @type {Integer (Int32)}
     */
    static StatisticsMax => 16
}
