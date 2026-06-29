#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\Apis.ahk" { CloseThemeData }

/**
 * @namespace Windows.Win32.UI.Controls
 */
export default struct HTHEME {
    Value : IntPtr

    __value {
        set {
            if (value is HTHEME) {
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
            CloseThemeData(this.Value)
            this.Value := 0
        }
    }

    /**
     * A `HTHEME` which is owned by the script and which frees itself
     * in `__Delete`.
     */
    struct Owned extends HTHEME {
        __Delete() {
            this.Free()
        }
    }

    /**
     * Takes ownership of this HTHEME, returning an owned handle that frees
     * itself when it falls out of scope. This is a *move*: the original handle is
     * invalidated so the underlying resource has exactly one owner.
     * @returns {HTHEME.Owned}
     */
    Adopt() {
        if (this is HTHEME.Owned) {
            throw TypeError("Cannot adopt an owned HTHEME", -1)
        }
        owned := HTHEME.Owned(this.Value)
        this.Value := 0
        return owned
    }
}
