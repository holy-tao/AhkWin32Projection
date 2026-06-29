#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\Apis.ahk" { midiOutClose }

/**
 * @namespace Windows.Win32.Media.Audio
 */
export default struct HMIDIOUT {
    Value : IntPtr

    __value {
        set {
            if (value is HMIDIOUT) {
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
            midiOutClose(this.Value)
            this.Value := -1
        }
    }

    /**
     * A `HMIDIOUT` which is owned by the script and which frees itself
     * in `__Delete`.
     */
    struct Owned extends HMIDIOUT {
        __Delete() {
            this.Free()
        }
    }

    /**
     * Takes ownership of this HMIDIOUT, returning an owned handle that frees
     * itself when it falls out of scope. This is a *move*: the original handle is
     * invalidated so the underlying resource has exactly one owner.
     * @returns {HMIDIOUT.Owned}
     */
    Adopt() {
        if (this is HMIDIOUT.Owned) {
            throw TypeError("Cannot adopt an owned HMIDIOUT", -1)
        }
        owned := HMIDIOUT.Owned(this.Value)
        this.Value := -1
        return owned
    }
}
