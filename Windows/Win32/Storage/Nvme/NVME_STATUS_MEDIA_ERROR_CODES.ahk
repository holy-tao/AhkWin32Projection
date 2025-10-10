#Requires AutoHotkey v2.0.0 64-bit

/**
 * @namespace Windows.Win32.Storage.Nvme
 * @version v4.0.30319
 */
class NVME_STATUS_MEDIA_ERROR_CODES{

    /**
     * @type {Integer (Int32)}
     */
    static NVME_STATUS_NVM_WRITE_FAULT => 128

    /**
     * @type {Integer (Int32)}
     */
    static NVME_STATUS_NVM_UNRECOVERED_READ_ERROR => 129

    /**
     * @type {Integer (Int32)}
     */
    static NVME_STATUS_NVM_END_TO_END_GUARD_CHECK_ERROR => 130

    /**
     * @type {Integer (Int32)}
     */
    static NVME_STATUS_NVM_END_TO_END_APPLICATION_TAG_CHECK_ERROR => 131

    /**
     * @type {Integer (Int32)}
     */
    static NVME_STATUS_NVM_END_TO_END_REFERENCE_TAG_CHECK_ERROR => 132

    /**
     * @type {Integer (Int32)}
     */
    static NVME_STATUS_NVM_COMPARE_FAILURE => 133

    /**
     * @type {Integer (Int32)}
     */
    static NVME_STATUS_NVM_ACCESS_DENIED => 134

    /**
     * @type {Integer (Int32)}
     */
    static NVME_STATUS_NVM_DEALLOCATED_OR_UNWRITTEN_LOGICAL_BLOCK => 135
}
