#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The WSAVERSION structure provides version comparison in Windows Sockets.
 * @see https://docs.microsoft.com/windows/win32/api//winsock2/ns-winsock2-wsaversion
 * @namespace Windows.Win32.Networking.WinSock
 * @version v4.0.30319
 */
class WSAVERSION extends Win32Struct
{
    static sizeof => 8

    static packingSize => 4

    /**
     * Version of Windows Sockets.
     * @type {Integer}
     */
    dwVersion {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * <a href="https://docs.microsoft.com/windows/desktop/api/winsock2/ne-winsock2-wsaecomparator">WSAECOMPARATOR</a> enumeration, used in the comparison.
     * @type {Integer}
     */
    ecHow {
        get => NumGet(this, 4, "int")
        set => NumPut("int", value, this, 4)
    }
}
