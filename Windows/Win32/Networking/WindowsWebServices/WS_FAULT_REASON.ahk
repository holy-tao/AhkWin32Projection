#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\WS_STRING.ahk" { WS_STRING }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }

/**
 * Contains an explanation of the fault.
 * @see https://learn.microsoft.com/windows/win32/api/webservices/ns-webservices-ws_fault_reason
 * @namespace Windows.Win32.Networking.WindowsWebServices
 */
export default struct WS_FAULT_REASON {
    #StructPack 8

    /**
     * Text describing the fault.
     */
    text : WS_STRING

    /**
     * The language identifier that identifies the language of the text.
     *                 
     * 
     * The identifier is serialized using the xml:lang attribute, and has
     *                     values that follow <a href="https://www.ietf.org/rfc/rfc3066.txt">RFC3066.txt</a>.
     */
    lang : WS_STRING

}
