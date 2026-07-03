#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\NTSTATUS.ahk" { NTSTATUS }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import ".\BCRYPT_HANDLE.ahk" { BCRYPT_HANDLE }

/**
 * @namespace Windows.Win32.Security.Cryptography
 */
export default struct BCryptGetPropertyFn {
    value : IntPtr

    __value {
        set {
            if (value is BCryptGetPropertyFn) {
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
     * @param {Integer} pbOutput 
     * @param {Integer} cbOutput 
     * @param {Pointer<Integer>} pcbResult 
     * @param {Integer} dwFlags 
     * @returns {NTSTATUS} 
     */
    Call(hObject, pszProperty, pbOutput, cbOutput, pcbResult, dwFlags) {
        pszProperty := pszProperty is String ? StrPtr(pszProperty) : pszProperty

        pcbResultMarshal := pcbResult is VarRef ? "uint*" : "ptr"

        result := DllCall(this.value, BCRYPT_HANDLE, hObject, "ptr", pszProperty, IntPtr, pbOutput, UInt32, cbOutput, pcbResultMarshal, pcbResult, UInt32, dwFlags, NTSTATUS)
        NTSTATUS.ThrowIfError(result)
        return result
    }

    /**
     * A BCryptGetPropertyFn that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends BCryptGetPropertyFn {
        /**
         * Creates a BCryptGetPropertyFn pointer that invokes the given AHK function when called.
         * @param {Func(BCRYPT_HANDLE, PWSTR, IntPtr, UInt32, "uint*", UInt32) => NTSTATUS} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 6)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 6 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [BCRYPT_HANDLE, PWSTR, IntPtr, UInt32, "uint*", UInt32, NTSTATUS])
        }

        __Delete() => CallbackFree(this.value)
    }
}
