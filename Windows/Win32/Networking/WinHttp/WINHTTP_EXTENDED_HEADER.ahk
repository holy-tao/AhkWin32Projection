#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\Foundation\PSTR.ahk" { PSTR }

/**
 * Represents an HTTP request header as a name/value string pair.
 * @see https://learn.microsoft.com/windows/win32/api/winhttp/ns-winhttp-winhttp_extended_header
 * @namespace Windows.Win32.Networking.WinHttp
 */
export default struct WINHTTP_EXTENDED_HEADER {
    #StructPack 8

    pwszName : PWSTR

    pwszValue : PWSTR

    static __New() {
        DefineProp(this.Prototype, 'pszName', { type: PSTR, offset: 0 })
        DefineProp(this.Prototype, 'pszValue', { type: PSTR, offset: 8 })
        this.DeleteProp("__New")
    }
}
