#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\Apis.ahk" { BCryptDestroyKey }

/**
 * @namespace Windows.Win32.Security.Cryptography
 */
export default struct BCRYPT_KEY_HANDLE {
    Value : IntPtr

    __value {
        set {
            if (value is BCRYPT_KEY_HANDLE) {
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

    Free() {
        ; Do nothing if the handle is invalid already
        if (this.Value != 0) {
            BCryptDestroyKey(this.Value)
            this.Value := 0
        }
    }

    /**
     * A `BCRYPT_KEY_HANDLE` which is owned by the script and which frees itself
     * in `__Delete`.
     */
    struct Owned extends BCRYPT_KEY_HANDLE {
        __Delete() {
            this.Free()
        }
    }

    /**
     * Takes ownership of this BCRYPT_KEY_HANDLE, returning an owned handle that frees
     * itself when it falls out of scope. This is a *move*: the original handle is
     * invalidated so the underlying resource has exactly one owner.
     * @returns {BCRYPT_KEY_HANDLE.Owned}
     */
    Adopt() {
        if (this is BCRYPT_KEY_HANDLE.Owned) {
            throw TypeError("Cannot adopt an owned BCRYPT_KEY_HANDLE", -1)
        }
        owned := BCRYPT_KEY_HANDLE.Owned(this.Value)
        this.Value := 0
        return owned
    }
}
