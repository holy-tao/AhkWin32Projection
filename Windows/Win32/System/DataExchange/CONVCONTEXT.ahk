#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Security\SECURITY_QUALITY_OF_SERVICE.ahk

/**
 * Contains information supplied by a Dynamic Data Exchange (DDE) client application. The information is useful for specialized or cross-language DDE conversations.
 * @remarks
 * <h3><a id="Security_Warning"></a><a id="security_warning"></a><a id="SECURITY_WARNING"></a>Security Warning</h3>
  * For added security, your application can specify a security code with the <b>dwSecurity</b> member. The application could then examine this value in the <a href="https://docs.microsoft.com/windows/desktop/api/ddeml/nc-ddeml-pfncallback">DdeCallback</a> function to check the identity of the client application. However, a value that is hard-coded into an application might be discovered. Thus, you may want to provide the security code in some other way, such as through user input.
 * @see https://learn.microsoft.com/windows/win32/api/ddeml/ns-ddeml-convcontext
 * @namespace Windows.Win32.System.DataExchange
 * @version v4.0.30319
 */
class CONVCONTEXT extends Win32Struct
{
    static sizeof => 40

    static packingSize => 8

    /**
     * Type: <b>UINT</b>
     * 
     * The structure's size, in bytes.
     * @type {Integer}
     */
    cb {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Type: <b>UINT</b>
     * 
     * The conversation context flags. Currently, no flags are defined for this member.
     * @type {Integer}
     */
    wFlags {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * Type: <b>UINT</b>
     * 
     * The country/region code identifier for topic-name and item-name strings.
     * @type {Integer}
     */
    wCountryID {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * Type: <b>int</b>
     * 
     * The code page for topic-name and item-name strings. Non-multilingual clients should set this member to <b>CP_WINANSI</b>. Unicode clients should set this value to <b>CP_WINUNICODE</b>.
     * @type {Integer}
     */
    iCodePage {
        get => NumGet(this, 12, "int")
        set => NumPut("int", value, this, 12)
    }

    /**
     * Type: <b>DWORD</b>
     * 
     * The <a href="https://docs.microsoft.com/windows/desktop/Intl/language-identifier-constants-and-strings">language identifier</a> for topic-name and item-name strings.
     * @type {Integer}
     */
    dwLangID {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * Type: <b>DWORD</b>
     * 
     * A private (application-defined) security code.
     * @type {Integer}
     */
    dwSecurity {
        get => NumGet(this, 20, "uint")
        set => NumPut("uint", value, this, 20)
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-security_quality_of_service">SECURITY_QUALITY_OF_SERVICE</a></b>
     * 
     * The quality of service a DDE client wants from the system during a given conversation. The quality of service level specified lasts for the duration of the conversation. It cannot be changed once the conversation is started.
     * @type {SECURITY_QUALITY_OF_SERVICE}
     */
    qos{
        get {
            if(!this.HasProp("__qos"))
                this.__qos := SECURITY_QUALITY_OF_SERVICE(this.ptr + 24)
            return this.__qos
        }
    }
}
