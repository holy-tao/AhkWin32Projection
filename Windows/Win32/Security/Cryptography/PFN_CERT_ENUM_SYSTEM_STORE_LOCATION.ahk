#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }

/**
 * The CertEnumSystemStoreLocationCallback callback function formats and presents information on each system store location found by a call to CertEnumSystemStoreLocation.
 * @see https://learn.microsoft.com/windows/win32/api/wincrypt/nc-wincrypt-pfn_cert_enum_system_store_location
 * @namespace Windows.Win32.Security.Cryptography
 */
export default struct PFN_CERT_ENUM_SYSTEM_STORE_LOCATION {
    value : IntPtr

    __value {
        set {
            if (value is PFN_CERT_ENUM_SYSTEM_STORE_LOCATION) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {PWSTR} pwszStoreLocation String that contains information on the store location found.
     * @param {Integer} dwFlags Flag used to call for an alteration of the presentation.
     * @param {Pointer<Void>} pvArg A pointer to information passed to the callback function in the <i>pvArg</i> 
     * 	 passed to <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/nf-wincrypt-certenumsystemstorelocation">CertEnumSystemStoreLocation</a>.
     * @returns {BOOL} If the function succeeds, the function returns <b>TRUE</b>.
     * 
     * If the function fails, it returns <b>FALSE</b>.
     */
    Call(pwszStoreLocation, dwFlags, pvArg) {
        static pvReserved := 0 ;Reserved parameters must always be NULL

        pwszStoreLocation := pwszStoreLocation is String ? StrPtr(pwszStoreLocation) : pwszStoreLocation

        pvArgMarshal := pvArg is VarRef ? "ptr" : "ptr"

        result := DllCall(this.value, "ptr", pwszStoreLocation, UInt32, dwFlags, "ptr", pvReserved, pvArgMarshal, pvArg, BOOL)
        return result
    }

    /**
     * A PFN_CERT_ENUM_SYSTEM_STORE_LOCATION that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PFN_CERT_ENUM_SYSTEM_STORE_LOCATION {
        /**
         * Creates a PFN_CERT_ENUM_SYSTEM_STORE_LOCATION pointer that invokes the given AHK function when called.
         * @param {Func(PWSTR, UInt32, "ptr") => BOOL} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 3)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 3 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [PWSTR, UInt32, "ptr", BOOL])
        }

        __Delete() => CallbackFree(this.value)
    }
}
