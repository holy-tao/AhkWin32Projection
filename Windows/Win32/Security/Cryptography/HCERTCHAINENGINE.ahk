#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\Apis.ahk" { CertFreeCertificateChainEngine }

/**
 * @namespace Windows.Win32.Security.Cryptography
 */
export default struct HCERTCHAINENGINE {
    Value : IntPtr

    __value {
        set {
            if (value is HCERTCHAINENGINE) {
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
            CertFreeCertificateChainEngine(this.Value)
            this.Value := -1
        }
    }

    /**
     * A `HCERTCHAINENGINE` which is owned by the script and which frees itself
     * in `__Delete`.
     */
    struct Owned extends HCERTCHAINENGINE {
        __Delete() {
            this.Free()
        }
    }

    /**
     * Takes ownership of this HCERTCHAINENGINE, returning an owned handle that frees
     * itself when it falls out of scope. This is a *move*: the original handle is
     * invalidated so the underlying resource has exactly one owner.
     * @returns {HCERTCHAINENGINE.Owned}
     */
    Adopt() {
        if (this is HCERTCHAINENGINE.Owned) {
            throw TypeError("Cannot adopt an owned HCERTCHAINENGINE", -1)
        }
        owned := HCERTCHAINENGINE.Owned(this.Value)
        this.Value := -1
        return owned
    }
}
