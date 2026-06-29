#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * The opaque handle representing a security token.
 * @remarks
 * This object is not thread safe. For more information, see [thread safety](thread-safety.md).
 * @see https://learn.microsoft.com/windows/win32/wsw/ws-security-token
 * @namespace Windows.Win32.Networking.WindowsWebServices
 */
export default struct WS_SECURITY_TOKEN {
    value : IntPtr

    __value {
        set {
            if (value is WS_SECURITY_TOKEN) {
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
