#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\Apis.ahk" { DeleteProcThreadAttributeList }

/**
 * @namespace Windows.Win32.System.Threading
 */
export default struct LPPROC_THREAD_ATTRIBUTE_LIST {
    Value : IntPtr

    __value {
        set {
            if (value is LPPROC_THREAD_ATTRIBUTE_LIST) {
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
    static invalidValues => []

    __New(Value := 0) {
        this.Value := Value
    }

    Free() {
        ; Do nothing if the handle is invalid already
        if (this.Value != 0) {
            DeleteProcThreadAttributeList(this.Value)
            this.Value := 0
        }
    }

    /**
     * A `LPPROC_THREAD_ATTRIBUTE_LIST` which is owned by the script and which frees itself
     * in `__Delete`.
     */
    struct Owned extends LPPROC_THREAD_ATTRIBUTE_LIST {
        __Delete() {
            this.Free()
        }
    }

    /**
     * Takes ownership of this LPPROC_THREAD_ATTRIBUTE_LIST, returning an owned handle that frees
     * itself when it falls out of scope. This is a *move*: the original handle is
     * invalidated so the underlying resource has exactly one owner.
     * @returns {LPPROC_THREAD_ATTRIBUTE_LIST.Owned}
     */
    Adopt() {
        if (this is LPPROC_THREAD_ATTRIBUTE_LIST.Owned) {
            throw TypeError("Cannot adopt an owned LPPROC_THREAD_ATTRIBUTE_LIST", -1)
        }
        owned := LPPROC_THREAD_ATTRIBUTE_LIST.Owned(this.Value)
        this.Value := 0
        return owned
    }
}
