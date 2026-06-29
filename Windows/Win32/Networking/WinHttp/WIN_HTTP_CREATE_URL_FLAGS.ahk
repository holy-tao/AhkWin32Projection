#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Networking.WinHttp
 */
export default struct WIN_HTTP_CREATE_URL_FLAGS {
    value : UInt32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * @type {Integer (UInt32)}
     */
    static ICU_ESCAPE => 2147483648

    /**
     * @type {Integer (UInt32)}
     */
    static ICU_REJECT_USERPWD => 16384

    /**
     * @type {Integer (UInt32)}
     */
    static ICU_DECODE => 268435456
}
