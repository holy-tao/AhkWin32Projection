#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Stores an Internet Protocol (IP) address for a computer that is participating in a Windows Sockets communication.
 * @remarks
 * This data structure is designed to be used as a 
 *     <b>SOCKADDR</b> structure.
 * @see https://learn.microsoft.com/windows/win32/api/ndattrib/ns-ndattrib-diag_sockaddr
 * @namespace Windows.Win32.NetworkManagement.NetworkDiagnosticsFramework
 * @version v4.0.30319
 */
class DIAG_SOCKADDR extends Win32Struct
{
    static sizeof => 254

    static packingSize => 2

    /**
     * Type: <b>USHORT</b>
     * 
     * Socket address group.
     * @type {Integer}
     */
    family {
        get => NumGet(this, 0, "ushort")
        set => NumPut("ushort", value, this, 0)
    }

    /**
     * Type: <b>CHAR[126]</b>
     * 
     * The maximum size of all the different socket address structures.
     * @type {String}
     */
    data {
        get => StrGet(this.ptr + 2, 125, "UTF-16")
        set => StrPut(value, this.ptr + 2, 125, "UTF-16")
    }
}
