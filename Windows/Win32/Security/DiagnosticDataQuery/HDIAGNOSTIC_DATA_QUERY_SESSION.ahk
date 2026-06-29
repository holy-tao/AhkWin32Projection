#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\Apis.ahk" { DdqCloseSession }

/**
 * @namespace Windows.Win32.Security.DiagnosticDataQuery
 */
export default struct HDIAGNOSTIC_DATA_QUERY_SESSION {
    Value : IntPtr

    __value {
        set {
            if (value is HDIAGNOSTIC_DATA_QUERY_SESSION) {
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
            DdqCloseSession(this.Value)
            this.Value := -1
        }
    }

    /**
     * A `HDIAGNOSTIC_DATA_QUERY_SESSION` which is owned by the script and which frees itself
     * in `__Delete`.
     */
    struct Owned extends HDIAGNOSTIC_DATA_QUERY_SESSION {
        __Delete() {
            this.Free()
        }
    }

    /**
     * Takes ownership of this HDIAGNOSTIC_DATA_QUERY_SESSION, returning an owned handle that frees
     * itself when it falls out of scope. This is a *move*: the original handle is
     * invalidated so the underlying resource has exactly one owner.
     * @returns {HDIAGNOSTIC_DATA_QUERY_SESSION.Owned}
     */
    Adopt() {
        if (this is HDIAGNOSTIC_DATA_QUERY_SESSION.Owned) {
            throw TypeError("Cannot adopt an owned HDIAGNOSTIC_DATA_QUERY_SESSION", -1)
        }
        owned := HDIAGNOSTIC_DATA_QUERY_SESSION.Owned(this.Value)
        this.Value := -1
        return owned
    }
}
