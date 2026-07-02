#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import ".\CRYPT_OID_INFO.ahk" { CRYPT_OID_INFO }

/**
 * The CRYPT_ENUM_OID_INFO callback function is used with the CryptEnumOIDInfo function.
 * @see https://learn.microsoft.com/windows/win32/api/wincrypt/nc-wincrypt-pfn_crypt_enum_oid_info
 * @namespace Windows.Win32.Security.Cryptography
 */
export default struct PFN_CRYPT_ENUM_OID_INFO {
    value : IntPtr

    __value {
        set {
            if (value is PFN_CRYPT_ENUM_OID_INFO) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Pointer<CRYPT_OID_INFO>} pInfo A pointer to the OID information.
     * @param {Pointer<Void>} pvArg A pointer to arguments passed through to the callback function.
     * @returns {BOOL} Returns <b>TRUE</b> to continue the enumeration and <b>FALSE</b> to stop the enumeration.
     *  If <b>FALSE</b> is returned, the <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/nf-wincrypt-cryptenumoidinfo">CryptEnumOIDInfo</a> enumeration is stopped.
     */
    Call(pInfo, pvArg) {
        pvArgMarshal := pvArg is VarRef ? "ptr" : "ptr"

        result := DllCall(this.value, CRYPT_OID_INFO.Ptr, pInfo, pvArgMarshal, pvArg, BOOL)
        return result
    }

    /**
     * A PFN_CRYPT_ENUM_OID_INFO that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PFN_CRYPT_ENUM_OID_INFO {
        /**
         * Creates a PFN_CRYPT_ENUM_OID_INFO pointer that invokes the given AHK function when called.
         * @param {Func(CRYPT_OID_INFO, "ptr") => BOOL} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 2)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 2 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [CRYPT_OID_INFO.Ptr, "ptr", BOOL])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
