#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * An opaque type used to reference a channel.
 * @remarks
 * This object is thread safe. For more information see [thread safety](thread-safety.md).
 * @see https://learn.microsoft.com/windows/win32/wsw/ws-channel
 * @namespace Windows.Win32.Networking.WindowsWebServices
 */
export default struct WS_CHANNEL {
    value : IntPtr

    __value {
        set {
            if (value is WS_CHANNEL) {
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
