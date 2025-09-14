#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk
#Include ..\..\..\Foundation\FILETIME.ahk

/**
 * Defines a cookie that you can add to the HTTP cookie jar by calling the SetCookie method or retrieve from the HTTP cookie jar by calling the GetCookie method.
 * @see https://learn.microsoft.com/windows/win32/api/msxml6/ns-msxml6-xhr_cookie
 * @namespace Windows.Win32.Data.Xml.MsXml
 * @version v4.0.30319
 */
class XHR_COOKIE extends Win32Struct
{
    static sizeof => 48

    static packingSize => 8

    /**
     * A null-terminated string that specifies the URL in the cookie.
     * @type {Pointer<PWSTR>}
     */
    pwszUrl {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * A null-terminated string that specifies the name in the cookie.
     * @type {Pointer<PWSTR>}
     */
    pwszName {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * A null-terminated string that specifies the value in the cookie.
     * @type {Pointer<PWSTR>}
     */
    pwszValue {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }

    /**
     * A null-terminated string that specifies the user policy in the cookie.
     * @type {Pointer<PWSTR>}
     */
    pwszP3PPolicy {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }

    /**
     * A null-terminated string that specifies the date and time at which the cookie expires.
     * @type {FILETIME}
     */
    ftExpires{
        get {
            if(!this.HasProp("__ftExpires"))
                this.__ftExpires := FILETIME(this.ptr + 32)
            return this.__ftExpires
        }
    }

    /**
     * A set of bit flags that specifies properties of the cookie.
     * 
     * This member can be one of the values from the <b>XHR_COOKIE_FLAG</b> enumeration type defined in the <i>Msxml6.h</i>  header file.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="XHR_COOKIE_IS_SECURE"></a><a id="xhr_cookie_is_secure"></a><dl>
     * <dt><b>XHR_COOKIE_IS_SECURE</b></dt>
     * <dt>0x1</dt>
     * </dl>
     * </td>
     * <td width="60%"></td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="XHR_COOKIE_IS_SESSION"></a><a id="xhr_cookie_is_session"></a><dl>
     * <dt><b>XHR_COOKIE_IS_SESSION</b></dt>
     * <dt>0x2</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The cookie is a session cookie and not  a persistent cookie.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="XHR_COOKIE_THIRD_PARTY"></a><a id="xhr_cookie_third_party"></a><dl>
     * <dt><b>XHR_COOKIE_THIRD_PARTY</b></dt>
     * <dt>0x10</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Indicates that the cookie being set is a third-party cookie.
     * 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="XHR_COOKIE_PROMPT_REQUIRED"></a><a id="xhr_cookie_prompt_required"></a><dl>
     * <dt><b>XHR_COOKIE_PROMPT_REQUIRED</b></dt>
     * <dt>0x20</dt>
     * </dl>
     * </td>
     * <td width="60%"></td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="XHR_COOKIE_EVALUATE_P3P"></a><a id="xhr_cookie_evaluate_p3p"></a><dl>
     * <dt><b>XHR_COOKIE_EVALUATE_P3P</b></dt>
     * <dt>0x40</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * If this flag is set, the <b>pwszP3PPolicy</b> member points to a Platform-for-Privacy-Protection (P3P) header for the cookie in question.
     * 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="XHR_COOKIE_APPLY_P3P"></a><a id="xhr_cookie_apply_p3p"></a><dl>
     * <dt><b>XHR_COOKIE_APPLY_P3P</b></dt>
     * <dt>0x80</dt>
     * </dl>
     * </td>
     * <td width="60%"></td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="XHR_COOKIE_APPLY_P3P"></a><a id="xhr_cookie_apply_p3p"></a><dl>
     * <dt><b>XHR_COOKIE_APPLY_P3P</b></dt>
     * <dt>0x100</dt>
     * </dl>
     * </td>
     * <td width="60%"></td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="XHR_COOKIE_IS_RESTRICTED"></a><a id="xhr_cookie_is_restricted"></a><dl>
     * <dt><b>XHR_COOKIE_IS_RESTRICTED</b></dt>
     * <dt>0x200</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Indicates that the cookie being set is associated with an untrusted site.
     *  
     * 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="XHR_COOKIE_IE6"></a><a id="xhr_cookie_ie6"></a><dl>
     * <dt><b>XHR_COOKIE_IE6</b></dt>
     * <dt>0x400</dt>
     * </dl>
     * </td>
     * <td width="60%"></td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="XHR_COOKIE_IS_LEGACY"></a><a id="xhr_cookie_is_legacy"></a><dl>
     * <dt><b>XHR_COOKIE_IS_LEGACY</b></dt>
     * <dt>0x800</dt>
     * </dl>
     * </td>
     * <td width="60%"></td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="XHR_COOKIE_NON_SCRIPT"></a><a id="xhr_cookie_non_script"></a><dl>
     * <dt><b>XHR_COOKIE_NON_SCRIPT</b></dt>
     * <dt>0x1000</dt>
     * </dl>
     * </td>
     * <td width="60%"></td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="XHR_COOKIE_HTTPONLY"></a><a id="xhr_cookie_httponly"></a><dl>
     * <dt><b>XHR_COOKIE_HTTPONLY</b></dt>
     * <dt>0x2000</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Enables the retrieval of cookies that are marked as "HTTPOnly". 
     * 
     * Do not use this flag if you expose a scriptable interface, because this has security implications. If you expose a scriptable interface, you can become an attack vector for cross-site scripting attacks. It is imperative that you use this flag only if they can guarantee that you will never permit third-party code to set a cookie using this flag by way of an extensibility mechanism you provide. 
     * 
     * 
     * 
     * </td>
     * </tr>
     * </table>
     * @type {Integer}
     */
    dwFlags {
        get => NumGet(this, 40, "uint")
        set => NumPut("uint", value, this, 40)
    }
}
