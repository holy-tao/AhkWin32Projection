#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * The type of WS_XML_READER_INPUT structure.
 * @see https://learn.microsoft.com/windows/win32/api/webservices/ne-webservices-ws_xml_reader_input_type
 * @namespace Windows.Win32.Networking.WindowsWebServices
 */
export default struct WS_XML_READER_INPUT_TYPE {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * @type {Integer (Int32)}
     */
    static WS_XML_READER_INPUT_TYPE_BUFFER => 1

    /**
     * @type {Integer (Int32)}
     */
    static WS_XML_READER_INPUT_TYPE_STREAM => 2
}
