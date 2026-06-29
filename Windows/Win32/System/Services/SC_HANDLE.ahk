#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\Apis.ahk" { CloseServiceHandle }

/**
 * @namespace Windows.Win32.System.Services
 */
export default struct SC_HANDLE {
    Value : IntPtr

    __value {
        set {
            if (value is SC_HANDLE) {
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
            CloseServiceHandle(this.Value)
            this.Value := -1
        }
    }

    /**
     * A `SC_HANDLE` which is owned by the script and which frees itself
     * in `__Delete`.
     */
    struct Owned extends SC_HANDLE {
        __Delete() {
            this.Free()
        }
    }

    /**
     * Takes ownership of this SC_HANDLE, returning an owned handle that frees
     * itself when it falls out of scope. This is a *move*: the original handle is
     * invalidated so the underlying resource has exactly one owner.
     * @returns {SC_HANDLE.Owned}
     */
    Adopt() {
        if (this is SC_HANDLE.Owned) {
            throw TypeError("Cannot adopt an owned SC_HANDLE", -1)
        }
        owned := SC_HANDLE.Owned(this.Value)
        this.Value := -1
        return owned
    }
}
