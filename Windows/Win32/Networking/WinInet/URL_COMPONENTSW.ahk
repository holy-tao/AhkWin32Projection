#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Contains the constituent parts of a URL. This structure is used with the InternetCrackUrl and InternetCreateUrl functions. (Unicode)
 * @remarks
 * For 
  * <a href="https://docs.microsoft.com/windows/desktop/api/wininet/nf-wininet-internetcrackurla">InternetCrackUrl</a>, if a pointer member and its corresponding length member are both zero, that component is not returned. If the pointer member is <b>NULL</b> but the length member is not zero, both the pointer and length members are returned. If both pointer and corresponding length members are nonzero, the pointer member points to a buffer where the component is copied. The component can be un-escaped, depending on the 
  * <i>dwFlags</i> parameter of 
  * <a href="https://docs.microsoft.com/windows/desktop/api/wininet/nf-wininet-internetcrackurla">InternetCrackUrl</a>.
  * 
  * For 
  * <a href="https://docs.microsoft.com/windows/desktop/api/wininet/nf-wininet-internetcreateurla">InternetCreateUrl</a>, the pointer members should be <b>NULL</b> if the component is not required. If the corresponding length member is zero, the pointer member is the address of a zero-terminated string. If the length member is not zero, it is the string length of the corresponding pointer member.
  * 
  * <div class="alert"><b>Note</b>  WinINet does not support server implementations. In addition, it should not be used from a service.  For server implementations or services use <a href="https://docs.microsoft.com/windows/desktop/WinHttp/winhttp-start-page">Microsoft Windows HTTP Services (WinHTTP)</a>.</div>
  * <div> </div>
  * 
  * 
  * 
  * 
  * > [!NOTE]
  * > The wininet.h header defines URL_COMPONENTS as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
 * @see https://learn.microsoft.com/windows/win32/api/wininet/ns-wininet-url_componentsw
 * @namespace Windows.Win32.Networking.WinInet
 * @version v4.0.30319
 * @charset Unicode
 */
class URL_COMPONENTSW extends Win32Struct
{
    static sizeof => 104

    static packingSize => 8

    /**
     * Size of this structure, in bytes.
     * @type {Integer}
     */
    dwStructSize {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Pointer to a string that contains the scheme name.
     * @type {Pointer<Char>}
     */
    lpszScheme {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * Size of the scheme name, in <b>TCHARs</b>.
     * @type {Integer}
     */
    dwSchemeLength {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * <a href="https://docs.microsoft.com/windows/desktop/api/wininet/ne-wininet-internet_scheme">INTERNET_SCHEME</a> value that indicates the Internet protocol scheme.
     * @type {Integer}
     */
    nScheme {
        get => NumGet(this, 20, "int")
        set => NumPut("int", value, this, 20)
    }

    /**
     * Pointer to a string that contains the host name.
     * @type {Pointer<Char>}
     */
    lpszHostName {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }

    /**
     * Size of the host name, in <b>TCHARs</b>.
     * @type {Integer}
     */
    dwHostNameLength {
        get => NumGet(this, 32, "uint")
        set => NumPut("uint", value, this, 32)
    }

    /**
     * Converted port number.
     * @type {Integer}
     */
    nPort {
        get => NumGet(this, 36, "ushort")
        set => NumPut("ushort", value, this, 36)
    }

    /**
     * Pointer to a string value that contains the user name.
     * @type {Pointer<Char>}
     */
    lpszUserName {
        get => NumGet(this, 40, "ptr")
        set => NumPut("ptr", value, this, 40)
    }

    /**
     * Size of the user name, in <b>TCHARs</b>.
     * @type {Integer}
     */
    dwUserNameLength {
        get => NumGet(this, 48, "uint")
        set => NumPut("uint", value, this, 48)
    }

    /**
     * Pointer to a string that contains the password.
     * @type {Pointer<Char>}
     */
    lpszPassword {
        get => NumGet(this, 56, "ptr")
        set => NumPut("ptr", value, this, 56)
    }

    /**
     * Size of the password, in <b>TCHARs</b>.
     * @type {Integer}
     */
    dwPasswordLength {
        get => NumGet(this, 64, "uint")
        set => NumPut("uint", value, this, 64)
    }

    /**
     * Pointer to a string that contains the URL path.
     * @type {Pointer<Char>}
     */
    lpszUrlPath {
        get => NumGet(this, 72, "ptr")
        set => NumPut("ptr", value, this, 72)
    }

    /**
     * Size of the URL path, in <b>TCHARs</b>.
     * @type {Integer}
     */
    dwUrlPathLength {
        get => NumGet(this, 80, "uint")
        set => NumPut("uint", value, this, 80)
    }

    /**
     * Pointer to a string that contains the extra information (for example, ?something or #something).
     * @type {Pointer<Char>}
     */
    lpszExtraInfo {
        get => NumGet(this, 88, "ptr")
        set => NumPut("ptr", value, this, 88)
    }

    /**
     * Size of the extra information, in <b>TCHARs</b>.
     * @type {Integer}
     */
    dwExtraInfoLength {
        get => NumGet(this, 96, "uint")
        set => NumPut("uint", value, this, 96)
    }
}
