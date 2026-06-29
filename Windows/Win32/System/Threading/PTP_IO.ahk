#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\Apis.ahk" { CloseThreadpoolIo }

/**
 * @namespace Windows.Win32.System.Threading
 */
export default struct PTP_IO {
    Value : IntPtr

    __value {
        set {
            if (value is PTP_IO) {
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
            CloseThreadpoolIo(this.Value)
            this.Value := 0
        }
    }

    /**
     * A `PTP_IO` which is owned by the script and which frees itself
     * in `__Delete`.
     */
    struct Owned extends PTP_IO {
        __Delete() {
            this.Free()
        }
    }

    /**
     * Takes ownership of this PTP_IO, returning an owned handle that frees
     * itself when it falls out of scope. This is a *move*: the original handle is
     * invalidated so the underlying resource has exactly one owner.
     * @returns {PTP_IO.Owned}
     */
    Adopt() {
        if (this is PTP_IO.Owned) {
            throw TypeError("Cannot adopt an owned PTP_IO", -1)
        }
        owned := PTP_IO.Owned(this.Value)
        this.Value := 0
        return owned
    }
}
