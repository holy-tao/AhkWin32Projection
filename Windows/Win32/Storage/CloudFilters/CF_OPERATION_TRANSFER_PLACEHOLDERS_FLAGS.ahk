#Requires AutoHotkey v2.0.0 64-bit

/**
 * Flags to specify the behavior when transferring a placeholder file or directory.
 * @see https://learn.microsoft.com/windows/win32/api/cfapi/ne-cfapi-cf_operation_transfer_placeholders_flags
 * @namespace Windows.Win32.Storage.CloudFilters
 * @version v4.0.30319
 */
class CF_OPERATION_TRANSFER_PLACEHOLDERS_FLAGS{

    /**
     * No transfer placeholder flags.
     * @type {Integer (Int32)}
     */
    static CF_OPERATION_TRANSFER_PLACEHOLDERS_FLAG_NONE => 0

    /**
     * Causes the API to return immediately if a placeholder transfer fails. If a transfer fails, the error code will be returned.
     * @type {Integer (Int32)}
     */
    static CF_OPERATION_TRANSFER_PLACEHOLDERS_FLAG_STOP_ON_ERROR => 1

    /**
     * If the provider no longer wants its **CF_CALLBACK_TYPE_FETCH_PLACEHOLDERS** callback to be invoked, it should mark the placeholder directory fully populated by setting the **CF_OPERATION_TRANSFER_PLACEHOLDERS_FLAG_DISABLE_ON_DEMAND_POPULATION** flag in **CF_OPERATION_TYPE_TRANSFER_PLACEHOLDERS**. Typically, a provider should set this flag after it has already laid down all the placeholders in the directory, or if the current invocation of **CF_OPERATION_TYPE_TRANSFER_PLACEHOLDERS** is supposed to lay down all the placeholders. The provider can set this flag anytime and it would be honored by the platform if the during the current invocation of **CF_OPERATION_TYPE_TRANSFER_PLACEHOLDERS**:
 * 
 * 1. `TransferPlaceholders.PlaceholderTotalCount` <= (Sum of Prior `TransferPlaceholders.EntriesProcessed`) + Current `TransferPlaceholders.PlaceholderCount`.
 * 2. All current `TransferPlaceholders.PlaceholderCount` placeholders are successfully created.
 * 
 * For example, if a provider has to transfer ten placeholders, it could transfer and set **CF_OPERATION_TRANSFER_PLACEHOLDERS_FLAG_DISABLE_ON_DEMAND_POPULATION** in one of the following ways.
 * 
 * It could do this:
 * 
 * 1. Set `TransferPlaceholders.PlaceholderTotalCount` = `5`, set `TransferPlaceholders.PlaceholderCount` = `4`, and set `Flags` to `NONE`.
 * 2. Set `TransferPlaceholders.PlaceholderTotalCount` = `9`, set `TransferPlaceholders.PlaceholderCount` = `4`, and set `Flags` to `NONE`.
 * 3. Set `TransferPlaceholders.PlaceholderTotalCount` = `11`, set `TransferPlaceholders.PlaceholderCount` = `2`, and set `Flags` to `NONE`.
 * 4. Set `TransferPlaceholders.PlaceholderTotalCount` = `10`, set `TransferPlaceholders.PlaceholderCount` = `0`, and set `Flags` to `CF_OPERATION_TRANSFER_PLACEHOLDERS_FLAG_DISABLE_ON_DEMAND_POPULATION`.
 * 
 * Or it could do the following:
 * 
 * 1. Set `TransferPlaceholders.PlaceholderTotalCount` = `5`, set `TransferPlaceholders.PlaceholderCount` = `4`, and set `Flags` to `NONE`.
 * 2. Set `TransferPlaceholders.PlaceholderTotalCount` = `9`, set `TransferPlaceholders.PlaceholderCount` = `4`, and set `Flags` to `NONE`.
 * 3. Set `TransferPlaceholders.PlaceholderTotalCount` = `10`, set `TransferPlaceholders.PlaceholderCount` = `2`, and set `Flags` to `CF_OPERATION_TRANSFER_PLACEHOLDERS_FLAG_DISABLE_ON_DEMAND_POPULATION`.
     * @type {Integer (Int32)}
     */
    static CF_OPERATION_TRANSFER_PLACEHOLDERS_FLAG_DISABLE_ON_DEMAND_POPULATION => 2
}
