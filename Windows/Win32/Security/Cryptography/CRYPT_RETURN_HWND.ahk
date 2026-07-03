#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\HWND.ahk" { HWND }

/**
 * Used by a cryptographic service provider (CSP) to obtain the window handle that the CSP should use as the parent or owner of any user interface that is displayed.
 * @see https://learn.microsoft.com/windows/win32/SecCrypto/funcreturnhwnd
 * @namespace Windows.Win32.Security.Cryptography
 */
export default struct CRYPT_RETURN_HWND {
    value : IntPtr

    __value {
        set {
            if (value is CRYPT_RETURN_HWND) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Pointer<HWND>} phWnd The address of an **HWND** variable that receives the parent window handle.
     * @returns {String} Nothing - always returns an empty string
     */
    Call(phWnd) {
        DllCall(this.value, HWND.Ptr, phWnd)
    }

    /**
     * A CRYPT_RETURN_HWND that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends CRYPT_RETURN_HWND {
        /**
         * Creates a CRYPT_RETURN_HWND pointer that invokes the given AHK function when called.
         * @param {Func(HWND) => IntPtr} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 1)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 1 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [HWND.Ptr, IntPtr])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
