#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import ".\CERT_SYSTEM_STORE_FLAGS.ahk" { CERT_SYSTEM_STORE_FLAGS }
#Import ".\CERT_SYSTEM_STORE_INFO.ahk" { CERT_SYSTEM_STORE_INFO }

/**
 * The CertEnumSystemStoreCallback callback function formats and presents information on each system store found by a call to CertEnumSystemStore.
 * @see https://learn.microsoft.com/windows/win32/api/wincrypt/nc-wincrypt-pfn_cert_enum_system_store
 * @namespace Windows.Win32.Security.Cryptography
 */
export default struct PFN_CERT_ENUM_SYSTEM_STORE {
    value : IntPtr

    __value {
        set {
            if (value is PFN_CERT_ENUM_SYSTEM_STORE) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Pointer<Void>} pvSystemStore A pointer to information on the system store found by a call to 
     * 	<a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/nf-wincrypt-certenumsystemstore">CertEnumSystemStore</a>. Where appropriate, this argument will contain a leading computer name or service name prefix.
     * @param {CERT_SYSTEM_STORE_FLAGS} dwFlags 
     * @param {Pointer<CERT_SYSTEM_STORE_INFO>} pStoreInfo A pointer to a 
     * 	    <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/ns-wincrypt-cert_system_store_info">CERT_SYSTEM_STORE_INFO</a> structure that contains information about the store.
     * @param {Pointer<Void>} pvArg A pointer to information passed to the callback function in the <i>pvArg</i> 
     * 	 passed to <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/nf-wincrypt-certenumsystemstore">CertEnumSystemStore</a>.
     * @returns {BOOL} If the function succeeds, the function returns <b>TRUE</b>.
     * 						
     * 
     * To stop the enumeration, the function must return <b>FALSE</b>.
     */
    Call(pvSystemStore, dwFlags, pStoreInfo, pvArg) {
        static pvReserved := 0 ;Reserved parameters must always be NULL

        pvSystemStoreMarshal := pvSystemStore is VarRef ? "ptr" : "ptr"
        pvArgMarshal := pvArg is VarRef ? "ptr" : "ptr"

        result := DllCall(this.value, pvSystemStoreMarshal, pvSystemStore, CERT_SYSTEM_STORE_FLAGS, dwFlags, CERT_SYSTEM_STORE_INFO.Ptr, pStoreInfo, "ptr", pvReserved, pvArgMarshal, pvArg, BOOL)
        return result
    }

    /**
     * A PFN_CERT_ENUM_SYSTEM_STORE that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PFN_CERT_ENUM_SYSTEM_STORE {
        /**
         * Creates a PFN_CERT_ENUM_SYSTEM_STORE pointer that invokes the given AHK function when called.
         * @param {Func("ptr", CERT_SYSTEM_STORE_FLAGS, CERT_SYSTEM_STORE_INFO, "ptr") => BOOL} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 4)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 4 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , ["ptr", CERT_SYSTEM_STORE_FLAGS, CERT_SYSTEM_STORE_INFO.Ptr, "ptr", BOOL])
        }

        __Delete() => CallbackFree(this.value)
    }
}
