#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\Apis.ahk" { SetupDiDestroyDeviceInfoList }

/**
 * @namespace Windows.Win32.Devices.DeviceAndDriverInstallation
 */
export default struct HDEVINFO {
    Value : IntPtr

    __value {
        set {
            if (value is HDEVINFO) {
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
            SetupDiDestroyDeviceInfoList(this.Value)
            this.Value := -1
        }
    }

    /**
     * A `HDEVINFO` which is owned by the script and which frees itself
     * in `__Delete`.
     */
    struct Owned extends HDEVINFO {
        __Delete() {
            this.Free()
        }
    }

    /**
     * Takes ownership of this HDEVINFO, returning an owned handle that frees
     * itself when it falls out of scope. This is a *move*: the original handle is
     * invalidated so the underlying resource has exactly one owner.
     * @returns {HDEVINFO.Owned}
     */
    Adopt() {
        if (this is HDEVINFO.Owned) {
            throw TypeError("Cannot adopt an owned HDEVINFO", -1)
        }
        owned := HDEVINFO.Owned(this.Value)
        this.Value := -1
        return owned
    }
}
