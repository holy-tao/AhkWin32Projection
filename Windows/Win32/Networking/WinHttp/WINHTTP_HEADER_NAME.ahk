#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\Foundation\PSTR.ahk" { PSTR }

/**
 * Represents an HTTP request header name.
 * @see https://learn.microsoft.com/windows/win32/api/winhttp/ns-winhttp-winhttp_header_name
 * @namespace Windows.Win32.Networking.WinHttp
 */
export default struct WINHTTP_HEADER_NAME {
    #StructPack 8

    /**
     * Type: IN **[PCWSTR](/windows/win32/winprog/windows-data-types)**
     * 
     * A wide string containing a name.
     */
    pwszName : PWSTR

    static __New() {
        DefineProp(this.Prototype, 'pszName', { type: PSTR, offset: 0 })
        this.DeleteProp("__New")
    }
}
