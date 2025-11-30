#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Flags to specify whether updates will be allowed given the state of a file or directory on disk.
 * @see https://docs.microsoft.com/windows/win32/api//projectedfslib/ne-projectedfslib-prj_update_types
 * @namespace Windows.Win32.Storage.ProjectedFileSystem
 * @version v4.0.30319
 */
class PRJ_UPDATE_TYPES extends Win32BitflagEnum{

    /**
     * Allow update only if the item is a placeholder (whether hydrated or not).
     * @type {Integer (Int32)}
     */
    static PRJ_UPDATE_NONE => 0

    /**
     * Allow update if the item is a placeholder or a dirty placeholder.
     * @type {Integer (Int32)}
     */
    static PRJ_UPDATE_ALLOW_DIRTY_METADATA => 1

    /**
     * Allow update if the item is a placeholder or if it is a full file.
     * @type {Integer (Int32)}
     */
    static PRJ_UPDATE_ALLOW_DIRTY_DATA => 2

    /**
     * Allow update if the item is a placeholder or if it is a tombstone.
     * @type {Integer (Int32)}
     */
    static PRJ_UPDATE_ALLOW_TOMBSTONE => 4

    /**
     * Reserved for future use.
     * @type {Integer (Int32)}
     */
    static PRJ_UPDATE_RESERVED1 => 8

    /**
     * Reserved for future use.
     * @type {Integer (Int32)}
     */
    static PRJ_UPDATE_RESERVED2 => 16

    /**
     * Allow update regardless of whether the DOS read-only bit is set on the item.
     * @type {Integer (Int32)}
     */
    static PRJ_UPDATE_ALLOW_READ_ONLY => 32

    /**
     * Maximum value.
     * @type {Integer (Int32)}
     */
    static PRJ_UPDATE_MAX_VAL => 64
}
