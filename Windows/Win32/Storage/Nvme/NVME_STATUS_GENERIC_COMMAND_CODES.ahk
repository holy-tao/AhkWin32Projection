#Requires AutoHotkey v2.0.0 64-bit

/**
 * @namespace Windows.Win32.Storage.Nvme
 * @version v4.0.30319
 */
class NVME_STATUS_GENERIC_COMMAND_CODES{

    /**
     * @type {Integer (Int32)}
     */
    static NVME_STATUS_SUCCESS_COMPLETION => 0

    /**
     * @type {Integer (Int32)}
     */
    static NVME_STATUS_INVALID_COMMAND_OPCODE => 1

    /**
     * @type {Integer (Int32)}
     */
    static NVME_STATUS_INVALID_FIELD_IN_COMMAND => 2

    /**
     * @type {Integer (Int32)}
     */
    static NVME_STATUS_COMMAND_ID_CONFLICT => 3

    /**
     * @type {Integer (Int32)}
     */
    static NVME_STATUS_DATA_TRANSFER_ERROR => 4

    /**
     * @type {Integer (Int32)}
     */
    static NVME_STATUS_COMMAND_ABORTED_DUE_TO_POWER_LOSS_NOTIFICATION => 5

    /**
     * @type {Integer (Int32)}
     */
    static NVME_STATUS_INTERNAL_DEVICE_ERROR => 6

    /**
     * @type {Integer (Int32)}
     */
    static NVME_STATUS_COMMAND_ABORT_REQUESTED => 7

    /**
     * @type {Integer (Int32)}
     */
    static NVME_STATUS_COMMAND_ABORTED_DUE_TO_SQ_DELETION => 8

    /**
     * @type {Integer (Int32)}
     */
    static NVME_STATUS_COMMAND_ABORTED_DUE_TO_FAILED_FUSED_COMMAND => 9

    /**
     * @type {Integer (Int32)}
     */
    static NVME_STATUS_COMMAND_ABORTED_DUE_TO_FAILED_MISSING_COMMAND => 10

    /**
     * @type {Integer (Int32)}
     */
    static NVME_STATUS_INVALID_NAMESPACE_OR_FORMAT => 11

    /**
     * @type {Integer (Int32)}
     */
    static NVME_STATUS_COMMAND_SEQUENCE_ERROR => 12

    /**
     * @type {Integer (Int32)}
     */
    static NVME_STATUS_INVALID_SGL_LAST_SEGMENT_DESCR => 13

    /**
     * @type {Integer (Int32)}
     */
    static NVME_STATUS_INVALID_NUMBER_OF_SGL_DESCR => 14

    /**
     * @type {Integer (Int32)}
     */
    static NVME_STATUS_DATA_SGL_LENGTH_INVALID => 15

    /**
     * @type {Integer (Int32)}
     */
    static NVME_STATUS_METADATA_SGL_LENGTH_INVALID => 16

    /**
     * @type {Integer (Int32)}
     */
    static NVME_STATUS_SGL_DESCR_TYPE_INVALID => 17

    /**
     * @type {Integer (Int32)}
     */
    static NVME_STATUS_INVALID_USE_OF_CONTROLLER_MEMORY_BUFFER => 18

    /**
     * @type {Integer (Int32)}
     */
    static NVME_STATUS_PRP_OFFSET_INVALID => 19

    /**
     * @type {Integer (Int32)}
     */
    static NVME_STATUS_ATOMIC_WRITE_UNIT_EXCEEDED => 20

    /**
     * @type {Integer (Int32)}
     */
    static NVME_STATUS_OPERATION_DENIED => 21

    /**
     * @type {Integer (Int32)}
     */
    static NVME_STATUS_SGL_OFFSET_INVALID => 22

    /**
     * @type {Integer (Int32)}
     */
    static NVME_STATUS_RESERVED => 23

    /**
     * @type {Integer (Int32)}
     */
    static NVME_STATUS_HOST_IDENTIFIER_INCONSISTENT_FORMAT => 24

    /**
     * @type {Integer (Int32)}
     */
    static NVME_STATUS_KEEP_ALIVE_TIMEOUT_EXPIRED => 25

    /**
     * @type {Integer (Int32)}
     */
    static NVME_STATUS_KEEP_ALIVE_TIMEOUT_INVALID => 26

    /**
     * @type {Integer (Int32)}
     */
    static NVME_STATUS_COMMAND_ABORTED_DUE_TO_PREEMPT_ABORT => 27

    /**
     * @type {Integer (Int32)}
     */
    static NVME_STATUS_SANITIZE_FAILED => 28

    /**
     * @type {Integer (Int32)}
     */
    static NVME_STATUS_SANITIZE_IN_PROGRESS => 29

    /**
     * @type {Integer (Int32)}
     */
    static NVME_STATUS_SGL_DATA_BLOCK_GRANULARITY_INVALID => 30

    /**
     * @type {Integer (Int32)}
     */
    static NVME_STATUS_COMMAND_NOT_SUPPORTED_FOR_QUEUE_IN_CMB => 31

    /**
     * @type {Integer (Int32)}
     */
    static NVME_STATUS_NAMESPACE_IS_WRITE_PROTECTED => 32

    /**
     * @type {Integer (Int32)}
     */
    static NVME_STATUS_COMMAND_INTERRUPTED => 33

    /**
     * @type {Integer (Int32)}
     */
    static NVME_STATUS_TRANSIENT_TRANSPORT_ERROR => 34

    /**
     * @type {Integer (Int32)}
     */
    static NVME_STATUS_COMMAND_PROHIBITED_BY_LOCKDOWN => 35

    /**
     * @type {Integer (Int32)}
     */
    static NVME_STATUS_ADMIN_COMMAND_MEDIA_NOT_READY => 36

    /**
     * @type {Integer (Int32)}
     */
    static NVME_STATUS_DIRECTIVE_TYPE_INVALID => 112

    /**
     * @type {Integer (Int32)}
     */
    static NVME_STATUS_DIRECTIVE_ID_INVALID => 113

    /**
     * @type {Integer (Int32)}
     */
    static NVME_STATUS_NVM_LBA_OUT_OF_RANGE => 128

    /**
     * @type {Integer (Int32)}
     */
    static NVME_STATUS_NVM_CAPACITY_EXCEEDED => 129

    /**
     * @type {Integer (Int32)}
     */
    static NVME_STATUS_NVM_NAMESPACE_NOT_READY => 130

    /**
     * @type {Integer (Int32)}
     */
    static NVME_STATUS_NVM_RESERVATION_CONFLICT => 131

    /**
     * @type {Integer (Int32)}
     */
    static NVME_STATUS_FORMAT_IN_PROGRESS => 132
}
