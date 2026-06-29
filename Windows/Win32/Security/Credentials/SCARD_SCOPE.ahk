#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Security.Credentials
 */
export default struct SCARD_SCOPE {
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
    static SCARD_SCOPE_USER => 0

    /**
     * @type {Integer (UInt32)}
     */
    static SCARD_SCOPE_SYSTEM => 2
}
