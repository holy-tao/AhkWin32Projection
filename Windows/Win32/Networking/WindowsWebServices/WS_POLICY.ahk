#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * An opaque type used to reference a metadata input policy.
 * @remarks
 * This object is not thread safe. For more information, see [thread safety](thread-safety.md).
 * @see https://learn.microsoft.com/windows/win32/wsw/ws-policy
 * @namespace Windows.Win32.Networking.WindowsWebServices
 */
export default struct WS_POLICY {
    value : IntPtr

    __value {
        set {
            if (value is WS_POLICY) {
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
