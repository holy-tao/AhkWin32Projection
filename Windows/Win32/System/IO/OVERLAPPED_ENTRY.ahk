#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Contains the information returned by a call to the GetQueuedCompletionStatusEx function.
 * @see https://learn.microsoft.com/windows/win32/api/minwinbase/ns-minwinbase-overlapped_entry
 * @namespace Windows.Win32.System.IO
 * @version v4.0.30319
 */
class OVERLAPPED_ENTRY extends Win32Struct
{
    static sizeof => 32

    static packingSize => 8

    /**
     * Receives the completion key value associated with the file handle whose I/O operation has completed. A 
     *       completion key is a per-file key that is specified in a call to 
     *       <a href="https://docs.microsoft.com/windows/desktop/FileIO/createiocompletionport">CreateIoCompletionPort</a>.
     * @type {Pointer}
     */
    lpCompletionKey {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * Receives the address of the <a href="https://docs.microsoft.com/windows/desktop/api/minwinbase/ns-minwinbase-overlapped">OVERLAPPED</a> structure 
     *       that was specified when the completed I/O operation was started.
     * @type {Pointer<OVERLAPPED>}
     */
    lpOverlapped {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * Reserved.
     * @type {Pointer}
     */
    Internal {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }

    /**
     * Receives the number of bytes transferred during the I/O operation that has completed.
     * @type {Integer}
     */
    dwNumberOfBytesTransferred {
        get => NumGet(this, 24, "uint")
        set => NumPut("uint", value, this, 24)
    }
}
