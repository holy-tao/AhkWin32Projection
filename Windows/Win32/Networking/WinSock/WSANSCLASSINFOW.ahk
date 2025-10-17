#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The WSANSCLASSINFO structure provides individual parameter information for a specific Windows Sockets namespace.
 * @remarks
 * 
  * The <b>WSANSCLASSINFO</b> structure is defined differently depending on whether ANSI or UNICODE is used. The above syntax block applies to ANSI; for UNICODE, the datatype for <b>lpszName</b> is <b>LPWSTR</b>.
  * 
  * 
  * 
  * 
  * 
  * > [!NOTE]
  * > The winsock2.h header defines WSANSCLASSINFO as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//winsock2/ns-winsock2-wsansclassinfow
 * @namespace Windows.Win32.Networking.WinSock
 * @version v4.0.30319
 * @charset Unicode
 */
class WSANSCLASSINFOW extends Win32Struct
{
    static sizeof => 32

    static packingSize => 8

    /**
     * String value associated with the parameter, such as SAPID, TCPPORT, and so forth.
     * @type {PWSTR}
     */
    lpszName {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * GUID associated with the namespace.
     * @type {Integer}
     */
    dwNameSpace {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * Value type for the parameter, such as REG_DWORD or REG_SZ, and so forth.
     * @type {Integer}
     */
    dwValueType {
        get => NumGet(this, 12, "uint")
        set => NumPut("uint", value, this, 12)
    }

    /**
     * Size of the parameter provided in <b>lpValue</b>, in bytes.
     * @type {Integer}
     */
    dwValueSize {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * Pointer to the value of the parameter.
     * @type {Pointer<Void>}
     */
    lpValue {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }
}
