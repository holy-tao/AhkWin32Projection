#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\CHAR.ahk" { CHAR }

/**
 * Stores an Internet Protocol (IP) address for a computer that is participating in a Windows Sockets communication.
 * @remarks
 * This data structure is designed to be used as a 
 *     <b>SOCKADDR</b> structure.
 * @see https://learn.microsoft.com/windows/win32/api/ndattrib/ns-ndattrib-diag_sockaddr
 * @namespace Windows.Win32.NetworkManagement.NetworkDiagnosticsFramework
 */
export default struct DIAG_SOCKADDR {
    #StructPack 2

    /**
     * Type: <b>USHORT</b>
     * 
     * Socket address group.
     */
    family : UInt16

    /**
     * Type: <b>CHAR[126]</b>
     * 
     * The maximum size of all the different socket address structures.
     */
    data : CHAR[126]

}
