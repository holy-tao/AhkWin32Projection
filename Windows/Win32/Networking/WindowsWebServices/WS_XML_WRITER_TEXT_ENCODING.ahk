#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\WS_XML_WRITER_ENCODING.ahk

/**
 * Indicates that the reader should emit bytes as textual xml.
 * @see https://learn.microsoft.com/windows/win32/api/webservices/ns-webservices-ws_xml_writer_text_encoding
 * @namespace Windows.Win32.Networking.WindowsWebServices
 * @version v4.0.30319
 */
class WS_XML_WRITER_TEXT_ENCODING extends Win32Struct
{
    static sizeof => 8

    static packingSize => 4

    /**
     * The base type for all types that derive from <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ns-webservices-ws_xml_writer_encoding">WS_XML_WRITER_ENCODING</a>.
     * @type {WS_XML_WRITER_ENCODING}
     */
    encoding{
        get {
            if(!this.HasProp("__encoding"))
                this.__encoding := WS_XML_WRITER_ENCODING(0, this)
            return this.__encoding
        }
    }

    /**
     * Indicates the text encoding of the bytes.  This may not be <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_charset">WS_CHARSET_AUTO</a>.
     * @type {Integer}
     */
    charSet {
        get => NumGet(this, 4, "int")
        set => NumPut("int", value, this, 4)
    }
}
