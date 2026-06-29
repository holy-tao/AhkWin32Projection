#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\Apis.ahk" { CloseThreadpoolCleanupGroup }

/**
 * @namespace Windows.Win32.System.Threading
 */
export default struct PTP_CLEANUP_GROUP {
    Value : IntPtr

    __value {
        set {
            if (value is PTP_CLEANUP_GROUP) {
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
            CloseThreadpoolCleanupGroup(this.Value)
            this.Value := 0
        }
    }

    /**
     * A `PTP_CLEANUP_GROUP` which is owned by the script and which frees itself
     * in `__Delete`.
     */
    struct Owned extends PTP_CLEANUP_GROUP {
        __Delete() {
            this.Free()
        }
    }

    /**
     * Takes ownership of this PTP_CLEANUP_GROUP, returning an owned handle that frees
     * itself when it falls out of scope. This is a *move*: the original handle is
     * invalidated so the underlying resource has exactly one owner.
     * @returns {PTP_CLEANUP_GROUP.Owned}
     */
    Adopt() {
        if (this is PTP_CLEANUP_GROUP.Owned) {
            throw TypeError("Cannot adopt an owned PTP_CLEANUP_GROUP", -1)
        }
        owned := PTP_CLEANUP_GROUP.Owned(this.Value)
        this.Value := 0
        return owned
    }
}
