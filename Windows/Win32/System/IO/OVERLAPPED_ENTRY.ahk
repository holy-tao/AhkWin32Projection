#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\OVERLAPPED.ahk" { OVERLAPPED }

/**
 * Contains the information returned by a call to the GetQueuedCompletionStatusEx function.
 * @see https://learn.microsoft.com/windows/win32/api/minwinbase/ns-minwinbase-overlapped_entry
 * @namespace Windows.Win32.System.IO
 */
export default struct OVERLAPPED_ENTRY {
    #StructPack 8

    /**
     * Receives the completion key value associated with the file handle whose I/O operation has completed. A 
     *       completion key is a per-file key that is specified in a call to 
     *       <a href="https://docs.microsoft.com/windows/desktop/FileIO/createiocompletionport">CreateIoCompletionPort</a>.
     */
    lpCompletionKey : IntPtr

    /**
     * Receives the address of the <a href="https://docs.microsoft.com/windows/desktop/api/minwinbase/ns-minwinbase-overlapped">OVERLAPPED</a> structure 
     *       that was specified when the completed I/O operation was started.
     */
    lpOverlapped : OVERLAPPED.Ptr

    /**
     * Reserved.
     */
    Internal : IntPtr

    /**
     * Receives the number of bytes transferred during the I/O operation that has completed.
     */
    dwNumberOfBytesTransferred : UInt32

}
