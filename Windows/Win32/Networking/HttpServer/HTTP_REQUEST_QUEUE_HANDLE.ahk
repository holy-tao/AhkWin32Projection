#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\Apis.ahk" { HttpCloseRequestQueue }

/**
 * @namespace Windows.Win32.Networking.HttpServer
 */
export default struct HTTP_REQUEST_QUEUE_HANDLE {
    Value : IntPtr

    __value {
        set {
            if (value is HTTP_REQUEST_QUEUE_HANDLE) {
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
            HttpCloseRequestQueue(this.Value)
            this.Value := 0
        }
    }

    /**
     * A `HTTP_REQUEST_QUEUE_HANDLE` which is owned by the script and which frees itself
     * in `__Delete`.
     */
    struct Owned extends HTTP_REQUEST_QUEUE_HANDLE {
        __Delete() {
            this.Free()
        }
    }

    /**
     * Takes ownership of this HTTP_REQUEST_QUEUE_HANDLE, returning an owned handle that frees
     * itself when it falls out of scope. This is a *move*: the original handle is
     * invalidated so the underlying resource has exactly one owner.
     * @returns {HTTP_REQUEST_QUEUE_HANDLE.Owned}
     */
    Adopt() {
        if (this is HTTP_REQUEST_QUEUE_HANDLE.Owned) {
            throw TypeError("Cannot adopt an owned HTTP_REQUEST_QUEUE_HANDLE", -1)
        }
        owned := HTTP_REQUEST_QUEUE_HANDLE.Owned(this.Value)
        this.Value := 0
        return owned
    }
}
