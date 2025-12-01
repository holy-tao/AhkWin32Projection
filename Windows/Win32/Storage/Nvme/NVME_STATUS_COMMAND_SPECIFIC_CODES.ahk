#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Contains values indicating status that is specific to a particular command.
 * @remarks
 * 
 * @see https://learn.microsoft.com/windows/win32/api/nvme/ne-nvme-nvme_status_command_specific_codes
 * @namespace Windows.Win32.Storage.Nvme
 * @version v4.0.30319
 */
class NVME_STATUS_COMMAND_SPECIFIC_CODES extends Win32Enum{

    /**
     * The Completion Queue identifier specified in the Create I/O Submission Queue command does not exist.
     * @type {Integer (Int32)}
     */
    static NVME_STATUS_COMPLETION_QUEUE_INVALID => 0

    /**
     * Indicates the following status for these commands:
     * 
     * - Create I/O Submission Queue: The creation of the I/O Submission Queue failed due to an invalid queue identifier specified as part of the command. An invalid queue identifier is one that is currently in use or one that is outside the range supported by the controller.
     * - Delete I/O Submission Queue: The queue identifier specified in the command is invalid. This error is also indicated if the Admin Completion Queue identifier is specified.
     * - Create I/O Completion Queue: The creation of the I/O Completion Queue failed due to an invalid queue identifier specified as part of the command. An invalid queue identifier is one that is currently in use or one that is outside the range supported by the controller.
     * - Delete I/O Completion Queue:  The queue identifier specified in the command is invalid. This error is also indicated if the Admin Completion Queue identifier is specified.
     * @type {Integer (Int32)}
     */
    static NVME_STATUS_INVALID_QUEUE_IDENTIFIER => 1

    /**
     * Indicates the following status for the Create I/O Submission Queue and Create I/O Completion Queue commands:
     * 
     * The host attempted to create an I/O Completion Queue with an invalid number of entries. For example, a value of zero or a value which exceeds the maximum supported by the controller specified in the **MQES** field of the [NVME_CONTROLLER_CAPABILITIES](ns-nvme-nvme_controller_capabilities.md) structure.
     * @type {Integer (Int32)}
     */
    static NVME_STATUS_MAX_QUEUE_SIZE_EXCEEDED => 2

    /**
     * The number of concurrently outstanding Abort commands has exceeded the limit indicated in the **ACL** field of the [Identify Controller data structure](ns-nvme-nvme_identify_controller_data.md).
     * @type {Integer (Int32)}
     */
    static NVME_STATUS_ABORT_COMMAND_LIMIT_EXCEEDED => 3

    /**
     * The number of concurrently outstanding Asynchronous Event Request commands has been exceeded.
     * @type {Integer (Int32)}
     */
    static NVME_STATUS_ASYNC_EVENT_REQUEST_LIMIT_EXCEEDED => 5

    /**
     * The firmware slot indicated in the Firmware Commit command is invalid or read only. This error is indicated if the firmware slot exceeds the number supported.
     * @type {Integer (Int32)}
     */
    static NVME_STATUS_INVALID_FIRMWARE_SLOT => 6

    /**
     * The firmware image specified for activation in the Firmware Commit command is invalid and not loaded by the controller.
     * @type {Integer (Int32)}
     */
    static NVME_STATUS_INVALID_FIRMWARE_IMAGE => 7

    /**
     * The creation of the I/O Completion Queue failed due to an invalid interrupt vector specified as part of the Create I/O Completion Queue command.
     * @type {Integer (Int32)}
     */
    static NVME_STATUS_INVALID_INTERRUPT_VECTOR => 8

    /**
     * The log page indicated in the Get Log Page command is invalid. This error condition is also returned if a reserved log page is requested.
     * @type {Integer (Int32)}
     */
    static NVME_STATUS_INVALID_LOG_PAGE => 9

    /**
     * Indicates the following status for the Format NVM command: The format specified is invalid.
     * 
     * This may be due to various conditions, including:
     * 
     * - Specifying an invalid Logical Block Address (LBA) Format number.
     * - Enabling protection information when there is not sufficient metadata per LBA.
     * - Invalid security state. For more information, see the [TCG Storage Interface Interactions Specification (SIIS)](https://trustedcomputinggroup.org).
     * @type {Integer (Int32)}
     */
    static NVME_STATUS_INVALID_FORMAT => 10

    /**
     * Indicates the following status for the Firmware Commit command:
     * 
     * The firmware commit was successful, however, activation of the firmware image requires a conventional reset. If a Function Level Reset (FLR) or controller reset occurs prior to a conventional reset, the controller shall continue operation with the currently executing firmware image.
     * @type {Integer (Int32)}
     */
    static NVME_STATUS_FIRMWARE_ACTIVATION_REQUIRES_CONVENTIONAL_RESET => 11

    /**
     * Indicates the following status for the Delete I/O Completion Queue command:
     * 
     * It is invalid to delete the Specified I/O Completion Queue. The typical reason for this error condition is that there is an associated I/O Submission Queue that has not been deleted.
     * @type {Integer (Int32)}
     */
    static NVME_STATUS_INVALID_QUEUE_DELETION => 12

    /**
     * The Feature Identifier specified in the Set Features command does not support a saveable value.
     * @type {Integer (Int32)}
     */
    static NVME_STATUS_FEATURE_ID_NOT_SAVEABLE => 13

    /**
     * The Feature Identifier specified in the Set Features command may not be changed.
     * @type {Integer (Int32)}
     */
    static NVME_STATUS_FEATURE_NOT_CHANGEABLE => 14

    /**
     * The Feature Identifier specified in the Set Features command is not namespace specific. The Feature Identifier settings apply across all namespaces.
     * @type {Integer (Int32)}
     */
    static NVME_STATUS_FEATURE_NOT_NAMESPACE_SPECIFIC => 15

    /**
     * Indicates status for the Firmware Commit command.
     * @type {Integer (Int32)}
     */
    static NVME_STATUS_FIRMWARE_ACTIVATION_REQUIRES_NVM_SUBSYSTEM_RESET => 16

    /**
     * Indicates the following status for the Firmware Commit command:
     * 
     * The firmware commit was successful, however, activation of the firmware image requires an NVM Subsystem Reset. If any other type of reset occurs prior to an NVM Subsystem Reset, the controller shall continue operation with the currently executing firmware image.
     * @type {Integer (Int32)}
     */
    static NVME_STATUS_FIRMWARE_ACTIVATION_REQUIRES_RESET => 17

    /**
     * Indicates the following status for the Firmware Commit command:
     * 
     * The image specified if activated immediately would exceed the Maximum Time for Firmware Activation (MFTA) value reported in Identify Controller. To activate the firmware, the Firmware Commit command needs to be reissued and the image activated using a reset.
     * @type {Integer (Int32)}
     */
    static NVME_STATUS_FIRMWARE_ACTIVATION_REQUIRES_MAX_TIME_VIOLATION => 18

    /**
     * Indicates the following status for the Firmware Commit command:
     * 
     * The specified image is being prohibited from activation by the controller for vendor specific reasons. For example, the controller does not support down revision firmware.
     * @type {Integer (Int32)}
     */
    static NVME_STATUS_FIRMWARE_ACTIVATION_PROHIBITED => 19

    /**
     * Indicates the following status for these commands:
     * 
     * - Firmware Commit: This error is indicated if the firmware image has overlapping ranges.
     * - Set Features: This error is indicated if the LBA Range Type data structure has overlapping ranges.
     * - Firmware Image Download: This error is indicated if the firmware image has overlapping ranges.
     * @type {Integer (Int32)}
     */
    static NVME_STATUS_OVERLAPPING_RANGE => 20

    /**
     * Indicates the following status for the Namespace Management command:
     * 
     * Creating the namespace requires more free space than is currently available. The Command Specific Information field of the Error Information Log specifies the total amount of NVM capacity required to create the namespace in bytes.
     * @type {Integer (Int32)}
     */
    static NVME_STATUS_NAMESPACE_INSUFFICIENT_CAPACITY => 21

    /**
     * Indicates the following status for the Namespace Management command:
     * 
     * The number of namespaces supported has been exceeded.
     * @type {Integer (Int32)}
     */
    static NVME_STATUS_NAMESPACE_IDENTIFIER_UNAVAILABLE => 22

    /**
     * Indicates the following status for the Namespace Attachment command:
     * 
     * The controller is already attached to the namespace specified.
     * @type {Integer (Int32)}
     */
    static NVME_STATUS_NAMESPACE_ALREADY_ATTACHED => 24

    /**
     * Indicates the following status for the Namespace Attachment command:
     * 
     * The controller is not attached to the namespace. The request to attach the controller could not be completed because the namespace is private and is already attached to one controller.
     * @type {Integer (Int32)}
     */
    static NVME_STATUS_NAMESPACE_IS_PRIVATE => 25

    /**
     * Indicates the following status for the Namespace Attachment command:
     * 
     * The controller is not attached to the namespace. The request to detach the controller could not be completed.
     * @type {Integer (Int32)}
     */
    static NVME_STATUS_NAMESPACE_NOT_ATTACHED => 26

    /**
     * 
     * @type {Integer (Int32)}
     */
    static NVME_STATUS_NAMESPACE_THIN_PROVISIONING_NOT_SUPPORTED => 27

    /**
     * Indicates the following status for the Namespace Attachment command:
     * 
     * The controller list provided is invalid.
     * @type {Integer (Int32)}
     */
    static NVME_STATUS_CONTROLLER_LIST_INVALID => 28

    /**
     * Indicates status for the Device Self-test command.
     * @type {Integer (Int32)}
     */
    static NVME_STATUS_DEVICE_SELF_TEST_IN_PROGRESS => 29

    /**
     * Indicates status for the Firmware Commit command.
     * @type {Integer (Int32)}
     */
    static NVME_STATUS_BOOT_PARTITION_WRITE_PROHIBITED => 30

    /**
     * Indicates status for the Virtualization Management command.
     * @type {Integer (Int32)}
     */
    static NVME_STATUS_INVALID_CONTROLLER_IDENTIFIER => 31

    /**
     * Indicates status for the Virtualization Management command
     * @type {Integer (Int32)}
     */
    static NVME_STATUS_INVALID_SECONDARY_CONTROLLER_STATE => 32

    /**
     * Indicates status for the Virtualization Management command.
     * @type {Integer (Int32)}
     */
    static NVME_STATUS_INVALID_NUMBER_OF_CONTROLLER_RESOURCES => 33

    /**
     * Indicates status for the Virtualization Management command.
     * @type {Integer (Int32)}
     */
    static NVME_STATUS_INVALID_RESOURCE_IDENTIFIER => 34

    /**
     * @type {Integer (Int32)}
     */
    static NVME_STATUS_SANITIZE_PROHIBITED_ON_PERSISTENT_MEMORY => 35

    /**
     * @type {Integer (Int32)}
     */
    static NVME_STATUS_INVALID_ANA_GROUP_IDENTIFIER => 36

    /**
     * @type {Integer (Int32)}
     */
    static NVME_STATUS_ANA_ATTACH_FAILED => 37

    /**
     * @type {Integer (Int32)}
     */
    static NVME_STATUS_INSUFFICIENT_CAPACITY => 38

    /**
     * @type {Integer (Int32)}
     */
    static NVME_STATUS_NAMESPACE_ATTACHMENT_LIMIT_EXCEEDED => 39

    /**
     * @type {Integer (Int32)}
     */
    static NVME_STATUS_PROHIBITION_NOT_SUPPORTED => 40

    /**
     * @type {Integer (Int32)}
     */
    static NVME_IO_COMMAND_SET_NOT_SUPPORTED => 41

    /**
     * @type {Integer (Int32)}
     */
    static NVME_IO_COMMAND_SET_NOT_ENABLED => 42

    /**
     * @type {Integer (Int32)}
     */
    static NVME_IO_COMMAND_SET_COMBINATION_REJECTED => 43

    /**
     * @type {Integer (Int32)}
     */
    static NVME_IO_COMMAND_SET_INVALID => 44

    /**
     * @type {Integer (Int32)}
     */
    static NVME_STATUS_INVALID_DISCOVERY_INFORMATION => 47

    /**
     * @type {Integer (Int32)}
     */
    static NVME_STATUS_INSUFFICIENT_DISCOVERY_RESOURCES => 50

    /**
     * Indicates status for the Streams Directive command.
     * @type {Integer (Int32)}
     */
    static NVME_STATUS_STREAM_RESOURCE_ALLOCATION_FAILED => 127

    /**
     * @type {Integer (Int32)}
     */
    static NVME_STATUS_ZONE_INVALID_FORMAT => 127

    /**
     * Indicates the following status for these commands: Dataset Management, Read, Write
     * 
     * The attributes specified in the command are conflicting.
     * @type {Integer (Int32)}
     */
    static NVME_STATUS_NVM_CONFLICTING_ATTRIBUTES => 128

    /**
     * Indicates the following status for these commands: Compare, Read, Write, Write Zeroes
     * 
     * The Protection Information settings specified in the command are invalid.
     * @type {Integer (Int32)}
     */
    static NVME_STATUS_NVM_INVALID_PROTECTION_INFORMATION => 129

    /**
     * Indicates the following status for these commands: Dataset Management, Write, Write Uncorrectable, Write Zeroes
     * 
     * The controller may optionally report this status if a deallocate is attempted for a read only range.
     * @type {Integer (Int32)}
     */
    static NVME_STATUS_NVM_ATTEMPTED_WRITE_TO_READ_ONLY_RANGE => 130

    /**
     * @type {Integer (Int32)}
     */
    static NVME_STATUS_NVM_COMMAND_SIZE_LIMIT_EXCEEDED => 131

    /**
     * @type {Integer (Int32)}
     */
    static NVME_STATUS_ZONE_BOUNDARY_ERROR => 184

    /**
     * @type {Integer (Int32)}
     */
    static NVME_STATUS_ZONE_FULL => 185

    /**
     * @type {Integer (Int32)}
     */
    static NVME_STATUS_ZONE_READ_ONLY => 186

    /**
     * @type {Integer (Int32)}
     */
    static NVME_STATUS_ZONE_OFFLINE => 187

    /**
     * @type {Integer (Int32)}
     */
    static NVME_STATUS_ZONE_INVALID_WRITE => 188

    /**
     * @type {Integer (Int32)}
     */
    static NVME_STATUS_ZONE_TOO_MANY_ACTIVE => 189

    /**
     * @type {Integer (Int32)}
     */
    static NVME_STATUS_ZONE_TOO_MANY_OPEN => 190

    /**
     * @type {Integer (Int32)}
     */
    static NVME_STATUS_ZONE_INVALID_STATE_TRANSITION => 191
}
