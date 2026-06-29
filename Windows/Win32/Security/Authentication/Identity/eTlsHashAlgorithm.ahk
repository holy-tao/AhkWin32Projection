#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Security.Authentication.Identity
 */
export default struct eTlsHashAlgorithm {
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
    static TlsHashAlgorithm_None => 0

    /**
     * @type {Integer (Int32)}
     */
    static TlsHashAlgorithm_Md5 => 1

    /**
     * @type {Integer (Int32)}
     */
    static TlsHashAlgorithm_Sha1 => 2

    /**
     * @type {Integer (Int32)}
     */
    static TlsHashAlgorithm_Sha224 => 3

    /**
     * @type {Integer (Int32)}
     */
    static TlsHashAlgorithm_Sha256 => 4

    /**
     * @type {Integer (Int32)}
     */
    static TlsHashAlgorithm_Sha384 => 5

    /**
     * @type {Integer (Int32)}
     */
    static TlsHashAlgorithm_Sha512 => 6
}
