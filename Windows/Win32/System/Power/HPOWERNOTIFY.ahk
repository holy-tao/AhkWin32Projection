#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\Apis.ahk" { UnregisterPowerSettingNotification }

/**
 * @namespace Windows.Win32.System.Power
 */
export default struct HPOWERNOTIFY {
    Value : IntPtr

    __value {
        set {
            if (value is HPOWERNOTIFY) {
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
            UnregisterPowerSettingNotification(this.Value)
            this.Value := -1
        }
    }

    /**
     * A `HPOWERNOTIFY` which is owned by the script and which frees itself
     * in `__Delete`.
     */
    struct Owned extends HPOWERNOTIFY {
        __Delete() {
            this.Free()
        }
    }

    /**
     * Takes ownership of this HPOWERNOTIFY, returning an owned handle that frees
     * itself when it falls out of scope. This is a *move*: the original handle is
     * invalidated so the underlying resource has exactly one owner.
     * @returns {HPOWERNOTIFY.Owned}
     */
    Adopt() {
        if (this is HPOWERNOTIFY.Owned) {
            throw TypeError("Cannot adopt an owned HPOWERNOTIFY", -1)
        }
        owned := HPOWERNOTIFY.Owned(this.Value)
        this.Value := -1
        return owned
    }
}
