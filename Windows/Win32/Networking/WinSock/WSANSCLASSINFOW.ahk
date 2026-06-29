#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }

/**
 * The WSANSCLASSINFO structure provides individual parameter information for a specific Windows Sockets namespace. (Unicode)
 * @remarks
 * The <b>WSANSCLASSINFO</b> structure is defined differently depending on whether ANSI or UNICODE is used. The above syntax block applies to ANSI; for UNICODE, the datatype for <b>lpszName</b> is <b>LPWSTR</b>.
 * 
 * 
 * 
 * 
 * 
 * > [!NOTE]
 * > The winsock2.h header defines WSANSCLASSINFO as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
 * @see https://learn.microsoft.com/windows/win32/api/winsock2/ns-winsock2-wsansclassinfow
 * @namespace Windows.Win32.Networking.WinSock
 * @charset Unicode
 */
export default struct WSANSCLASSINFOW {
    #StructPack 8

    /**
     * String value associated with the parameter, such as SAPID, TCPPORT, and so forth.
     */
    lpszName : PWSTR

    /**
     * GUID associated with the namespace.
     */
    dwNameSpace : UInt32

    /**
     * Value type for the parameter, such as REG_DWORD or REG_SZ, and so forth.
     */
    dwValueType : UInt32

    /**
     * Size of the parameter provided in <b>lpValue</b>, in bytes.
     */
    dwValueSize : UInt32

    /**
     * Pointer to the value of the parameter.
     */
    lpValue : IntPtr

}
