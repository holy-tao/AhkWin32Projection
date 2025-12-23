#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * A callback flag to inform the sync provider that a placeholder under one of its sync roots has been successfully dehydrated.
 * @see https://learn.microsoft.com/windows/win32/api/cfapi/ne-cfapi-cf_callback_dehydrate_completion_flags
 * @namespace Windows.Win32.Storage.CloudFilters
 * @version v4.0.30319
 */
class CF_CALLBACK_DEHYDRATE_COMPLETION_FLAGS extends Win32BitflagEnum{

    /**
     * No dehydration completion flag.
     * @type {Integer (Int32)}
     */
    static CF_CALLBACK_DEHYDRATE_COMPLETION_FLAG_NONE => 0

    /**
     * A flag set if the dehydration request is initiated by a system background service.
     * @type {Integer (Int32)}
     */
    static CF_CALLBACK_DEHYDRATE_COMPLETION_FLAG_BACKGROUND => 1

    /**
     * A flag set if the placeholder was hydrated prior to the dehydration request.
     * @type {Integer (Int32)}
     */
    static CF_CALLBACK_DEHYDRATE_COMPLETION_FLAG_DEHYDRATED => 2
}
