#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Security.Cryptography
 */
export default struct ECC_CURVE_TYPE_ENUM {
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
    static BCRYPT_ECC_PRIME_SHORT_WEIERSTRASS_CURVE => 1

    /**
     * @type {Integer (Int32)}
     */
    static BCRYPT_ECC_PRIME_TWISTED_EDWARDS_CURVE => 2

    /**
     * @type {Integer (Int32)}
     */
    static BCRYPT_ECC_PRIME_MONTGOMERY_CURVE => 3
}
