#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\WSANSCLASSINFOA.ahk" { WSANSCLASSINFOA }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\PSTR.ahk" { PSTR }

/**
 * The WSASERVICECLASSINFO structure contains information about a specified service class. For each service class in Windows Sockets 2, there is a single WSASERVICECLASSINFO structure. (ANSI)
 * @remarks
 * > [!NOTE]
 * > The winsock2.h header defines WSASERVICECLASSINFO as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
 * @see https://learn.microsoft.com/windows/win32/api/winsock2/ns-winsock2-wsaserviceclassinfoa
 * @namespace Windows.Win32.Networking.WinSock
 * @charset ANSI
 * @deprecated WSASERVICECLASSINFOW
 */
export default struct WSASERVICECLASSINFOA {
    #StructPack 8

    /**
     * Unique Identifier (GUID) for the service class.
     */
    lpServiceClassId : Guid.Ptr

    /**
     * Well known name associated with the service class.
     */
    lpszServiceClassName : PSTR

    /**
     * Number of entries in <b>lpClassInfos</b>.
     */
    dwCount : UInt32

    /**
     * Array of <a href="https://docs.microsoft.com/windows/desktop/api/winsock2/ns-winsock2-wsansclassinfow">WSANSCLASSINFO</a> structures that contains information about the service class.
     */
    lpClassInfos : WSANSCLASSINFOA.Ptr

}
