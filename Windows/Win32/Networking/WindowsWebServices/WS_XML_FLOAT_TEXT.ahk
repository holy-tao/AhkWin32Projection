#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\WS_XML_TEXT_TYPE.ahk" { WS_XML_TEXT_TYPE }
#Import ".\WS_XML_TEXT.ahk" { WS_XML_TEXT }

/**
 * Represents a 4 byte floating point value.
 * @remarks
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
 * @see https://learn.microsoft.com/windows/win32/api/webservices/ns-webservices-ws_xml_float_text
 * @namespace Windows.Win32.Networking.WindowsWebServices
 */
export default struct WS_XML_FLOAT_TEXT {
    #StructPack 4

    /**
     * The base type for all types that derive from <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ns-webservices-ws_xml_text">WS_XML_TEXT</a>.
     */
    text : WS_XML_TEXT

    /**
     * The value.
     */
    value : Float32

}
