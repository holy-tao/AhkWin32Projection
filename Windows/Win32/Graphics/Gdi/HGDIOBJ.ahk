#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\HPALETTE.ahk" { HPALETTE }
#Import ".\HRGN.ahk" { HRGN }
#Import ".\HBITMAP.ahk" { HBITMAP }
#Import ".\HBRUSH.ahk" { HBRUSH }
#Import ".\HFONT.ahk" { HFONT }
#Import ".\HPEN.ahk" { HPEN }
#Import ".\Apis.ahk" { DeleteObject }

/**
 * @namespace Windows.Win32.Graphics.Gdi
 */
export default struct HGDIOBJ {
    Value : IntPtr

    __value {
        set {
            if ((value is HBITMAP) || (value is HBRUSH) || (value is HFONT) || (value is HGDIOBJ) || (value is HPALETTE) || (value is HPEN) || (value is HRGN)) {
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
            DeleteObject(this.Value)
            this.Value := -1
        }
    }

    /**
     * A `HGDIOBJ` which is owned by the script and which frees itself
     * in `__Delete`.
     */
    struct Owned extends HGDIOBJ {
        __Delete() {
            this.Free()
        }
    }

    /**
     * Takes ownership of this HGDIOBJ, returning an owned handle that frees
     * itself when it falls out of scope. This is a *move*: the original handle is
     * invalidated so the underlying resource has exactly one owner.
     * @returns {HGDIOBJ.Owned}
     */
    Adopt() {
        if (this is HGDIOBJ.Owned) {
            throw TypeError("Cannot adopt an owned HGDIOBJ", -1)
        }
        owned := HGDIOBJ.Owned(this.Value)
        this.Value := -1
        return owned
    }
}
