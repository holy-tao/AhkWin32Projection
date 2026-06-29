#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * An opaque type used to reference a listener.
 * @remarks
 * This object is thread safe. For more information, see [thread safety](thread-safety.md).
 * @see https://learn.microsoft.com/windows/win32/wsw/ws-listener
 * @namespace Windows.Win32.Networking.WindowsWebServices
 */
export default struct WS_LISTENER {
    value : IntPtr

    __value {
        set {
            if (value is WS_LISTENER) {
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
