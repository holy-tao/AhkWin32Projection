#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Contains values that indicate a status associated with the command that is generic across many different types of commands.
 * @remarks
 * 
 * @see https://learn.microsoft.com/windows/win32/api/nvme/ne-nvme-nvme_status_generic_command_codes
 * @namespace Windows.Win32.Storage.Nvme
 * @version v4.0.30319
 */
class NVME_STATUS_GENERIC_COMMAND_CODES extends Win32Enum{

    /**
     * The command completed successfully.
     * @type {Integer (Int32)}
     */
    static NVME_STATUS_SUCCESS_COMPLETION => 0

    /**
     * The associated command opcode field is not valid.
     * @type {Integer (Int32)}
     */
    static NVME_STATUS_INVALID_COMMAND_OPCODE => 1

    /**
     * An invalid or unsupported field is specified in the command parameters.
     * @type {Integer (Int32)}
     */
    static NVME_STATUS_INVALID_FIELD_IN_COMMAND => 2

    /**
     * The command identifier is already in use.
     * 
     * > [!NOTE]
     * > The number of commands that are searched for an ID conflict is implementation specific.
     * @type {Integer (Int32)}
     */
    static NVME_STATUS_COMMAND_ID_CONFLICT => 3

    /**
     * Indicates an error transferring the data or metadata associated with a command.
     * @type {Integer (Int32)}
     */
    static NVME_STATUS_DATA_TRANSFER_ERROR => 4

    /**
     * Indicates that the command was aborted due to a power loss notification.
     * @type {Integer (Int32)}
     */
    static NVME_STATUS_COMMAND_ABORTED_DUE_TO_POWER_LOSS_NOTIFICATION => 5

    /**
     * The command was not completed successfully due to an internal error. Details on the internal device error are returned as an asynchronous event.
     * @type {Integer (Int32)}
     */
    static NVME_STATUS_INTERNAL_DEVICE_ERROR => 6

    /**
     * The command was aborted due to a Command Abort command being received that specified the Submission Queue Identifier and Command Identifier of this command.
     * @type {Integer (Int32)}
     */
    static NVME_STATUS_COMMAND_ABORT_REQUESTED => 7

    /**
     * The command was aborted due to a Delete I/O Submission Queue request received for the Submission Queue to which the command was submitted.
     * @type {Integer (Int32)}
     */
    static NVME_STATUS_COMMAND_ABORTED_DUE_TO_SQ_DELETION => 8

    /**
     * The command was aborted due to the other command in a fused operation failing.
     * @type {Integer (Int32)}
     */
    static NVME_STATUS_COMMAND_ABORTED_DUE_TO_FAILED_FUSED_COMMAND => 9

    /**
     * The command was aborted due to the companion fused command not being found as the subsequent Submission Queue entry.
     * @type {Integer (Int32)}
     */
    static NVME_STATUS_COMMAND_ABORTED_DUE_TO_FAILED_MISSING_COMMAND => 10

    /**
     * The namespace or the format of that namespace is invalid.
     * @type {Integer (Int32)}
     */
    static NVME_STATUS_INVALID_NAMESPACE_OR_FORMAT => 11

    /**
     * The command was aborted due to a protocol violation in a multi-command sequence. For example, a violation of the Security Send and Security Receive sequencing rules in the TCG Storage Synchronous Interface Communications protocol.
     * @type {Integer (Int32)}
     */
    static NVME_STATUS_COMMAND_SEQUENCE_ERROR => 12

    /**
     * The command includes an invalid SGL Last Segment or SGL Segment descriptor. This may occur when the SGL segment pointed to by an SGL Last Segment descriptor contains an SGL Segment descriptor or an SGL Last Segment descriptor or an SGL Segment descriptor. This may occur when an SGL Last Segment descriptor contains an invalid length (for example, a length of zero or one that is not a multiple of 16).
     * @type {Integer (Int32)}
     */
    static NVME_STATUS_INVALID_SGL_LAST_SEGMENT_DESCR => 13

    /**
     * There is an SGL Last Segment descriptor or an SGL Segment descriptor in a location other than the last descriptor of a segment based on the length indicated.
     * @type {Integer (Int32)}
     */
    static NVME_STATUS_INVALID_NUMBER_OF_SGL_DESCR => 14

    /**
     * This may occur if the length of a Data SGL is too short. This may occur if the length of a Data SGL is too long and the controller does not support SGL transfers longer than the amount of data to be transferred as indicated in the SGL Support (**SGLS**) field of the [Identify Controller (NVME_IDENTIFY_CONTROLLER_DATA)](ns-nvme-nvme_identify_controller_data.md) data structure.
     * @type {Integer (Int32)}
     */
    static NVME_STATUS_DATA_SGL_LENGTH_INVALID => 15

    /**
     * This may occur if the length of a Metadata SGL is too short. This may occur if the length of a Metadata SGL is too long and the controller does not support SGL transfers longer than the amount of data to be transferred as indicated in the SGL Support (**SGLS**) field of the [Identify Controller (NVME_IDENTIFY_CONTROLLER_DATA)](ns-nvme-nvme_identify_controller_data.md) data structure.
     * @type {Integer (Int32)}
     */
    static NVME_STATUS_METADATA_SGL_LENGTH_INVALID => 16

    /**
     * The type of an SGL Descriptor is a type that is not supported by the controller.
     * @type {Integer (Int32)}
     */
    static NVME_STATUS_SGL_DESCR_TYPE_INVALID => 17

    /**
     * The attempted use of the Controller Memory Buffer is not supported by the controller.
     * @type {Integer (Int32)}
     */
    static NVME_STATUS_INVALID_USE_OF_CONTROLLER_MEMORY_BUFFER => 18

    /**
     * The Offset field for a PRP entry is invalid. This may occur when there is a PRP entry with a non-zero offset after the first entry.
     * @type {Integer (Int32)}
     */
    static NVME_STATUS_PRP_OFFSET_INVALID => 19

    /**
     * The length specified exceeds the atomic write unit size.
     * @type {Integer (Int32)}
     */
    static NVME_STATUS_ATOMIC_WRITE_UNIT_EXCEEDED => 20

    /**
     * The command was denied due to lack of access rights.
     * @type {Integer (Int32)}
     */
    static NVME_STATUS_OPERATION_DENIED => 21

    /**
     * The offset specified in a descriptor is invalid.
     * @type {Integer (Int32)}
     */
    static NVME_STATUS_SGL_OFFSET_INVALID => 22

    /**
     * Reserved.
     * @type {Integer (Int32)}
     */
    static NVME_STATUS_RESERVED => 23

    /**
     * The NVM subsystem detected the simultaneous use of 64-bit and 128-bit Host Identifier values on different controllers.
     * @type {Integer (Int32)}
     */
    static NVME_STATUS_HOST_IDENTIFIER_INCONSISTENT_FORMAT => 24

    /**
     * The Keep Alive Timer expired.
     * @type {Integer (Int32)}
     */
    static NVME_STATUS_KEEP_ALIVE_TIMEOUT_EXPIRED => 25

    /**
     * The Keep Alive Timeout value specified is invalid.
     * @type {Integer (Int32)}
     */
    static NVME_STATUS_KEEP_ALIVE_TIMEOUT_INVALID => 26

    /**
     * The command was aborted due to a Reservation Acquire command with the Reservation Acquire Action (RACQA) set to 010b (Preempt and Abort).
     * @type {Integer (Int32)}
     */
    static NVME_STATUS_COMMAND_ABORTED_DUE_TO_PREEMPT_ABORT => 27

    /**
     * The most recent sanitize operation failed and no recovery action has been successfully completed.
     * @type {Integer (Int32)}
     */
    static NVME_STATUS_SANITIZE_FAILED => 28

    /**
     * The requested function (e.g., command) is prohibited while a sanitize operation is in progress.
     * @type {Integer (Int32)}
     */
    static NVME_STATUS_SANITIZE_IN_PROGRESS => 29

    /**
     * The Address alignment or Length granularity for an SGLData Block descriptor is invalid.
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
     * The command references an LBA that exceeds the size of the namespace.
     * @type {Integer (Int32)}
     */
    static NVME_STATUS_NVM_LBA_OUT_OF_RANGE => 128

    /**
     * Execution of the command has caused the capacity of the namespace to be exceeded. This error occurs when the Namespace Utilization exceeds the Namespace Capacity.
     * @type {Integer (Int32)}
     */
    static NVME_STATUS_NVM_CAPACITY_EXCEEDED => 129

    /**
     * The namespace is not ready to be accessed. The Do Not Retry bit indicates whether re-issuing the command at a later time may succeed.
     * @type {Integer (Int32)}
     */
    static NVME_STATUS_NVM_NAMESPACE_NOT_READY => 130

    /**
     * The command was aborted due to a conflict with a reservation held on the accessed namespace.
     * @type {Integer (Int32)}
     */
    static NVME_STATUS_NVM_RESERVATION_CONFLICT => 131

    /**
     * The namespace is currently being formatted. The Do Not Retry bit will be cleared to ‘0’ to indicate that the command may succeed if it is resubmitted.
     * @type {Integer (Int32)}
     */
    static NVME_STATUS_FORMAT_IN_PROGRESS => 132
}
