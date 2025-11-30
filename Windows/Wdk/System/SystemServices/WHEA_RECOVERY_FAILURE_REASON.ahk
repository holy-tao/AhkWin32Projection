#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Wdk.System.SystemServices
 * @version v4.0.30319
 */
class WHEA_RECOVERY_FAILURE_REASON extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static WheaRecoveryFailureReasonKernelCouldNotMarkMemoryBad => 1

    /**
     * @type {Integer (Int32)}
     */
    static WheaRecoveryFailureReasonKernelMarkMemoryBadTimedOut => 2

    /**
     * @type {Integer (Int32)}
     */
    static WheaRecoveryFailureReasonNoRecoveryContext => 3

    /**
     * @type {Integer (Int32)}
     */
    static WheaRecoveryFailureReasonNotContinuable => 4

    /**
     * @type {Integer (Int32)}
     */
    static WheaRecoveryFailureReasonPcc => 5

    /**
     * @type {Integer (Int32)}
     */
    static WheaRecoveryFailureReasonOverflow => 6

    /**
     * @type {Integer (Int32)}
     */
    static WheaRecoveryFailureReasonNotSupported => 7

    /**
     * @type {Integer (Int32)}
     */
    static WheaRecoveryFailureReasonMiscOrAddrNotValid => 8

    /**
     * @type {Integer (Int32)}
     */
    static WheaRecoveryFailureReasonInvalidAddressMode => 9

    /**
     * @type {Integer (Int32)}
     */
    static WheaRecoveryFailureReasonHighIrql => 10

    /**
     * @type {Integer (Int32)}
     */
    static WheaRecoveryFailureReasonInsufficientAltContextWrappers => 11

    /**
     * @type {Integer (Int32)}
     */
    static WheaRecoveryFailureReasonInterruptsDisabled => 12

    /**
     * @type {Integer (Int32)}
     */
    static WheaRecoveryFailureReasonSwapBusy => 13

    /**
     * @type {Integer (Int32)}
     */
    static WheaRecoveryFailureReasonStackOverflow => 14

    /**
     * @type {Integer (Int32)}
     */
    static WheaRecoveryFailureReasonUnexpectedFailure => 15

    /**
     * @type {Integer (Int32)}
     */
    static WheaRecoveryFailureReasonKernelWillPageFaultBCAtCurrentIrql => 16

    /**
     * @type {Integer (Int32)}
     */
    static WheaRecoveryFailureReasonFarNotValid => 17

    /**
     * @type {Integer (Int32)}
     */
    static WheaRecoveryFailureReasonMax => 18
}
