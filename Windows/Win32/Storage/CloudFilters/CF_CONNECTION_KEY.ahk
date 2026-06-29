#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\Apis.ahk" { CfDisconnectSyncRoot }

/**
 * @namespace Windows.Win32.Storage.CloudFilters
 */
export default struct CF_CONNECTION_KEY {
    Value : Int64

    __value {
        set {
            if (value is CF_CONNECTION_KEY) {
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
            CfDisconnectSyncRoot(this.Value)
            this.Value := -1
        }
    }

    /**
     * A `CF_CONNECTION_KEY` which is owned by the script and which frees itself
     * in `__Delete`.
     */
    struct Owned extends CF_CONNECTION_KEY {
        __Delete() {
            this.Free()
        }
    }

    /**
     * Takes ownership of this CF_CONNECTION_KEY, returning an owned handle that frees
     * itself when it falls out of scope. This is a *move*: the original handle is
     * invalidated so the underlying resource has exactly one owner.
     * @returns {CF_CONNECTION_KEY.Owned}
     */
    Adopt() {
        if (this is CF_CONNECTION_KEY.Owned) {
            throw TypeError("Cannot adopt an owned CF_CONNECTION_KEY", -1)
        }
        owned := CF_CONNECTION_KEY.Owned(this.Value)
        this.Value := -1
        return owned
    }
}
