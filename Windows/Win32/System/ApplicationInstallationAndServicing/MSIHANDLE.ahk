#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\Apis.ahk" { MsiCloseHandle }

/**
 * @namespace Windows.Win32.System.ApplicationInstallationAndServicing
 */
export default struct MSIHANDLE {
    Value : UInt32

    __value {
        set {
            if (value is MSIHANDLE) {
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
            MsiCloseHandle(this.Value)
            this.Value := -1
        }
    }

    /**
     * A `MSIHANDLE` which is owned by the script and which frees itself
     * in `__Delete`.
     */
    struct Owned extends MSIHANDLE {
        __Delete() {
            this.Free()
        }
    }

    /**
     * Takes ownership of this MSIHANDLE, returning an owned handle that frees
     * itself when it falls out of scope. This is a *move*: the original handle is
     * invalidated so the underlying resource has exactly one owner.
     * @returns {MSIHANDLE.Owned}
     */
    Adopt() {
        if (this is MSIHANDLE.Owned) {
            throw TypeError("Cannot adopt an owned MSIHANDLE", -1)
        }
        owned := MSIHANDLE.Owned(this.Value)
        this.Value := -1
        return owned
    }
}
