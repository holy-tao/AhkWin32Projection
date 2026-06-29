#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\Apis.ahk" { CoDecrementMTAUsage }

/**
 * @namespace Windows.Win32.System.Com
 */
export default struct CO_MTA_USAGE_COOKIE {
    Value : IntPtr

    __value {
        set {
            if (value is CO_MTA_USAGE_COOKIE) {
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
            CoDecrementMTAUsage(this.Value)
            this.Value := -1
        }
    }

    /**
     * A `CO_MTA_USAGE_COOKIE` which is owned by the script and which frees itself
     * in `__Delete`.
     */
    struct Owned extends CO_MTA_USAGE_COOKIE {
        __Delete() {
            this.Free()
        }
    }

    /**
     * Takes ownership of this CO_MTA_USAGE_COOKIE, returning an owned handle that frees
     * itself when it falls out of scope. This is a *move*: the original handle is
     * invalidated so the underlying resource has exactly one owner.
     * @returns {CO_MTA_USAGE_COOKIE.Owned}
     */
    Adopt() {
        if (this is CO_MTA_USAGE_COOKIE.Owned) {
            throw TypeError("Cannot adopt an owned CO_MTA_USAGE_COOKIE", -1)
        }
        owned := CO_MTA_USAGE_COOKIE.Owned(this.Value)
        this.Value := -1
        return owned
    }
}
