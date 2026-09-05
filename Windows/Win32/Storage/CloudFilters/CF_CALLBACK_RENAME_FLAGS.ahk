#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Call back flags to inform the sync provider that a placeholder under one of its sync roots is about to be renamed or moved.
 * @see https://learn.microsoft.com/windows/win32/api/cfapi/ne-cfapi-cf_callback_rename_flags
 * @namespace Windows.Win32.Storage.CloudFilters
 */
class CF_CALLBACK_RENAME_FLAGS extends Win32BitflagEnum {

    /**
     * No rename flag.
     * Native name: CF_CALLBACK_RENAME_FLAG_NONE
     * @type {Integer (Int32)}
     */
    static FLAG_NONE => 0

    /**
     * Flag set if the placeholder is a directory.
     * Native name: CF_CALLBACK_RENAME_FLAG_IS_DIRECTORY
     * @type {Integer (Int32)}
     */
    static FLAG_IS_DIRECTORY => 1

    /**
     * Flag set if the link to be renamed or moved is within a sync root managed by the sync process.
     * Native name: CF_CALLBACK_RENAME_FLAG_SOURCE_IN_SCOPE
     * @type {Integer (Int32)}
     */
    static FLAG_SOURCE_IN_SCOPE => 2

    /**
     * Flag set if the rename or move target is in the same sync root of the source path.
     * Native name: CF_CALLBACK_RENAME_FLAG_TARGET_IN_SCOPE
     * @type {Integer (Int32)}
     */
    static FLAG_TARGET_IN_SCOPE => 4
}
