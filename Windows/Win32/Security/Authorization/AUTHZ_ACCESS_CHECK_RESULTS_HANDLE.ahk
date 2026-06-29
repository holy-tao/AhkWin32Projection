#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\Apis.ahk" { AuthzFreeHandle }

/**
 * @namespace Windows.Win32.Security.Authorization
 */
export default struct AUTHZ_ACCESS_CHECK_RESULTS_HANDLE {
    Value : IntPtr

    __value {
        set {
            if (value is AUTHZ_ACCESS_CHECK_RESULTS_HANDLE) {
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
            AuthzFreeHandle(this.Value)
            this.Value := -1
        }
    }

    /**
     * A `AUTHZ_ACCESS_CHECK_RESULTS_HANDLE` which is owned by the script and which frees itself
     * in `__Delete`.
     */
    struct Owned extends AUTHZ_ACCESS_CHECK_RESULTS_HANDLE {
        __Delete() {
            this.Free()
        }
    }

    /**
     * Takes ownership of this AUTHZ_ACCESS_CHECK_RESULTS_HANDLE, returning an owned handle that frees
     * itself when it falls out of scope. This is a *move*: the original handle is
     * invalidated so the underlying resource has exactly one owner.
     * @returns {AUTHZ_ACCESS_CHECK_RESULTS_HANDLE.Owned}
     */
    Adopt() {
        if (this is AUTHZ_ACCESS_CHECK_RESULTS_HANDLE.Owned) {
            throw TypeError("Cannot adopt an owned AUTHZ_ACCESS_CHECK_RESULTS_HANDLE", -1)
        }
        owned := AUTHZ_ACCESS_CHECK_RESULTS_HANDLE.Owned(this.Value)
        this.Value := -1
        return owned
    }
}
