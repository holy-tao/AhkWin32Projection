#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\BOOLEAN.ahk" { BOOLEAN }
#Import "..\..\Security\SECURITY_QUALITY_OF_SERVICE.ahk" { SECURITY_QUALITY_OF_SERVICE }
#Import "..\..\Security\SECURITY_IMPERSONATION_LEVEL.ahk" { SECURITY_IMPERSONATION_LEVEL }

/**
 * Contains information supplied by a Dynamic Data Exchange (DDE) client application. The information is useful for specialized or cross-language DDE conversations.
 * @remarks
 * <h3><a id="Security_Warning"></a><a id="security_warning"></a><a id="SECURITY_WARNING"></a>Security Warning</h3>
 * For added security, your application can specify a security code with the <b>dwSecurity</b> member. The application could then examine this value in the <a href="https://docs.microsoft.com/windows/desktop/api/ddeml/nc-ddeml-pfncallback">DdeCallback</a> function to check the identity of the client application. However, a value that is hard-coded into an application might be discovered. Thus, you may want to provide the security code in some other way, such as through user input.
 * @see https://learn.microsoft.com/windows/win32/api/ddeml/ns-ddeml-convcontext
 * @namespace Windows.Win32.System.DataExchange
 */
export default struct CONVCONTEXT {
    #StructPack 4

    /**
     * Type: <b>UINT</b>
     * 
     * The structure's size, in bytes.
     */
    cb : UInt32

    /**
     * Type: <b>UINT</b>
     * 
     * The conversation context flags. Currently, no flags are defined for this member.
     */
    wFlags : UInt32

    /**
     * Type: <b>UINT</b>
     * 
     * The country/region code identifier for topic-name and item-name strings.
     */
    wCountryID : UInt32

    /**
     * Type: <b>int</b>
     * 
     * The code page for topic-name and item-name strings. Non-multilingual clients should set this member to <b>CP_WINANSI</b>. Unicode clients should set this value to <b>CP_WINUNICODE</b>.
     */
    iCodePage : Int32

    /**
     * Type: <b>DWORD</b>
     * 
     * The <a href="https://docs.microsoft.com/windows/desktop/Intl/language-identifier-constants-and-strings">language identifier</a> for topic-name and item-name strings.
     */
    dwLangID : UInt32

    /**
     * Type: <b>DWORD</b>
     * 
     * A private (application-defined) security code.
     */
    dwSecurity : UInt32

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-security_quality_of_service">SECURITY_QUALITY_OF_SERVICE</a></b>
     * 
     * The quality of service a DDE client wants from the system during a given conversation. The quality of service level specified lasts for the duration of the conversation. It cannot be changed once the conversation is started.
     */
    qos : SECURITY_QUALITY_OF_SERVICE

}
