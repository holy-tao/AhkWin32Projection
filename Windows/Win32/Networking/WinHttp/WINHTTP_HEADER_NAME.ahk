#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\PWSTR.ahk
#Include ..\..\Foundation\PSTR.ahk

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
     * @type {PWSTR}
     */
    pwszName{
        get {
            if(!this.HasProp("__pwszName"))
                this.__pwszName := PWSTR(this.ptr + 0)
            return this.__pwszName
        }
    }

    /**
     * Type: IN **[PCSTR](/windows/win32/winprog/windows-data-types)**
     * 
     * A narrow string containing a name.
     * @type {PSTR}
     */
    pszName{
        get {
            if(!this.HasProp("__pszName"))
                this.__pszName := PSTR(this.ptr + 0)
            return this.__pszName
        }
    }
}
