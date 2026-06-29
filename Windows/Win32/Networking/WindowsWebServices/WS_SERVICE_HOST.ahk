#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * An opaque type used to reference a service host.
 * @remarks
 * This object is thread safe. For more information, see [thread safety](thread-safety.md).
 * @see https://learn.microsoft.com/windows/win32/wsw/ws-service-host
 * @namespace Windows.Win32.Networking.WindowsWebServices
 */
export default struct WS_SERVICE_HOST {
    value : IntPtr

    __value {
        set {
            if (value is WS_SERVICE_HOST) {
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
