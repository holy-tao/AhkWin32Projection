#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\Apis.ahk" { closesocket }

/**
 * @namespace Windows.Win32.Networking.WinSock
 */
export default struct SOCKET {
    Value : IntPtr

    __value {
        set {
            if (value is SOCKET) {
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
    static invalidValues => [-1]

    __New(Value := -1) {
        this.Value := Value
    }

    Free() {
        ; Do nothing if the handle is invalid already
        if (this.Value != -1 && this.Value != 0) {
            closesocket(this.Value)
            this.Value := -1
        }
    }

    /**
     * A `SOCKET` which is owned by the script and which frees itself
     * in `__Delete`.
     */
    struct Owned extends SOCKET {
        __Delete() {
            this.Free()
        }
    }

    /**
     * Takes ownership of this SOCKET, returning an owned handle that frees
     * itself when it falls out of scope. This is a *move*: the original handle is
     * invalidated so the underlying resource has exactly one owner.
     * @returns {SOCKET.Owned}
     */
    Adopt() {
        if (this is SOCKET.Owned) {
            throw TypeError("Cannot adopt an owned SOCKET", -1)
        }
        owned := SOCKET.Owned(this.Value)
        this.Value := -1
        return owned
    }
}
