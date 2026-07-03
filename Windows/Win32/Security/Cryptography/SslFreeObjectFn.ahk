#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\NCRYPT_HANDLE.ahk" { NCRYPT_HANDLE }

/**
 * @namespace Windows.Win32.Security.Cryptography
 */
export default struct SslFreeObjectFn {
    value : IntPtr

    __value {
        set {
            if (value is SslFreeObjectFn) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {NCRYPT_HANDLE} hObject 
     * @param {Integer} dwFlags 
     * @returns {HRESULT} 
     */
    Call(hObject, dwFlags) {
        result := DllCall(this.value, NCRYPT_HANDLE, hObject, UInt32, dwFlags, "HRESULT")
        return result
    }

    /**
     * A SslFreeObjectFn that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends SslFreeObjectFn {
        /**
         * Creates a SslFreeObjectFn pointer that invokes the given AHK function when called.
         * @param {Func(NCRYPT_HANDLE, UInt32) => "int"} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 2)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 2 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [NCRYPT_HANDLE, UInt32, "int"])
        }

        __Delete() => CallbackFree(this.value)
    }
}
