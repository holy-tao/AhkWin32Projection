#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\Apis.ahk" { DPA_Destroy }

/**
 * @namespace Windows.Win32.UI.Controls
 */
export default struct HDPA {
    Value : IntPtr

    __value {
        set {
            if (value is HDPA) {
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
            DPA_Destroy(this.Value)
            this.Value := -1
        }
    }

    /**
     * A `HDPA` which is owned by the script and which frees itself
     * in `__Delete`.
     */
    struct Owned extends HDPA {
        __Delete() {
            this.Free()
        }
    }

    /**
     * Takes ownership of this HDPA, returning an owned handle that frees
     * itself when it falls out of scope. This is a *move*: the original handle is
     * invalidated so the underlying resource has exactly one owner.
     * @returns {HDPA.Owned}
     */
    Adopt() {
        if (this is HDPA.Owned) {
            throw TypeError("Cannot adopt an owned HDPA", -1)
        }
        owned := HDPA.Owned(this.Value)
        this.Value := -1
        return owned
    }
}
