#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\Apis.ahk" { EventUnregister }

/**
 * @namespace Windows.Win32.System.Diagnostics.Etw
 */
export default struct REGHANDLE {
    Value : Int64

    __value {
        set {
            if (value is REGHANDLE) {
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
            EventUnregister(this.Value)
            this.Value := 0
        }
    }

    /**
     * A `REGHANDLE` which is owned by the script and which frees itself
     * in `__Delete`.
     */
    struct Owned extends REGHANDLE {
        __Delete() {
            this.Free()
        }
    }

    /**
     * Takes ownership of this REGHANDLE, returning an owned handle that frees
     * itself when it falls out of scope. This is a *move*: the original handle is
     * invalidated so the underlying resource has exactly one owner.
     * @returns {REGHANDLE.Owned}
     */
    Adopt() {
        if (this is REGHANDLE.Owned) {
            throw TypeError("Cannot adopt an owned REGHANDLE", -1)
        }
        owned := REGHANDLE.Owned(this.Value)
        this.Value := 0
        return owned
    }
}
