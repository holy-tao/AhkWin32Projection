#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Contains a user buffer, which is to become part of a log record, and its length.
 * @see https://learn.microsoft.com/windows/win32/api/clfs/ns-clfs-cls_write_entry
 * @namespace Windows.Win32.Storage.FileSystem
 */
export default struct CLS_WRITE_ENTRY {
    #StructPack 8

    /**
     * The log record data buffer.
     */
    Buffer : IntPtr

    /**
     * The length of the log record data buffer, in bytes.
     */
    ByteLength : UInt32

}
