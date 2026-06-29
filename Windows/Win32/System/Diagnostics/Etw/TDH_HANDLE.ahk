#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\Apis.ahk" { TdhCloseDecodingHandle }

/**
 * @namespace Windows.Win32.System.Diagnostics.Etw
 */
export default struct TDH_HANDLE {
    Value : IntPtr

    __value {
        set {
            if (value is TDH_HANDLE) {
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
            TdhCloseDecodingHandle(this.Value)
            this.Value := -1
        }
    }

    /**
     * A `TDH_HANDLE` which is owned by the script and which frees itself
     * in `__Delete`.
     */
    struct Owned extends TDH_HANDLE {
        __Delete() {
            this.Free()
        }
    }

    /**
     * Takes ownership of this TDH_HANDLE, returning an owned handle that frees
     * itself when it falls out of scope. This is a *move*: the original handle is
     * invalidated so the underlying resource has exactly one owner.
     * @returns {TDH_HANDLE.Owned}
     */
    Adopt() {
        if (this is TDH_HANDLE.Owned) {
            throw TypeError("Cannot adopt an owned TDH_HANDLE", -1)
        }
        owned := TDH_HANDLE.Owned(this.Value)
        this.Value := -1
        return owned
    }
}
