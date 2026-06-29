#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\Apis.ahk" { UnhookWinEvent }

/**
 * Used to declare a window event hook function.
 * @remarks
 * This data type is used with the [*WinEventProc*](/windows/desktop/api/Winuser/nc-winuser-wineventproc) callback function and the [**SetWinEventHook**](/windows/desktop/api/Winuser/nf-winuser-setwineventhook) and [**UnhookWinEvent**](/windows/desktop/api/Winuser/nf-winuser-unhookwinevent) functions.
 * @see https://learn.microsoft.com/windows/win32/WinAuto/hwineventhook
 * @namespace Windows.Win32.UI.Accessibility
 */
export default struct HWINEVENTHOOK {
    Value : IntPtr

    __value {
        set {
            if (value is HWINEVENTHOOK) {
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
            UnhookWinEvent(this.Value)
            this.Value := -1
        }
    }

    /**
     * A `HWINEVENTHOOK` which is owned by the script and which frees itself
     * in `__Delete`.
     */
    struct Owned extends HWINEVENTHOOK {
        __Delete() {
            this.Free()
        }
    }

    /**
     * Takes ownership of this HWINEVENTHOOK, returning an owned handle that frees
     * itself when it falls out of scope. This is a *move*: the original handle is
     * invalidated so the underlying resource has exactly one owner.
     * @returns {HWINEVENTHOOK.Owned}
     */
    Adopt() {
        if (this is HWINEVENTHOOK.Owned) {
            throw TypeError("Cannot adopt an owned HWINEVENTHOOK", -1)
        }
        owned := HWINEVENTHOOK.Owned(this.Value)
        this.Value := -1
        return owned
    }
}
