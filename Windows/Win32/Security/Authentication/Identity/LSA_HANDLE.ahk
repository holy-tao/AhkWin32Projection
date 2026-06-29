#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\Apis.ahk" { LsaClose }

/**
 * Handle to the local Policy object.
 * @remarks
 * Before you can use the local policy API your application must open a handle to a [**Policy**](policy-object.md) object. To do this, call [**LsaOpenPolicy**](/windows/desktop/api/ntsecapi/nf-ntsecapi-lsaopenpolicy). This function returns a handle that your application can then specify in subsequent LSA policy function calls.
 * 
 * Each handle has an associated set of permissions that determine the operations your application can perform on the [**Policy**](policy-object.md) object by using the handle. Your application can open more than one handle to the **Policy** object at a time. When a handle is no longer required, your application should close it by calling [**LsaClose**](/windows/desktop/api/Ntsecapi/nf-ntsecapi-lsaclose).
 * @see https://learn.microsoft.com/windows/win32/SecMgmt/lsa-handle
 * @namespace Windows.Win32.Security.Authentication.Identity
 */
export default struct LSA_HANDLE {
    Value : IntPtr

    __value {
        set {
            if (value is LSA_HANDLE) {
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
            LsaClose(this.Value)
            this.Value := -1
        }
    }

    /**
     * A `LSA_HANDLE` which is owned by the script and which frees itself
     * in `__Delete`.
     */
    struct Owned extends LSA_HANDLE {
        __Delete() {
            this.Free()
        }
    }

    /**
     * Takes ownership of this LSA_HANDLE, returning an owned handle that frees
     * itself when it falls out of scope. This is a *move*: the original handle is
     * invalidated so the underlying resource has exactly one owner.
     * @returns {LSA_HANDLE.Owned}
     */
    Adopt() {
        if (this is LSA_HANDLE.Owned) {
            throw TypeError("Cannot adopt an owned LSA_HANDLE", -1)
        }
        owned := LSA_HANDLE.Owned(this.Value)
        this.Value := -1
        return owned
    }
}
