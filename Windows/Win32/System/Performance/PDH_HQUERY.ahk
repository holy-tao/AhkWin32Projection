#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\Apis.ahk" { PdhCloseQuery }

/**
 * @namespace Windows.Win32.System.Performance
 */
export default struct PDH_HQUERY {
    Value : IntPtr

    __value {
        set {
            if (value is PDH_HQUERY) {
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
            PdhCloseQuery(this.Value)
            this.Value := -1
        }
    }

    /**
     * A `PDH_HQUERY` which is owned by the script and which frees itself
     * in `__Delete`.
     */
    struct Owned extends PDH_HQUERY {
        __Delete() {
            this.Free()
        }
    }

    /**
     * Takes ownership of this PDH_HQUERY, returning an owned handle that frees
     * itself when it falls out of scope. This is a *move*: the original handle is
     * invalidated so the underlying resource has exactly one owner.
     * @returns {PDH_HQUERY.Owned}
     */
    Adopt() {
        if (this is PDH_HQUERY.Owned) {
            throw TypeError("Cannot adopt an owned PDH_HQUERY", -1)
        }
        owned := PDH_HQUERY.Owned(this.Value)
        this.Value := -1
        return owned
    }
}
