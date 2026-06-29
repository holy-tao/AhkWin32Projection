#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * An opaque type used to reference a set of metadata documents.
 * @remarks
 * This object is not thread safe. For more information, see [thread safety](thread-safety.md).
 * @see https://learn.microsoft.com/windows/win32/wsw/ws-metadata
 * @namespace Windows.Win32.Networking.WindowsWebServices
 */
export default struct WS_METADATA {
    value : IntPtr

    __value {
        set {
            if (value is WS_METADATA) {
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
