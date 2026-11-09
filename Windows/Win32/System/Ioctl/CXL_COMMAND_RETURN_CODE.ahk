#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.Ioctl
 */
class CXL_COMMAND_RETURN_CODE extends Win32Enum {

    /**
     * Native name: CxlCommandReturnCode_Success
     * @type {Integer (Int32)}
     */
    static Success => 0

    /**
     * Native name: CxlCommandReturnCode_BackgroundCommandStarted
     * @type {Integer (Int32)}
     */
    static BackgroundCommandStarted => 1

    /**
     * Native name: CxlCommandReturnCode_InvalidInput
     * @type {Integer (Int32)}
     */
    static InvalidInput => 2

    /**
     * Native name: CxlCommandReturnCode_Unsupported
     * @type {Integer (Int32)}
     */
    static Unsupported => 3

    /**
     * Native name: CxlCommandReturnCode_InternalError
     * @type {Integer (Int32)}
     */
    static InternalError => 4

    /**
     * Native name: CxlCommandReturnCode_RetryRequired
     * @type {Integer (Int32)}
     */
    static RetryRequired => 5

    /**
     * Native name: CxlCommandReturnCode_Busy
     * @type {Integer (Int32)}
     */
    static Busy => 6

    /**
     * Native name: CxlCommandReturnCode_MediaDisabled
     * @type {Integer (Int32)}
     */
    static MediaDisabled => 7

    /**
     * Native name: CxlCommandReturnCode_FWTransferInProgress
     * @type {Integer (Int32)}
     */
    static FWTransferInProgress => 8

    /**
     * Native name: CxlCommandReturnCode_FWTransferOutOfOrder
     * @type {Integer (Int32)}
     */
    static FWTransferOutOfOrder => 9

    /**
     * Native name: CxlCommandReturnCode_FWVerificationFailed
     * @type {Integer (Int32)}
     */
    static FWVerificationFailed => 10

    /**
     * Native name: CxlCommandReturnCode_InvalidSlot
     * @type {Integer (Int32)}
     */
    static InvalidSlot => 11

    /**
     * Native name: CxlCommandReturnCode_ActivationFailed_FWRolledBack
     * @type {Integer (Int32)}
     */
    static ActivationFailed_FWRolledBack => 12

    /**
     * Native name: CxlCommandReturnCode_ActivationFailed_ColdResetRequired
     * @type {Integer (Int32)}
     */
    static ActivationFailed_ColdResetRequired => 13

    /**
     * Native name: CxlCommandReturnCode_InvalidHandle
     * @type {Integer (Int32)}
     */
    static InvalidHandle => 14

    /**
     * Native name: CxlCommandReturnCode_InvalidPhysicalAddress
     * @type {Integer (Int32)}
     */
    static InvalidPhysicalAddress => 15

    /**
     * Native name: CxlCommandReturnCode_InjectPoisonLimitReached
     * @type {Integer (Int32)}
     */
    static InjectPoisonLimitReached => 16

    /**
     * Native name: CxlCommandReturnCode_PermanentMediaFailure
     * @type {Integer (Int32)}
     */
    static PermanentMediaFailure => 17

    /**
     * Native name: CxlCommandReturnCode_Aborted
     * @type {Integer (Int32)}
     */
    static Aborted => 18

    /**
     * Native name: CxlCommandReturnCode_InvalidSecurityState
     * @type {Integer (Int32)}
     */
    static InvalidSecurityState => 19

    /**
     * Native name: CxlCommandReturnCode_IncorrectPassphrase
     * @type {Integer (Int32)}
     */
    static IncorrectPassphrase => 20

    /**
     * Native name: CxlCommandReturnCode_UnsupportedMailboxOrCCI
     * @type {Integer (Int32)}
     */
    static UnsupportedMailboxOrCCI => 21

    /**
     * Native name: CxlCommandReturnCode_InvalidPayloadLength
     * @type {Integer (Int32)}
     */
    static InvalidPayloadLength => 22

    /**
     * Native name: CxlCommandReturnCode_InvalidLog
     * @type {Integer (Int32)}
     */
    static InvalidLog => 23

    /**
     * Native name: CxlCommandReturnCode_Interrupted
     * @type {Integer (Int32)}
     */
    static Interrupted => 24

    /**
     * Native name: CxlCommandReturnCode_UnsupportedFeatureVersion
     * @type {Integer (Int32)}
     */
    static UnsupportedFeatureVersion => 25

    /**
     * Native name: CxlCommandReturnCode_UnsupportedFeatureSelectionValue
     * @type {Integer (Int32)}
     */
    static UnsupportedFeatureSelectionValue => 26

    /**
     * Native name: CxlCommandReturnCode_FeatureTransferInProgress
     * @type {Integer (Int32)}
     */
    static FeatureTransferInProgress => 27

    /**
     * Native name: CxlCommandReturnCode_FeatureTransferOutOfOrder
     * @type {Integer (Int32)}
     */
    static FeatureTransferOutOfOrder => 28

    /**
     * Native name: CxlCommandReturnCode_ResourcesExhausted
     * @type {Integer (Int32)}
     */
    static ResourcesExhausted => 29

    /**
     * Native name: CxlCommandReturnCode_InvalidExtentList
     * @type {Integer (Int32)}
     */
    static InvalidExtentList => 30

    /**
     * Native name: CxlCommandReturnCode_TransferOutOfOrder
     * @type {Integer (Int32)}
     */
    static TransferOutOfOrder => 31

    /**
     * Native name: CxlCommandReturnCode_RequestAbortNotSupportedByBackgroundOperation
     * @type {Integer (Int32)}
     */
    static RequestAbortNotSupportedByBackgroundOperation => 32

    /**
     * Native name: CxlCommandReturnCode_Max
     * @type {Integer (Int32)}
     */
    static Max => 33
}
