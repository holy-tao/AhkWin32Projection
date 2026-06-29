#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\HANDLE.ahk" { HANDLE }

/**
 * The WSATHREADID structure enables a provider to identify a thread on which asynchronous procedure calls (APCs) can be queued using the WPUQueueApc function.
 * @see https://learn.microsoft.com/windows/win32/api/ws2spi/ns-ws2spi-wsathreadid
 * @namespace Windows.Win32.Networking.WinSock
 */
export default struct WSATHREADID {
    #StructPack 8

    /**
     * Handle to the thread ID.
     */
    ThreadHandle : HANDLE

    /**
     * Reserved.
     */
    Reserved : IntPtr

}
