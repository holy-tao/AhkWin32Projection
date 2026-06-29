#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\Apis.ahk" { CloseThreadpool }

/**
 * @namespace Windows.Win32.System.Threading
 */
export default struct PTP_POOL {
    Value : IntPtr

    __value {
        set {
            if (value is PTP_POOL) {
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
            CloseThreadpool(this.Value)
            this.Value := 0
        }
    }

    /**
     * A `PTP_POOL` which is owned by the script and which frees itself
     * in `__Delete`.
     */
    struct Owned extends PTP_POOL {
        __Delete() {
            this.Free()
        }
    }

    /**
     * Takes ownership of this PTP_POOL, returning an owned handle that frees
     * itself when it falls out of scope. This is a *move*: the original handle is
     * invalidated so the underlying resource has exactly one owner.
     * @returns {PTP_POOL.Owned}
     */
    Adopt() {
        if (this is PTP_POOL.Owned) {
            throw TypeError("Cannot adopt an owned PTP_POOL", -1)
        }
        owned := PTP_POOL.Owned(this.Value)
        this.Value := 0
        return owned
    }
}
