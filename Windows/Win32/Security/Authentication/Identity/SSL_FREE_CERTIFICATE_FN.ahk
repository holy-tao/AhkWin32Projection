#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\X509Certificate.ahk" { X509Certificate }

/**
 * @namespace Windows.Win32.Security.Authentication.Identity
 */
export default struct SSL_FREE_CERTIFICATE_FN {
    value : IntPtr

    __value {
        set {
            if (value is SSL_FREE_CERTIFICATE_FN) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Pointer<X509Certificate>} pCertificate 
     * @returns {String} Nothing - always returns an empty string
     */
    Call(pCertificate) {
        DllCall(this.value, X509Certificate.Ptr, pCertificate)
    }

    /**
     * A SSL_FREE_CERTIFICATE_FN that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends SSL_FREE_CERTIFICATE_FN {
        /**
         * Creates a SSL_FREE_CERTIFICATE_FN pointer that invokes the given AHK function when called.
         * @param {Func(X509Certificate) => IntPtr} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 1)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 1 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [X509Certificate.Ptr, IntPtr])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
