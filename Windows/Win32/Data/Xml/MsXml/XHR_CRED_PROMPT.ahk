#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Specifies whether to allow credential prompts to the user for authentication.
 * @see https://learn.microsoft.com/windows/win32/api/msxml6/ne-msxml6-xhr_cred_prompt
 * @namespace Windows.Win32.Data.Xml.MsXml
 */
export default struct XHR_CRED_PROMPT {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * Allow all credential prompts for authentication. 
     * 
     * This setting allows credential prompts in response to requests from the proxy or the server.
     * @type {Integer (Int32)}
     */
    static XHR_CRED_PROMPT_ALL => 0

    /**
     * Disable all credential prompts for authentication. This setting disables any credential prompts in response to requests from the proxy or the server.
     * @type {Integer (Int32)}
     */
    static XHR_CRED_PROMPT_NONE => 1

    /**
     * Allow credential prompts for authentication only in response to requests from the proxy.
     * 
     * This setting disables any credential prompts in response to requests from the server.
     * @type {Integer (Int32)}
     */
    static XHR_CRED_PROMPT_PROXY => 2
}
