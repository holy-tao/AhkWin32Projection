#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Is used to replace the HCRYPTPROV data type where the HCRYPTPROV data type is no longer used. Function parameters and data structures that are of type HCRYPTPROV\_LEGACY should be set to NULL.
 * @see https://learn.microsoft.com/windows/win32/SecCrypto/hcryptprov-legacy
 * @namespace Windows.Win32.Security.Cryptography
 */
export default struct HCRYPTPROV_LEGACY {
    Value : IntPtr

    __value {
        set {
            if (value is HCRYPTPROV_LEGACY) {
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
