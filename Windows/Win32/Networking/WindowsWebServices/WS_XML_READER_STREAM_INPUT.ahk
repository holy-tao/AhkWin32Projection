#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\WS_XML_READER_INPUT.ahk

/**
 * Specifies that the source of the xml should be obtained from a callback.
 * @see https://docs.microsoft.com/windows/win32/api//webservices/ns-webservices-ws_xml_reader_stream_input
 * @namespace Windows.Win32.Networking.WindowsWebServices
 * @version v4.0.30319
 */
class WS_XML_READER_STREAM_INPUT extends Win32Struct
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
                this.__input := WS_XML_READER_INPUT(this.ptr + 0)
            return this.__input
        }
    }

    /**
     * A callback that is invoked when <a href="https://docs.microsoft.com/windows/desktop/api/webservices/nf-webservices-wsfillreader">WsFillReader</a> is called.
     * @type {Pointer<WS_READ_CALLBACK>}
     */
    readCallback {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * A user-defined value that will be passed back to readCallback.
     * @type {Pointer<Void>}
     */
    readCallbackState {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }
}
