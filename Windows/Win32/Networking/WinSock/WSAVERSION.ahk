#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\WSAECOMPARATOR.ahk" { WSAECOMPARATOR }

/**
 * The WSAVERSION structure provides version comparison in Windows Sockets.
 * @see https://learn.microsoft.com/windows/win32/api/winsock2/ns-winsock2-wsaversion
 * @namespace Windows.Win32.Networking.WinSock
 */
export default struct WSAVERSION {
    #StructPack 4

    /**
     * Version of Windows Sockets.
     */
    dwVersion : UInt32

    /**
     * <a href="https://docs.microsoft.com/windows/desktop/api/winsock2/ne-winsock2-wsaecomparator">WSAECOMPARATOR</a> enumeration, used in the comparison.
     */
    ecHow : WSAECOMPARATOR

}
