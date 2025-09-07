#Requires AutoHotkey v2.0.0 64-bit

/**
 * Defines the flags of the file handle.
 * @see https://learn.microsoft.com/windows/win32/api/windowsstoragecom/ne-windowsstoragecom-handle_options
 * @namespace Windows.Win32.System.WinRT.Storage
 * @version v4.0.30319
 */
class HANDLE_OPTIONS{

    /**
     * None.
     * @type {Integer (UInt32)}
     */
    static HO_NONE => 0

    /**
     * This value is for internal use only.
     * @type {Integer (UInt32)}
     */
    static HO_OPEN_REQUIRING_OPLOCK => 262144

    /**
     * The file is to be deleted immediately after this handle is closed.
     * @type {Integer (UInt32)}
     */
    static HO_DELETE_ON_CLOSE => 67108864

    /**
     * Access is intended to be sequential from beginning to end. The system can use this as a hint to optimize file caching.
 * For additional information, see <a href="https://docs.microsoft.com/windows/desktop/api/fileapi/nf-fileapi-createfilea">Caching Behavior</a>.
     * @type {Integer (UInt32)}
     */
    static HO_SEQUENTIAL_SCAN => 134217728

    /**
     * Access is intended to be random. The system can use this as a hint to optimize file caching.
 * For more information, see  <a href="https://docs.microsoft.com/windows/desktop/api/fileapi/nf-fileapi-createfilea">Caching Behavior</a>.
     * @type {Integer (UInt32)}
     */
    static HO_RANDOM_ACCESS => 268435456

    /**
     * The file is being opened with no system caching for data reads and writes. This flag does not affect hard disk caching or memory mapped files.
 * There are strict requirements for successfully working with files opened with this flag. For details see  <a href="https://docs.microsoft.com/windows/desktop/FileIO/file-buffering">File Buffering</a>.
     * @type {Integer (UInt32)}
     */
    static HO_NO_BUFFERING => 536870912

    /**
     * The file is being opened or created for asynchronous I/O.
 * For information about considerations when using a file handle created with this flag, see  <a href="https://docs.microsoft.com/windows/desktop/api/fileapi/nf-fileapi-createfilea">Synchronous and Asynchronous I/O Handles</a>.
     * @type {Integer (UInt32)}
     */
    static HO_OVERLAPPED => 1073741824

    /**
     * Write operations will not go through any intermediate cache, they will go directly to disk.
 * For additional information, see  <a href="https://docs.microsoft.com/windows/desktop/api/fileapi/nf-fileapi-createfilea">Caching Behavior</a>.
     * @type {Integer (UInt32)}
     */
    static HO_WRITE_THROUGH => 2147483648
}
