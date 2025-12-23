#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Defines values that specify a command in the Admin command set which. The Admin command set contains commands that may be submitted to the Admin Submission Queue.
 * @remarks
 * 
 * @see https://learn.microsoft.com/windows/win32/api/nvme/ne-nvme-nvme_admin_commands
 * @namespace Windows.Win32.Storage.Nvme
 * @version v4.0.30319
 */
class NVME_ADMIN_COMMANDS extends Win32Enum{

    /**
     * The Delete I/O Submission Queue command.
     * @type {Integer (Int32)}
     */
    static NVME_ADMIN_COMMAND_DELETE_IO_SQ => 0

    /**
     * The Create I/O Submission Queue command.
     * @type {Integer (Int32)}
     */
    static NVME_ADMIN_COMMAND_CREATE_IO_SQ => 1

    /**
     * The Get Log Page command.
     * @type {Integer (Int32)}
     */
    static NVME_ADMIN_COMMAND_GET_LOG_PAGE => 2

    /**
     * The Delete I/O Completion Queue command.
     * @type {Integer (Int32)}
     */
    static NVME_ADMIN_COMMAND_DELETE_IO_CQ => 4

    /**
     * The Create I/O Completion Queue command.
     * @type {Integer (Int32)}
     */
    static NVME_ADMIN_COMMAND_CREATE_IO_CQ => 5

    /**
     * The Identify command.
     * @type {Integer (Int32)}
     */
    static NVME_ADMIN_COMMAND_IDENTIFY => 6

    /**
     * The Abort command.
     * @type {Integer (Int32)}
     */
    static NVME_ADMIN_COMMAND_ABORT => 8

    /**
     * The Set Features command.
     * @type {Integer (Int32)}
     */
    static NVME_ADMIN_COMMAND_SET_FEATURES => 9

    /**
     * The Get Features command.
     * @type {Integer (Int32)}
     */
    static NVME_ADMIN_COMMAND_GET_FEATURES => 10

    /**
     * The Asynchronous Event Request command.
     * @type {Integer (Int32)}
     */
    static NVME_ADMIN_COMMAND_ASYNC_EVENT_REQUEST => 12

    /**
     * The Namespace Management command.
     * @type {Integer (Int32)}
     */
    static NVME_ADMIN_COMMAND_NAMESPACE_MANAGEMENT => 13

    /**
     * This command has been renamed to the Firmware Commit command in NVME spec v1.2.
     * @type {Integer (Int32)}
     */
    static NVME_ADMIN_COMMAND_FIRMWARE_ACTIVATE => 16

    /**
     * The Firmware Commit command.
     * @type {Integer (Int32)}
     */
    static NVME_ADMIN_COMMAND_FIRMWARE_COMMIT => 16

    /**
     * The Firmware Image Download command.
     * @type {Integer (Int32)}
     */
    static NVME_ADMIN_COMMAND_FIRMWARE_IMAGE_DOWNLOAD => 17

    /**
     * The Device Self-test command
     * @type {Integer (Int32)}
     */
    static NVME_ADMIN_COMMAND_DEVICE_SELF_TEST => 20

    /**
     * The Namespace Attachment command.
     * @type {Integer (Int32)}
     */
    static NVME_ADMIN_COMMAND_NAMESPACE_ATTACHMENT => 21

    /**
     * @type {Integer (Int32)}
     */
    static NVME_ADMIN_COMMAND_KEEP_ALIVE => 24

    /**
     * The Directive Send command.
     * @type {Integer (Int32)}
     */
    static NVME_ADMIN_COMMAND_DIRECTIVE_SEND => 25

    /**
     * The Directive Receive command.
     * @type {Integer (Int32)}
     */
    static NVME_ADMIN_COMMAND_DIRECTIVE_RECEIVE => 26

    /**
     * The Virtualization Management command.
     * @type {Integer (Int32)}
     */
    static NVME_ADMIN_COMMAND_VIRTUALIZATION_MANAGEMENT => 28

    /**
     * The NVMe-MI Send command
     * @type {Integer (Int32)}
     */
    static NVME_ADMIN_COMMAND_NVME_MI_SEND => 29

    /**
     * The NVMe-MI Receive command.
     * @type {Integer (Int32)}
     */
    static NVME_ADMIN_COMMAND_NVME_MI_RECEIVE => 30

    /**
     * @type {Integer (Int32)}
     */
    static NVME_ADMIN_COMMAND_DISCOVERY_INFO_MGMT => 33

    /**
     * The Doorbell Buffer Config command.
     * @type {Integer (Int32)}
     */
    static NVME_ADMIN_COMMAND_DOORBELL_BUFFER_CONFIG => 124

    /**
     * @type {Integer (Int32)}
     */
    static NVME_ADMIN_COMMAND_FABRICS => 127

    /**
     * The Format NVM command.
     * @type {Integer (Int32)}
     */
    static NVME_ADMIN_COMMAND_FORMAT_NVM => 128

    /**
     * The Security Send command.
     * @type {Integer (Int32)}
     */
    static NVME_ADMIN_COMMAND_SECURITY_SEND => 129

    /**
     * The Security Receive command.
     * @type {Integer (Int32)}
     */
    static NVME_ADMIN_COMMAND_SECURITY_RECEIVE => 130

    /**
     * The Sanitize command.
     * @type {Integer (Int32)}
     */
    static NVME_ADMIN_COMMAND_SANITIZE => 132

    /**
     * @type {Integer (Int32)}
     */
    static NVME_ADMIN_COMMAND_GET_LBA_STATUS => 134
}
