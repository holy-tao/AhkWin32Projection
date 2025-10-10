#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\WS_XML_READER_ENCODING.ahk

/**
 * Used to indicate that the reader should interpret the bytes it reads as textual xml.
 * @see https://docs.microsoft.com/windows/win32/api//webservices/ns-webservices-ws_xml_reader_text_encoding
 * @namespace Windows.Win32.Networking.WindowsWebServices
 * @version v4.0.30319
 */
class WS_XML_READER_TEXT_ENCODING extends Win32Struct
{
    static sizeof => 8

    static packingSize => 4

    /**
     * The base type for all types that derive from <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ns-webservices-ws_xml_reader_encoding">WS_XML_READER_ENCODING</a>.
     * @type {WS_XML_READER_ENCODING}
     */
    encoding{
        get {
            if(!this.HasProp("__encoding"))
                this.__encoding := WS_XML_READER_ENCODING(this.ptr + 0)
            return this.__encoding
        }
    }

    /**
     * Indicates the text encoding of the bytes.  If <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_charset">WS_CHARSET_AUTO</a> is specified then the reader will
     *           determine the encoding of the document based on the first few bytes of the document.  If an xml declaration
     *           is present in the document, the reader will ensure that the encoding attribute coincides with this value.
     * @type {Integer}
     */
    charSet {
        get => NumGet(this, 4, "int")
        set => NumPut("int", value, this, 4)
    }
}
