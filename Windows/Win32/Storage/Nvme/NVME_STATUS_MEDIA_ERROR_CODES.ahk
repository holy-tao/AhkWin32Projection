#Requires AutoHotkey v2.0.0 64-bit

/**
 * Contains values that indicate an error associated with the NVM media or indicate a data integrity type error.
 * @remarks
 * 
 * @see https://learn.microsoft.com/windows/win32/api/nvme/ne-nvme-nvme_status_media_error_codes
 * @namespace Windows.Win32.Storage.Nvme
 * @version v4.0.30319
 */
class NVME_STATUS_MEDIA_ERROR_CODES{

    /**
     * The write data could not be committed to the media.
     * @type {Integer (Int32)}
     */
    static NVME_STATUS_NVM_WRITE_FAULT => 128

    /**
     * The read data could not be recovered from the media.
     * @type {Integer (Int32)}
     */
    static NVME_STATUS_NVM_UNRECOVERED_READ_ERROR => 129

    /**
     * The command was aborted due to an end-to-end guard check failure.
     * @type {Integer (Int32)}
     */
    static NVME_STATUS_NVM_END_TO_END_GUARD_CHECK_ERROR => 130

    /**
     * The command was aborted due to an end-to-end application tag check failure.
     * @type {Integer (Int32)}
     */
    static NVME_STATUS_NVM_END_TO_END_APPLICATION_TAG_CHECK_ERROR => 131

    /**
     * The command was aborted due to an end-to-end reference tag check failure.
     * @type {Integer (Int32)}
     */
    static NVME_STATUS_NVM_END_TO_END_REFERENCE_TAG_CHECK_ERROR => 132

    /**
     * The command failed due to a miscompare during a Compare command.
     * @type {Integer (Int32)}
     */
    static NVME_STATUS_NVM_COMPARE_FAILURE => 133

    /**
     * Access to the namespace and/or Logical Block Address (LBA) range is denied due to lack of access rights. For more information, see the [TCG Storage Interface Interactions Specification (SIIS)](https://trustedcomputinggroup.org).
     * @type {Integer (Int32)}
     */
    static NVME_STATUS_NVM_ACCESS_DENIED => 134

    /**
     * The command failed due to an attempt to read from an LBA range containing a deallocated or unwritten logical block.
     * @type {Integer (Int32)}
     */
    static NVME_STATUS_NVM_DEALLOCATED_OR_UNWRITTEN_LOGICAL_BLOCK => 135
}
