#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\Apis.ahk" { FwpmEngineClose0 }

/**
 * @namespace Windows.Win32.NetworkManagement.WindowsFilteringPlatform
 */
export default struct FWPM_ENGINE_HANDLE {
    Value : IntPtr

    __value {
        set {
            if (value is FWPM_ENGINE_HANDLE) {
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
            FwpmEngineClose0(this.Value)
            this.Value := -1
        }
    }

    /**
     * A `FWPM_ENGINE_HANDLE` which is owned by the script and which frees itself
     * in `__Delete`.
     */
    struct Owned extends FWPM_ENGINE_HANDLE {
        __Delete() {
            this.Free()
        }
    }

    /**
     * Takes ownership of this FWPM_ENGINE_HANDLE, returning an owned handle that frees
     * itself when it falls out of scope. This is a *move*: the original handle is
     * invalidated so the underlying resource has exactly one owner.
     * @returns {FWPM_ENGINE_HANDLE.Owned}
     */
    Adopt() {
        if (this is FWPM_ENGINE_HANDLE.Owned) {
            throw TypeError("Cannot adopt an owned FWPM_ENGINE_HANDLE", -1)
        }
        owned := FWPM_ENGINE_HANDLE.Owned(this.Value)
        this.Value := -1
        return owned
    }
}
