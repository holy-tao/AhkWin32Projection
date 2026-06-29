#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Networking.WinSock
 */
export default struct FALLBACK_INDEX {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * @type {Integer (Int32)}
     */
    static FallbackIndexTcpFastopen => 0

    /**
     * @type {Integer (Int32)}
     */
    static FallbackIndexMax => 1
}
