#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\Apis.ahk" { WinUsb_Free }

/**
 * @namespace Windows.Win32.Devices.Usb
 */
export default struct WINUSB_INTERFACE_HANDLE {
    Value : IntPtr

    __value {
        set {
            if (value is WINUSB_INTERFACE_HANDLE) {
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
            WinUsb_Free(this.Value)
            this.Value := 0
        }
    }

    /**
     * A `WINUSB_INTERFACE_HANDLE` which is owned by the script and which frees itself
     * in `__Delete`.
     */
    struct Owned extends WINUSB_INTERFACE_HANDLE {
        __Delete() {
            this.Free()
        }
    }

    /**
     * Takes ownership of this WINUSB_INTERFACE_HANDLE, returning an owned handle that frees
     * itself when it falls out of scope. This is a *move*: the original handle is
     * invalidated so the underlying resource has exactly one owner.
     * @returns {WINUSB_INTERFACE_HANDLE.Owned}
     */
    Adopt() {
        if (this is WINUSB_INTERFACE_HANDLE.Owned) {
            throw TypeError("Cannot adopt an owned WINUSB_INTERFACE_HANDLE", -1)
        }
        owned := WINUSB_INTERFACE_HANDLE.Owned(this.Value)
        this.Value := 0
        return owned
    }
}
