#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Flags to specify whether updates will be allowed given the state of a file or directory on disk.
 * @see https://learn.microsoft.com/windows/win32/api/projectedfslib/ne-projectedfslib-prj_update_types
 * @namespace Windows.Win32.Storage.ProjectedFileSystem
 */
class PRJ_UPDATE_TYPES extends Win32BitflagEnum {

    /**
     * Allow update only if the item is a placeholder (whether hydrated or not).
     * Native name: PRJ_UPDATE_NONE
     * @type {Integer (Int32)}
     */
    static NONE => 0

    /**
     * Allow update if the item is a placeholder or a dirty placeholder.
     * Native name: PRJ_UPDATE_ALLOW_DIRTY_METADATA
     * @type {Integer (Int32)}
     */
    static ALLOW_DIRTY_METADATA => 1

    /**
     * Allow update if the item is a placeholder or if it is a full file.
     * Native name: PRJ_UPDATE_ALLOW_DIRTY_DATA
     * @type {Integer (Int32)}
     */
    static ALLOW_DIRTY_DATA => 2

    /**
     * Allow update if the item is a placeholder or if it is a tombstone.
     * Native name: PRJ_UPDATE_ALLOW_TOMBSTONE
     * @type {Integer (Int32)}
     */
    static ALLOW_TOMBSTONE => 4

    /**
     * Reserved for future use.
     * Native name: PRJ_UPDATE_RESERVED1
     * @type {Integer (Int32)}
     */
    static RESERVED1 => 8

    /**
     * Reserved for future use.
     * Native name: PRJ_UPDATE_RESERVED2
     * @type {Integer (Int32)}
     */
    static RESERVED2 => 16

    /**
     * Allow update regardless of whether the DOS read-only bit is set on the item.
     * Native name: PRJ_UPDATE_ALLOW_READ_ONLY
     * @type {Integer (Int32)}
     */
    static ALLOW_READ_ONLY => 32

    /**
     * Maximum value.
     * Native name: PRJ_UPDATE_MAX_VAL
     * @type {Integer (Int32)}
     */
    static MAX_VAL => 64
}
