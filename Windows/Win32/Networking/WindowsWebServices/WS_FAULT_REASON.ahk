#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\WS_STRING.ahk

/**
 * Contains an explanation of the fault.
 * @see https://docs.microsoft.com/windows/win32/api//webservices/ns-webservices-ws_fault_reason
 * @namespace Windows.Win32.Networking.WindowsWebServices
 * @version v4.0.30319
 */
class WS_FAULT_REASON extends Win32Struct
{
    static sizeof => 32

    static packingSize => 8

    /**
     * Text describing the fault.
     * @type {WS_STRING}
     */
    text{
        get {
            if(!this.HasProp("__text"))
                this.__text := WS_STRING(0, this)
            return this.__text
        }
    }

    /**
     * The language identifier that identifies the language of the text.
     *                 
     * 
     * The identifier is serialized using the xml:lang attribute, and has
     *                     values that follow <a href="https://www.ietf.org/rfc/rfc3066.txt">RFC3066.txt</a>.
     * @type {WS_STRING}
     */
    lang{
        get {
            if(!this.HasProp("__lang"))
                this.__lang := WS_STRING(16, this)
            return this.__lang
        }
    }
}
