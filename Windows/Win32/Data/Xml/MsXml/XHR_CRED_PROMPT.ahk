#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Enum.ahk

/**
 * Specifies whether to allow credential prompts to the user for authentication.
 * @see https://learn.microsoft.com/windows/win32/api/msxml6/ne-msxml6-xhr_cred_prompt
 * @namespace Windows.Win32.Data.Xml.MsXml
 */
class XHR_CRED_PROMPT extends Win32Enum {

    /**
     * Allow all credential prompts for authentication. 
     * 
     * This setting allows credential prompts in response to requests from the proxy or the server.
     * Native name: XHR_CRED_PROMPT_ALL
     * @type {Integer (Int32)}
     */
    static ALL => 0

    /**
     * Disable all credential prompts for authentication. This setting disables any credential prompts in response to requests from the proxy or the server.
     * Native name: XHR_CRED_PROMPT_NONE
     * @type {Integer (Int32)}
     */
    static NONE => 1

    /**
     * Allow credential prompts for authentication only in response to requests from the proxy.
     * 
     * This setting disables any credential prompts in response to requests from the server.
     * Native name: XHR_CRED_PROMPT_PROXY
     * @type {Integer (Int32)}
     */
    static PROXY => 2
}
