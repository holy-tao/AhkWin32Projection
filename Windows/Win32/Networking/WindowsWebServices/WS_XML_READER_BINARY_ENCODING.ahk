#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\WS_XML_READER_ENCODING.ahk

/**
 * Used to indicate that the reader should interpret the bytes it reads as binary xml.
 * @see https://docs.microsoft.com/windows/win32/api//webservices/ns-webservices-ws_xml_reader_binary_encoding
 * @namespace Windows.Win32.Networking.WindowsWebServices
 * @version v4.0.30319
 */
class WS_XML_READER_BINARY_ENCODING extends Win32Struct
{
    static sizeof => 24

    static packingSize => 8

    /**
     * The base type for all types that derive from <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ns-webservices-ws_xml_reader_encoding">WS_XML_READER_ENCODING</a>.
     * @type {WS_XML_READER_ENCODING}
     */
    encoding{
        get {
            if(!this.HasProp("__encoding"))
                this.__encoding := WS_XML_READER_ENCODING(0, this)
            return this.__encoding
        }
    }

    /**
     * Indicates the dictionary that the reader should use for static strings.  The binary representation of the xml
     *           document references these strings by id (as opposed to embedding the actual string), and therefore they must contain 
     *           the same set of strings used when the document was written.
     * @type {Pointer<WS_XML_DICTIONARY>}
     */
    staticDictionary {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * Indicates the dictionary that the reader should use for dynamic strings. These are strings that were not in the 
     *           staticDictionary when the document was written but that were found by the <a href="https://docs.microsoft.com/windows/desktop/api/webservices/nc-webservices-ws_dynamic_string_callback">WS_DYNAMIC_STRING_CALLBACK</a>.
     *           The binary representation of the xml document references these strings by id (as opposed to embedding the actual string), 
     *           and therefore they must contain the same set of strings used when the document was written.
     *           The application that uses the reader and writer must coordinate communicating the values referenced by these strings.
     * @type {Pointer<WS_XML_DICTIONARY>}
     */
    dynamicDictionary {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }
}
