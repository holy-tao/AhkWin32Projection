#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\WS_XML_WRITER_ENCODING.ahk

/**
 * Used to indicate that the writer should emit bytes as binary xml.
 * @see https://learn.microsoft.com/windows/win32/api/webservices/ns-webservices-ws_xml_writer_binary_encoding
 * @namespace Windows.Win32.Networking.WindowsWebServices
 * @version v4.0.30319
 */
class WS_XML_WRITER_BINARY_ENCODING extends Win32Struct
{
    static sizeof => 32

    static packingSize => 8

    /**
     * The base type for all types that derive from <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ns-webservices-ws_xml_writer_encoding">WS_XML_WRITER_ENCODING</a>.
     * @type {WS_XML_WRITER_ENCODING}
     */
    encoding{
        get {
            if(!this.HasProp("__encoding"))
                this.__encoding := WS_XML_WRITER_ENCODING(this.ptr + 0)
            return this.__encoding
        }
    }

    /**
     * Indicates the dictionary that the writer should use for static strings.  <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ns-webservices-ws_xml_string">WS_XML_STRING</a>s that are written that
     *           reference this dictionary, will be written in the binary xml document using an id rather than the string itself.
     *           When reading this document, the application must provide a dictionary with the same strings.
     * @type {Pointer<WS_XML_DICTIONARY>}
     */
    staticDictionary {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * Specifies an optional callback that the writer will invoke when a <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ns-webservices-ws_xml_string">WS_XML_STRING</a> that is not found in the staticDictionary is written for the first time.
     *           The callback provides the mapping to an id which the writer will then use.  It is the responsibility of the callback to coordinate with the
     *           writer to propagate these strings to the reader. The string is not added to the dictionary if this callback is not specified.
     * @type {Pointer<Ptr>}
     */
    dynamicStringCallback {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }

    /**
     * User-defined state that will be passed to dynamicStringCallback.
     * @type {Pointer<Void>}
     */
    dynamicStringCallbackState {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }
}
