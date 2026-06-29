#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * The opaque type used for a reference to an xml buffer.
 * @remarks
 * This object is not thread safe. For more information, see [thread safety](thread-safety.md).
 * @see https://learn.microsoft.com/windows/win32/wsw/ws-xml-buffer
 * @namespace Windows.Win32.Networking.WindowsWebServices
 */
export default struct WS_XML_BUFFER {
    value : IntPtr

    __value {
        set {
            if (value is WS_XML_BUFFER) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    __New(value := 0) {
        this.value := value
    }
}
