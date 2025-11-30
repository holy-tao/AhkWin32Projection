#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * The types of operations that can be performed on placeholder files and directories.
 * @see https://docs.microsoft.com/windows/win32/api//cfapi/ne-cfapi-cf_operation_type
 * @namespace Windows.Win32.Storage.CloudFilters
 * @version v4.0.30319
 */
class CF_OPERATION_TYPE extends Win32Enum{

    /**
     * Transfers data to hydrate a placeholder.
     * @type {Integer (Int32)}
     */
    static CF_OPERATION_TYPE_TRANSFER_DATA => 0

    /**
     * Validates the integrity of data previously transferred to a placeholder.
     * @type {Integer (Int32)}
     */
    static CF_OPERATION_TYPE_RETRIEVE_DATA => 1

    /**
     * Data is acknowledged by the sync provider.
     * @type {Integer (Int32)}
     */
    static CF_OPERATION_TYPE_ACK_DATA => 2

    /**
     * Restarts ongoing data hydration.
     * @type {Integer (Int32)}
     */
    static CF_OPERATION_TYPE_RESTART_HYDRATION => 3

    /**
     * Transfers placeholders.
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
