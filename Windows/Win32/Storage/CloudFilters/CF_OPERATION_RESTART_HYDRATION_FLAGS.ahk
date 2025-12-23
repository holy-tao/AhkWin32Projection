#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Flags to restart data hydration on a placeholder file or folder.
 * @see https://learn.microsoft.com/windows/win32/api/cfapi/ne-cfapi-cf_operation_restart_hydration_flags
 * @namespace Windows.Win32.Storage.CloudFilters
 * @version v4.0.30319
 */
class CF_OPERATION_RESTART_HYDRATION_FLAGS extends Win32BitflagEnum{

    /**
     * No restart data hydration flag.
     * @type {Integer (Int32)}
     */
    static CF_OPERATION_RESTART_HYDRATION_FLAG_NONE => 0

    /**
     * If this flag is specified, the placeholder will be marked in-sync upon a successful **RESTART_HYDRATION** operation.
     * @type {Integer (Int32)}
     */
    static CF_OPERATION_RESTART_HYDRATION_FLAG_MARK_IN_SYNC => 1
}
