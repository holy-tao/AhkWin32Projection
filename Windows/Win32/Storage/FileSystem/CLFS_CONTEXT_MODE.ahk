#Requires AutoHotkey v2.0.0 64-bit

/**
 * Specifies a context mode type that indicates the direction and access methods that a client uses to scan a log.
 * @see https://learn.microsoft.com/windows/win32/api/clfs/ne-clfs-clfs_context_mode
 * @namespace Windows.Win32.Storage.FileSystem
 * @version v4.0.30319
 */
class CLFS_CONTEXT_MODE{

    /**
     * Do not move the cursor.
     * @type {Integer (Int32)}
     */
    static ClfsContextNone => 0

    /**
     * Move the cursor backward to the next undo record.
     * @type {Integer (Int32)}
     */
    static ClfsContextUndoNext => 1

    /**
     * Move the cursor to the previous log record from the current read context.
     * @type {Integer (Int32)}
     */
    static ClfsContextPrevious => 2

    /**
     * Move the cursor to the next client log record from the current read context.
     * @type {Integer (Int32)}
     */
    static ClfsContextForward => 3
}
