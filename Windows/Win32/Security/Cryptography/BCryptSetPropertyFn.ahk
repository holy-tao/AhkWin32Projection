#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\Foundation\NTSTATUS.ahk" { NTSTATUS }
#Import ".\BCRYPT_HANDLE.ahk" { BCRYPT_HANDLE }

/**
 * @namespace Windows.Win32.Security.Cryptography
 */
export default struct BCryptSetPropertyFn {
    value : IntPtr

    __value {
        set {
            if (value is BCryptSetPropertyFn) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {BCRYPT_HANDLE} hObject 
     * @param {PWSTR} pszProperty 
     * @param {Integer} pbInput 
     * @param {Integer} cbInput 
     * @param {Integer} dwFlags 
     * @returns {NTSTATUS} 
     */
    Call(hObject, pszProperty, pbInput, cbInput, dwFlags) {
        pszProperty := pszProperty is String ? StrPtr(pszProperty) : pszProperty

        result := DllCall(this.value, BCRYPT_HANDLE, hObject, "ptr", pszProperty, IntPtr, pbInput, UInt32, cbInput, UInt32, dwFlags, NTSTATUS)
        NTSTATUS.ThrowIfError(result.value)
        return result
    }

    /**
     * A BCryptSetPropertyFn that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends BCryptSetPropertyFn {
        /**
         * Creates a BCryptSetPropertyFn pointer that invokes the given AHK function when called.
         * @param {Func(BCRYPT_HANDLE, PWSTR, IntPtr, UInt32, UInt32) => NTSTATUS} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 5)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 5 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [BCRYPT_HANDLE, PWSTR, IntPtr, UInt32, UInt32, NTSTATUS])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
