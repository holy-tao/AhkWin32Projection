#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\Apis.ahk" { JetEndSession }

/**
 * Learn more about: JET_SESID structure
 * @see https://learn.microsoft.com/windows/win32/extensible-storage-engine/jet-sesid-structure
 * @namespace Windows.Win32.Storage.Jet
 */
export default struct JET_SESID {
    Value : IntPtr

    __value {
        set {
            if (value is JET_SESID) {
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
            JetEndSession(this.Value)
            this.Value := 0
        }
    }

    /**
     * A `JET_SESID` which is owned by the script and which frees itself
     * in `__Delete`.
     */
    struct Owned extends JET_SESID {
        __Delete() {
            this.Free()
        }
    }

    /**
     * Takes ownership of this JET_SESID, returning an owned handle that frees
     * itself when it falls out of scope. This is a *move*: the original handle is
     * invalidated so the underlying resource has exactly one owner.
     * @returns {JET_SESID.Owned}
     */
    Adopt() {
        if (this is JET_SESID.Owned) {
            throw TypeError("Cannot adopt an owned JET_SESID", -1)
        }
        owned := JET_SESID.Owned(this.Value)
        this.Value := 0
        return owned
    }
}
