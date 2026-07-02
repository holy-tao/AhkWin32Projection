#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import ".\CRYPT_PRIVATE_KEY_INFO.ahk" { CRYPT_PRIVATE_KEY_INFO }

/**
 * @namespace Windows.Win32.Security.Cryptography
 */
export default struct PFN_IMPORT_PRIV_KEY_FUNC {
    value : IntPtr

    __value {
        set {
            if (value is PFN_IMPORT_PRIV_KEY_FUNC) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Pointer} hCryptProv 
     * @param {Pointer<CRYPT_PRIVATE_KEY_INFO>} pPrivateKeyInfo 
     * @param {Integer} dwFlags 
     * @param {Pointer<Void>} pvAuxInfo 
     * @returns {BOOL} 
     */
    Call(hCryptProv, pPrivateKeyInfo, dwFlags, pvAuxInfo) {
        pvAuxInfoMarshal := pvAuxInfo is VarRef ? "ptr" : "ptr"

        result := DllCall(this.value, IntPtr, hCryptProv, CRYPT_PRIVATE_KEY_INFO.Ptr, pPrivateKeyInfo, UInt32, dwFlags, pvAuxInfoMarshal, pvAuxInfo, BOOL)
        return result
    }

    /**
     * A PFN_IMPORT_PRIV_KEY_FUNC that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PFN_IMPORT_PRIV_KEY_FUNC {
        /**
         * Creates a PFN_IMPORT_PRIV_KEY_FUNC pointer that invokes the given AHK function when called.
         * @param {Func(IntPtr, CRYPT_PRIVATE_KEY_INFO, UInt32, "ptr") => BOOL} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 4)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 4 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [IntPtr, CRYPT_PRIVATE_KEY_INFO.Ptr, UInt32, "ptr", BOOL])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
