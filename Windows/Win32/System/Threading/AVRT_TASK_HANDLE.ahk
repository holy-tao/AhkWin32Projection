#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\Apis.ahk" { AvRevertMmThreadCharacteristics }

/**
 * @namespace Windows.Win32.System.Threading
 */
export default struct AVRT_TASK_HANDLE {
    Value : IntPtr

    __value {
        set {
            if (value is AVRT_TASK_HANDLE) {
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
            AvRevertMmThreadCharacteristics(this.Value)
            this.Value := 0
        }
    }

    /**
     * A `AVRT_TASK_HANDLE` which is owned by the script and which frees itself
     * in `__Delete`.
     */
    struct Owned extends AVRT_TASK_HANDLE {
        __Delete() {
            this.Free()
        }
    }

    /**
     * Takes ownership of this AVRT_TASK_HANDLE, returning an owned handle that frees
     * itself when it falls out of scope. This is a *move*: the original handle is
     * invalidated so the underlying resource has exactly one owner.
     * @returns {AVRT_TASK_HANDLE.Owned}
     */
    Adopt() {
        if (this is AVRT_TASK_HANDLE.Owned) {
            throw TypeError("Cannot adopt an owned AVRT_TASK_HANDLE", -1)
        }
        owned := AVRT_TASK_HANDLE.Owned(this.Value)
        this.Value := 0
        return owned
    }
}
