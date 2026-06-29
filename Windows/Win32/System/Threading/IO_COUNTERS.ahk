#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Contains I/O accounting information for a process or a job object.
 * @see https://learn.microsoft.com/windows/win32/api/winnt/ns-winnt-io_counters
 * @namespace Windows.Win32.System.Threading
 */
export default struct IO_COUNTERS {
    #StructPack 8

    /**
     * The number of read operations performed.
     */
    ReadOperationCount : Int64

    /**
     * The number of write operations performed.
     */
    WriteOperationCount : Int64

    /**
     * The number of I/O operations performed, other than read and write operations.
     */
    OtherOperationCount : Int64

    /**
     * The number of bytes read.
     */
    ReadTransferCount : Int64

    /**
     * The number of bytes written.
     */
    WriteTransferCount : Int64

    /**
     * The number of bytes transferred during operations other than read and write operations.
     */
    OtherTransferCount : Int64

}
