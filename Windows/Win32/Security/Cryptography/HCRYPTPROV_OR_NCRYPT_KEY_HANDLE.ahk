#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Is used as a handle to a CryptoAPI cryptographic service provider (CSP) or CNG CSP.
 * @see https://learn.microsoft.com/windows/win32/SecCrypto/hcryptprov-or-ncrypt-key-handle
 * @namespace Windows.Win32.Security.Cryptography
 */
export default struct HCRYPTPROV_OR_NCRYPT_KEY_HANDLE {
    Value : IntPtr

    __value {
        set {
            if (value is HCRYPTPROV_OR_NCRYPT_KEY_HANDLE) {
                this.Value := value.Value
            }
            else {
                this.Value := value
            }
        }
    }

    /**
     * The list of values which indicate that the handle is invalid
     * @type {Array<Integer>}
     */
    static invalidValues => [0]

    __New(Value := 0) {
        this.Value := Value
    }
}
