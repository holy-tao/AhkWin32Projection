#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\Foundation\BOOL.ahk" { BOOL }
#Import ".\X509Certificate.ahk" { X509Certificate }

/**
 * @namespace Windows.Win32.Security.Authentication.Identity
 */
export default struct SSL_CRACK_CERTIFICATE_FN {
    value : IntPtr

    __value {
        set {
            if (value is SSL_CRACK_CERTIFICATE_FN) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Pointer<Integer>} pbCertificate 
     * @param {Integer} cbCertificate 
     * @param {BOOL} VerifySignature 
     * @param {Pointer<Pointer<X509Certificate>>} ppCertificate 
     * @returns {BOOL} 
     */
    Call(pbCertificate, cbCertificate, VerifySignature, ppCertificate) {
        pbCertificateMarshal := pbCertificate is VarRef ? "char*" : "ptr"
        ppCertificateMarshal := ppCertificate is VarRef ? "ptr*" : "ptr"

        result := DllCall(this.value, pbCertificateMarshal, pbCertificate, UInt32, cbCertificate, BOOL, VerifySignature, ppCertificateMarshal, ppCertificate, BOOL)
        return result
    }

    /**
     * A SSL_CRACK_CERTIFICATE_FN that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends SSL_CRACK_CERTIFICATE_FN {
        /**
         * Creates a SSL_CRACK_CERTIFICATE_FN pointer that invokes the given AHK function when called.
         * @param {Func("char*", UInt32, BOOL, "ptr*") => BOOL} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 4)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 4 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , ["char*", UInt32, BOOL, "ptr*", BOOL])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
