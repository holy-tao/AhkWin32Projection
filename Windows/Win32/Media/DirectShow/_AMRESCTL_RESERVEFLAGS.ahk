#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Specifies whether to increment or decrement the number of resources currently being reserved.
 * @see https://learn.microsoft.com/windows/win32/api/strmif/ne-strmif-_amresctl_reserveflags
 * @namespace Windows.Win32.Media.DirectShow
 */
export default struct _AMRESCTL_RESERVEFLAGS {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * Increment the reserved resource count.
     * @type {Integer (Int32)}
     */
    static AMRESCTL_RESERVEFLAGS_RESERVE => 0

    /**
     * Decrement the reserved resource count.
     * @type {Integer (Int32)}
     */
    static AMRESCTL_RESERVEFLAGS_UNRESERVE => 1
}
