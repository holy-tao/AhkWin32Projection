#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\BCRYPT_SECRET_HANDLE.ahk" { BCRYPT_SECRET_HANDLE }
#Import ".\BCRYPT_HASH_HANDLE.ahk" { BCRYPT_HASH_HANDLE }
#Import ".\BCRYPT_ALG_HANDLE.ahk" { BCRYPT_ALG_HANDLE }
#Import ".\BCRYPT_KEY_HANDLE.ahk" { BCRYPT_KEY_HANDLE }

/**
 * @namespace Windows.Win32.Security.Cryptography
 */
export default struct BCRYPT_HANDLE {
    Value : IntPtr

    __value {
        set {
            if ((value is BCRYPT_ALG_HANDLE) || (value is BCRYPT_HANDLE) || (value is BCRYPT_HASH_HANDLE) || (value is BCRYPT_KEY_HANDLE) || (value is BCRYPT_SECRET_HANDLE)) {
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
