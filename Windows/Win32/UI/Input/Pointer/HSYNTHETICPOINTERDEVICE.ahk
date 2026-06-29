#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\Apis.ahk" { DestroySyntheticPointerDevice }

/**
 * @namespace Windows.Win32.UI.Input.Pointer
 */
export default struct HSYNTHETICPOINTERDEVICE {
    Value : IntPtr

    __value {
        set {
            if (value is HSYNTHETICPOINTERDEVICE) {
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
            DestroySyntheticPointerDevice(this.Value)
            this.Value := -1
        }
    }

    /**
     * A `HSYNTHETICPOINTERDEVICE` which is owned by the script and which frees itself
     * in `__Delete`.
     */
    struct Owned extends HSYNTHETICPOINTERDEVICE {
        __Delete() {
            this.Free()
        }
    }

    /**
     * Takes ownership of this HSYNTHETICPOINTERDEVICE, returning an owned handle that frees
     * itself when it falls out of scope. This is a *move*: the original handle is
     * invalidated so the underlying resource has exactly one owner.
     * @returns {HSYNTHETICPOINTERDEVICE.Owned}
     */
    Adopt() {
        if (this is HSYNTHETICPOINTERDEVICE.Owned) {
            throw TypeError("Cannot adopt an owned HSYNTHETICPOINTERDEVICE", -1)
        }
        owned := HSYNTHETICPOINTERDEVICE.Owned(this.Value)
        this.Value := -1
        return owned
    }
}
