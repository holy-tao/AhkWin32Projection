#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * The types of operations that can be performed on placeholder files and directories.
 * @see https://learn.microsoft.com/windows/win32/api/cfapi/ne-cfapi-cf_operation_type
 * @namespace Windows.Win32.Storage.CloudFilters
 * @version v4.0.30319
 */
class CF_OPERATION_TYPE extends Win32Enum{

    /**
     * A sync provider performs **TRANSFER_DATA** to hydrate a placeholder file. This operation can be performed as a response to a **FETCH_DATA** callback, a **VALIDATE_DATA** callback, or as part of a preemptive background hydration effort outside of any callback context.
     * @type {Integer (Int32)}
     */
    static CF_OPERATION_TYPE_TRANSFER_DATA => 0

    /**
     * A sync provider performs a **RETRIEVE_DATA** operation as part of the placeholder hydration in order to validate the integrity of the data that was previously transferred to the placeholder. This operation can be performed as a response to a **FETCH_DATA** callback, a **VALIDATE_DATA** callback, or as part of a preemptive background hydration effort outside of any callback context.
     * @type {Integer (Int32)}
     */
    static CF_OPERATION_TYPE_RETRIEVE_DATA => 1

    /**
     * A sync provider performs a **ACK_DATA** operation as part of the placeholder hydration after validating the integrity of the data that was previously transferred to the platform. This operation can be performed as a response to a **FETCH_DATA** callback, a **VALIDATE_DATA** callback, or as part of a preemptive background hydration effort outside of any callback context
     * @type {Integer (Int32)}
     */
    static CF_OPERATION_TYPE_ACK_DATA => 2

    /**
     * A sync provider performs a **RESTART_HYDRATION** operation to restart an ongoing hydration. This operation can be performed as a response to a **FETCH_DATA** callback, a **VALIDATE_DATA** callback, or as part of a preemptive background hydration effort outside of any callback context.
     * @type {Integer (Int32)}
     */
    static CF_OPERATION_TYPE_RESTART_HYDRATION => 3

    /**
     * Transfers placeholders. The sync provider must transfer all placeholders matching the pattern but not necessarily in one-shot, as a minimum requirement. The sync provider may additionally choose to transfer placeholders not matching the pattern.
     * @type {Integer (Int32)}
     */
    static CF_OPERATION_TYPE_TRANSFER_PLACEHOLDERS => 4

    /**
     * Acknowledge and dehydrate a placeholder.
     * @type {Integer (Int32)}
     */
    static CF_OPERATION_TYPE_ACK_DEHYDRATE => 5

    /**
     * Acknowledge and delete a placeholder.
     * @type {Integer (Int32)}
     */
    static CF_OPERATION_TYPE_ACK_DELETE => 6

    /**
     * Acknowledge and rename a placeholder.
     * @type {Integer (Int32)}
     */
    static CF_OPERATION_TYPE_ACK_RENAME => 7
}
