#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\WS_XML_READER_INPUT.ahk

/**
 * Specifies that the source of the xml input is a buffer.
 * @see https://learn.microsoft.com/windows/win32/api/webservices/ns-webservices-ws_xml_reader_buffer_input
 * @namespace Windows.Win32.Networking.WindowsWebServices
 * @version v4.0.30319
 */
class WS_XML_READER_BUFFER_INPUT extends Win32Struct
{
    static sizeof => 24

    static packingSize => 8

    /**
     * The base type for all types that derive from <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ns-webservices-ws_xml_reader_input">WS_XML_READER_INPUT</a>.
     * @type {WS_XML_READER_INPUT}
     */
    input{
        get {
            if(!this.HasProp("__input"))
                this.__input := WS_XML_READER_INPUT(0, this)
            return this.__input
        }
    }

    /**
     * A pointer to the bytes of data that comprise the encoded form of the xml.  The reader will not modify any of these bytes.
     * @type {Pointer<Void>}
     */
    encodedData {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * The length of the encodedData.
     * @type {Integer}
     */
    encodedDataSize {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }
}
