#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\HWND.ahk" { HWND }
#Import ".\Apis.ahk" { CloseHandle }

/**
 * @namespace Windows.Win32.Foundation
 */
export default struct HANDLE {
    Value : IntPtr

    __value {
        set {
            if ((value is HANDLE) || (value is HWND)) {
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
            CloseHandle(this.Value)
            this.Value := -1
        }
    }

    /**
     * A `HANDLE` which is owned by the script and which frees itself
     * in `__Delete`.
     */
    struct Owned extends HANDLE {
        __Delete() {
            this.Free()
        }
    }

    /**
     * Frees this handle using a caller-supplied function rather than the default.
     * Used by `OwnedWith` for handles returned with a context-specific RAIIFree.
     * @param {Func} freeFunc called with the raw handle value
     */
    __FreeWith(freeFunc) {
        if (this.Value != -1 && this.Value != 0) {
            freeFunc(this.Value)
            this.Value := -1
        }
    }

    /**
     * Returns a cached `HANDLE.Owned` subclass whose `Free()` calls `freeFunc`
     * instead of the default. Used for handles returned with a context-specific
     * RAIIFree (e.g. a HANDLE that must be closed with FindClose, not CloseHandle).
     * @param {Func} freeFunc called with the raw handle value to free it
     * @returns {Class} a subclass of {@link HANDLE.Owned}
     */
    static OwnedWith(freeFunc) {
        static cache := Map()
        if (cache.Has(freeFunc)) {
            return cache[freeFunc]
        }
        cls := Class(HANDLE.Owned)
        DefineProp(cls.Prototype, "Free", { Call: (self) => self.__FreeWith(freeFunc) })
        return cache[freeFunc] := cls
    }

    /**
     * Takes ownership of this HANDLE, returning an owned handle that frees
     * itself when it falls out of scope. This is a *move*: the original handle is
     * invalidated so the underlying resource has exactly one owner.
     * @returns {HANDLE.Owned}
     */
    Adopt() {
        if (this is HANDLE.Owned) {
            throw TypeError("Cannot adopt an owned HANDLE", -1)
        }
        owned := HANDLE.Owned(this.Value)
        this.Value := -1
        return owned
    }
}
