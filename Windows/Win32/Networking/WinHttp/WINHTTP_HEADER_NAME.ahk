#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Represents an HTTP request header name.
 * @remarks
 * 
 * @see https://learn.microsoft.com/windows/win32/api/winhttp/ns-winhttp-winhttp_header_name
 * @namespace Windows.Win32.Networking.WinHttp
 * @version v4.0.30319
 */
class WINHTTP_HEADER_NAME extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * Type: IN **[PCWSTR](/windows/win32/winprog/windows-data-types)**
     * 
     * A wide string containing a name.
     * @type {Pointer<PWSTR>}
     */
    pwszName {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * Type: IN **[PCSTR](/windows/win32/winprog/windows-data-types)**
     * 
     * A narrow string containing a name.
     * @type {Pointer<PSTR>}
     */
    pszName {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }
}
