#Requires AutoHotkey v2.0.0 64-bit

/**
 * 
 * @see https://learn.microsoft.com/windows/win32/api/nvme/ne-nvme-nvme_status_command_specific_codes
 * @namespace Windows.Win32.Storage.Nvme
 * @version v4.0.30319
 */
class NVME_STATUS_COMMAND_SPECIFIC_CODES{

    /**
     * @type {Integer (Int32)}
     */
    static NVME_STATUS_COMPLETION_QUEUE_INVALID => 0

    /**
     * @type {Integer (Int32)}
     */
    static NVME_STATUS_INVALID_QUEUE_IDENTIFIER => 1

    /**
     * @type {Integer (Int32)}
     */
    static NVME_STATUS_MAX_QUEUE_SIZE_EXCEEDED => 2

    /**
     * @type {Integer (Int32)}
     */
    static NVME_STATUS_ABORT_COMMAND_LIMIT_EXCEEDED => 3

    /**
     * @type {Integer (Int32)}
     */
    static NVME_STATUS_ASYNC_EVENT_REQUEST_LIMIT_EXCEEDED => 5

    /**
     * @type {Integer (Int32)}
     */
    static NVME_STATUS_INVALID_FIRMWARE_SLOT => 6

    /**
     * @type {Integer (Int32)}
     */
    static NVME_STATUS_INVALID_FIRMWARE_IMAGE => 7

    /**
     * @type {Integer (Int32)}
     */
    static NVME_STATUS_INVALID_INTERRUPT_VECTOR => 8

    /**
     * @type {Integer (Int32)}
     */
    static NVME_STATUS_INVALID_LOG_PAGE => 9

    /**
     * @type {Integer (Int32)}
     */
    static NVME_STATUS_INVALID_FORMAT => 10

    /**
     * @type {Integer (Int32)}
     */
    static NVME_STATUS_FIRMWARE_ACTIVATION_REQUIRES_CONVENTIONAL_RESET => 11

    /**
     * @type {Integer (Int32)}
     */
    static NVME_STATUS_INVALID_QUEUE_DELETION => 12

    /**
     * @type {Integer (Int32)}
     */
    static NVME_STATUS_FEATURE_ID_NOT_SAVEABLE => 13

    /**
     * @type {Integer (Int32)}
     */
    static NVME_STATUS_FEATURE_NOT_CHANGEABLE => 14

    /**
     * @type {Integer (Int32)}
     */
    static NVME_STATUS_FEATURE_NOT_NAMESPACE_SPECIFIC => 15

    /**
     * @type {Integer (Int32)}
     */
    static NVME_STATUS_FIRMWARE_ACTIVATION_REQUIRES_NVM_SUBSYSTEM_RESET => 16

    /**
     * @type {Integer (Int32)}
     */
    static NVME_STATUS_FIRMWARE_ACTIVATION_REQUIRES_RESET => 17

    /**
     * @type {Integer (Int32)}
     */
    static NVME_STATUS_FIRMWARE_ACTIVATION_REQUIRES_MAX_TIME_VIOLATION => 18

    /**
     * @type {Integer (Int32)}
     */
    static NVME_STATUS_FIRMWARE_ACTIVATION_PROHIBITED => 19

    /**
     * @type {Integer (Int32)}
     */
    static NVME_STATUS_OVERLAPPING_RANGE => 20

    /**
     * @type {Integer (Int32)}
     */
    static NVME_STATUS_NAMESPACE_INSUFFICIENT_CAPACITY => 21

    /**
     * @type {Integer (Int32)}
     */
    static NVME_STATUS_NAMESPACE_IDENTIFIER_UNAVAILABLE => 22

    /**
     * @type {Integer (Int32)}
     */
    static NVME_STATUS_NAMESPACE_ALREADY_ATTACHED => 24

    /**
     * @type {Integer (Int32)}
     */
    static NVME_STATUS_NAMESPACE_IS_PRIVATE => 25

    /**
     * @type {Integer (Int32)}
     */
    static NVME_STATUS_NAMESPACE_NOT_ATTACHED => 26

    /**
     * @type {Integer (Int32)}
     */
    static NVME_STATUS_NAMESPACE_THIN_PROVISIONING_NOT_SUPPORTED => 27

    /**
     * @type {Integer (Int32)}
     */
    static NVME_STATUS_CONTROLLER_LIST_INVALID => 28

    /**
     * @type {Integer (Int32)}
     */
    static NVME_STATUS_DEVICE_SELF_TEST_IN_PROGRESS => 29

    /**
     * @type {Integer (Int32)}
     */
    static NVME_STATUS_BOOT_PARTITION_WRITE_PROHIBITED => 30

    /**
     * @type {Integer (Int32)}
     */
    static NVME_STATUS_INVALID_CONTROLLER_IDENTIFIER => 31

    /**
     * @type {Integer (Int32)}
     */
    static NVME_STATUS_INVALID_SECONDARY_CONTROLLER_STATE => 32

    /**
     * @type {Integer (Int32)}
     */
    static NVME_STATUS_INVALID_NUMBER_OF_CONTROLLER_RESOURCES => 33

    /**
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
     * @type {Integer (Int32)}
     */
    static NVME_STATUS_STREAM_RESOURCE_ALLOCATION_FAILED => 127

    /**
     * @type {Integer (Int32)}
     */
    static NVME_STATUS_ZONE_INVALID_FORMAT => 127

    /**
     * @type {Integer (Int32)}
     */
    static NVME_STATUS_NVM_CONFLICTING_ATTRIBUTES => 128

    /**
     * @type {Integer (Int32)}
     */
    static NVME_STATUS_NVM_INVALID_PROTECTION_INFORMATION => 129

    /**
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
