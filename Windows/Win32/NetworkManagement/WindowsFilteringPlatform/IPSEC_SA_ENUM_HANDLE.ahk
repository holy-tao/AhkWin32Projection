#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\Apis.ahk" { IPsecSaDestroyEnumHandle0 }

/**
 * @namespace Windows.Win32.NetworkManagement.WindowsFilteringPlatform
 */
export default struct IPSEC_SA_ENUM_HANDLE {
    Value : IntPtr

    __value {
        set {
            if (value is IPSEC_SA_ENUM_HANDLE) {
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
            IPsecSaDestroyEnumHandle0(this.Value)
            this.Value := -1
        }
    }

    /**
     * A `IPSEC_SA_ENUM_HANDLE` which is owned by the script and which frees itself
     * in `__Delete`.
     */
    struct Owned extends IPSEC_SA_ENUM_HANDLE {
        __Delete() {
            this.Free()
        }
    }

    /**
     * Takes ownership of this IPSEC_SA_ENUM_HANDLE, returning an owned handle that frees
     * itself when it falls out of scope. This is a *move*: the original handle is
     * invalidated so the underlying resource has exactly one owner.
     * @returns {IPSEC_SA_ENUM_HANDLE.Owned}
     */
    Adopt() {
        if (this is IPSEC_SA_ENUM_HANDLE.Owned) {
            throw TypeError("Cannot adopt an owned IPSEC_SA_ENUM_HANDLE", -1)
        }
        owned := IPSEC_SA_ENUM_HANDLE.Owned(this.Value)
        this.Value := -1
        return owned
    }
}
