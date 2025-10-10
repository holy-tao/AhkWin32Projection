#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\WS_XML_TEXT.ahk

/**
 * Represents an 8 byte floating point value.
 * @remarks
 * 
  * The textual representation of the value has enough digits to preserve the floating point value.
  *       
  * 
  * Negative zero is represented by the text "-0".
  *       
  * 
  * Positive infinity is represented by the text "INF";
  *       
  * 
  * Negative infinity is represented by the text "-INF";
  *       
  * 
  * Unrepresentable values are represented by the text "NaN".
  *       
  * 
  * For more information on this representation, refer to IEEE Standard for Binary Floating-Point Arithmetic, available on the Web site http://www.ieee.org/.
  * 
 * @see https://docs.microsoft.com/windows/win32/api//webservices/ns-webservices-ws_xml_double_text
 * @namespace Windows.Win32.Networking.WindowsWebServices
 * @version v4.0.30319
 */
class WS_XML_DOUBLE_TEXT extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * The base type for all types that derive from <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ns-webservices-ws_xml_text">WS_XML_TEXT</a>.
     * @type {WS_XML_TEXT}
     */
    text{
        get {
            if(!this.HasProp("__text"))
                this.__text := WS_XML_TEXT(this.ptr + 0)
            return this.__text
        }
    }

    /**
     * The value.
     * @type {Float}
     */
    value {
        get => NumGet(this, 8, "double")
        set => NumPut("double", value, this, 8)
    }
}
