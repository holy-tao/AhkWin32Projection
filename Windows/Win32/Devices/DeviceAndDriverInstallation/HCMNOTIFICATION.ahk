#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\Apis.ahk" { CM_Unregister_Notification }

/**
 * @namespace Windows.Win32.Devices.DeviceAndDriverInstallation
 */
export default struct HCMNOTIFICATION {
    Value : IntPtr

    __value {
        set {
            if (value is HCMNOTIFICATION) {
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
            CM_Unregister_Notification(this.Value)
            this.Value := -1
        }
    }

    /**
     * A `HCMNOTIFICATION` which is owned by the script and which frees itself
     * in `__Delete`.
     */
    struct Owned extends HCMNOTIFICATION {
        __Delete() {
            this.Free()
        }
    }

    /**
     * Takes ownership of this HCMNOTIFICATION, returning an owned handle that frees
     * itself when it falls out of scope. This is a *move*: the original handle is
     * invalidated so the underlying resource has exactly one owner.
     * @returns {HCMNOTIFICATION.Owned}
     */
    Adopt() {
        if (this is HCMNOTIFICATION.Owned) {
            throw TypeError("Cannot adopt an owned HCMNOTIFICATION", -1)
        }
        owned := HCMNOTIFICATION.Owned(this.Value)
        this.Value := -1
        return owned
    }
}
