#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Defines values that specify a command in the Admin command set which. The Admin command set contains commands that may be submitted to the Admin Submission Queue.
 * @see https://learn.microsoft.com/windows/win32/api/nvme/ne-nvme-nvme_admin_commands
 * @namespace Windows.Win32.Storage.Nvme
 */
class NVME_ADMIN_COMMANDS extends Win32Enum {

    /**
     * The Delete I/O Submission Queue command.
     * Native name: NVME_ADMIN_COMMAND_DELETE_IO_SQ
     * @type {Integer (Int32)}
     */
    static COMMAND_DELETE_IO_SQ => 0

    /**
     * The Create I/O Submission Queue command.
     * Native name: NVME_ADMIN_COMMAND_CREATE_IO_SQ
     * @type {Integer (Int32)}
     */
    static COMMAND_CREATE_IO_SQ => 1

    /**
     * The Get Log Page command.
     * Native name: NVME_ADMIN_COMMAND_GET_LOG_PAGE
     * @type {Integer (Int32)}
     */
    static COMMAND_GET_LOG_PAGE => 2

    /**
     * The Delete I/O Completion Queue command.
     * Native name: NVME_ADMIN_COMMAND_DELETE_IO_CQ
     * @type {Integer (Int32)}
     */
    static COMMAND_DELETE_IO_CQ => 4

    /**
     * The Create I/O Completion Queue command.
     * Native name: NVME_ADMIN_COMMAND_CREATE_IO_CQ
     * @type {Integer (Int32)}
     */
    static COMMAND_CREATE_IO_CQ => 5

    /**
     * The Identify command.
     * Native name: NVME_ADMIN_COMMAND_IDENTIFY
     * @type {Integer (Int32)}
     */
    static COMMAND_IDENTIFY => 6

    /**
     * The Abort command.
     * Native name: NVME_ADMIN_COMMAND_ABORT
     * @type {Integer (Int32)}
     */
    static COMMAND_ABORT => 8

    /**
     * The Set Features command.
     * Native name: NVME_ADMIN_COMMAND_SET_FEATURES
     * @type {Integer (Int32)}
     */
    static COMMAND_SET_FEATURES => 9

    /**
     * The Get Features command.
     * Native name: NVME_ADMIN_COMMAND_GET_FEATURES
     * @type {Integer (Int32)}
     */
    static COMMAND_GET_FEATURES => 10

    /**
     * The Asynchronous Event Request command.
     * Native name: NVME_ADMIN_COMMAND_ASYNC_EVENT_REQUEST
     * @type {Integer (Int32)}
     */
    static COMMAND_ASYNC_EVENT_REQUEST => 12

    /**
     * The Namespace Management command.
     * Native name: NVME_ADMIN_COMMAND_NAMESPACE_MANAGEMENT
     * @type {Integer (Int32)}
     */
    static COMMAND_NAMESPACE_MANAGEMENT => 13

    /**
     * This command has been renamed to the Firmware Commit command in NVME spec v1.2.
     * Native name: NVME_ADMIN_COMMAND_FIRMWARE_ACTIVATE
     * @type {Integer (Int32)}
     */
    static COMMAND_FIRMWARE_ACTIVATE => 16

    /**
     * The Firmware Commit command.
     * Native name: NVME_ADMIN_COMMAND_FIRMWARE_COMMIT
     * @type {Integer (Int32)}
     */
    static COMMAND_FIRMWARE_COMMIT => 16

    /**
     * The Firmware Image Download command.
     * Native name: NVME_ADMIN_COMMAND_FIRMWARE_IMAGE_DOWNLOAD
     * @type {Integer (Int32)}
     */
    static COMMAND_FIRMWARE_IMAGE_DOWNLOAD => 17

    /**
     * The Device Self-test command
     * Native name: NVME_ADMIN_COMMAND_DEVICE_SELF_TEST
     * @type {Integer (Int32)}
     */
    static COMMAND_DEVICE_SELF_TEST => 20

    /**
     * The Namespace Attachment command.
     * Native name: NVME_ADMIN_COMMAND_NAMESPACE_ATTACHMENT
     * @type {Integer (Int32)}
     */
    static COMMAND_NAMESPACE_ATTACHMENT => 21

    /**
     * Native name: NVME_ADMIN_COMMAND_KEEP_ALIVE
     * @type {Integer (Int32)}
     */
    static COMMAND_KEEP_ALIVE => 24

    /**
     * The Directive Send command.
     * Native name: NVME_ADMIN_COMMAND_DIRECTIVE_SEND
     * @type {Integer (Int32)}
     */
    static COMMAND_DIRECTIVE_SEND => 25

    /**
     * The Directive Receive command.
     * Native name: NVME_ADMIN_COMMAND_DIRECTIVE_RECEIVE
     * @type {Integer (Int32)}
     */
    static COMMAND_DIRECTIVE_RECEIVE => 26

    /**
     * The Virtualization Management command.
     * Native name: NVME_ADMIN_COMMAND_VIRTUALIZATION_MANAGEMENT
     * @type {Integer (Int32)}
     */
    static COMMAND_VIRTUALIZATION_MANAGEMENT => 28

    /**
     * The NVMe-MI Send command
     * Native name: NVME_ADMIN_COMMAND_NVME_MI_SEND
     * @type {Integer (Int32)}
     */
    static COMMAND_NVME_MI_SEND => 29

    /**
     * The NVMe-MI Receive command.
     * Native name: NVME_ADMIN_COMMAND_NVME_MI_RECEIVE
     * @type {Integer (Int32)}
     */
    static COMMAND_NVME_MI_RECEIVE => 30

    /**
     * Native name: NVME_ADMIN_COMMAND_DISCOVERY_INFO_MGMT
     * @type {Integer (Int32)}
     */
    static COMMAND_DISCOVERY_INFO_MGMT => 33

    /**
     * The Doorbell Buffer Config command.
     * Native name: NVME_ADMIN_COMMAND_DOORBELL_BUFFER_CONFIG
     * @type {Integer (Int32)}
     */
    static COMMAND_DOORBELL_BUFFER_CONFIG => 124

    /**
     * Native name: NVME_ADMIN_COMMAND_FABRICS
     * @type {Integer (Int32)}
     */
    static COMMAND_FABRICS => 127

    /**
     * The Format NVM command.
     * Native name: NVME_ADMIN_COMMAND_FORMAT_NVM
     * @type {Integer (Int32)}
     */
    static COMMAND_FORMAT_NVM => 128

    /**
     * The Security Send command.
     * Native name: NVME_ADMIN_COMMAND_SECURITY_SEND
     * @type {Integer (Int32)}
     */
    static COMMAND_SECURITY_SEND => 129

    /**
     * The Security Receive command.
     * Native name: NVME_ADMIN_COMMAND_SECURITY_RECEIVE
     * @type {Integer (Int32)}
     */
    static COMMAND_SECURITY_RECEIVE => 130

    /**
     * The Sanitize command.
     * Native name: NVME_ADMIN_COMMAND_SANITIZE
     * @type {Integer (Int32)}
     */
    static COMMAND_SANITIZE => 132

    /**
     * Native name: NVME_ADMIN_COMMAND_GET_LBA_STATUS
     * @type {Integer (Int32)}
     */
    static COMMAND_GET_LBA_STATUS => 134
}
