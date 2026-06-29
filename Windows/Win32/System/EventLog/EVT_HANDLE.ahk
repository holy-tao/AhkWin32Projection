#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\Apis.ahk" { EvtClose }

/**
 * @namespace Windows.Win32.System.EventLog
 */
export default struct EVT_HANDLE {
    Value : IntPtr

    __value {
        set {
            if (value is EVT_HANDLE) {
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
            EvtClose(this.Value)
            this.Value := 0
        }
    }

    /**
     * A `EVT_HANDLE` which is owned by the script and which frees itself
     * in `__Delete`.
     */
    struct Owned extends EVT_HANDLE {
        __Delete() {
            this.Free()
        }
    }

    /**
     * Takes ownership of this EVT_HANDLE, returning an owned handle that frees
     * itself when it falls out of scope. This is a *move*: the original handle is
     * invalidated so the underlying resource has exactly one owner.
     * @returns {EVT_HANDLE.Owned}
     */
    Adopt() {
        if (this is EVT_HANDLE.Owned) {
            throw TypeError("Cannot adopt an owned EVT_HANDLE", -1)
        }
        owned := EVT_HANDLE.Owned(this.Value)
        this.Value := 0
        return owned
    }
}
