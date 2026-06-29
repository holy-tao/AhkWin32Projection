#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\Apis.ahk" { DeleteColorSpace }

/**
 * @namespace Windows.Win32.UI.ColorSystem
 */
export default struct HCOLORSPACE {
    Value : IntPtr

    __value {
        set {
            if (value is HCOLORSPACE) {
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
            DeleteColorSpace(this.Value)
            this.Value := -1
        }
    }

    /**
     * A `HCOLORSPACE` which is owned by the script and which frees itself
     * in `__Delete`.
     */
    struct Owned extends HCOLORSPACE {
        __Delete() {
            this.Free()
        }
    }

    /**
     * Takes ownership of this HCOLORSPACE, returning an owned handle that frees
     * itself when it falls out of scope. This is a *move*: the original handle is
     * invalidated so the underlying resource has exactly one owner.
     * @returns {HCOLORSPACE.Owned}
     */
    Adopt() {
        if (this is HCOLORSPACE.Owned) {
            throw TypeError("Cannot adopt an owned HCOLORSPACE", -1)
        }
        owned := HCOLORSPACE.Owned(this.Value)
        this.Value := -1
        return owned
    }
}
