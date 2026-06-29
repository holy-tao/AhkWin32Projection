#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PSTR.ahk" { PSTR }

/**
 * The WSABUF structure enables the creation or manipulation of a data buffer used by some Winsock functions.
 * @see https://learn.microsoft.com/windows/win32/api/ws2def/ns-ws2def-wsabuf
 * @namespace Windows.Win32.Networking.WinSock
 */
export default struct WSABUF {
    #StructPack 8

    /**
     * The length of the buffer, in bytes.
     */
    len : UInt32

    /**
     * A pointer to the buffer.
     */
    buf : PSTR

}
