#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\Apis.ahk" { ImageList_Destroy }

/**
 * @namespace Windows.Win32.UI.Controls
 */
export default struct HIMAGELIST {
    Value : IntPtr

    __value {
        set {
            if (value is HIMAGELIST) {
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
            ImageList_Destroy(this.Value)
            this.Value := -1
        }
    }

    /**
     * A `HIMAGELIST` which is owned by the script and which frees itself
     * in `__Delete`.
     */
    struct Owned extends HIMAGELIST {
        __Delete() {
            this.Free()
        }
    }

    /**
     * Takes ownership of this HIMAGELIST, returning an owned handle that frees
     * itself when it falls out of scope. This is a *move*: the original handle is
     * invalidated so the underlying resource has exactly one owner.
     * @returns {HIMAGELIST.Owned}
     */
    Adopt() {
        if (this is HIMAGELIST.Owned) {
            throw TypeError("Cannot adopt an owned HIMAGELIST", -1)
        }
        owned := HIMAGELIST.Owned(this.Value)
        this.Value := -1
        return owned
    }
}
