#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\Apis.ahk" { CryptCloseAsyncHandle }

/**
 * @namespace Windows.Win32.Security.Cryptography
 */
export default struct HCRYPTASYNC {
    Value : IntPtr

    __value {
        set {
            if (value is HCRYPTASYNC) {
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
    static invalidValues => [-1, 0]

    __New(Value := -1) {
        this.Value := Value
    }

    Free() {
        ; Do nothing if the handle is invalid already
        if (this.Value != -1 && this.Value != 0) {
            CryptCloseAsyncHandle(this.Value)
            this.Value := -1
        }
    }

    /**
     * A `HCRYPTASYNC` which is owned by the script and which frees itself
     * in `__Delete`.
     */
    struct Owned extends HCRYPTASYNC {
        __Delete() {
            this.Free()
        }
    }

    /**
     * Takes ownership of this HCRYPTASYNC, returning an owned handle that frees
     * itself when it falls out of scope. This is a *move*: the original handle is
     * invalidated so the underlying resource has exactly one owner.
     * @returns {HCRYPTASYNC.Owned}
     */
    Adopt() {
        if (this is HCRYPTASYNC.Owned) {
            throw TypeError("Cannot adopt an owned HCRYPTASYNC", -1)
        }
        owned := HCRYPTASYNC.Owned(this.Value)
        this.Value := -1
        return owned
    }
}
