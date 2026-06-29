#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * The PHONECAPS_BUFFER enum is used by methods that set or get phone capabilities described by a buffer.
 * @see https://learn.microsoft.com/windows/win32/api/tapi3if/ne-tapi3if-phonecaps_buffer
 * @namespace Windows.Win32.Devices.Tapi
 */
export default struct PHONECAPS_BUFFER {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * Device-specific phone capabilities.
     * @type {Integer (Int32)}
     */
    static PCB_DEVSPECIFICBUFFER => 0
}
