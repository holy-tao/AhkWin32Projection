#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Each XML buffer property is identified by an ID and has an associated value.
 * @see https://learn.microsoft.com/windows/win32/api/webservices/ne-webservices-ws_xml_buffer_property_id
 * @namespace Windows.Win32.Networking.WindowsWebServices
 */
export default struct WS_XML_BUFFER_PROPERTY_ID {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }
}
