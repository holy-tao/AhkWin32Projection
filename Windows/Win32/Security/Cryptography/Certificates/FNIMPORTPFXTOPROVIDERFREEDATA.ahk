#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\CERT_CONTEXT.ahk" { CERT_CONTEXT }

/**
 * @namespace Windows.Win32.Security.Cryptography.Certificates
 */
export default struct FNIMPORTPFXTOPROVIDERFREEDATA {
    value : IntPtr

    __value {
        set {
            if (value is FNIMPORTPFXTOPROVIDERFREEDATA) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Integer} cCert 
     * @param {Pointer<Pointer<CERT_CONTEXT>>} rgpCert 
     * @returns {String} Nothing - always returns an empty string
     */
    Call(cCert, rgpCert) {
        rgpCertMarshal := rgpCert is VarRef ? "ptr*" : "ptr"

        DllCall(this.value, UInt32, cCert, rgpCertMarshal, rgpCert)
    }

    /**
     * A FNIMPORTPFXTOPROVIDERFREEDATA that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends FNIMPORTPFXTOPROVIDERFREEDATA {
        /**
         * Creates a FNIMPORTPFXTOPROVIDERFREEDATA pointer that invokes the given AHK function when called.
         * @param {Func(UInt32, "ptr*") => IntPtr} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 2)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 2 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [UInt32, "ptr*", IntPtr])
        }

        __Delete() => CallbackFree(this.value)
    }
}
