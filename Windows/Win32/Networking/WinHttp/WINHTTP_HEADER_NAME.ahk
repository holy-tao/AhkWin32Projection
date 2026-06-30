#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\PWSTR.ahk
#Include ..\..\Foundation\PSTR.ahk

/**
 * Represents an HTTP request header name.
 * @see https://learn.microsoft.com/windows/win32/api/winhttp/ns-winhttp-winhttp_header_name
 * @namespace Windows.Win32.Networking.WinHttp
 */
class WINHTTP_HEADER_NAME extends Win32Struct {
    static sizeof => 16

    static packingSize => 8

    /**
     * Type: IN **[PCWSTR](/windows/win32/winprog/windows-data-types)**
     * 
     * A wide string containing a name.
     * @type {PWSTR}
     */
    pwszName {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * Type: IN **[PCSTR](/windows/win32/winprog/windows-data-types)**
     * 
     * A narrow string containing a name.
     * @type {PSTR}
     */
    pszName {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }
}
