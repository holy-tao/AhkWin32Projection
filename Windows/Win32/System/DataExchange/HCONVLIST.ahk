#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\Apis.ahk" { DdeDisconnectList }

/**
 * @namespace Windows.Win32.System.DataExchange
 */
export default struct HCONVLIST {
    Value : IntPtr

    __value {
        set {
            if (value is HCONVLIST) {
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
            DdeDisconnectList(this.Value)
            this.Value := -1
        }
    }

    /**
     * A `HCONVLIST` which is owned by the script and which frees itself
     * in `__Delete`.
     */
    struct Owned extends HCONVLIST {
        __Delete() {
            this.Free()
        }
    }

    /**
     * Takes ownership of this HCONVLIST, returning an owned handle that frees
     * itself when it falls out of scope. This is a *move*: the original handle is
     * invalidated so the underlying resource has exactly one owner.
     * @returns {HCONVLIST.Owned}
     */
    Adopt() {
        if (this is HCONVLIST.Owned) {
            throw TypeError("Cannot adopt an owned HCONVLIST", -1)
        }
        owned := HCONVLIST.Owned(this.Value)
        this.Value := -1
        return owned
    }
}
