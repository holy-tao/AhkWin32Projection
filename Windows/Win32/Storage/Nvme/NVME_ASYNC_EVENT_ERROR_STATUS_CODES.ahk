#Requires AutoHotkey v2.0.0 64-bit

/**
 * Contains values that indicate a general error event type.
 * @remarks
 * Use this enumeration to specify values in the **NVME_ASYNC_EVENT_TYPE_ERROR_STATUS** field of the [NVME_ASYNC_EVENT_TYPES](ne-nvme-nvme_async_event_types.md) enumeration that is used in the Async Event Request Admin command.
 * @see https://learn.microsoft.com/windows/win32/api/nvme/ne-nvme-nvme_async_event_error_status_codes
 * @namespace Windows.Win32.Storage.Nvme
 * @version v4.0.30319
 */
class NVME_ASYNC_EVENT_ERROR_STATUS_CODES{

    /**
     * A write to an invalid doorbell register. The host software wrote to the doorbell of a queue that was not created.
     * @type {Integer (Int32)}
     */
    static NVME_ASYNC_ERROR_INVALID_SUBMISSION_QUEUE => 0

    /**
     * Invalid doorbell write value. The host software attempted to write an invalid doorbell value. Some possible causes of this error are:
 * 
 * - The value written was out of range of the corresponding queue’s base address and size.
 * - The value written is the same as the previously written doorbell value.
 * - The number of commands that would be added as part of a doorbell write would exceed the number of available entries.
 * - The host software attempted to add a command to a full Submission Queue.
 * - The host software attempted to remove a completion queue entry from an empty Completion Queue.
     * @type {Integer (Int32)}
     */
    static NVME_ASYNC_ERROR_INVALID_DOORBELL_WRITE_VALUE => 1

    /**
     * A diagnostic failure was detected. This error may include a self-test operation.
     * @type {Integer (Int32)}
     */
    static NVME_ASYNC_ERROR_DIAG_FAILURE => 2

    /**
     * A failure occurred that is persistent, and the controller is unable to isolate it to a specific set of commands.
 * 
 * If this error is indicated, the Controller Fatal Status (**CFS**) bit of the [NVME_CONTROLLER_STATUS](ns-nvme-nvme_controller_status.md) structure may be set to `1` and the host should perform a reset. For more information, see [NVM Subsystem Reset](ns-nvme-nvme_nvm_subsystem_reset.md).
     * @type {Integer (Int32)}
     */
    static NVME_ASYNC_ERROR_PERSISTENT_INTERNAL_DEVICE_ERROR => 3

    /**
     * A transient internal error occurred that is specific to a particular set of commands. Controller operation may continue without a reset.
     * @type {Integer (Int32)}
     */
    static NVME_ASYNC_ERROR_TRANSIENT_INTERNAL_DEVICE_ERROR => 4

    /**
     * The firmware image could not be loaded. The controller reverted to the previously active firmware image or a baseline read-only firmware image.
     * @type {Integer (Int32)}
     */
    static NVME_ASYNC_ERROR_FIRMWARE_IMAGE_LOAD_ERROR => 5
}
