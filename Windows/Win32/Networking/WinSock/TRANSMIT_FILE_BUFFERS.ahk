#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * The TRANSMIT_FILE_BUFFERS structure (mswsock.h) specifies data to be transmitted before and after file data during a TransmitFile function file transfer operation.
 * @see https://learn.microsoft.com/windows/win32/api/mswsock/ns-mswsock-transmit_file_buffers
 * @namespace Windows.Win32.Networking.WinSock
 */
export default struct TRANSMIT_FILE_BUFFERS {
    #StructPack 8

    /**
     * Pointer to a buffer that contains data to be transmitted before the file data is transmitted.
     */
    Head : IntPtr

    /**
     * Size of the buffer pointed to by <b>Head</b>, in bytes, to be transmitted.
     */
    HeadLength : UInt32

    /**
     * Pointer to a buffer that contains data to be transmitted after the file data is transmitted.
     */
    Tail : IntPtr

    /**
     * Size of the buffer pointed to <b>Tail</b>, in bytes, to be transmitted.
     */
    TailLength : UInt32

}
