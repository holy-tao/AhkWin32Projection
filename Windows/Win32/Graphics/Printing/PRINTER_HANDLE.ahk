#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\Apis.ahk" { ClosePrinter }

/**
 * @namespace Windows.Win32.Graphics.Printing
 */
export default struct PRINTER_HANDLE {
    Value : IntPtr

    __value {
        set {
            if (value is PRINTER_HANDLE) {
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
            ClosePrinter(this.Value)
            this.Value := -1
        }
    }

    /**
     * A `PRINTER_HANDLE` which is owned by the script and which frees itself
     * in `__Delete`.
     */
    struct Owned extends PRINTER_HANDLE {
        __Delete() {
            this.Free()
        }
    }

    /**
     * Takes ownership of this PRINTER_HANDLE, returning an owned handle that frees
     * itself when it falls out of scope. This is a *move*: the original handle is
     * invalidated so the underlying resource has exactly one owner.
     * @returns {PRINTER_HANDLE.Owned}
     */
    Adopt() {
        if (this is PRINTER_HANDLE.Owned) {
            throw TypeError("Cannot adopt an owned PRINTER_HANDLE", -1)
        }
        owned := PRINTER_HANDLE.Owned(this.Value)
        this.Value := -1
        return owned
    }
}
