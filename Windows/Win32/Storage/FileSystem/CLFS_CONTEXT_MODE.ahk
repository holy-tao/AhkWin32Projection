#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Specifies a context mode type that indicates the direction and access methods that a client uses to scan a log.
 * @see https://learn.microsoft.com/windows/win32/api/clfs/ne-clfs-clfs_context_mode
 * @namespace Windows.Win32.Storage.FileSystem
 */
class CLFS_CONTEXT_MODE extends Win32Enum {

    /**
     * Do not move the cursor.
     * Native name: ClfsContextNone
     * @type {Integer (Int32)}
     */
    static None => 0

    /**
     * Move the cursor backward to the next undo record.
     * Native name: ClfsContextUndoNext
     * @type {Integer (Int32)}
     */
    static UndoNext => 1

    /**
     * Move the cursor to the previous log record from the current read context.
     * Native name: ClfsContextPrevious
     * @type {Integer (Int32)}
     */
    static Previous => 2

    /**
     * Move the cursor to the next client log record from the current read context.
     * Native name: ClfsContextForward
     * @type {Integer (Int32)}
     */
    static Forward => 3
}
