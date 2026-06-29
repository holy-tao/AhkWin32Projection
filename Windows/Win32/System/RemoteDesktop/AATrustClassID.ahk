#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.RemoteDesktop
 */
export default struct AATrustClassID {
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
    static AA_UNTRUSTED => 0

    /**
     * @type {Integer (Int32)}
     */
    static AA_TRUSTEDUSER_UNTRUSTEDCLIENT => 1

    /**
     * @type {Integer (Int32)}
     */
    static AA_TRUSTEDUSER_TRUSTEDCLIENT => 2
}
