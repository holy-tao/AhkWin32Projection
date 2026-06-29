#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\Apis.ahk" { DdeFreeDataHandle }

/**
 * @namespace Windows.Win32.System.DataExchange
 */
export default struct HDDEDATA {
    Value : IntPtr

    __value {
        set {
            if (value is HDDEDATA) {
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
            DdeFreeDataHandle(this.Value)
            this.Value := 0
        }
    }

    /**
     * A `HDDEDATA` which is owned by the script and which frees itself
     * in `__Delete`.
     */
    struct Owned extends HDDEDATA {
        __Delete() {
            this.Free()
        }
    }

    /**
     * Takes ownership of this HDDEDATA, returning an owned handle that frees
     * itself when it falls out of scope. This is a *move*: the original handle is
     * invalidated so the underlying resource has exactly one owner.
     * @returns {HDDEDATA.Owned}
     */
    Adopt() {
        if (this is HDDEDATA.Owned) {
            throw TypeError("Cannot adopt an owned HDDEDATA", -1)
        }
        owned := HDDEDATA.Owned(this.Value)
        this.Value := 0
        return owned
    }
}
