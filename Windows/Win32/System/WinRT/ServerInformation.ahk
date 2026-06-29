#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Represents the implementation of a Component Object Model (COM) interface in a server process.
 * @remarks
 * The <b>ServerInformation</b> structure is used by the <a href="https://docs.microsoft.com/windows/desktop/api/combaseapi/nf-combaseapi-codecodeproxy">CoDecodeProxy</a> function to enable native debuggers to locate the implementation of a COM interface in a server process, given a Windows Runtime interface on a proxy to the Windows Runtime object.
 * @see https://learn.microsoft.com/windows/win32/api/combaseapi/ns-combaseapi-serverinformation
 * @namespace Windows.Win32.System.WinRT
 */
export default struct ServerInformation {
    #StructPack 8

    /**
     * The process ID of the server.
     */
    dwServerPid : UInt32

    /**
     * The thread ID of the server object if it's in the STA, 0 if it's in the MTA, and <b>0x0000FFFF</b> if it's in the NA.
     */
    dwServerTid : UInt32

    /**
     * <i>ui64ServerAddress</i> is considered a 64-bit value type, rather than a pointer  to a 64-bit value, and isn't a pointer to an object in the debugger process. Instead, this address is passed to the <a href="https://docs.microsoft.com/windows/desktop/api/memoryapi/nf-memoryapi-readprocessmemory">ReadProcessMemory</a> function.
     */
    ui64ServerAddress : Int64

}
