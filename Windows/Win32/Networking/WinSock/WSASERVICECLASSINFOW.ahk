#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The WSASERVICECLASSINFO structure contains information about a specified service class. For each service class in Windows Sockets 2, there is a single WSASERVICECLASSINFO structure.
 * @remarks
 * 
 * > [!NOTE]
 * > The winsock2.h header defines WSASERVICECLASSINFO as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
 * 
 * @see https://docs.microsoft.com/windows/win32/api//winsock2/ns-winsock2-wsaserviceclassinfow
 * @namespace Windows.Win32.Networking.WinSock
 * @version v4.0.30319
 * @charset Unicode
 */
class WSASERVICECLASSINFOW extends Win32Struct
{
    static sizeof => 32

    static packingSize => 8

    /**
     * Unique Identifier (GUID) for the service class.
     * @type {Pointer<Guid>}
     */
    lpServiceClassId {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * Well known name associated with the service class.
     * @type {PWSTR}
     */
    lpszServiceClassName {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * Number of entries in <b>lpClassInfos</b>.
     * @type {Integer}
     */
    dwCount {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * Array of <a href="https://docs.microsoft.com/windows/desktop/api/winsock2/ns-winsock2-wsansclassinfow">WSANSCLASSINFO</a> structures that contains information about the service class.
     * @type {Pointer<WSANSCLASSINFOW>}
     */
    lpClassInfos {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }
}
