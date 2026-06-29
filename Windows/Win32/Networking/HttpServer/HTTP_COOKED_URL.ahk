#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }

/**
 * Contains a validated, canonical, UTF-16 Unicode-encoded URL request string together with pointers into it and element lengths.
 * @remarks
 * For example, if <b>pFullUrl</b> is "http://www.fabrikam.com/path1/path2/file.ext?n1=v1&amp;n2=v2", then <b>pHost</b> points to "www.fabrikam", <b>pAbsPath</b> points to "/path1/…" and <b>pQueryString</b> points to "?n1=v1…".
 * @see https://learn.microsoft.com/windows/win32/api/http/ns-http-http_cooked_url
 * @namespace Windows.Win32.Networking.HttpServer
 */
export default struct HTTP_COOKED_URL {
    #StructPack 8

    /**
     * Size, in bytes, of the data pointed to by the <b>pFullUrl</b> member, not including a terminating null character.
     */
    FullUrlLength : UInt16

    /**
     * Size, in bytes, of the data pointed to by the <b>pHost</b> member.
     */
    HostLength : UInt16

    /**
     * Size, in bytes, of the data pointed to by the <b>pAbsPath</b> member.
     */
    AbsPathLength : UInt16

    /**
     * Size, in bytes, of the data pointed to by the <b>pQueryString</b> member.
     */
    QueryStringLength : UInt16

    /**
     * Pointer to the scheme element at the beginning of the URL (must be either "http://..." or "https://...").
     */
    pFullUrl : PWSTR

    /**
     * Pointer to the first character in the host element, immediately following the double slashes at the end of the scheme element.
     */
    pHost : PWSTR

    /**
     * Pointer to the third forward slash ("/") in the string. In a UrlPrefix string, this is the slash immediately preceding the relativeUri element.
     */
    pAbsPath : PWSTR

    /**
     * Pointer to the first question mark (?) in the string, or <b>NULL</b> if there is none.
     */
    pQueryString : PWSTR

}
