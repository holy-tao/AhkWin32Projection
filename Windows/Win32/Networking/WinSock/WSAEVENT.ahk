#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\Apis.ahk" { WSACloseEvent }

/**
 * @namespace Windows.Win32.Networking.WinSock
 */
export default struct WSAEVENT {
    Value : IntPtr

    __value {
        set {
            if (value is WSAEVENT) {
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
            WSACloseEvent(this.Value)
            this.Value := 0
        }
    }

    /**
     * A `WSAEVENT` which is owned by the script and which frees itself
     * in `__Delete`.
     */
    struct Owned extends WSAEVENT {
        __Delete() {
            this.Free()
        }
    }

    /**
     * Takes ownership of this WSAEVENT, returning an owned handle that frees
     * itself when it falls out of scope. This is a *move*: the original handle is
     * invalidated so the underlying resource has exactly one owner.
     * @returns {WSAEVENT.Owned}
     */
    Adopt() {
        if (this is WSAEVENT.Owned) {
            throw TypeError("Cannot adopt an owned WSAEVENT", -1)
        }
        owned := WSAEVENT.Owned(this.Value)
        this.Value := 0
        return owned
    }
}
