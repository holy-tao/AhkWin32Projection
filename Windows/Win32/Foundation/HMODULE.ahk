#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\HINSTANCE.ahk" { HINSTANCE }
#Import ".\Apis.ahk" { FreeLibrary }

/**
 * @namespace Windows.Win32.Foundation
 */
export default struct HMODULE {
    Value : IntPtr

    __value {
        set {
            if ((value is HINSTANCE) || (value is HMODULE)) {
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
            FreeLibrary(this.Value)
            this.Value := 0
        }
    }

    /**
     * A `HMODULE` which is owned by the script and which frees itself
     * in `__Delete`.
     */
    struct Owned extends HMODULE {
        __Delete() {
            this.Free()
        }
    }

    /**
     * Takes ownership of this HMODULE, returning an owned handle that frees
     * itself when it falls out of scope. This is a *move*: the original handle is
     * invalidated so the underlying resource has exactly one owner.
     * @returns {HMODULE.Owned}
     */
    Adopt() {
        if (this is HMODULE.Owned) {
            throw TypeError("Cannot adopt an owned HMODULE", -1)
        }
        owned := HMODULE.Owned(this.Value)
        this.Value := 0
        return owned
    }
}
