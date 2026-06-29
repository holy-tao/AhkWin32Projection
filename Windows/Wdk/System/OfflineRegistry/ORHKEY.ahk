#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\Apis.ahk" { ORCloseKey }

/**
 * @namespace Windows.Wdk.System.OfflineRegistry
 */
export default struct ORHKEY {
    Value : IntPtr

    __value {
        set {
            if (value is ORHKEY) {
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
            ORCloseKey(this.Value)
            this.Value := -1
        }
    }

    /**
     * A `ORHKEY` which is owned by the script and which frees itself
     * in `__Delete`.
     */
    struct Owned extends ORHKEY {
        __Delete() {
            this.Free()
        }
    }

    /**
     * Takes ownership of this ORHKEY, returning an owned handle that frees
     * itself when it falls out of scope. This is a *move*: the original handle is
     * invalidated so the underlying resource has exactly one owner.
     * @returns {ORHKEY.Owned}
     */
    Adopt() {
        if (this is ORHKEY.Owned) {
            throw TypeError("Cannot adopt an owned ORHKEY", -1)
        }
        owned := ORHKEY.Owned(this.Value)
        this.Value := -1
        return owned
    }
}
