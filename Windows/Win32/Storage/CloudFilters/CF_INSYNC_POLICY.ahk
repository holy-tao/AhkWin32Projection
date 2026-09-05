#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * A policy allowing a sync provider to control when the platform should clear the in-sync state on a placeholder file or directory.
 * @see https://learn.microsoft.com/windows/win32/api/cfapi/ne-cfapi-cf_insync_policy
 * @namespace Windows.Win32.Storage.CloudFilters
 */
class CF_INSYNC_POLICY extends Win32BitflagEnum {

    /**
     * The default in-sync policy.
     * Native name: CF_INSYNC_POLICY_NONE
     * @type {Integer (UInt32)}
     */
    static NONE => 0

    /**
     * Clears in-sync state when a file is created.
     * Native name: CF_INSYNC_POLICY_TRACK_FILE_CREATION_TIME
     * @type {Integer (UInt32)}
     */
    static TRACK_FILE_CREATION_TIME => 1

    /**
     * Clears in-sync state when a file is read-only.
     * Native name: CF_INSYNC_POLICY_TRACK_FILE_READONLY_ATTRIBUTE
     * @type {Integer (UInt32)}
     */
    static TRACK_FILE_READONLY_ATTRIBUTE => 2

    /**
     * Clears in-sync state when a file is hidden.
     * Native name: CF_INSYNC_POLICY_TRACK_FILE_HIDDEN_ATTRIBUTE
     * @type {Integer (UInt32)}
     */
    static TRACK_FILE_HIDDEN_ATTRIBUTE => 4

    /**
     * Clears in-sync state when a file is a system file.
     * Native name: CF_INSYNC_POLICY_TRACK_FILE_SYSTEM_ATTRIBUTE
     * @type {Integer (UInt32)}
     */
    static TRACK_FILE_SYSTEM_ATTRIBUTE => 8

    /**
     * Clears in-sync state when a directory is created.
     * Native name: CF_INSYNC_POLICY_TRACK_DIRECTORY_CREATION_TIME
     * @type {Integer (UInt32)}
     */
    static TRACK_DIRECTORY_CREATION_TIME => 16

    /**
     * Clears in-sync state when a directory is read-only.
     * Native name: CF_INSYNC_POLICY_TRACK_DIRECTORY_READONLY_ATTRIBUTE
     * @type {Integer (UInt32)}
     */
    static TRACK_DIRECTORY_READONLY_ATTRIBUTE => 32

    /**
     * Clears in-sync state when a directory is hidden.
     * Native name: CF_INSYNC_POLICY_TRACK_DIRECTORY_HIDDEN_ATTRIBUTE
     * @type {Integer (UInt32)}
     */
    static TRACK_DIRECTORY_HIDDEN_ATTRIBUTE => 64

    /**
     * Clears in-sync state when a directory is  a system directory.
     * Native name: CF_INSYNC_POLICY_TRACK_DIRECTORY_SYSTEM_ATTRIBUTE
     * @type {Integer (UInt32)}
     */
    static TRACK_DIRECTORY_SYSTEM_ATTRIBUTE => 128

    /**
     * Clears in-sync state based on the last write time to a file.
     * Native name: CF_INSYNC_POLICY_TRACK_FILE_LAST_WRITE_TIME
     * @type {Integer (UInt32)}
     */
    static TRACK_FILE_LAST_WRITE_TIME => 256

    /**
     * Clears in-sync state based on the last write time to a directory.
     * Native name: CF_INSYNC_POLICY_TRACK_DIRECTORY_LAST_WRITE_TIME
     * @type {Integer (UInt32)}
     */
    static TRACK_DIRECTORY_LAST_WRITE_TIME => 512

    /**
     * Clears in-sync state for any changes to a file.
     * Native name: CF_INSYNC_POLICY_TRACK_FILE_ALL
     * @type {Integer (UInt32)}
     */
    static TRACK_FILE_ALL => 5592335

    /**
     * Clears in-sync state for any changes to a directory.
     * Native name: CF_INSYNC_POLICY_TRACK_DIRECTORY_ALL
     * @type {Integer (UInt32)}
     */
    static TRACK_DIRECTORY_ALL => 11184880

    /**
     * Clears in-sync state for any changes to a file or directory.
     * Native name: CF_INSYNC_POLICY_TRACK_ALL
     * @type {Integer (UInt32)}
     */
    static TRACK_ALL => 16777215

    /**
     * In-sync policies are exempt from clearing.
     * Native name: CF_INSYNC_POLICY_PRESERVE_INSYNC_FOR_SYNC_ENGINE
     * @type {Integer (UInt32)}
     */
    static PRESERVE_INSYNC_FOR_SYNC_ENGINE => 2147483648
}
