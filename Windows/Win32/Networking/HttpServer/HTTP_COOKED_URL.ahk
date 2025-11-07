#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Contains a validated, canonical, UTF-16 Unicode-encoded URL request string together with pointers into it and element lengths.
 * @remarks
 * 
 * For example, if <b>pFullUrl</b> is "http://www.fabrikam.com/path1/path2/file.ext?n1=v1&amp;n2=v2", then <b>pHost</b> points to "www.fabrikam", <b>pAbsPath</b> points to "/path1/…" and <b>pQueryString</b> points to "?n1=v1…".
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//http/ns-http-http_cooked_url
 * @namespace Windows.Win32.Networking.HttpServer
 * @version v4.0.30319
 */
class HTTP_COOKED_URL extends Win32Struct
{
    static sizeof => 40

    static packingSize => 8

    /**
     * Size, in bytes, of the data pointed to by the <b>pFullUrl</b> member, not including a terminating null character.
     * @type {Integer}
     */
    FullUrlLength {
        get => NumGet(this, 0, "ushort")
        set => NumPut("ushort", value, this, 0)
    }

    /**
     * Size, in bytes, of the data pointed to by the <b>pHost</b> member.
     * @type {Integer}
     */
    HostLength {
        get => NumGet(this, 2, "ushort")
        set => NumPut("ushort", value, this, 2)
    }

    /**
     * Size, in bytes, of the data pointed to by the <b>pAbsPath</b> member.
     * @type {Integer}
     */
    AbsPathLength {
        get => NumGet(this, 4, "ushort")
        set => NumPut("ushort", value, this, 4)
    }

    /**
     * Size, in bytes, of the data pointed to by the <b>pQueryString</b> member.
     * @type {Integer}
     */
    QueryStringLength {
        get => NumGet(this, 6, "ushort")
        set => NumPut("ushort", value, this, 6)
    }

    /**
     * Pointer to the scheme element at the beginning of the URL (must be either "http://..." or "https://...").
     * @type {PWSTR}
     */
    pFullUrl {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * Pointer to the first character in the host element, immediately following the double slashes at the end of the scheme element.
     * @type {PWSTR}
     */
    pHost {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }

    /**
     * Pointer to the third forward slash ("/") in the string. In a UrlPrefix string, this is the slash immediately preceding the relativeUri element.
     * @type {PWSTR}
     */
    pAbsPath {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }

    /**
     * Pointer to the first question mark (?) in the string, or <b>NULL</b> if there is none.
     * @type {PWSTR}
     */
    pQueryString {
        get => NumGet(this, 32, "ptr")
        set => NumPut("ptr", value, this, 32)
    }
}
