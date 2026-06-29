#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\Apis.ahk" { CloseIoRing }

/**
 * @namespace Windows.Win32.Storage.FileSystem
 */
export default struct HIORING {
    Value : IntPtr

    __value {
        set {
            if (value is HIORING) {
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
            CloseIoRing(this.Value)
            this.Value := -1
        }
    }

    /**
     * A `HIORING` which is owned by the script and which frees itself
     * in `__Delete`.
     */
    struct Owned extends HIORING {
        __Delete() {
            this.Free()
        }
    }

    /**
     * Takes ownership of this HIORING, returning an owned handle that frees
     * itself when it falls out of scope. This is a *move*: the original handle is
     * invalidated so the underlying resource has exactly one owner.
     * @returns {HIORING.Owned}
     */
    Adopt() {
        if (this is HIORING.Owned) {
            throw TypeError("Cannot adopt an owned HIORING", -1)
        }
        owned := HIORING.Owned(this.Value)
        this.Value := -1
        return owned
    }
}
