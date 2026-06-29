#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\Apis.ahk" { HcsCloseComputeSystem }

/**
 * @namespace Windows.Win32.System.HostComputeSystem
 */
export default struct HCS_SYSTEM {
    Value : IntPtr

    __value {
        set {
            if (value is HCS_SYSTEM) {
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
            HcsCloseComputeSystem(this.Value)
            this.Value := -1
        }
    }

    /**
     * A `HCS_SYSTEM` which is owned by the script and which frees itself
     * in `__Delete`.
     */
    struct Owned extends HCS_SYSTEM {
        __Delete() {
            this.Free()
        }
    }

    /**
     * Takes ownership of this HCS_SYSTEM, returning an owned handle that frees
     * itself when it falls out of scope. This is a *move*: the original handle is
     * invalidated so the underlying resource has exactly one owner.
     * @returns {HCS_SYSTEM.Owned}
     */
    Adopt() {
        if (this is HCS_SYSTEM.Owned) {
            throw TypeError("Cannot adopt an owned HCS_SYSTEM", -1)
        }
        owned := HCS_SYSTEM.Owned(this.Value)
        this.Value := -1
        return owned
    }
}
