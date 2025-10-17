#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The URL_COMPONENTS structure contains the constituent parts of a URL. This structure is used with the WinHttpCrackUrl and WinHttpCreateUrl functions.
 * @remarks
 * 
  * For the 
  * <a href="https://docs.microsoft.com/windows/desktop/api/winhttp/nf-winhttp-winhttpcrackurl">WinHttpCrackUrl</a> function, if a pointer member and its corresponding length member are both zero, that component of the URL is not returned. If the pointer member is <b>NULL</b> but the length member is not zero, both the pointer and length members are returned. If both pointer and corresponding length members are nonzero, the pointer member points to a buffer where the component is copied. All escape sequences can be removed from a component, depending on the 
  * <i>dwFlags</i> parameter of 
  * <a href="https://docs.microsoft.com/windows/desktop/api/winhttp/nf-winhttp-winhttpcrackurl">WinHttpCrackUrl</a>.
  * 
  * For the 
  * <a href="https://docs.microsoft.com/windows/desktop/api/winhttp/nf-winhttp-winhttpcreateurl">WinHttpCreateUrl</a> function, the pointer members should be <b>NULL</b> if the component of the URL is not required. If the corresponding length member is zero, the pointer member is the pointer to a zero-terminated string. If the length member is not zero, it is the string length of the corresponding pointer member.
  * 
  * <div class="alert"><b>Note</b>  For Windows XP and Windows 2000, see the <a href="https://docs.microsoft.com/windows/desktop/WinHttp/winhttp-start-page">Run-Time Requirements</a> section of the WinHttp start page.</div>
  * <div> </div>
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//winhttp/ns-winhttp-url_components
 * @namespace Windows.Win32.Networking.WinHttp
 * @version v4.0.30319
 * @charset ANSI
 */
class URL_COMPONENTS extends Win32Struct
{
    static sizeof => 104

    static packingSize => 8

    /**
     * Size of this structure, in bytes. Used for version checking. The size of this structure must be set to initialize this structure properly.
     * @type {Integer}
     */
    dwStructSize {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Pointer to a string value that contains the scheme name.
     * @type {PWSTR}
     */
    lpszScheme {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * Length of the scheme name, in characters.
     * @type {Integer}
     */
    dwSchemeLength {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * 
     * @type {Integer}
     */
    nScheme {
        get => NumGet(this, 20, "int")
        set => NumPut("int", value, this, 20)
    }

    /**
     * Pointer to a string value that contains the host name.
     * @type {PWSTR}
     */
    lpszHostName {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }

    /**
     * Length of the host name, in characters.
     * @type {Integer}
     */
    dwHostNameLength {
        get => NumGet(this, 32, "uint")
        set => NumPut("uint", value, this, 32)
    }

    /**
     * Port number.
     * @type {Integer}
     */
    nPort {
        get => NumGet(this, 36, "ushort")
        set => NumPut("ushort", value, this, 36)
    }

    /**
     * Pointer to a string  that contains the user name.
     * @type {PWSTR}
     */
    lpszUserName {
        get => NumGet(this, 40, "ptr")
        set => NumPut("ptr", value, this, 40)
    }

    /**
     * Length of the user name, in characters.
     * @type {Integer}
     */
    dwUserNameLength {
        get => NumGet(this, 48, "uint")
        set => NumPut("uint", value, this, 48)
    }

    /**
     * Pointer to a string  that contains the password.
     * @type {PWSTR}
     */
    lpszPassword {
        get => NumGet(this, 56, "ptr")
        set => NumPut("ptr", value, this, 56)
    }

    /**
     * Length of the password, in characters.
     * @type {Integer}
     */
    dwPasswordLength {
        get => NumGet(this, 64, "uint")
        set => NumPut("uint", value, this, 64)
    }

    /**
     * Pointer to a string  that contains the URL path.
     * @type {PWSTR}
     */
    lpszUrlPath {
        get => NumGet(this, 72, "ptr")
        set => NumPut("ptr", value, this, 72)
    }

    /**
     * Length of the URL path, in characters.
     * @type {Integer}
     */
    dwUrlPathLength {
        get => NumGet(this, 80, "uint")
        set => NumPut("uint", value, this, 80)
    }

    /**
     * Pointer to a string value that contains the extra information, for example, ?something or #something.
     * @type {PWSTR}
     */
    lpszExtraInfo {
        get => NumGet(this, 88, "ptr")
        set => NumPut("ptr", value, this, 88)
    }

    /**
     * Unsigned long integer value that contains the length of the extra information, in characters.
     * @type {Integer}
     */
    dwExtraInfoLength {
        get => NumGet(this, 96, "uint")
        set => NumPut("uint", value, this, 96)
    }
}
