#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
class WHEA_RECOVERY_FAILURE_REASON extends Win32Enum {

    /**
     * Native name: WheaRecoveryFailureReasonKernelCouldNotMarkMemoryBad
     * @type {Integer (Int32)}
     */
    static KernelCouldNotMarkMemoryBad => 1

    /**
     * Native name: WheaRecoveryFailureReasonKernelMarkMemoryBadTimedOut
     * @type {Integer (Int32)}
     */
    static KernelMarkMemoryBadTimedOut => 2

    /**
     * Native name: WheaRecoveryFailureReasonNoRecoveryContext
     * @type {Integer (Int32)}
     */
    static NoRecoveryContext => 3

    /**
     * Native name: WheaRecoveryFailureReasonNotContinuable
     * @type {Integer (Int32)}
     */
    static NotContinuable => 4

    /**
     * Native name: WheaRecoveryFailureReasonPcc
     * @type {Integer (Int32)}
     */
    static Pcc => 5

    /**
     * Native name: WheaRecoveryFailureReasonOverflow
     * @type {Integer (Int32)}
     */
    static Overflow => 6

    /**
     * Native name: WheaRecoveryFailureReasonNotSupported
     * @type {Integer (Int32)}
     */
    static NotSupported => 7

    /**
     * Native name: WheaRecoveryFailureReasonMiscOrAddrNotValid
     * @type {Integer (Int32)}
     */
    static MiscOrAddrNotValid => 8

    /**
     * Native name: WheaRecoveryFailureReasonInvalidAddressMode
     * @type {Integer (Int32)}
     */
    static InvalidAddressMode => 9

    /**
     * Native name: WheaRecoveryFailureReasonHighIrql
     * @type {Integer (Int32)}
     */
    static HighIrql => 10

    /**
     * Native name: WheaRecoveryFailureReasonInsufficientAltContextWrappers
     * @type {Integer (Int32)}
     */
    static InsufficientAltContextWrappers => 11

    /**
     * Native name: WheaRecoveryFailureReasonInterruptsDisabled
     * @type {Integer (Int32)}
     */
    static InterruptsDisabled => 12

    /**
     * Native name: WheaRecoveryFailureReasonSwapBusy
     * @type {Integer (Int32)}
     */
    static SwapBusy => 13

    /**
     * Native name: WheaRecoveryFailureReasonStackOverflow
     * @type {Integer (Int32)}
     */
    static StackOverflow => 14

    /**
     * Native name: WheaRecoveryFailureReasonUnexpectedFailure
     * @type {Integer (Int32)}
     */
    static UnexpectedFailure => 15

    /**
     * Native name: WheaRecoveryFailureReasonKernelWillPageFaultBCAtCurrentIrql
     * @type {Integer (Int32)}
     */
    static KernelWillPageFaultBCAtCurrentIrql => 16

    /**
     * Native name: WheaRecoveryFailureReasonFarNotValid
     * @type {Integer (Int32)}
     */
    static FarNotValid => 17

    /**
     * Native name: WheaRecoveryFailureReasonMax
     * @type {Integer (Int32)}
     */
    static Max => 18
}
