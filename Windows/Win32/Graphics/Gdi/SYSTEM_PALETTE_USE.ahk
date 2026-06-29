#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Graphics.Gdi
 */
export default struct SYSTEM_PALETTE_USE {
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
    static SYSPAL_NOSTATIC => 2

    /**
     * @type {Integer (UInt32)}
     */
    static SYSPAL_NOSTATIC256 => 3

    /**
     * @type {Integer (UInt32)}
     */
    static SYSPAL_STATIC => 1
}
